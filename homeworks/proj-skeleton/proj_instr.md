# Project #

## 수정사항 ##
- 11/30, 10:38 = `RUNTIME_EXCEPTION` 추가
- 11/30, 10:30 = syntax에서 `plambda` 삭제, value에 `PCLOS` -> `CLOS_MEM` 으로 이름 수정

## 설명 ##
- parser.ml 에서 파서를 구현합니다.
  + lexer () 를 실행할 때마다 순서대로 token이 나옵니다.
  + 파서 구현에 실패하신 분들은 현재의 위치가 아닌 [이 곳](../proj-skeleton-with-parser/)에서 파일을 다운받으세요.
    * 파서 등 기반 코드들이 이미 컴파일되어 있습니다.
- proj.ml에서 myeval을 구현합니다.
  + 문서에서 빠졌지만, 뼈대코드에서 알 수 있듯 `set!`도 5번의 mutable pairs 문제에 포함됩니다.
- Makefile을 이용해 컴파일할 수 있습니다.
  + 리눅스 등 make를 사용할 수 있는 환경에서는 쉘에서 `make`를 하면 컴파일이 됩니다.
  + 테스트는 `make test`를 하면 됩니다.
  + `make clean`을 실행하면 컴파일 부산물들이 제거됩니다.
  + make를 사용할 수 없는 환경의 경우, syntax.ml, parser.ml, lexer.mll, lexer.ml, proj.ml 을 컴파일하시면 됩니다.
    * lexer.mll로부터, ocamllex를 이용해 ml파일을 생성합니다. Makefile의 내용을 참고해주세요.
- 현재 self-grader의 내용이 부실합니다. 저도 여러 테스트를 추가할 계획이고, 각자 테스트를 만들어 공유해도 좋습니다.
