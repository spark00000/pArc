# ARCH QGate

**Project:** pArc  
**Target:** `docs/ARCH.md`  
**Target Baseline:** 0.0.0  
**QGate Definition:** `template/ARCH_QGate_Template.md` v0.0.0  
**Reviewer:** GPT-5.6 Sol, self-review  
**Review Independence:** **Not independent** — 사용자의 지시대로 독립 Peer가 없는 상태에서 Architecture creator가 임시 자가검증  
**Gate Status:** **FAIL / PROVISIONAL SELF-REVIEW**

> 이 결과는 0.0.0 문서 baseline의 품질 상태를 기록하기 위한 자가비판입니다. pArc 원칙상 독립 Architecture Peer가 최종 gate를 수행해야 하므로, 이 self-review는 최종 PASS evidence가 될 수 없습니다.

## 0. Review Control

| 항목 | 값 |
|---|---|
| Project | pArc |
| Project Baseline | 0.0.0 |
| Target ARCH Baseline | 0.0.0 |
| Target artifact | `docs/ARCH.md` |
| QGate template | `template/ARCH_QGate_Template.md` |
| Reviewer | GPT-5.6 Sol |
| Reviewer relation | Architecture 작성자와 동일 Agent |
| Independent context | No |
| Review date | 2026-09-10 |

### 0.1. Scoring

- `2`: 충족 + evidence 확인
- `1`: 부분 충족
- `0`: 미충족/모순
- `N/A`: 적용 제외 + rationale, 점수 계산 제외
- `D`: Deferred + rationale/revisit trigger, 0점
- `M`: Mandatory, `A`: Advisory

## 1. Introduction and Goals

| Item ID | R | Score | Evidence / Finding | 기준 |
|---|:---:|:---:|---|---|
| QG-01-01 | M | 2 | ARCH §1.1/§1.2에 목적·non-goal이 명시됨. | arc42 §1 |
| QG-01-02 | M | 1 | 실제 project SWE1.md instance가 아직 없고 template만 존재함. Position Paper/대화가 현재 driving source. | arc42 §1.1, pArc traceability |
| QG-01-03 | M | 2 | ARCH §1.3에 우선순위와 목표가 있음. | arc42 §1.2 |
| QG-01-04 | A | 2 | ARCH §1.4에 주요 Role/Authority 정의. | arc42 §1.3 |
| QG-01-05 | M | 2 | ARCH §4 전략, §9 ADR, §10 quality로 연결. | ASPICE SWE.2 BP4 inspired |

**Chapter Score:** 9/10 = 90.0%

## 2. Constraints

| Item ID | R | Score | Evidence / Finding | 기준 |
|---|:---:|:---:|---|---|
| QG-02-01 | M | 2 | ARCH §2.1에 Markdown/Mermaid/Git 등 기술 제약. | arc42 §2 |
| QG-02-02 | M | 2 | ARCH §2.2에 artifact/process/public-private 제약. | arc42 §2, pArc |
| QG-02-03 | M | 2 | ARCH §2.4 비용 제약 존재. 법규/safety는 pArc 방법론 자체에는 project-specific. | arc42 §2 |
| QG-02-04 | M | 2 | 제약 간 충돌은 현재 발견되지 않았고 open issue는 §11 risk로 disposition. | pArc consistency |

**Chapter Score:** 8/8 = 100.0%

## 3. Context and Scope

| Item ID | R | Score | Evidence / Finding | 기준 |
|---|:---:|:---:|---|---|
| QG-03-01 | M | 2 | ARCH §3.1 System Context가 Human/pArc/Artifact/Agent/External resource 경계 정의. | arc42 §3 |
| QG-03-02 | M | 2 | ARCH §3.2에 pArc와 external mechanism 책임 경계. | arc42 §3.1 |
| QG-03-03 | M | 2 | ARCH §3.1/§3.3에 connector/runtime/trust interface 개념. | arc42 §3.2 |
| QG-03-04 | M | 2 | ARCH §3.3 interface table에 partner/direction/contract/ownership. | arc42 §3, pArc handoff |
| QG-03-05 | A | 2 | §3.1 Mermaid와 §3.2/3.3 표가 일치. | C4 + pArc Mermaid |

**Chapter Score:** 10/10 = 100.0%

## 4. Solution Strategy

| Item ID | R | Score | Evidence / Finding | 기준 |
|---|:---:|:---:|---|---|
| QG-04-01 | M | 2 | STR-001~006이 portability/verification/cost 등 driver와 연결. | arc42 §4 |
| QG-04-02 | M | 2 | 각 strategy에 rationale/trade-off가 있음. | arc42 §4 |
| QG-04-03 | M | 2 | STR table에 주요 trade-off 기록. | arc42 §4/§9 |
| QG-04-04 | M | 1 | 현재 본 QGate가 첫 formal analysis이며 독립 peer analysis는 아직 없음. | ASPICE SWE.2 BP3 inspired |

**Chapter Score:** 7/8 = 87.5%

## 5. Building Block View

| Item ID | R | Score | Evidence / Finding | 기준 |
|---|:---:|:---:|---|---|
| QG-05-01 | M | 2 | ARCH §5.2 BB-001~009 책임 정의. | arc42 §5, SWE.2 BP1 inspired |
| QG-05-02 | M | 2 | §5.1 Mermaid가 주요 flow/dependency 방향을 정의. | arc42 §5 |
| QG-05-03 | M | 1 | Artifact ownership은 비교적 명확하나 data ownership은 pArc 자체 수준에서 충분히 구체화되지 않음. | arc42 §5 |
| QG-05-04 | M | N/A | N/A: 아직 구현 source가 없는 methodology/document baseline. | SWE.2 BP1/BP4 inspired |
| QG-05-05 | A | N/A | N/A: 0.0.0은 Level-1 process architecture 정의가 목적. | arc42 tailoring |

**Chapter Score:** 5/6 = 83.3%

## 6. Runtime View

| Item ID | R | Score | Evidence / Finding | 기준 |
|---|:---:|:---:|---|---|
| QG-06-01 | M | 2 | §6.1 architecture definition/review, §6.2 downstream execution 시나리오. | arc42 §6, SWE.2 BP2 inspired |
| QG-06-02 | M | N/A | N/A: pArc 0.0.0 process contract에 concurrency/async semantics를 강제하지 않음. | arc42 §6 |
| QG-06-03 | M | 2 | §6.3에 QGate fail, implementation ambiguity, verification fail, resource failure 처리. | arc42 §6 |
| QG-06-04 | M | 2 | §6 runtime flow가 §5 building block과 동일 artifact/role을 사용. | SWE.2 BP4 inspired |

**Chapter Score:** 6/6 = 100.0%

## 7. Deployment View

| Item ID | R | Score | Evidence / Finding | 기준 |
|---|:---:|:---:|---|---|
| QG-07-01 | M | 2 | §7.1 logical deployment topology 정의. | arc42 §7 |
| QG-07-02 | M | 1 | Role/service-to-physical node mapping은 project-specific이며 0.0.0에는 logical mapping만 존재. | arc42 §7 |
| QG-07-03 | M | 1 | Repository/runtime dependency는 보이지만 concrete network/storage/queue contract는 project-specific. | arc42 §7 |
| QG-07-04 | M | 2 | §7.2에 peer activation, horizontal scale, fallback/replacement 원칙. | arc42 §7, pArc orchestration |
| QG-07-05 | A | N/A | N/A: 특정 DEV/TEST/PROD deployment를 규정하는 product가 아님. | arc42 §7 |

**Chapter Score:** 6/8 = 75.0%

## 8. Cross-cutting Concepts

| Item ID | R | Score | Evidence / Finding | 기준 |
|---|:---:|:---:|---|---|
| QG-08-01 | M | N/A | N/A: pArc 자체에 domain data model이 없음. | arc42 §8 |
| QG-08-02 | M | 1 | Public/private/security boundary 원칙은 있으나 concrete policy는 project instance로 위임. | arc42 §8 |
| QG-08-03 | A | 2 | §8 XC-002/003 및 baseline/recovery 정책 존재. | arc42 §8 |
| QG-08-04 | A | 2 | §8 XC-006에 orchestration telemetry 정의. | arc42 §8, pArc |
| QG-08-05 | M | 2 | §6 failure behavior와 §8 recovery policy가 모순되지 않음. | arc42 §8 |

**Chapter Score:** 7/8 = 87.5%

## 9. Architecture Decisions

| Item ID | R | Score | Evidence / Finding | 기준 |
|---|:---:|:---:|---|---|
| QG-09-01 | M | 2 | §9 ADR-001~010 stable ID 사용. | arc42 §9 |
| QG-09-02 | M | 2 | 각 ADR에 decision/rationale 존재. | arc42 §9 |
| QG-09-03 | A | 1 | 일부 ADR은 대안 분석이 충분히 기록되지 않아 partial. | ADR review practice |
| QG-09-04 | M | 2 | 모든 ADR에 status 있음. supersession은 현재 없음. | ADR evolution practice |
| QG-09-05 | M | 1 | Position Paper section은 trace되지만 실제 SWE2.md baseline/heading evidence가 아직 ARCH에 매핑되지 않음. | pArc traceability |

**Chapter Score:** 8/10 = 80.0%

## 10. Quality Requirements

| Item ID | R | Score | Evidence / Finding | 기준 |
|---|:---:|:---:|---|---|
| QG-10-01 | M | 2 | §10 Q-001~008 quality attribute/requirement 명시. | arc42 §10 |
| QG-10-02 | M | 1 | 일부 quality item은 scenario 형태지만 stimulus/environment/response/measure가 완전하지 않음. | arc42 quality scenario |
| QG-10-03 | M | 1 | Cost model은 정량식이 있으나 portability/completeness 등 다수 quality goal의 numeric threshold가 미정. | pArc verification symmetry |
| QG-10-04 | M | 1 | Quality item과 ADR/requirement의 explicit ID-to-ID matrix가 아직 없음. | SWE.2 BP4 inspired |
| QG-10-05 | M | 2 | §6/§10에서 right-V는 left-V obligation을 mirror한다고 명시. | pArc symmetric verification |

**Chapter Score:** 7/10 = 70.0%

## 11. Risks and Technical Debt

| Item ID | R | Score | Evidence / Finding | 기준 |
|---|:---:|:---:|---|---|
| QG-11-01 | M | 2 | §11 RISK-001~008에 known limitation 기록. | arc42 §11 |
| QG-11-02 | M | 2 | 각 risk에 severity 지정. | arc42 §11 |
| QG-11-03 | A | 1 | Mitigation/revisit trigger는 있으나 개별 owner field는 없음. | pArc governance |
| QG-11-04 | M | 2 | Open/deferred concern에 revisit trigger 존재. | pArc baseline discipline |

**Chapter Score:** 7/8 = 87.5%

## 12. Glossary

| Item ID | R | Score | Evidence / Finding | 기준 |
|---|:---:|:---:|---|---|
| QG-12-01 | M | 2 | §12에 pArc 핵심 용어 정의. | arc42 §12 |
| QG-12-02 | M | 2 | 현재 문서 내 pArc/ARCH/QGate/Role 용어 사용이 일관됨. | pArc agent readability |
| QG-12-03 | A | 2 | Agent-facing, Human-facing, Effective Context 등 오해 가능한 용어를 별도 정의. | pArc agent-facing primacy |

**Chapter Score:** 6/6 = 100.0%

## 13. Agent Role and Orchestration View - pArc Extension

| Item ID | R | Score | Evidence / Finding | 기준 |
|---|:---:|:---:|---|---|
| QG-13-01 | M | 2 | §13은 Role 정의를 Agent resource보다 선행. | pArc role orchestration |
| QG-13-02 | M | 2 | §13.1 process-grouped RASIC 존재. | MAN.3/RASIC inspired |
| QG-13-03 | M | 1 | Role authority/qualification은 있으나 Role별 Required Input/Output을 하나의 표로 완전 정규화하지 않음. | pArc handoff |
| QG-13-04 | M | 2 | §13.2/13.3에 ArchBench/coding benchmark/internal eval 등 qualification evidence. | pArc qualification |
| QG-13-05 | M | 2 | Architecture Peer의 independence requirement 정의. | pArc independent QA |
| QG-13-06 | M | 2 | §13.5에서 Role과 Agent/model/runtime assignment 분리. | pArc vendor neutrality |
| QG-13-07 | A | 2 | §10 quantitative model 및 §13.3 cost evidence. | pArc resource economics |
| QG-13-08 | A | 2 | token/cost/latency/throughput/energy/rework telemetry를 §8/§10에 정의. | MAN.3/PA4/PA5 inspired |
| QG-13-09 | M | 2 | §13.4에 context/work partition/retrieval rule. | pArc scoped delivery |
| QG-13-10 | M | 2 | §13.5에 scale/fallback/replacement/reactivation trigger. | pArc elastic deployment |
| QG-13-11 | M | 2 | §1/§12와 Position Paper core principle이 원 chat 없이 handoff 가능해야 함을 명시. | pArc artifact-mediated independence |

**Chapter Score:** 21/22 = 95.5%

## 14. Gate Summary

| Metric | Result |
|---|---|
| Applicable Items | 60 |
| Raw Score / Maximum | 107 / 120 |
| **Overall Score** | **89.2%** |
| Applicable Mandatory Items | 51 |
| Mandatory Items Scored 2 | 40 |
| **Mandatory Compliance** | **78.4%** |
| Critical Findings | 0 |
| Major Findings | 7 |
| Minor Findings | 0 |
| **Gate Decision** | **FAIL / PROVISIONAL SELF-REVIEW** |

### 14.1. Gate Decision Rationale

- Mandatory Compliance가 100%가 아닙니다.
- Major finding이 남아 있습니다.
- 무엇보다 reviewer independence가 충족되지 않았습니다.
- 따라서 `docs/ARCH.md`는 **0.0.0 draft/document baseline**으로 기록할 수 있으나, pArc 원칙상 downstream autonomous implementation을 허용하는 최종 Architecture PASS baseline으로 간주하면 안 됩니다.

## 15. Findings

| Finding ID | Severity | Item ID | Finding | Required Action | Status |
|---|---|---|---|---|---|
| F-001 | Major | QG-01-02 | 실제 pArc project `SWE1.md` instance가 없어 requirement/driver trace가 template/position paper에 의존함. | 0.0.0 이후 project SWE1 instance를 생성하고 material requirement ID를 ARCH에 trace. | OPEN |
| F-002 | Major | QG-04-04 | Architecture analysis가 현재 creator self-review에 의존함. | 독립 Architecture Peer로 QGate 재실행. | OPEN |
| F-003 | Major | QG-07-02/QG-07-03 | Logical deployment는 있으나 concrete node/network/storage mapping은 아직 project-specific placeholder 수준. | 분산 orchestration prototype 단계에서 concrete deployment mapping 추가. | OPEN |
| F-004 | Major | QG-09-05 | ADR이 actual SWE2 baseline/turn evidence와 직접 연결되지 않음. | ARCH baseline 생성 시 SWE2 version + heading evidence를 자동 추출/부여하는 규칙 구현. | OPEN |
| F-005 | Major | QG-10-02/QG-10-03/QG-10-04 | Quality requirement의 scenario/threshold/trace matrix가 아직 충분히 정량화되지 않음. | Pilot 전에 measurable acceptance scenario와 trace matrix 보강. | OPEN |
| F-006 | Major | QG-13-03 | Role별 I/O artifact contract가 여러 section에 흩어져 있고 한 표로 정규화되지 않음. | §13에 Role I/O Contract table 추가. | OPEN |
| F-007 | Major | Independent Review | 본 QGate는 Architecture creator와 동일 Agent의 self-review로 수행됨. | 별도 session/model/provider의 independent peer review를 수행하여 최종 gate evidence 생성. | OPEN |

## 16. Reviewer Record

- Reviewed artifact: `docs/ARCH.md` baseline 0.0.0
- QGate definition: `template/ARCH_QGate_Template.md` baseline 0.0.0
- Reviewer: GPT-5.6 Sol
- Original architecture conversation/history available: Yes
- Independent reviewer context: No
- Limitation: creator와 reviewer가 동일하므로 confirmation/context bias가 남을 수 있음.

## 17. Baseline Decision

- [ ] Mandatory Compliance = 100%.
- [x] Critical finding = 0.
- [ ] Major finding = 0.
- [ ] Independent Architecture Peer review completed.
- [x] Open issue가 명시적으로 기록됨.

> [!failure]- Result: 2026/09/10 23:57
> - [x] 13개 Architecture chapter 전부를 Item ID 단위로 자가검증했습니다.
> - [x] 점수와 open finding을 계산했습니다.
> - [ ] 독립 Architecture Peer review가 필요합니다.
> - [ ] Major finding 해소 후 최종 PASS gate를 다시 실행해야 합니다.
