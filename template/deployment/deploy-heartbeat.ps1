[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$HostName,

    [Parameter(Mandatory = $true)]
    [string]$User,

    [Parameter(Mandatory = $true)]
    [string]$KeyPath,

    [string]$RemoteDir = '~/pArc-heartbeat',

    [switch]$WhatIf
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$Payload = Join-Path $PSScriptRoot 'heartbeat.sh'
$SshCommon = @(
    '-o', 'BatchMode=yes',
    '-o', 'ConnectTimeout=8',
    '-o', 'StrictHostKeyChecking=accept-new'
)

function Write-Step {
    param(
        [int]$N,
        [int]$M,
        [string]$Text
    )

    Write-Host ("Step {0}/{1} - {2}" -f $N, $M, $Text)
}

function Invoke-Native {
    param(
        [string]$Exe,
        [string[]]$Arguments,
        [switch]$Capture
    )

    if ($WhatIf) {
        Write-Host ('WHATIF: ' + $Exe + ' ' + ($Arguments -join ' '))
        return ''
    }

    if ($Capture) {
        $output = & $Exe @Arguments 2>&1
        if ($LASTEXITCODE -ne 0) {
            throw "$Exe failed with exit code $LASTEXITCODE`n$($output -join "`n")"
        }
        return ($output -join "`n")
    }

    & $Exe @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "$Exe failed with exit code $LASTEXITCODE"
    }
}

Write-Step 1 5 'Validate local prerequisites'

if (-not (Test-Path -LiteralPath $Payload -PathType Leaf)) {
    throw "Missing heartbeat payload: $Payload"
}

if (-not (Test-Path -LiteralPath $KeyPath -PathType Leaf)) {
    throw "Missing SSH key: $KeyPath"
}

if ($RemoteDir -notmatch '^[A-Za-z0-9_./~\-]+$') {
    throw 'RemoteDir may contain only letters, digits, underscore, dot, slash, tilde, and hyphen.'
}

foreach ($tool in @('ssh.exe', 'scp.exe')) {
    if (-not (Get-Command $tool -ErrorAction SilentlyContinue)) {
        throw "Required tool is not available: $tool"
    }
}

$Target = "$User@$HostName"

Write-Step 2 5 'Read-only SSH preflight'
Invoke-Native ssh.exe (@('-i', $KeyPath) + $SshCommon + @(
    $Target,
    'printf HEARTBEAT_SSH_OK'
))

Write-Step 3 5 'Backup previous heartbeat and deploy one file'

$backupOutput = Invoke-Native ssh.exe (@('-i', $KeyPath) + $SshCommon + @(
    $Target,
    "set -eu; mkdir -p $RemoteDir/.backup $RemoteDir; if [ -f $RemoteDir/heartbeat.sh ]; then stamp=`$(date -u +%Y%m%d-%H%M%S); backup=$RemoteDir/.backup/heartbeat.sh.`$stamp; cp -p $RemoteDir/heartbeat.sh `$backup; printf 'BACKUP=%s\n' `$backup; else printf 'BACKUP=NONE\n'; fi"
)) -Capture

$backupPath = 'NONE'
if ($backupOutput -match 'BACKUP=([^\r\n]+)') {
    $backupPath = $Matches[1].Trim()
}

try {
    Invoke-Native scp.exe (@('-i', $KeyPath) + $SshCommon + @(
        $Payload,
        "${Target}:$RemoteDir/heartbeat.sh"
    ))

    Write-Step 4 5 'Verify checksum and heartbeat'

    $localHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $Payload).Hash.ToLowerInvariant()

    $verifyOutput = Invoke-Native ssh.exe (@('-i', $KeyPath) + $SshCommon + @(
        $Target,
        "set -eu; chmod 700 $RemoteDir/heartbeat.sh; printf 'SHA256='; sha256sum $RemoteDir/heartbeat.sh | awk '{print `$1}'; sh $RemoteDir/heartbeat.sh"
    )) -Capture

    if ($WhatIf) {
        Write-Step 5 5 'Heartbeat deployment dry-run complete'
        Write-Host 'OVERALL=WHATIF_PASS'
        exit 0
    }

    if ($verifyOutput -notmatch 'SHA256=([0-9a-fA-F]{64})') {
        throw 'Remote SHA-256 was not returned.'
    }

    $remoteHash = $Matches[1].ToLowerInvariant()
    if ($remoteHash -ne $localHash) {
        throw "Checksum mismatch. local=$localHash remote=$remoteHash"
    }

    if ($verifyOutput -notmatch 'HEARTBEAT=OK') {
        throw 'Heartbeat smoke test failed.'
    }
}
catch {
    if (-not $WhatIf -and $backupPath -ne 'NONE') {
        Write-Host "Verification failed; restoring $backupPath"
        try {
            Invoke-Native ssh.exe (@('-i', $KeyPath) + $SshCommon + @(
                $Target,
                "cp -p $backupPath $RemoteDir/heartbeat.sh"
            ))
        }
        catch {
            Write-Warning 'Automatic rollback also failed. Inspect the remote backup manually.'
        }
    }

    throw
}

Write-Step 5 5 'Heartbeat deployment verified'
Write-Host ("BACKUP={0}" -f $backupPath)
Write-Host 'OVERALL=PASS'
