# Agentic Engineering Reference Landscape

**Purpose:** pArc 방법론 및 SPARK 실행 기능 확장을 위한 외부 기술 레퍼런스  
**Verified:** 2026-09-22

> 특정 제품 도입 결정문이 아니라, pArc에 흡수할 방법론과 SPARK에 구현할 실행 기능을 분리하여 비교하기 위한 조사 기준점입니다.

## 1. Summary

| 기술 | 분류 | 실행 코드 | Sub-agent / Orchestration | Context / 상태관리 | Codex 적합성 | pArc 적용 포인트 | SPARK 확장 후보 | 중복/충돌 | 원본 |
|---|---|---:|---|---|---|---|---|---|---|
| **GSD (Get Shit Done)** | Methodology + Skills + agent workflow | O | **O** — planner/executor/verifier, agent별 skill 주입 | .planning 기반 durable state | **높음** | 계획→실행→검증 분리, role별 bounded context | role별 spawn, state bundle, verification gate | pArc SWE lifecycle와 일부 중복 | [GitHub](https://github.com/gsd-build/get-shit-done) |
| **gstack** | Skill stack + helper runtime | O | host 의존 | Skill workflow + browser helper | **높음** | CEO/Eng/Design/QA/Release 전문 역할 | reusable role registry, second opinion | pArc Role View와 중복 | [GitHub](https://github.com/garrytan/gstack) |
| **Superpowers** | Methodology + composable Skills | 일부 | **O** — host native multi-agent 가능 | spec/plan/task artifact | **높음** | brainstorm→design→plan→TDD→review discipline | native sub-agent dispatch wrapper | GSD/cc-sdd와 중복 | [GitHub](https://github.com/obra/superpowers) |
| **LazyCodex** | **Agent Harness** | **O** | **O** | project memory, planning, execution state | **매우 높음** | memory/plan/execute/verify runtime lifecycle | Codex launcher, persistent memory, resume | oh-my-codex/OmO와 강한 중복 | [GitHub](https://github.com/code-yeongyu/lazycodex) |
| **context-mode** | **Context infrastructure / MCP** | **O** | 직접 목적 아님 | **강함** — output sandboxing + persistent memory | 높음 | P8 Complete Knowledge / Bounded Work Context 구현 | output sandbox/index, selective retrieval | SPARK tool-result 관리와 중첩 가능 | [GitHub](https://github.com/mksglu/context-mode) |
| **Caveman** | Token-efficiency Skill/plugin | O(보조) | X | output 축약 + memory compression | 높음 | P9 Resource Economics 실험 | output budget/compression 옵션 | 거의 없음 | [GitHub](https://github.com/dvfdez/20260407-caveman) |
| **Oh My OpenAgent (OmO)** | **Multi-agent Harness** | **O** | **O** — 다수 agent, team mode, hooks | routing, MCP, hooks, telemetry | 높음 | graph orchestration, lifecycle hooks | orchestration DAG, agent pool, telemetry | LazyCodex/oh-my-codex와 강한 중복 | [GitHub](https://github.com/code-yeongyu/oh-my-openagent) |
| **oh-my-codex** | **Codex Agent Harness** | **O** | **O** — specialized agents/delegation | state, routing, drift, resume | **매우 높음** | plan→delegate→verify→resume | state machine, drift detection, session manager | LazyCodex/OmO와 강한 중복 | [GitHub](https://github.com/realsigridjin/oh-my-codex) |
| **GitHub Spec Kit** | SDD toolkit + CLI + Skills | **O** | host 의존 | spec/plan/tasks/outcomes | **높음** | durable specification, convergence | artifact generator 참고 | pArc SWE1/SWE2와 상당 부분 중복 | [GitHub](https://github.com/github/spec-kit) |
| **OpenSpec** | SDD framework + CLI + Skills | **O** | host 의존 | propose/explore/apply/update/sync/archive | **높음** | delta-spec → sync → archive | spec sync/archive helper | Spec Kit/pArc와 중복 | [GitHub](https://github.com/Fission-AI/OpenSpec) |
| **BMAD Method** | SDLC framework + agents/workflows/skills | **O** | O | workflow artifact | 높음 | 역할 분리, thinking/build 분리 | 전문 role skill library | pArc Role View/gstack과 중복 | [GitHub](https://github.com/bmad-code-org/BMAD-METHOD) |
| **cc-sdd** | **SDD Harness + Agent Skills** | **O** | **O** — native subagent spawn + independent review | spec/brief/roadmap/tasks + long-running impl | **매우 높음** | boundary contract, per-task independent review | native subagent launcher, debug/review loop | pArc+GSD+Ralph와 부분 중복 | [GitHub](https://github.com/gotalab/cc-sdd) |
| **Ralph / Ralph Loop** | Autonomous loop pattern + implementations | **O** | 구현별 상이 | **강함** — file/git state + fresh context | 구현에 따라 높음 | P3/P10의 가장 단순한 실행 패턴 | loop runner, stop/resume/watch, completion gate | cc-sdd long-running impl과 중복 | [Anthropic](https://github.com/anthropics/claude-code/tree/main/plugins/ralph-wiggum) / [Codex+Claude](https://github.com/Yeine/ralph) |
| **Codagent Agent Skills** | Portable Skill bundle | 일부 | host/plugin 의존 | requirements→design→TDD→CI/PR | 높음 | lifecycle별 focused skill | validator integration | Superpowers/GSD와 중복 | [GitHub](https://github.com/Codagent-AI/agent-skills) |
| **Carl Tools** | Specialist Skill bundle | 일부 | 일부 skill이 parallel agents 사용 | skill별 | 높음 | pre-mortem/second-opinion/adversarial review | reviewer pool | pArc QGate와 보완적 중복 | [GitHub](https://github.com/carlkibler/agent-skills) |

## 2. 큰 분류

```text
문서/방법론 중심
  Spec Kit / OpenSpec / Superpowers / GSD
              |
              v
Skill + Workflow
  gstack / BMAD / Codagent / Carl Tools
              |
              v
실행 Harness
  LazyCodex / OmO / oh-my-codex / cc-sdd
              |
              v
Infrastructure / Execution Pattern
  context-mode / Ralph
```

경계는 겹칩니다. GSD와 cc-sdd는 단순 Markdown 방법론을 넘어 sub-agent 실행까지 포함하며, gstack도 setup/build script와 helper runtime을 포함합니다.

## 3. pArc와 SPARK의 역할 분리

| 외부 기술의 요소 | pArc | SPARK |
|---|---|---|
| Requirement / Design / Task artifact 규칙 | **O** | X |
| Role, RASIC, independent reviewer 규칙 | **O** | X |
| Agent 선택/escalation 정책 | **O** | X |
| Sub-agent process/session 생성 | 계약/정책만 | **O** |
| Codex/Claude CLI invocation | X | **O** |
| Parallel agent execution | 역할/독립성 규칙 | **O** |
| Context bundle 정의/추적 | **O** | **O — 실제 생성/전달** |
| Tool output sandbox/index | bounded-context 원칙 | **O** |
| Persistent task/session state | baseline/state contract | **O** |
| Stop/resume/retry/watch | policy | **O** |
| Test execution/result capture | evidence requirement | **O** |
| Git worktree isolation | isolation requirement | **O** |
| Token/cost telemetry | metric 정의 | **O** |
| Output compression | 측정 기준 | 선택적 O |

## 4. Technology Notes

### 4.1. GSD — Get Shit Done
단순 Markdown 묶음이 아니라 Skill, agent definition, Codex TOML/hooks, .planning state를 갖는 workflow system입니다. Codex에서 planner/executor/verifier 같은 agent 유형을 분리하고 spawn 시 custom Skill을 주입할 수 있습니다.

**pArc:** P5 Role-Orchestrated Execution, P6 Independent QA, P8 Bounded Context의 concrete reference.  
**SPARK:** spawn(role, context_refs, skills), role별 context bundle, result 회수, verifier 분리.

Source: https://github.com/gsd-build/get-shit-done

### 4.2. gstack
역할별 SKILL.md 묶음이 핵심이지만 setup/build script와 browser helper runtime도 있습니다. CEO/Engineering/Design/QA/Release/Investigate/Codex second-opinion 역할이 분리됩니다.

**pArc:** Role Profile을 reusable specialist skill로 표현하는 예시.  
**SPARK:** role registry, independent second-opinion launcher, QA/review session 분리.

Source: https://github.com/garrytan/gstack

### 4.3. Superpowers
Composable Skill 기반 개발 방법론입니다. brainstorming, design, planning, TDD, debugging, review, subagent-driven development를 제공합니다. Codex native skill discovery를 사용합니다.

**pArc:** task-level execution discipline만 선택적으로 참고.  
**SPARK:** task별 fresh sub-agent와 구현 후 독립 review 분리.

Source: https://github.com/obra/superpowers

### 4.4. LazyCodex
Codex 내부에서 project memory, planning, execution, verified completion을 묶는 실제 Agent Harness입니다. source/runtime/package가 있는 프로그램입니다.

**pArc:** artifact-mediated independence를 runtime으로 연결하는 사례.  
**SPARK:** Codex process/session launcher, memory loader, long-running state, completion verifier, interrupted-session resume.

Source: https://github.com/code-yeongyu/lazycodex

### 4.5. context-mode
MCP server + hooks 기반 context infrastructure입니다. 큰 tool output을 LLM context에 그대로 넣지 않고 sandbox/index에 저장하고 필요한 부분만 전달하며 persistent session memory도 제공합니다.

**pArc:** P8의 가장 직접적인 구현 reference.  
**SPARK:** raw output store, index/selective retrieval, durable session state, context-budget routing.

Source: https://github.com/mksglu/context-mode

### 4.6. Caveman
Agent의 reasoning/orchestration system이 아니라 output 축약 Skill/plugin과 memory compression helper입니다.

**pArc:** P9 Resource Economics 실험 대상으로만 취급. token 감소뿐 아니라 acceptance quality/rework까지 함께 측정해야 합니다.  
**SPARK:** optional compression profile, role별 output budget, token/quality before-after telemetry.

Source: https://github.com/dvfdez/20260407-caveman

### 4.7. Oh My OpenAgent (OmO)
여러 host를 지원하는 multi-agent harness입니다. 다수 agent, lifecycle hooks, MCP, team mode, routing, telemetry를 제공하며 Codex용 Light Edition도 존재합니다.

**pArc:** Role을 graph로 배치하고 hooks로 lifecycle을 제어하는 구현 사례.  
**SPARK:** orchestration DAG, agent pool, lifecycle event hooks, telemetry/model routing.

Source: https://github.com/code-yeongyu/oh-my-openagent

### 4.8. oh-my-codex
Codex 위에 specialized agents, Skills, hooks, LSP/AST tooling, state/routing/drift/resume를 올리는 실제 orchestration runtime입니다.

**pArc:** plan→delegate→verify→detect drift→resume 구조가 process/runtime bridge에 가깝습니다.  
**SPARK:** task state machine, role delegation, drift detector, wait/resume, session manager.

Source: https://github.com/realsigridjin/oh-my-codex

### 4.9. GitHub Spec Kit
Python CLI + templates + Skills로 SDD를 구현합니다. Codex는 .agents/skills integration을 지원합니다.

**pArc:** 이미 pArc 영향 요소이므로 이중 SSOT를 만들기보다 artifact generation/convergence 패턴만 비교합니다.

Source: https://github.com/github/spec-kit

### 4.10. OpenSpec
Node CLI + generated Skills 기반 SDD framework입니다. propose/explore/apply/update/sync/archive lifecycle을 제공하며 Codex는 skills-only integration을 사용합니다.

**pArc:** delta-spec→sync→archive를 현재 SWE2→ARCH baseline convergence와 비교할 가치가 있습니다.

Source: https://github.com/Fission-AI/OpenSpec

### 4.11. BMAD Method
Agents, workflows, skills를 묶는 AI-native SDLC framework이며 Codex plugin도 제공합니다.

**pArc:** concrete role catalog와 thinking/build workflow 분리를 참고하되 normative dependency로 삼지 않습니다.

Source: https://github.com/bmad-code-org/BMAD-METHOD

### 4.12. cc-sdd
npx installer와 17개 Agent Skills를 갖는 SDD harness입니다. Codex/Claude Code stable 지원이며 큰 task set을 실행할 때 각 host의 native primitive로 subagent를 spawn하고 per-task independent review/debug loop를 수행합니다.

**pArc:** 현재 목록 중 가장 직접적인 implementation reference 중 하나입니다. boundary contract, work partitioning, per-task independent review가 중요합니다.  
**SPARK:** host adapter, one-task-one-agent, reviewer spawn, auto-debug loop, roadmap/brief resume.

Source: https://github.com/gotalab/cc-sdd

### 4.13. Ralph / Ralph Loop
본질은 반복 실행 패턴입니다. 같은 task를 fresh context의 agent에 반복 제공하고 진척 상태는 대화 context 대신 파일/Git에 남깁니다. 구현에 따라 bash loop, Stop hook, 별도 runner를 사용합니다.

대표 구현:
- Anthropic: https://github.com/anthropics/claude-code/tree/main/plugins/ralph-wiggum
- Codex + Claude runner: https://github.com/Yeine/ralph
- fresh-process example: https://github.com/FasalZein/ralph-loop

**pArc:** P3 Artifact-Mediated Independence와 P10 Recursive Baseline Convergence의 단순한 실행 패턴.  
**SPARK:** fresh agent per iteration, stop/resume/restart/watch, retry/iteration limit, durable progress ledger, evidence-based completion gate.

### 4.14. Codagent Agent Skills
Idea evaluation→requirements→design→tasks→TDD→validation→PR/CI를 stage별 Skill로 제공하는 portable bundle이며 Codex plugin도 제공합니다.

**pArc:** SWE 단계별 focused skill packaging 방식 참고.

Source: https://github.com/Codagent-AI/agent-skills

### 4.15. Carl Tools
pre-mortem, empathy/trust audit, second opinions, support storm 등 독립 Skill 묶음이며 일부는 parallel agents를 사용합니다.

**pArc:** 동일 artifact를 서로 다른 failure lens로 독립 평가하는 방식이 ARCH_QGate/SWE5/SWE6에 유용합니다.  
**SPARK:** N개 reviewer 병렬 실행, 결과 merge/dedup, reviewer-independence 기록.

Source: https://github.com/carlkibler/agent-skills

## 5. Sub-agent가 실제로 뜨는 방식

| 방식 | 실제 실행 | 예 |
|---|---|---|
| **Skill only** | 현재 agent가 Skill을 읽고 같은 session에서 수행 | Caveman, 다수 gstack Skill |
| **Host-native subagent** | Codex/Claude/OpenCode가 제공하는 child-agent primitive 호출 | cc-sdd, GSD 일부, Superpowers |
| **별도 CLI process** | harness가 새 codex/claude process/session 실행 | Ralph 구현, 일부 harness |
| **Plugin/runtime orchestration** | host plugin이 agent pool/state/hooks 관리 | OmO, oh-my-codex |
| **API multi-agent** | 별도 orchestrator가 API로 여러 agent 호출 | 자체 서비스 구현 시 |

따라서 **ChatGPT Work를 계속 켜 두는 것 자체는 sub-agent orchestration과 동일하지 않습니다.** pArc/SPARK에서 중요한 것은 UI mode가 아니라 다음 다섯 가지입니다.

1. 어떤 Role을 새 agent에 배정하는가
2. 어떤 bounded context를 전달하는가
3. 결과를 어디에 durable artifact로 남기는가
4. 누가 독립 검증하는가
5. 실패/중단 시 어떻게 재개하는가

## 6. 하나씩 볼 순서

1. **Ralph** — fresh context + file state의 최소 구조
2. **context-mode** — context 축소와 persistent state
3. **cc-sdd** — native subagent + independent review
4. **GSD** — planner/executor/verifier + role별 Skill injection
5. **LazyCodex / oh-my-codex / OmO** — full harness가 위 기능을 묶는 방법
6. **gstack / Carl Tools** — specialist reviewer/role library
7. **Spec Kit / OpenSpec / Superpowers / BMAD / Codagent** — pArc lifecycle과 겹치는 부분 비교
8. **Caveman** — 마지막에 token economics 실험

## 7. pArc 내부 연결

- [pArc Charter](../AGENTS.md)
- [Architecture Contract](../docs/ARCH.md)
- [Architecture QGate](../docs/ARCH_QGate.md)
- [Project Templates](../template/)
- [Repository README](../README.md)

이 문서는 **reference/influence layer**이며 pArc normative rule을 자동 변경하지 않습니다. 특정 아이디어를 pArc 정식 규칙으로 승격할 때에는 AGENTS.md, ARCH.md, template, QGate 간 일관성을 별도로 검증합니다.
