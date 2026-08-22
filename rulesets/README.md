# 개발 소스 Repository ruleset 적용 절차

## 적용 범위

이 문서는 [Governance](../GOVERNANCE.md)의 ruleset 보호 기준을 개발 소스 Repository에
적용하는 순서를 규정한다. 최종 운영 설정은 Governance에서 관리하고 JSON은 해당 설정을
반복 적용하기 위한 가져오기용 템플릿으로 사용한다.

네 JSON은 가져오는 순간 보호 규칙이 적용되지 않도록 Disabled 상태로 제공한다.

## 가져오기 파일

| Ruleset | Target | JSON |
| --- | --- | --- |
| `protect-main` | Default branch | [protect-main-source.json 다운로드](https://raw.githubusercontent.com/ajin-scrap-monitoring/.github/main/rulesets/protect-main-source.json) |
| `require-ci` | Default branch | [require-ci-source.json 다운로드](https://raw.githubusercontent.com/ajin-scrap-monitoring/.github/main/rulesets/require-ci-source.json) |
| `require-codeql` | Default branch | [require-codeql-source.json 다운로드](https://raw.githubusercontent.com/ajin-scrap-monitoring/.github/main/rulesets/require-codeql-source.json) |
| `protect-release-tags` | `refs/tags/v*` | [protect-release-tags-source.json 다운로드](https://raw.githubusercontent.com/ajin-scrap-monitoring/.github/main/rulesets/protect-release-tags-source.json) |

## `protect-main` 적용 순서

1. `Settings -> General -> Pull Requests`에서 Squash 병합을 허용하고 Merge와 Rebase
   병합을 허용하지 않도록 설정한다.
2. `Settings -> Rules -> Rulesets`로 이동한다.
3. `New ruleset -> Import a ruleset`을 선택하고 `protect-main-source.json`을 가져온다.
4. Enforcement status를 Active로 변경하고 ruleset을 생성한다.

## `require-ci` 적용 순서

1. 최신 `main`에서 CI 작업 브랜치를 생성한다.
2. 작업 브랜치에 `main` 대상 Pull Request와 `main` Push에서 실행되는 CI 워크플로우를 작성한다.
3. CI 워크플로우에 Repository에 필요한 빌드, 린트, 타입 검사와 테스트를 구성한다.
4. 워크플로우 내 job의 `name`을 `CI`로 설정하고 전체 job을 생략하는 경로 필터와 조건문을 사용하지 않는다.
5. `Settings -> Rules -> Rulesets`로 이동한다.
6. `New ruleset -> Import a ruleset`에서 `require-ci-source.json`을 가져온다.
7. Enforcement status를 Active로 변경하고 ruleset을 생성한다.
8. CI 작업 브랜치를 Push하고 `main` 대상 Pull Request를 생성하여 첫 `CI`를 실행한다.
9. 대화와 필수 검사를 완료한 뒤 Squash 방식으로 병합한다.

[선택 사항] `CI` Check Run이 보고된 뒤 Expected source를 GitHub Actions로 변경한다.

## `require-codeql` 적용 순서

1. `Settings -> Advanced Security -> CodeQL analysis`에서 Default setup을 활성화한다.
2. `Settings -> Rules -> Rulesets`로 이동한다.
3. `New ruleset -> Import a ruleset`에서 `require-codeql-source.json`을 가져온다.
4. Enforcement status를 Active로 변경하고 ruleset을 생성한다.

## `protect-release-tags` 적용 순서

1. `Settings -> Rules -> Rulesets`로 이동한다.
2. `New ruleset -> Import a ruleset`에서 `protect-release-tags-source.json`을 가져온다.
3. Enforcement status를 Active로 변경하고 ruleset을 생성한다.
