# HW8 #
- 8_4에서 size와 pp는 테스트하지 않습니다.
- 다른 사이즈의 프레임들을 Glue하는 경우 exception DIFFERENT_SIZED_BOXES를 냅니다.
- BasicFrame.rotate에서, 입력받은 box가 basic box(=BOX)가 아니면 exception NON_BASIC_BOX를 냅니다.
- BasicFrame 이외의 모듈에서 rotate는 모듈 자신이 가진 box만 잘 rotate할 수 있으면 됩니다. 이외에는 예외처리를 하시든지 자유롭게 하시면 됩니다.
