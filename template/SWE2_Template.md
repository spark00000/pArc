# SWE2 Template

**Version:** 0.0.0

이 문서는 사용자와 Architecture Agent가 요구사항을 구체화하고 설계를 반복하는 **interactive architecture process ledger** 템플릿입니다. 안정된 설계 결과는 `ARCH.md`로 승격하고, 이 문서에는 prompt, reasoning에 필요한 결정 맥락, 실행 결과, 실패/재시도 이력을 유지합니다.

## 0.0.0

### 1.1.
1. 사용자 요구사항 또는 설계 질문을 원문으로 기록합니다.
2. 필요한 경우 세부 항목을 동일한 nested numbering으로 기록합니다.

> [!todo]- Result: YYYY/MM/DD HH:mm
> - [ ] 분석/설계 결과를 기록합니다.
> - [ ] `ARCH.md` 반영 필요 여부를 기록합니다.
> - [ ] 미완료 구현/재시도가 있으면 `SWE3.md`로 이관합니다.

### 1.2.
1. 다음 interactive work item을 기록합니다.

> [!success]- Result: YYYY/MM/DD HH:mm
> - [x] 완료하고 검증한 결과를 간결하게 기록합니다.
> - [x] 필요하면 `ARCH.md`의 반영 section 또는 생성된 ADR ID를 기록합니다.

---

# Definition / User Guide

1. 실제 프로젝트에서는 이 파일을 `SWE2.md`로 복사합니다.
2. `#`는 문서 제목, `## X.Y.Z`는 baseline/version 구간, `### N.M.`은 interactive work item입니다.
3. 사용자 prompt/요구는 가능한 한 원문을 보존합니다.
4. 각 turn의 결과는 기존 Result를 지우지 않고 해당 section 끝에 추가합니다.
5. Architecture로 확정된 내용만 `ARCH.md`에 distill합니다.
6. 실패/보류/재시도 구현 작업은 `SWE3.md`로 이관합니다.
7. Architecture Decision은 `ARCH.md` 생성/갱신 시 AI가 stable ADR ID를 부여하고, 원 evidence는 `SWE2.md`의 baseline + heading 번호로 역추적합니다.
8. 초기 공개 template에는 pre-baseline history를 싣지 않고 `0.0.0`에서 시작합니다.
