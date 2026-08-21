# 개발 소스 저장소 ruleset 적용 절차

## 구성 요소

이 절차는 다음 3개 구성 요소를 설정한다.

1. 공통 브랜치 보호 규칙을 담은 `protect-main-source.json`
2. 저장소별 빌드, 린트, 타입 검사와 테스트를 실행하는 CI
3. 보안 분석을 실행하는 CodeQL

`protect-main-source.json`은 공개 개발 소스 저장소에서 사용하는 가져오기용 템플릿이다.
조직 공통 `.github` 저장소의 실제 ruleset을 복사한 파일이 아니다.

## 템플릿 범위

템플릿에는 다음 설정이 포함되어 있다.

- 기본 브랜치 대상
- 브랜치 삭제와 force push 차단
- 선형 이력과 Pull Request 요구
- 승인 필수 수 0
- 대화 해결 요구
- Squash 병합만 허용
- CodeQL 결과 요구
- 초기 상태 Disabled

템플릿에는 저장소별 필수 상태 검사 이름을 포함하지 않는다. 필수 상태 검사 이름은
저장소의 CI가 GitHub에서 한 번 실행된 뒤 확인하여 추가한다.

## 적용 전 저장소 설정

새 저장소의 `Settings -> General -> Pull Requests`에서 다음 값을 설정한다.

| 항목 | 설정 |
| --- | --- |
| Allow squash merging | 사용 |
| Allow merge commits | 사용하지 않음 |
| Allow rebase merging | 사용하지 않음 |
| Allow auto-merge | 사용하지 않음 |
| Automatically delete head branches | 사용 |

## 적용 순서

1. 저장소의 CI 워크플로우를 추가한다.
2. 저장소에서 CodeQL 기본 설정 또는 CodeQL 워크플로우를 구성한다.
3. 작업 브랜치와 Pull Request에서 CI와 CodeQL을 한 번 실행한다.
4. 저장소의 `Settings -> Rules -> Rulesets`로 이동한다.
5. `New ruleset -> Import a ruleset`을 선택한다.
6. `protect-main-source.json`을 가져온다.
7. 이름이 `protect-main`, 대상이 Default branch, 상태가 Disabled인지 확인한다.
8. `Require status checks to pass`를 추가한다.
9. 해당 저장소에서 실제로 실행된 CI 검사 이름을 필수 상태 검사로 등록한다.
10. `Require branches to be up to date before merging`을 사용한다.
11. CodeQL의 Security alerts가 High or higher, Alerts가 Errors인지 확인한다.
12. ruleset을 Active 상태로 저장한다.
13. 시험 Pull Request로 직접 Push 차단, 최신 브랜치 요구, 필수 CI, CodeQL과 Squash
    병합을 확인한다.

CI 또는 CodeQL 결과가 아직 GitHub에 보고되지 않았다면 ruleset을 Active로 전환하지
않는다. 필수 도구가 구성되지 않은 상태에서 CodeQL 규칙을 활성화하면 Pull Request
병합이 차단된다.

## 문서 저장소

실행 소스 코드가 없는 문서 저장소에는 이 템플릿을 사용하지 않는다. 해당 저장소에
실제로 존재하는 문서 검증 CI를 기준으로 별도 ruleset을 생성하며 CodeQL을 요구하지
않는다.
