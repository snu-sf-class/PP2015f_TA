## 수정 사항 ##
- 11월 18일 : 6-7 채점기 버그 수정, 자가채점기용 makefile 추가 (수강생분들의 pull request를 merge)
- 11월 19일 : 6-5 채점기 보완 
- 11월 20일 : 6-5 채점기 오타 수정 ( TIMES -> SUM )

## HW6 ##
이번 숙제는 OCaml 프로그래밍을 요구합니다. 다음 실습 시간에 OCaml 튜토리얼을 진행할 것인데, 아래 링크의 OCaml tutorial을 참고하셔서 숙제를 진행하셔도 됩니다.

- 1번 숙제에서 교재라 함은 과목 홈페이지에 링크된 SICP 를 말합니다.
- `set-car!`등은 현재 버전의 Racket에서는 `set-mcar!` 등으로 대응됩니다.
- 2번에서는 string의 포맷이 자가채점기와 같도록 정확히 출력되어야 합니다.
- 3번의 toParen은 parenize의 오타입니다. 2번에서 정의한 함수의 코드를 복사해서 3번 파일에 붙여넣기 하세요.
- 코드 제일 위의 exception 부분은 숙제를 완성한 후에는 그냥 놔두셔도 됩니다. 숙제 진행 중 절대 실행되지 않아야 하는 부분에 exception을 새로 정의하여 사용하셔도 좋습니다.

OCaml 프로그래밍하기
- 메모장, vim, emacs 등 원하는 텍스트 편집기를 이용해 코드를 작성합니다.
- 작성한 코드를 실행하기 위해서는 아래의 컴파일 방법 및 링크를 참고해주세요.

리눅스 터미널에서 자가채점기 테스트하는 법:
- OCaml을 설치한다.
- 터미널에서 아래 명령을 순서대로 실행한다.
  ```
  ocamlc commonGrade.ml
  
  ocamlc hw6_2.ml
  
  ocaml commonGrade.cmo hw6_2.cmo hw6_2_selfgrader.ml
  ```
  
- 또는 `make`를 이용한다. 가령 2번 과제를 채점하려면 아래 명령을 실행한다.
  ```
  make 2
  ```
  
OCaml 도움 링크
- Tutorial: https://github.com/snu-sf/course-pp-2014/blob/master/lab/20141112/Ocaml_tutorial_eng.pdf
- 리눅스/맥 OS에서 opam으로 OCaml 설치하기: https://ropas.snu.ac.kr/phpbb/viewtopic.php?t=4649&highlight=ocaml
- interactive 환경으로 테스트하기: https://ropas.snu.ac.kr/phpbb/viewtopic.php?t=4640&highlight=ocaml
- OCaml 설치 후 Eclipse IDE로 OCaml 사용하기: https://ropas.snu.ac.kr/phpbb/viewtopic.php?t=4623&highlight=ocaml
