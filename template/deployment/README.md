# pArc minimal deployment template

이 directory는 새 프로젝트가 바로 복사해서 확장할 수 있는 **최소 deployment skeleton**입니다.

## Scope

Template은 실제 application, package manager, service manager, container, cloud provider를 가정하지 않습니다.

배포하는 artifact는 오직 다음 하나입니다.

```text
heartbeat.sh
```

성공 조건은 다음뿐입니다.

1. SSH read-only preflight 성공
2. 기존 remote heartbeat가 있으면 timestamp backup 생성
3. `heartbeat.sh` 한 파일 전송
4. local/remote SHA-256 일치
5. remote 실행 결과 `HEARTBEAT=OK`

Project-specific source, tool 설치, service restart, container orchestration, runtime secret, 실제 hostname/IP는 **각 프로젝트의 `deploy/`에서 별도로 구현**합니다.

## Files

```text
deployment/
├─ README.md
├─ deploy-heartbeat.cmd
├─ deploy-heartbeat.ps1
└─ heartbeat.sh
```

## Usage

새 프로젝트를 시작할 때 이 directory를 project의 `deploy/` 등 적절한 위치로 복사한 뒤 사용합니다.

```bat
deploy-heartbeat.cmd ^
  -HostName example-host ^
  -User ubuntu ^
  -KeyPath C:\path\to\private.key ^
  -RemoteDir ~/my-project-heartbeat
```

실제 변경 없이 흐름만 확인:

```bat
deploy-heartbeat.cmd ^
  -HostName example-host ^
  -User ubuntu ^
  -KeyPath C:\path\to\private.key ^
  -RemoteDir ~/my-project-heartbeat ^
  -WhatIf
```

## Template contract

- Script는 `Step n/m` 형식의 heartbeat/progress를 출력합니다.
- 상태 변경 전 SSH preflight를 수행합니다.
- 기존 remote heartbeat가 있으면 먼저 backup합니다.
- 변경 후 checksum과 smoke test를 모두 통과해야 `OVERALL=PASS`를 출력합니다.
- verification 실패 시 가능한 경우 이전 heartbeat를 자동 복구합니다.
- private key, host, secret, project-specific service명은 template에 하드코딩하지 않습니다.
- 이 template이 성공했다고 해서 실제 project application deployment가 검증된 것은 아닙니다. 각 project는 자신의 build/test/deploy/rollback 계약을 `SWE1.md`, `ARCH.md`, project `deploy/` 문서에 정의해야 합니다.
