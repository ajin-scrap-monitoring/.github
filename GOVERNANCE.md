# 조직 개발 저장소 운영 규칙

## 적용 범위

이 문서는 `ajin-scrap-monitoring` GitHub 조직이 소유한 공개 개발 저장소에 적용하는
최소 운영 기준이다. 각 저장소는 사용하는 언어, CI 검사와 릴리스 산출물처럼 해당
저장소에만 필요한 규칙을 자체 문서에 추가할 수 있다.

저장소별 문서는 이 문서의 공개 범위와 보안 기준을 완화하거나 대체하지 않는다. 공통
기준을 변경해야 하면 이 문서를 Pull Request로 수정한다.

개발 소스 코드는 조직 소유의 공개 저장소에서 관리한다. 조직 프로필과 공개 저장소를
프로젝트의 공개 개발 창구로 사용한다.

## 소유권과 권한

1. 저장소는 `ajin-scrap-monitoring` 조직이 소유한다.
2. 공통 변경 권한은 개인별 반복 설정보다 팀 단위로 부여한다.
3. 조직 소유자는 저장소 생성, 공개 범위와 보호 규칙을 관리한다.
4. 저장소 관리 권한은 코드 변경 권한과 구분하여 필요한 범위로 부여한다.
5. 개인 권한과 팀 권한이 함께 부여되면 GitHub가 가장 높은 권한을 적용한다.

## 공개 범위

공개 저장소에는 다음 내용을 포함할 수 있다.

- 소스 코드와 테스트 코드
- 공개 가능한 빌드, 배포와 자동화 설정
- 공개 사양만으로 만든 합성 예제 데이터
- 저장소를 이해하고 실행하는 데 필요한 기술 문서
- 릴리스 산출물

공개 저장소에는 다음 내용을 포함하지 않는다.

- 외부에서 제공받은 원본 문서와 파일
- 현장 사진, 내부 치수와 내부 측정값
- 비공개 원본에서 파생된 사실과 데이터
- 자격 증명, 비밀키, 토큰과 비밀번호
- 실제 사설 IP 주소와 내부 네트워크 세부 정보
- 실제 운영 로그, 영상과 센서 원본 데이터
- 개인 프로젝트 관리 문서와 비공개 회의 자료

공개 Push 전에 전체 Git 이력과 변경 파일에서 비공개 정보가 제외되었는지 확인한다.

## 소스 이용 조건

프로젝트 소스 코드에는 별도 라이선스를 부여하지 않는다. 개발 저장소에는 `LICENSE`
파일을 만들지 않고 `README.md`에 다음 이용 조건을 명시한다.

> 이 저장소는 코드 검토와 참고를 위해 공개하며 프로젝트 소스 코드에 별도 라이선스를
> 부여하지 않는다.

## 외부 의존성

외부 의존성에는 각 저작권자가 정한 라이선스를 적용한다. 직접 의존성은 저장소 문서에
다음 정보를 기록한다.

| 항목 | 기록 내용 |
| --- | --- |
| 의존성 | 패키지, 라이브러리 또는 도구 이름 |
| 버전 | 직접 사용하는 버전 또는 버전 범위 |
| 사용 목적 | 저장소에서 담당하는 기능 |
| 출처 | 공식 배포 위치 또는 소스 저장소 |
| 라이선스 | SPDX 식별자 또는 공식 라이선스명 |

외부 의존성의 라이선스가 요구하는 저작권, 라이선스와 `NOTICE` 고지를 유지한다. 배포
산출물에 외부 코드를 포함하면 필요한 고지를 산출물과 함께 제공한다. 외부 라이브러리는
교체 가능한 경계로 격리하고 공개 릴리스 전에 직접 및 전이 의존성의 라이선스를 감사한다.

## Issue와 작업 관리

구현, 오류 수정, 문서 변경과 설정 변경은 필요한 경우 Issue로 정의한다. Issue에는 작업
목적, 필요한 이유와 완료 조건을 기록하고 담당자를 지정한다.

조직 Project는 여러 저장소의 열린 Issue를 통합 관리한다. 새 저장소는 Project의
`Auto-add to project` 대상에 등록하고 `is:issue is:open` 필터를 사용한다. Pull Request는
별도 Project 항목으로 추가하지 않는다.

Project에 추가된 Issue의 초기 상태는 `Todo`로 설정하고 작업을 시작하면
`In Progress`로 변경한다. Pull Request 본문의 `Closes #이슈번호`가 기본 브랜치에
병합되면 GitHub가 연결된 Issue를 닫고 Project 상태를 `Done`으로 변경한다.

## 저장소 기본 설정

각 공개 개발 저장소는 다음 설정을 사용한다.

| 항목 | 설정 |
| --- | --- |
| Visibility | Public |
| Default branch | `main` |
| Allow squash merging | 사용 |
| Allow merge commits | 사용하지 않음 |
| Allow rebase merging | 사용하지 않음 |
| Allow auto-merge | 사용하지 않음 |
| Automatically delete head branches | 사용 |

Pull Request는 Squash 방식으로 병합한다. 병합된 작업 브랜치는 GitHub가 자동으로
삭제한다.

## 브랜치와 커밋

`main`은 변경 통합과 릴리스의 기준 브랜치다. 기능 추가, 오류 수정, 문서 변경과 설정
변경은 최신 `main`에서 만든 작업 브랜치에서 수행한다. 작업 브랜치는 원격 저장소에
Push할 수 있으며 후속 커밋을 계속 추가할 수 있다.

작업 브랜치 이름은 `<type>/<issue-number>-<short-description>` 형식을 사용한다.

| 작업 | type |
| --- | --- |
| 기능 추가 | `feature` |
| 오류 수정 | `fix` |
| 문서 변경 | `docs` |
| 유지보수 | `chore` |

커밋 메시지와 Pull Request 제목은 `<type>: <summary>` 형식을 사용한다. `type`은
`feat`, `fix`, `ci`, `docs`, `chore` 중 작업 성격에 맞는 값을 사용한다. `summary`는
한글로 작성할 수 있다.

## Pull Request

작업 브랜치의 변경은 `main`을 대상으로 한 Pull Request로 병합한다. 로컬 변경이나 작업
브랜치를 원격 `main`에 직접 Push하지 않는다.

Pull Request는 다음 순서로 진행한다.

1. 최신 `main`에서 작업 브랜치를 생성한다.
2. 작업 브랜치에서 변경하고 검증한다.
3. 작업 브랜치를 원격 저장소에 Push한다.
4. Pull Request를 생성하고 관련 Issue를 연결한다.
5. 대화와 필수 검증을 완료한다.
6. Squash 방식으로 `main`에 병합한다.

승인 수는 병합 조건으로 강제하지 않는다. 팀원이 코드 대화 또는 `Request changes`로
문제를 제기하면 해당 문제를 해결하고 모든 대화를 완료한 뒤 병합한다.

## `main` 보호 기준

새 개발 소스 저장소는 다음 템플릿과 적용 절차를 먼저 확인한다.

- [ruleset JSON 다운로드](https://raw.githubusercontent.com/ajin-scrap-monitoring/.github/main/rulesets/protect-main-source.json)
- [ruleset 적용 절차](https://github.com/ajin-scrap-monitoring/.github/blob/main/rulesets/README.md)

`New ruleset -> Import a ruleset`에서 위 JSON을 가져온다. 기본 브랜치를 대상으로 하는
`protect-main` ruleset이 Disabled 상태로 생성된다.

CI와 CodeQL을 먼저 실행하고 저장소별 필수 검사를 등록하는 순서는 적용 절차 문서를
따른다. 아래 표는 가져오기와 저장소별 설정을 모두 마친 뒤 도달해야 하는 최종 상태다.

| 항목 | 설정 |
| --- | --- |
| Ruleset name | `protect-main` |
| Enforcement status | Active |
| Bypass actor | Organization admin |
| Bypass mode | Pull requests only |
| Target branch | Default branch |
| Restrict deletions | 사용 |
| Require linear history | 사용 |
| Require a pull request before merging | 사용 |
| Required approvals | 0 |
| Require conversation resolution before merging | 사용 |
| Allowed merge methods | Squash |
| Require status checks to pass | 사용 |
| Require branches to be up to date before merging | 사용 |
| Do not require status checks on creation | 사용하지 않음 |
| Require code scanning results | 사용 |
| Code scanning tool | CodeQL |
| Security alerts threshold | High or higher |
| Alerts threshold | Errors |
| Block force pushes | 사용 |

조직 관리자의 예외 권한은 Pull Request 안에서 명시적으로 우회할 때만 사용한다. 조직
관리자도 `main`에 직접 Push하여 ruleset을 우회하지 않는다.

머지 큐는 사용하지 않는다.

조직 공통 `.github` 저장소의 `protect-main`은 문서 검증용 `Community files` 검사에
맞춘 별도 설정이다. 개발 소스 저장소용 템플릿으로 사용하지 않는다.

## CI와 코드 분석

CI (Continuous Integration, 지속적 통합)는 Pull Request와 `main` 변경을 자동으로
검증한다. 각 저장소는 빌드, 린트와 타입 검사, 테스트 등 저장소에 필요한 검사를
정의하고 ruleset의 필수 상태 검사로 등록한다.

Pull Request는 최신 `main`을 반영한 상태에서 필수 검사를 다시 통과해야 한다. 실제로
실행되어 GitHub에 보고된 검사만 필수 상태 검사로 등록한다. 필수 검사 이름은 저장소마다
달라질 수 있으므로 개발 소스 저장소용 ruleset 템플릿에는 포함하지 않는다.

실행 소스 코드가 있는 저장소는 CodeQL을 구성하고 `Require code scanning results`를
사용한다. 보안 경고 임계값은 `High or higher`, 일반 경고 임계값은 `Errors`로 설정한다.
CodeQL 분석 결과가 한 번 보고된 뒤 ruleset에 등록한다.

개발 소스 저장소용 ruleset 템플릿은 CodeQL 규칙을 포함하되 Disabled 상태로 제공한다.
CI와 CodeQL 결과가 GitHub에 보고되고 필수 검사 이름을 등록한 뒤 Active 상태로
전환한다.

조직 공통 `.github` 저장소는 문서 검증 CI의 `Community files` 검사를 필수 상태 검사로
사용한다. 실행 소스 코드가 없으므로 CodeQL 검사는 요구하지 않는다.

## 릴리스

`main`에 병합된 모든 변경을 즉시 릴리스하지 않는다. 릴리스할 검증 완료 커밋을
선택하고 해당 커밋을 가리키는 `vMAJOR.MINOR.PATCH` 형식의 버전 태그를 생성한다.

버전 태그가 원격 저장소에 Push되면 릴리스 워크플로우가 검증과 빌드를 실행한다.
릴리스 워크플로우는 GitHub Release를 생성하고 배포 가능한 산출물이 있으면 릴리스
자산으로 첨부한다. 각 저장소는 버전, 태그, GitHub Release와 릴리스 자산을 독립적으로
관리한다.
