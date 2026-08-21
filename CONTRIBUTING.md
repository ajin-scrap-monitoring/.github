# 기여 절차

대상 저장소에 별도 `CONTRIBUTING.md`가 있으면 해당 문서를 우선한다.
조직 공통 운영 규칙은
[`GOVERNANCE.md`](https://github.com/ajin-scrap-monitoring/.github/blob/main/GOVERNANCE.md)에서
확인한다.

1. 필요한 경우 구현 또는 수정할 작업을 Issue로 정의한다.
2. 최신 `main`을 기준으로 작업 브랜치를 생성한다.
3. 작업 브랜치에서 코드를 변경하고 검증한다.
4. 작업 브랜치를 원격 저장소에 Push한다.
5. 작업 브랜치에서 `main`을 대상으로 Pull Request를 생성한다.
6. 공통 Pull Request 템플릿을 작성한다.
7. 검토와 필수 검증을 완료한 뒤 Pull Request를 병합한다.

`main`에 직접 Push하거나 force push하지 않는다. 공개 저장소에는 공개 가능한 내용만
포함하고, 보안 문제는 `SECURITY.md`의 절차로 보고한다.
