# Lab Session, Principles of Programming #

20141022 (Wed) 16:00-17:50
TA [Jeehoon Kang](http://sf.snu.ac.kr/jeehoon.kang), [Yoonseung Kim](http://sf.snu.ac.kr/yskim)

## Calculator ##

Implement a calculator. Complete the skeleton
[calculator.rkt](calculator.rkt).

Note that we will treat only

- constants,
- varables,
- additions,
- subtractions, and
- multiplications.

Your calculator is given:
- an expression, and
- values of variables.

See skeleton for more details.

## Complex numbers ##

Implement complex number data type. Complete the skeleton
[complex.rkt](complex.rkt).

You shall make two implementations:

- Descartes coordinate system: As usual, express as ```(x, y)```.
- Polar coordinate system: ```(r, θ)``` means the length ```r``` and
the angle ```θ```.

Both are represented as ```real X real```, so it is better to
distinguish with tagging. For example,

- ```(cons 'rect (cons 1 pi))``` means ```(1, pi)``` in the Descartes
  coordinate, and
- ```(cons 'polar (cons 1 pi))``` means ```(1, pi)``` in polar
coordinate, i.e. ```(-1,0)``` in Descartes coordinate.

See Wikipedia for more information on complex numbers and polar
coordinate system.

- [Complex number](http://en.wikipedia.org/wiki/Complex_number)
- [Polar coordinate system](http://en.wikipedia.org/wiki/Polar_coordinate_system)

## Finite State Machine, Revisited ##

Since there are only few students in the prevous lab session, we do
FSM again! See: [20141015/content.md](../20141015/content.md).

### Challenge ###

Implement a [Turing machine](http://en.wikipedia.org/wiki/Turing_machine) ([Korean](http://ko.wikipedia.org/wiki/%ED%8A%9C%EB%A7%81_%EA%B8%B0%EA%B3%84)).
