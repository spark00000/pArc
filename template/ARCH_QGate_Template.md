# ARCH QGate Template

**Version:** 0.0.0  
**Target artifact:** `ARCH.md`  
**Project instance name:** `ARCH_QGate.md`

이 파일 하나가 **실제 평가에 복사해 사용하는 Template/Example**과 **Definition/User Guide**를 함께 제공합니다. 프로젝트에서는 이 파일을 복사하여 `ARCH_QGate.md`로 사용하고, 각 Item ID의 점수와 evidence를 채웁니다.

---

## 0. Template / Example

### 0.1. Review Control

| 항목 | 값 |
|---|---|
| Project | TBD |
| Project Baseline | 0.0.0 |
| Target ARCH Baseline | 0.0.0 |
| Target Commit / Hash | TBD |
| SWE1 Baseline | 0.0.0 |
| Reviewer | TBD |
| Agent / Model / Provider / Runtime | TBD |
| Review Context Independence | TBD |
| Review Date | TBD |

### 0.2. Score Legend

| 값 | 의미 |
|---|---|
| `2` | 충족. 명확한 evidence로 확인됨 |
| `1` | 부분 충족. 일부 누락/불명확/evidence 부족 |
| `0` | 미충족 또는 모순 |
| `N/A` | 적용 제외. rationale 필수. 점수 계산 제외 |
| `D` | Deferred. rationale + revisit trigger 필수. 0점 |

`R`: `M` = Mandatory, `A` = Advisory.

### 0.3. Chapter Evaluation

#### 1. Introduction and Goals

| Item ID | R | 평가 항목 | Score | Evidence / Finding | Comment |
|---|:---:|---|:---:|---|---|
| QG-01-01 | M | 시스템/제품 목적과 scope가 명확하다. | - | - | arc42 §1 |
| QG-01-02 | M | 주요 functional requirement/driving force가 `SWE1.md`와 연결된다. | - | - | arc42 §1.1, pArc traceability |
| QG-01-03 | M | 주요 quality goal이 구체적이고 우선순위가 있다. | - | - | arc42 §1.2 |
| QG-01-04 | A | 주요 stakeholder와 concern/expectation/authority가 식별된다. | - | - | arc42 §1.3 |
| QG-01-05 | M | material requirement/goal이 Architecture의 후속 chapter 또는 decision으로 추적 가능하다. | - | - | ASPICE SWE.2 BP4 inspired |

**Chapter Score:** TBD

#### 2. Constraints

| Item ID | R | 평가 항목 | Score | Evidence / Finding | Comment |
|---|:---:|---|:---:|---|---|
| QG-02-01 | M | 기술/플랫폼/runtime constraint가 명확하다. | - | - | arc42 §2 |
| QG-02-02 | M | 조직/process/tool/public-private constraint가 필요한 범위에서 명확하다. | - | - | arc42 §2, pArc |
| QG-02-03 | M | 법규/security/privacy/safety/cost constraint가 적용되는 경우 명시된다. | - | - | arc42 §2 |
| QG-02-04 | M | 상충하는 constraint가 해결되었거나 risk/decision으로 disposition 된다. | - | - | pArc consistency |

**Chapter Score:** TBD

#### 3. Context and Scope

| Item ID | R | 평가 항목 | Score | Evidence / Finding | Comment |
|---|:---:|---|:---:|---|---|
| QG-03-01 | M | System boundary와 external actor/system이 명확하다. | - | - | arc42 §3 |
| QG-03-02 | M | Business context와 책임 경계가 명확하다. | - | - | arc42 §3.1 |
| QG-03-03 | M | Technical context/network/trust boundary가 필요한 범위에서 정의된다. | - | - | arc42 §3.2 |
| QG-03-04 | M | External interface/protocol/data format/ownership이 구현 가능한 수준으로 정의된다. | - | - | arc42 §3, pArc handoff |
| QG-03-05 | A | C4 System Context 또는 동등한 text/Mermaid view가 prose/table과 일치한다. | - | - | C4 + pArc Mermaid |

**Chapter Score:** TBD

#### 4. Solution Strategy

| Item ID | R | 평가 항목 | Score | Evidence / Finding | Comment |
|---|:---:|---|:---:|---|---|
| QG-04-01 | M | 핵심 solution strategy가 주요 requirement/quality goal과 연결된다. | - | - | arc42 §4 |
| QG-04-02 | M | 주요 technology/architecture style 선택의 rationale가 있다. | - | - | arc42 §4 |
| QG-04-03 | M | 중요한 trade-off와 reject된 대안이 필요한 수준으로 기록된다. | - | - | arc42 §4/§9 |
| QG-04-04 | M | Architecture가 정의된 criteria에 대해 분석되었음을 보여주는 evidence가 있다. | - | - | ASPICE SWE.2 BP3 inspired |

**Chapter Score:** TBD

#### 5. Building Block View

| Item ID | R | 평가 항목 | Score | Evidence / Finding | Comment |
|---|:---:|---|:---:|---|---|
| QG-05-01 | M | 주요 building block/component/service와 responsibility가 정의된다. | - | - | arc42 §5, SWE.2 BP1 inspired |
| QG-05-02 | M | Dependency와 allowed/forbidden direction이 명확하다. | - | - | arc42 §5 |
| QG-05-03 | M | Interface와 data ownership이 block 경계와 일치한다. | - | - | arc42 §5 |
| QG-05-04 | M | static architecture가 source/repository 구조와 모순되지 않는다(소스 존재 시). | - | - | SWE.2 BP1/BP4 inspired |
| QG-05-05 | A | 필요한 경우 lower-level decomposition의 중단 기준이 명확하다. | - | - | arc42 tailoring |

**Chapter Score:** TBD

#### 6. Runtime View

| Item ID | R | 평가 항목 | Score | Evidence / Finding | Comment |
|---|:---:|---|:---:|---|---|
| QG-06-01 | M | 핵심 use case/quality scenario의 runtime flow가 정의된다. | - | - | arc42 §6, SWE.2 BP2 inspired |
| QG-06-02 | M | state/sequence/concurrency/async/event 관계가 필요한 범위에서 명확하다. | - | - | arc42 §6 |
| QG-06-03 | M | error/failure/retry/timeout/cancellation behavior가 필요한 범위에서 정의된다. | - | - | arc42 §6 |
| QG-06-04 | M | dynamic view가 Building Block/Interface 정의와 일치한다. | - | - | SWE.2 BP4 inspired |

**Chapter Score:** TBD

#### 7. Deployment View

| Item ID | R | 평가 항목 | Score | Evidence / Finding | Comment |
|---|:---:|---|:---:|---|---|
| QG-07-01 | M | device/server/node/runtime/cloud/local topology가 정의된다. | - | - | arc42 §7 |
| QG-07-02 | M | software/service/model을 infrastructure node에 mapping할 수 있다. | - | - | arc42 §7 |
| QG-07-03 | M | network/storage/queue/external service dependency가 명확하다. | - | - | arc42 §7 |
| QG-07-04 | M | capacity/scaling/fallback/recovery/rollback이 material한 경우 정의된다. | - | - | arc42 §7, pArc orchestration |
| QG-07-05 | A | DEV/TEST/PROD 또는 동등 environment 차이가 필요한 경우 명시된다. | - | - | arc42 §7 |

**Chapter Score:** TBD

#### 8. Cross-cutting Concepts

| Item ID | R | 평가 항목 | Score | Evidence / Finding | Comment |
|---|:---:|---|:---:|---|---|
| QG-08-01 | M | data model/ownership/lifecycle 공통 정책이 필요한 범위에서 정의된다. | - | - | arc42 §8 |
| QG-08-02 | M | security/privacy/safety 공통 정책이 적용되는 경우 정의된다. | - | - | arc42 §8 |
| QG-08-03 | A | configuration/secrets/versioning 정책이 일관된다. | - | - | arc42 §8 |
| QG-08-04 | A | logging/observability/telemetry 정책이 필요한 범위에서 정의된다. | - | - | arc42 §8, pArc |
| QG-08-05 | M | error/retry/recovery 등 공통 concept가 개별 building block/runtime view와 모순되지 않는다. | - | - | arc42 §8 |

**Chapter Score:** TBD

#### 9. Architecture Decisions

| Item ID | R | 평가 항목 | Score | Evidence / Finding | Comment |
|---|:---:|---|:---:|---|---|
| QG-09-01 | M | architecturally significant decision이 식별되고 stable ADR ID를 가진다. | - | - | arc42 §9 |
| QG-09-02 | M | decision context와 rationale가 명확하다. | - | - | arc42 §9 |
| QG-09-03 | A | 현실적인 alternatives/trade-offs가 필요한 수준으로 기록된다. | - | - | ADR review practice |
| QG-09-04 | M | decision status와 superseded/stale 상태가 명확하다. | - | - | ADR evolution practice |
| QG-09-05 | M | ADR이 `SWE2.md`의 baseline/version + heading evidence 또는 동등 근거로 역추적 가능하다. | - | - | pArc traceability |

**Chapter Score:** TBD

#### 10. Quality Requirements

| Item ID | R | 평가 항목 | Score | Evidence / Finding | Comment |
|---|:---:|---|:---:|---|---|
| QG-10-01 | M | material quality attribute가 명시된다. | - | - | arc42 §10 |
| QG-10-02 | M | quality requirement가 stimulus/environment/response/measure 형태의 concrete scenario로 표현 가능하다. | - | - | arc42 quality scenario |
| QG-10-03 | M | measurable threshold/acceptance criterion이 정의된다. | - | - | pArc verification symmetry |
| QG-10-04 | M | quality scenario가 requirement/architecture decision과 trace된다. | - | - | SWE.2 BP4 inspired |
| QG-10-05 | M | 오른쪽 V가 새로운 acceptance semantics를 창작하지 않아도 된다. | - | - | pArc symmetric verification |

**Chapter Score:** TBD

#### 11. Risks and Technical Debt

| Item ID | R | 평가 항목 | Score | Evidence / Finding | Comment |
|---|:---:|---|:---:|---|---|
| QG-11-01 | M | 알려진 architecture risk/technical debt가 누락 없이 기록된다. | - | - | arc42 §11 |
| QG-11-02 | M | impact/severity가 이해 가능하다. | - | - | arc42 §11 |
| QG-11-03 | A | mitigation/acceptance owner 또는 authority가 필요한 경우 명시된다. | - | - | pArc governance |
| QG-11-04 | M | `DEFERRED` 항목은 rationale와 revisit trigger를 가진다. | - | - | pArc baseline discipline |

**Chapter Score:** TBD

#### 12. Glossary

| Item ID | R | 평가 항목 | Score | Evidence / Finding | Comment |
|---|:---:|---|:---:|---|---|
| QG-12-01 | M | domain/technical acronym과 중요한 용어가 정의된다. | - | - | arc42 §12 |
| QG-12-02 | M | 같은 개념에 서로 다른 용어를 사용하거나 다른 개념에 같은 용어를 쓰지 않는다. | - | - | pArc agent readability |
| QG-12-03 | A | Agent가 오해하기 쉬운 용어는 disambiguation/example을 제공한다. | - | - | pArc agent-facing primacy |

**Chapter Score:** TBD

#### 13. Agent Role and Orchestration View - pArc Extension

| Item ID | R | 평가 항목 | Score | Evidence / Finding | Comment |
|---|:---:|---|:---:|---|---|
| QG-13-01 | M | 필요한 engineering role이 Agent/Model보다 먼저 정의된다. | - | - | pArc role orchestration |
| QG-13-02 | M | Role별 Responsibility/Authority/RASIC가 명확하다. | - | - | MAN.3/RASIC inspired |
| QG-13-03 | M | Role별 required input/output artifact contract가 정의된다. | - | - | pArc handoff |
| QG-13-04 | M | Role별 qualification/competency를 공개 benchmark 또는 project eval로 평가할 수 있다. | - | - | pArc qualification |
| QG-13-05 | M | Architecture Peer 등 독립성이 필요한 role의 independence 조건이 정의된다. | - | - | pArc independent QA |
| QG-13-06 | M | Role definition과 실제 Agent/Model/Runtime assignment가 분리되어 교체 가능하다. | - | - | pArc vendor neutrality |
| QG-13-07 | A | model/runtime assignment에 performance와 cost가 함께 기록된다. | - | - | pArc resource economics |
| QG-13-08 | A | token/latency/throughput/compute/energy/rework telemetry가 material한 경우 측정 가능하다. | - | - | MAN.3/PA4/PA5 inspired |
| QG-13-09 | M | context/work partition과 추가 authoritative context retrieval 규칙이 필요한 경우 정의된다. | - | - | pArc scoped delivery |
| QG-13-10 | M | scaling/fallback/replacement/escalation trigger가 필요한 경우 정의된다. | - | - | pArc elastic deployment |
| QG-13-11 | M | downstream role이 이전 Agent의 private chat/history 없이 작업을 계속할 수 있다. | - | - | pArc artifact-mediated independence |

**Chapter Score:** TBD

### 0.4. Gate Summary

| Metric | Result |
|---|---|
| Applicable Items | TBD |
| Raw Score / Maximum | TBD |
| **Overall Score** | TBD % |
| Applicable Mandatory Items | TBD |
| Mandatory Items Scored 2 | TBD |
| **Mandatory Compliance** | TBD % |
| Critical Findings | TBD |
| Major Findings | TBD |
| Minor Findings | TBD |
| Observations | TBD |
| **Gate Decision** | **NOT RUN** |

### 0.5. Findings

| Finding ID | Severity | Item ID | Finding | Evidence | Required Action | Owner | Status |
|---|---|---|---|---|---|---|---|
| F-001 | TBD | TBD | TBD | TBD | TBD | TBD | OPEN |

### 0.6. Reviewer Record

- Reviewed `ARCH.md` baseline/hash: TBD
- Reviewer identity/model/provider/runtime: TBD
- Original architecture chat/history supplied: Yes / No / Partial
- Independence rationale: TBD
- Known limitations: TBD

### 0.7. Baseline Decision

- [ ] Mandatory Compliance = 100%.
- [ ] Critical = 0.
- [ ] Major = 0.
- [ ] Review target hash equals baseline candidate hash.
- [ ] Downstream authoritative artifact set is identifiable.

> [!todo]- Result: YYYY/MM/DD HH:mm
> - [ ] 독립 review를 수행하고 실제 score/evidence/finding을 기록합니다.

---

## 1. Definition / User Guide

### 1.1. 목적

`ARCH_QGate_Template.md`는 pArc `ARCH.md`의 **13개 Architecture chapter를 1:1로 평가**하기 위한 재사용 가능한 Quality Gate 정의이자 worksheet입니다. arc42 12개 chapter를 baseline으로 하고, `13. Agent Role and Orchestration View`를 pArc 확장으로 추가합니다.

### 1.2. 사용 방법

1. 이 파일을 프로젝트에 복사하여 실제 review 결과 파일 `ARCH_QGate.md`를 만듭니다.
2. Review Control에 검토 대상 baseline/hash와 reviewer 정보를 기록합니다.
3. `QG-01-xx`부터 `QG-13-xx`까지 모든 Item ID를 순서대로 평가합니다.
4. 각 항목에 score뿐 아니라 `ARCH.md` section, `refs/`, source/test 등 확인 가능한 evidence를 기록합니다.
5. defect는 Finding ID를 부여하고 severity/action/owner/status를 기록합니다.
6. chapter/overall score와 Mandatory Compliance를 계산합니다.
7. Gate Decision을 기록하고 PASS인 경우에만 해당 ARCH를 downstream Architecture Contract baseline으로 사용합니다.

### 1.3. Item ID 규칙

`QG-CC-II` 형식을 사용합니다.

- `CC`: `ARCH.md` chapter 번호 `01`~`13`
- `II`: 해당 chapter 내부의 안정된 검사 항목 번호
- 문구가 보강되어도 같은 의미의 검사항목이면 Item ID를 유지합니다.
- 의미가 다른 새 criterion은 새 Item ID를 추가합니다.

예: `QG-07-04` = ARCH chapter 7 Deployment View의 네 번째 검사항목.

### 1.4. Required Level

- `M` (Mandatory): 적용 대상이면 반드시 `2`여야 baseline PASS 가능.
- `A` (Advisory): score에는 포함되지만 단독으로 baseline을 차단하지 않습니다.

### 1.5. 점수 계산

```text
Chapter Score (%) = Sum(Item Score) / (2 x Applicable Item Count) x 100
Overall Score (%) = Sum(All Item Scores) / (2 x All Applicable Item Count) x 100
Mandatory Compliance (%) = Mandatory Items Scored 2 / Applicable Mandatory Items x 100
```

`N/A`는 분모에서 제외합니다. `D`는 아직 완료되지 않은 항목이므로 0점입니다.

### 1.6. Gate Decision

- `PASS`: Mandatory Compliance = 100%, Critical = 0, Major = 0.
- `PASS WITH ACTIONS`: Mandatory Compliance = 100%, blocking finding = 0, Advisory/Minor action만 남음.
- `FAIL`: Mandatory item 중 하나라도 `0/1/D` 또는 Critical/Major finding 존재.
- `NOT RUN`: 독립 review가 수행되지 않음.

Overall Score는 비교/추세/optimization용이며 Mandatory defect를 평균점수로 상쇄하지 않습니다.

### 1.7. Finding Severity

| Severity | 정의 |
|---|---|
| Critical | baseline 신뢰성, 안전/보안/데이터 또는 핵심 구조를 직접 훼손 |
| Major | downstream Agent가 중요한 설계를 추측해야 하거나 requirement/architecture가 모순됨 |
| Minor | baseline은 가능하지만 명확성/유지보수성/traceability 개선 필요 |
| Observation | 비차단 개선 제안 |

### 1.8. Evidence 규칙

- Score `2`는 review 가능한 evidence가 있어야 합니다.
- 기본 evidence는 `ARCH.md` chapter/ID입니다.
- 필요하면 `SWE1.md`, `SWE2.md`의 version + heading, `refs/`, source/test/evidence를 함께 사용합니다.
- Markdown link는 navigation을 위한 것이며 stable Item/REQ/ARC/ADR ID가 traceability identity를 담당합니다.
- `N/A`와 `D`는 단순 공란으로 두지 않습니다. rationale를 기록하고 `D`에는 revisit trigger를 추가합니다.

### 1.9. Independent Review

- Architecture 작성 Agent의 self-check는 허용하지만 최종 baseline의 유일한 reviewer로 사용하지 않습니다.
- 기본 review는 원 설계 대화의 persuasive history를 받지 않은 별도 context에서 수행합니다.
- risk가 높은 경우 다른 model/provider 또는 복수 reviewer를 사용할 수 있습니다.
- reviewer가 받은 context와 independence 조건을 Reviewer Record에 남깁니다.

### 1.10. 13개 Chapter 1:1 Mapping

| ARCH chapter | QGate Item Prefix |
|---|---|
| 1. Introduction and Goals | `QG-01-*` |
| 2. Constraints | `QG-02-*` |
| 3. Context and Scope | `QG-03-*` |
| 4. Solution Strategy | `QG-04-*` |
| 5. Building Block View | `QG-05-*` |
| 6. Runtime View | `QG-06-*` |
| 7. Deployment View | `QG-07-*` |
| 8. Cross-cutting Concepts | `QG-08-*` |
| 9. Architecture Decisions | `QG-09-*` |
| 10. Quality Requirements | `QG-10-*` |
| 11. Risks and Technical Debt | `QG-11-*` |
| 12. Glossary | `QG-12-*` |
| 13. Agent Role and Orchestration View | `QG-13-*` |

### 1.11. 기준의 출처와 역할

| Reference | QGate에서의 역할 |
|---|---|
| arc42 | 1~12 chapter schema와 architecture completeness baseline |
| Automotive SPICE SWE.2 | static/dynamic architecture, analysis, consistency, bidirectional traceability discipline |
| Automotive SPICE SUP.8 / MAN.3 | baseline/recovery, role/resource/budget concern |
| iSAQB AGENTA | agent-facing architecture, knowledge delivery, alignment, governance, orchestration concern |
| C4 | context/structure/deployment view의 표현 관점 |
| SDD / harness practices | durable artifact, cross-artifact consistency, fresh-agent handoff |
| pArc | independent peer, role/resource decoupling, context partition, cost-performance observability |

### 1.12. Template 확장 규칙

- 프로젝트 특화 검사항목은 기존 Item ID의 의미를 바꾸지 말고 별도 project criterion으로 추가합니다.
- 공통성이 검증된 항목만 pArc reusable template에 승격합니다.
- 13개 architecture chapter와의 1:1 구조를 깨는 top-level checklist group을 만들지 않습니다.
- QGate 변경도 project baseline/version과 함께 형상관리합니다.

### 1.13. Version / Baseline

본 template의 초기 공개 baseline은 `0.0.0`입니다. 이후 accepted change가 생길 때 project baseline 정책에 따라 version을 갱신합니다. 과거 pre-baseline 작업 버전은 공개 문서 History에 포함하지 않습니다.
