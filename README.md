# ajin-scrap-monitoring organization configuration

이 저장소는 `ajin-scrap-monitoring` GitHub 조직의 공개 프로필과 공통 협업 문서를 관리한다.

## 관리 범위

| 경로 | 역할 |
| --- | --- |
| `profile/README.md` | 조직 공개 프로필 |
| `GOVERNANCE.md` | 조직 개발 저장소 공통 운영 규칙 |
| `PULL_REQUEST_TEMPLATE.md` | 조직 저장소의 기본 Pull Request 템플릿 |
| `CONTRIBUTING.md` | 공통 기여 절차 |
| `SECURITY.md` | 보안 문제 보고 절차 |
| `rulesets/` | 개발 소스 저장소용 ruleset 템플릿과 적용 절차 |
| `.github/ISSUE_TEMPLATE/` | 기본 Bug 및 Feature Issue 양식 |
| `.github/workflows/validate-community-files.yml` | 공통 문서 검증 CI |
| `.github/scripts/validate_issue_templates.rb` | Issue 양식의 YAML 검증 |

대상 저장소에 같은 종류의 파일이 있으면 대상 저장소의 파일이 우선한다.

이 저장소에는 공개 가능한 협업 규칙과 템플릿만 포함한다.

## CI 의존성

| 의존성 | 사용 목적 | 라이선스 |
| --- | --- | --- |
| `actions/checkout@v6` | GitHub Actions 실행 환경의 저장소 체크아웃 | MIT |
| `markdownlint-cli2@0.23.2` | Markdown 문법과 형식 검사 | MIT |
| `jq` | ruleset JSON 문법 검사 | MIT |
