# SWE1 Template

**Version:** 0.0.0

이 문서는 pArc 프로젝트의 **요구·제약·작업 계약 템플릿**입니다. Automotive SPICE SWE.1의 요구사항 분석 개념을 중심으로 하되, 실제 개인/Agentic 프로젝트 운영에 필요한 SUP.8 성격의 형상관리·복구 규칙과 MAN.3 성격의 역할·자원 제약을 함께 담습니다. 프로젝트별 실제 값은 이 템플릿을 복사한 뒤 채웁니다.

## 0. 문서 제어

| 항목 | 값 |
|---|---|
| Project | TBD |
| Baseline | 0.0.0 |
| Status | Draft |
| Architecture Contract | `ARCH.md` |
| Architecture Quality Gate | `ARCH_QGate.md` |

## 1. 목적과 범위

### 1.1. 목표

- [ ] 프로젝트가 해결할 문제를 기술합니다.
- [ ] 사용자가 얻어야 할 결과를 기술합니다.
- [ ] 성공 조건을 기술합니다.

### 1.2. 범위

- In Scope: TBD
- Out of Scope: TBD

### 1.3. Non-goals

- TBD

## 2. 요구사항

요구사항은 가능한 한 **무엇을/왜** 만족해야 하는지 기술하고, 구현 방법은 원칙적으로 `ARCH.md`에서 다룹니다. 사용자가 요구와 설계를 동시에 제시한 경우에도 최종 baseline에서는 requirement와 architecture decision을 구분합니다.

### 2.1. Functional Requirements

- REQ-F-001: TBD

### 2.2. Quality Requirements

- REQ-Q-001: TBD

### 2.3. Interface / Data / Compatibility Requirements

- REQ-I-001: TBD

### 2.4. Safety / Security / Privacy / Compliance

- Applicable / N/A / DEFERRED 중 하나를 명시합니다.
- TBD

### 2.5. Acceptance Obligations

오른쪽 V의 검증이 새 기준을 창작하지 않도록, 제품이 통과해야 할 acceptance semantics를 가능한 한 이 단계 또는 SWE2 Architecture 단계에서 먼저 정의합니다.

- ACC-001: TBD

## 3. 공통 작업 계약

> [!info] 1. Chat 응답은 존댓말로 작성합니다. 짧게 답할 때도 단정적 반말을 사용하지 않으며, 작업 결과를 먼저 제시하고 필요한 근거와 제한사항을 뒤에 설명합니다. 다만 쓸데없이 말을 길게 하여 token/credit을 낭비하지 않습니다.
%%
%%
> [!info] 2. 모든 상태 변경 전에 현재 상태와 정확한 대상을 읽기 전용으로 확인하고, 작업 종류에 맞는 backup, checkpoint, snapshot, export 또는 Git ref를 만든 뒤 원복 절차와 원본 hash/commit 일치를 검증합니다. 검증된 복구 수단을 만들 수 없으면 변경하지 않습니다.
%%
%%
> [!info] 3. 기존 변경 중인 worktree와 사용자 편집은 사용자 소유로 간주합니다. 덮어쓰기가 필요한 경우 기존 상태를 별도 blob/commit/checkpoint로 보존하고 작업 전 내용과 일치함을 확인합니다. Git으로 복구 가능한 프로젝트에는 불필요한 별도 backup directory를 만들지 않습니다.
%%
%%
> [!info] 4. 사용자가 정한 목표와 범위 안에서는 합리적인 가정을 통해 끝까지 진행합니다. 결과를 실질적으로 바꾸는 선택, 새로운 권한, 외부 공개·전송, 복구하기 어려운 작업이 필요할 때만 중단하고 사용자 또는 지정 Authority에게 명시적으로 확인합니다.
%%
%%
> [!info] 5. 변경은 요청 범위에 필요한 최소 단위로 수행하고 실패하면 연쇄적인 추가 변경을 중단합니다. 관련 test, lint, build, release check와 결과물 hash·Git 상태를 위험도에 맞게 검증하며, 검증하지 못한 사항은 완료로 표현하지 않습니다.
%%
%%
> [!info] 6. 공개 source, 비공개 process 문서, 생성 산출물, secret, 개인정보와 외부 service 상태의 경계를 구분합니다. 공개하지 않기로 한 파일은 public branch에서 추적하지 않고, push·release·외부 전송 전에 tracked files, diff, remote, ignore 상태와 민감정보 포함 여부를 확인합니다.
%%
%%
> [!info] 7. 문서는 표준 Markdown을 우선합니다. Obsidian에서 작성 주체를 구분할 때 사용자가 확정한 항목은 native `[!info]`, Agent가 새로 작성한 항목은 native `[!attention]` callout을 사용합니다. 독립 callout 사이에는 빈 Obsidian block comment `%%` 두 줄을 바로 붙여 시각적 빈 행 없이 block 경계를 유지합니다. 줄 끝 backslash, HTML tag, custom CSS는 사용자가 명시적으로 허용하기 전에는 사용하지 않습니다.
%%
%%
> [!info] 8. 요청한 표시나 동작이 Markdown·Obsidian·사용 도구의 문법상 성립하지 않거나 요구사항끼리 충돌하면 임의로 우회하지 않습니다. 먼저 제약, 영향과 가능한 대안을 명시하고 사용자 승인을 받은 뒤 작업합니다.
%%
%%
> [!info] 9. 프로젝트 공통 원칙과 프로젝트 특화 규칙을 구분합니다. 재사용 가능한 공통 방법론은 `AGENTS.md`, 이 프로젝트의 실제 요구·제약은 `SWE1.md`, interactive architecture 기록은 `SWE2.md`, 안정된 설계 결과는 `ARCH.md`, 미완료·실패·deferred 구현 항목은 `SWE3.md`에 둡니다.

## 4. 프로젝트별 제약

이 section은 프로젝트를 시작할 때 반드시 실제 값으로 교체하거나 `N/A`를 명시합니다.

### 4.1. Workspace / Source / Tool 경계

- Project root: TBD
- Source root: TBD
- Tool/install root: TBD
- 생성 허용 directory: TBD
- 변경 금지 directory/system 영역: TBD

### 4.2. Runtime / Platform

- OS / device / architecture: TBD
- Runtime / language / package manager: TBD
- Minimum/target version: TBD

### 4.3. 외부 서비스 / 네트워크 / 비용

- Allowed services: TBD
- Forbidden services: TBD
- API/Token/Cloud budget: TBD
- Offline/local requirement: TBD

### 4.4. 공개 / 비공개 / Secret

- Public artifacts: TBD
- Private artifacts: TBD
- Secrets: TBD
- 개인정보/사용자 데이터 처리: TBD

### 4.5. Build / Test / Release

- Build command: TBD
- Unit test: TBD
- Integration test: TBD
- Release check: TBD
- Manual verification: TBD

## 5. 형상관리와 복구 - SUP.8 inspired

### 5.1. Configuration Items

- `AGENTS.md`
- `SWE1.md`
- `SWE2.md`
- `SWE3.md`
- `ARCH.md`
- `ARCH_QGate_Template.md`
- `ARCH_QGate.md`
- Source / tests / refs / generated deliverables as applicable

### 5.2. Baseline

- Baseline identifier는 `MAJOR.MINOR.PATCH` 형태를 사용합니다.
- 같은 baseline은 process 문서, `ARCH.md`, source, test/evidence의 일관된 상태를 가리켜야 합니다.
- Architecture 본문 변화가 없어도 전체 project baseline이 변경되면 `ARCH.md` History는 해당 baseline과 동기화할 수 있습니다.

### 5.3. Backup / Recovery

- Git으로 완전 복구 가능한 경우 Git commit/ref/blob를 우선합니다.
- Git 밖의 상태는 대상별 export/snapshot/restore point 등 적절한 수단을 정의합니다.
- 복구 수단은 작업 전에 생성하고 식별자/hash/commit 등으로 검증합니다.

## 6. 역할·자원·예산 - MAN.3 inspired

프로젝트는 특정 AI 제품을 먼저 고르기보다 필요한 **Role Profile**을 먼저 정의합니다.

| Role | Responsibility | Authority | Required Input | Required Output | Qualification | Resource/Budget |
|---|---|---|---|---|---|---|
| Architecture | TBD | TBD | SWE1 + refs | ARCH draft | TBD | TBD |
| Architecture Peer | TBD | TBD | ARCH + QGate template | QGate result | TBD | TBD |
| Implementation | TBD | TBD | Baselined ARCH + source | Source change | TBD | TBD |
| Verification | TBD | TBD | Left-V obligations + implementation | Evidence | TBD | TBD |
| Release/Deployment | TBD | TBD | Approved build/evidence | Released/deployed state | TBD | TBD |

모델/Agent/Runtime 선택 시 가능한 경우 quality/performance metric과 token, 비용, latency, throughput, rework, compute/energy를 함께 기록합니다.

## 7. Context / Work Partition

- 기본값은 필요한 범위의 authoritative artifact 전체를 제공하는 것입니다.
- 문서/저장소가 Agent의 실효 context 또는 작업 능력을 초과하면 작업을 분할합니다.
- 분할된 작업은 `ARCH.md`의 안정된 section/requirement/decision/reference로 추적할 수 있어야 합니다.
- Agent는 필요 시 추가 authoritative context를 조회할 수 있어야 합니다.

## 8. SWE2 작업 기록 규칙

`SWE2.md`는 사용자와 설계 Agent의 interactive architecture process ledger입니다.

- `# SWE2`를 문서 제목으로 사용합니다.
- `## X.Y.Z`를 baseline/version 구간으로 사용합니다.
- 개별 interactive work item은 `### N.M.` 형식을 사용합니다.
- 사용자의 prompt/요구는 원문을 보존합니다.
- 실행 결과는 해당 section 끝에 새 Result callout으로 추가하며 이전 Result를 지우지 않습니다.

Result 형식:

```md
> [!success]- Result: YYYY/MM/DD HH:mm
> - [x] 완료하고 검증한 내용
> - [ ] 남은 사용자 확인 또는 후속 작업
```

상태:

- `[!success]`: 요구사항과 필요한 검증까지 완료
- `[!failure]`: 요청을 충족하지 못했거나 검증 실패
- `[!todo]`: 외부 처리, 사용자 확인, 재시도 등 미완료 상태 존재

## 9. Architecture 승격 규칙

SWE2의 모든 대화나 실패 이력을 `ARCH.md`로 복사하지 않습니다. Architecture baseline 생성/갱신 시 구현에 필요한 안정된 결과만 distill합니다.

- Requirements → REQ/quality/constraint section
- Structural/runtime/deployment decisions → 해당 arc42 section
- Architecture decision → `ARCH.md`의 Architecture Decisions chapter에서 ADR ID 부여
- Role/resource/orchestration decision → Agent Role & Orchestration View
- 실패한 탐색 또는 미완료 구현 → `SWE3.md`

SWE2 원문 evidence는 `baseline version + ### section number`로 역추적할 수 있게 유지합니다.

## 10. Lessons Learned

프로젝트 수행 중 발견한 중요한 사실을 기록합니다. 공통 방법론으로 승격할 내용은 여러 프로젝트에서 유효함을 확인한 뒤 별도 승인하여 `AGENTS.md`에 반영합니다.

- TBD

## 11. Project-specific Notes

- TBD
