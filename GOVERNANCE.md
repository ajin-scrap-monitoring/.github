# ajin-scrap-monitoring GitHub 개발 운영 규칙

## 적용 범위

이 문서는 `ajin-scrap-monitoring` GitHub Organization이 소유한 Public 개발 소스
Repository에 적용하는 최소 운영 기준이다. Organization 공통 `.github` Repository는
이 문서의 적용 대상에 포함하지 않는다. 각 Repository는 사용하는 언어, CI 검사와
릴리스 산출물처럼 해당 Repository에만 필요한 규칙을 자체 문서에 추가할 수 있다.

공통 기준을 변경해야 하면 이 문서를 Pull Request로 수정한다.

개발 소스 코드는 Organization 소유의 Public Repository에서 관리한다.

## 소유권과 권한

1. Repository는 `ajin-scrap-monitoring` Organization이 소유한다.
2. 공통 변경 권한은 개인별 반복 설정보다 팀 단위로 부여한다.
3. Organization owner는 Repository 생성, Visibility와 보호 규칙을 관리한다.
4. Repository 관리 권한은 코드 변경 권한과 구분하여 필요한 범위로 부여한다.
5. 개인 권한과 팀 권한이 함께 부여되면 GitHub가 가장 높은 권한을 적용한다.

## Public 범위

Public Repository에는 다음 내용을 포함할 수 있다.

- 소스 코드와 테스트 코드
- 외부 배포가 허용된 빌드, 배포와 자동화 설정
- Public 사양만으로 만든 합성 예제 데이터
- Repository를 이해하고 실행하는 데 필요한 기술 문서
- 릴리스 산출물

Public Repository에는 다음 내용을 포함하지 않는다.

- 외부에서 제공받은 원본 문서와 파일
- 현장 사진, 내부 치수와 내부 측정값
- Private 원본에서 파생된 사실과 데이터
- 자격 증명, 비밀키, 토큰과 비밀번호
- 실제 사설 IP 주소와 내부 네트워크 세부 정보
- 실제 운영 로그, 영상과 센서 원본 데이터
- 개인 프로젝트 관리 문서와 Private 회의 자료

Public Repository에 Push하기 전에 전체 Git 이력과 변경 파일에서 Private 정보가
제외되었는지 확인한다.

## 소스 이용 조건

프로젝트 소스 코드에는 별도 라이선스를 부여하지 않는다. 개발 Repository에는 `LICENSE`
파일을 만들지 않고 `README.md`에 다음 이용 조건을 명시한다.

> 이 Repository는 코드 검토와 참고를 위해 Public으로 제공하며 프로젝트 소스 코드에 별도 라이선스를 부여하지 않는다.

## 외부 의존성

외부 의존성에는 각 저작권자가 정한 라이선스를 적용한다. 직접 의존성은 Repository 문서에
다음 정보를 기록한다.

| 항목 | 기록 내용 |
| --- | --- |
| 의존성 | 패키지, 라이브러리 또는 도구 이름 |
| 버전 | 직접 사용하는 버전 또는 버전 범위 |
| 사용 목적 | Repository에서 담당하는 기능 |
| 출처 | 공식 배포 위치 또는 소스 Repository |
| 라이선스 | SPDX 식별자 또는 공식 라이선스명 |

외부 의존성의 라이선스가 요구하는 저작권, 라이선스와 `NOTICE` 고지를 유지한다. 배포
산출물에 외부 코드를 포함하면 필요한 고지를 산출물과 함께 제공한다. 외부 라이브러리는
교체 가능한 경계로 격리하고 Public Release 전에 직접 및 전이 의존성의 라이선스를 감사한다.

## Issue와 작업 관리

### Issue 생성과 Project 등록

1. 대상 Repository의 `Issues -> New issue`로 이동한다.
2. 작업에 맞는 Issue template의 `Get started`를 선택하고 작업 목적과 필요한 이유를 작성하여
   Issue를 생성한다.
3. 생성한 Issue 오른쪽 사이드바의 `Projects`에서 `Scrap Monitoring Development`를 선택한다.
4. `Projects`에 표시된 `Status`를 `Todo`로 설정한다.

### Issue 처리

1. Issue 오른쪽 사이드바의 `Assignees`에서 작업 담당자를 선택한다.
2. `Projects`에 표시된 `Status`를 `In Progress`로 변경한다.
3. 브랜치와 커밋 규칙에 따라 작업 브랜치를 생성하고 변경과 검증을 완료한다.
4. 작업 브랜치를 Push하고 기본 브랜치 대상 Pull Request를 생성한다.
5. Pull Request 본문에 `Closes #이슈번호`를 작성한다.
6. 대화와 필수 검증을 완료하고 Squash 방식으로 병합한다.
7. GitHub가 Issue를 닫고 `Status`를 `Done`으로 변경했는지 확인한다.

## 기본 설정

### Repository 설정

각 Public 개발 Repository의 Settings에서 다음 값을 설정한다.

| Settings section | 항목 | 설정 |
| --- | --- | --- |
| General | Visibility | Public |
| General | Default branch | `main` |
| General -> Pull Requests | Allow squash merging | 사용 |
| General -> Pull Requests | Allow merge commits | 사용하지 않음 |
| General -> Pull Requests | Allow rebase merging | 사용하지 않음 |
| General -> Pull Requests | Allow auto-merge | 사용하지 않음 |
| General -> Pull Requests | Automatically delete head branches | 사용 |
| Advanced Security | Private vulnerability reporting | Enabled |
| Advanced Security | CodeQL | Default setup |

### Organization 설정

Organization Settings -> Repository -> General에서 다음 값을 설정한다.

| Settings section | 항목 | 설정 |
| --- | --- | --- |
| Releases | Immutable releases | All repositories |

## 브랜치와 커밋

`main`은 변경 통합과 릴리스의 기준 브랜치다. 기능 추가, 오류 수정, 문서 변경과 설정
변경은 최신 `main`에서 만든 작업 브랜치에서 수행한다. 작업 브랜치는 원격 Repository에
Push할 수 있으며 후속 커밋을 계속 추가할 수 있다.

작업 브랜치 이름은 `<type>/<issue-number>-<short-description>` 형식을 사용한다.
작업 브랜치, 커밋 메시지와 Pull Request 제목에는 같은 `type`을 사용한다.

| 작업 | type |
| --- | --- |
| 기능 추가 | `feat` |
| 오류 수정 | `fix` |
| CI 변경 | `ci` |
| 문서 변경 | `docs` |
| 유지보수 | `chore` |

커밋 메시지와 Pull Request 제목은 `<type>: <summary>` 형식을 사용한다. `summary`는
한글로 작성할 수 있다.

## Pull Request

작업 브랜치의 변경은 `main`을 대상으로 한 Pull Request로 병합한다. 로컬 변경이나 작업
브랜치를 원격 `main`에 직접 Push하지 않는다.

승인 수는 병합 조건으로 강제하지 않는다. 팀원이 코드 대화 또는 Request changes로
문제를 제기하면 해당 문제를 해결하고 모든 대화를 완료한 뒤 병합한다.

## ruleset 보호 기준

개발 소스 Repository는 다음 4개 ruleset을 사용한다.

| Ruleset | Target | 책임 |
| --- | --- | --- |
| `protect-main` | Default branch | 공통 브랜치 보호 |
| `require-ci` | Default branch | 프로젝트 CI 결과 요구 |
| `require-codeql` | Default branch | CodeQL 분석 결과 요구 |
| `protect-release-tags` | `refs/tags/v*` | Release tag 보호 |

같은 Target에 적용된 ruleset의 규칙은 모두 합산된다. 기본 브랜치 ruleset 3개는 기본
브랜치에 함께 적용되고 `protect-release-tags`는 Release tag에 별도로 적용된다.

ruleset 템플릿과 상태 전환 절차는 [ruleset 적용 절차](https://github.com/ajin-scrap-monitoring/.github/blob/main/rulesets/README.md)에서
관리한다. JSON은 안전한 가져오기를 위해 Disabled 상태로 제공한다. 아래 표는 적용
절차를 완료한 뒤 유지해야 하는 운영 상태다.

### 기본 브랜치 ruleset

실행 소스 코드와 CI가 구성된 운영 Repository에서는 다음 기본 브랜치 ruleset 3개를 모두
Active 상태로 유지한다.

#### `protect-main`

| 항목 | 설정 |
| --- | --- |
| Ruleset name | `protect-main` |
| Target | Branch |
| Enforcement status | Active |
| Target branch | Default branch |
| Bypass actor | Organization admin |
| Bypass mode | Pull requests only |
| Restrict deletions | 사용 |
| Require linear history | 사용 |
| Require a pull request before merging | 사용 |
| Required approvals | 0 |
| Require conversation resolution before merging | 사용 |
| Allowed merge methods | Squash |
| Block force pushes | 사용 |

#### `require-ci`

| 항목 | 설정 |
| --- | --- |
| Ruleset name | `require-ci` |
| Target | Branch |
| Enforcement status | Active |
| Target branch | Default branch |
| Bypass actor | Organization admin |
| Bypass mode | Pull requests only |
| Require status checks to pass | 사용 |
| Required status check | `CI` |
| Required status check source | Any source |
| Require branches to be up to date before merging | 사용 |
| Do not require status checks on creation | 사용하지 않음 |

#### `require-codeql`

| 항목 | 설정 |
| --- | --- |
| Ruleset name | `require-codeql` |
| Target | Branch |
| Enforcement status | Active |
| Target branch | Default branch |
| Bypass actor | Organization admin |
| Bypass mode | Pull requests only |
| Require code scanning results | 사용 |
| Code scanning tool | CodeQL |
| Security alerts threshold | High or higher |
| Alerts threshold | Errors |

기본 브랜치 ruleset의 Organization admin 예외 권한은 Pull Request 안에서 명시적으로
우회할 때만 사용한다.

머지 큐는 사용하지 않는다.

### Release tag ruleset

| 항목 | 설정 |
| --- | --- |
| Ruleset name | `protect-release-tags` |
| Target | Tag |
| Enforcement status | Active |
| Target tags | `refs/tags/v*` |
| Restrict tag names | 사용 |
| Operator | Regex |
| Pattern | `^v[0-9]+\.[0-9]+\.[0-9]+$` |
| Restrict deletions | 사용 |
| Block force pushes | 사용 |
| Bypass actor | Organization admin |
| Bypass mode | Always |

Release tag ruleset의 Organization admin 예외 권한은 게시되지 않은 잘못된 Release tag를
복구할 때만 사용한다.

## CI와 CodeQL

- `CI`는 빌드, 린트, 타입 검사와 테스트 결과를 집계한다. `main` 대상 Pull Request를
  생성하거나 갱신할 때와 `main`에 Push할 때 실행한다.
- CodeQL은 소스 코드를 보안 분석한다. Default setup을 활성화할 때, `main`에 Push할
  때, `main` 대상 Pull Request를 생성하거나 갱신할 때와 주 1회 실행한다.

CodeQL은 Repository Default setup을 사용한다.
전체 `CI` job을 생략하는 경로 필터와 조건문은 사용하지 않는다.

## 릴리스

`main`에 병합된 모든 변경을 릴리스하지 않는다. 릴리스할 검증 완료 커밋을
선택하고 해당 커밋을 가리키는 `vMAJOR.MINOR.PATCH` 형식의 버전 tag를 생성한다.

버전 tag는 원격 `main` 이력에 포함된 커밋만 가리킬 수 있다. 버전 tag가 원격 Repository에
Push되면 릴리스 워크플로우가 tag 대상 커밋을 확인하고 검증과 빌드를 실행한다.

릴리스 워크플로우는 배포 파일을 release asset으로 모두 첨부한 뒤 게시한다.
게시된 Release의 tag와 release asset은 변경하거나 삭제하지 않으며 수정이 필요하면 새 버전을 릴리스한다.
