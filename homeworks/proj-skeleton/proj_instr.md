# Project #

## 수정사항 ##
- 12/09, 18:10 = 컴파일된 파서가 4.02.3 버전에서 컴파일되었기 때문에 martini에서 실행이 안 되는 문제가 있어 proj-skeleton-with-parser/ocaml4021.tar 에 4.02.1 버전에서 컴파일한 파일을 올림 
- 12/02, 22:40 = `VOID`, `UNDEF` 값 추가, Makefile 보완. 안정된 버전.
- 12/02, 12:38 = `set!` 삭제, 오타 (lexer.mll, `mcdr`)
- 11/30, 10:38 = `RUNTIME_EXCEPTION` 추가
- 11/30, 10:30 = syntax에서 `plambda` 삭제, value에 `PCLOS` -> `CLOS_MEM` 으로 이름 수정

## 설명 ##
- parser.ml 에서 파서를 구현합니다.
  + lexer () 를 실행할 때마다 순서대로 token이 나옵니다.
  + 파서 구현에 실패하신 분들은 현재의 위치가 아닌 [이 곳](../proj-skeleton-with-parser/)에서 파일을 다운받으세요.
    * 파서 등 기반 코드들이 이미 컴파일되어 있습니다.
- proj.ml에서 myeval을 구현합니다.
  + 원래 문서대로, `set!`은 구현하지 않습니다.
- Makefile을 이용해 컴파일할 수 있습니다.
  + 리눅스 등 make를 사용할 수 있는 환경에서는 쉘에서 `make`를 하면 컴파일이 됩니다.
  + 테스트는 `make test`를 하면 됩니다.
  + `make clean`을 실행하면 컴파일 부산물들이 제거됩니다.
  + make를 사용할 수 없는 환경의 경우, syntax.ml, parser.ml, lexer.mll, lexer.ml, proj.ml 을 컴파일하시면 됩니다.
    * lexer.mll로부터, ocamllex를 이용해 ml파일을 생성합니다. Makefile의 내용을 참고해주세요.
- 현재 self-grader의 내용이 부실합니다. 저도 여러 테스트를 추가할 계획이고, 각자 테스트를 만들어 공유해도 좋습니다. 이후 테스트가 추가되면 `proj_selfgrader.ml`에서 추가된 코드 부분만 복사하시면 됩니다.
- 제출 칸이 3개 열려있는데, 1번에 challenge.rkt 파일, 2, 3번에 parser.ml과 proj.ml을 넣어주세요
- 예외처리의 경우, `with-handlers`는 Racket 코드 내에서 `raise`를 사용한 경우만 처리해도 좋습니다. 이외의 실행 중 에러는 OCaml 예외(`RUNTIME_EXCEPTION`)로 처리해도 좋습니다.
  + `raise`에서 발생한 예외가 핸들러에 의해 처리되지 못했을 경우, OCaml 예외(`UNCAUGHT_EXCEPTION`)로 처리하면 됩니다. 
- `set-mcar!` 등 리턴 값이 void인 경우는 `VOID` 값을 리턴하게 하면 됩니다.
