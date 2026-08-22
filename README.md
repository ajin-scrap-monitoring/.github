# ajin-scrap-monitoring Organization configuration

이 Repository는 `ajin-scrap-monitoring` GitHub Organization의 Public profile과 공통
협업 문서를 관리한다.

## 관리 범위

| 경로 | 역할 |
| --- | --- |
| `profile/README.md` | Organization Public profile |
| `GOVERNANCE.md` | GitHub 개발 운영 규칙 |
| `PULL_REQUEST_TEMPLATE.md` | Organization Repository의 기본 Pull Request 템플릿 |
| `CONTRIBUTING.md` | 공통 기여 절차 |
| `SECURITY.md` | 보안 문제 보고 절차 |
| `rulesets/` | 개발 소스 Repository용 ruleset 템플릿과 적용 절차 |
| `.github/ISSUE_TEMPLATE/` | 기본 Bug 및 Feature Issue 양식 |
| `.github/workflows/validate-community-files.yml` | 공통 문서 검증 CI |
| `.github/scripts/validate_issue_templates.rb` | Issue 양식의 YAML 검증 |

대상 Repository에 같은 종류의 파일이 있으면 대상 Repository의 파일이 우선한다.

이 Repository에는 Public으로 제공 가능한 협업 규칙과 템플릿만 포함한다.

## CI 의존성

| 의존성 | 버전 | 사용 목적 | 출처 | 라이선스 |
| --- | --- | --- | --- | --- |
| `actions/checkout` | `v6` | GitHub Actions 실행 환경의 Repository 체크아웃 | [GitHub](https://github.com/actions/checkout) | MIT |
| `markdownlint-cli2` | `0.23.2` | Markdown 문법과 형식 검사 | [npm](https://www.npmjs.com/package/markdownlint-cli2) | MIT |
| `jq` | GitHub-hosted runner 제공 버전 | ruleset JSON 문법 검사 | [공식 사이트](https://jqlang.org/) | MIT |

## 이용 조건

이 Repository는 Organization 운영 문서와 템플릿의 검토 및 참고를 위해 Public으로 제공하며 별도 라이선스를
부여하지 않는다.
