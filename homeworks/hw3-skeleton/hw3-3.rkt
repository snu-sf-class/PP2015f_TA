#lang racket

(require "hw3-3-library.rkt")

(provide mazeGen)

; Play around the interface of hw3-3-library.rkt.
; After executing this file, see hw3-3.ps.
; To read .ps files, you will need
;  - GhostScript: http://www.ghostscript.com/download/gsdnld.html
;  - Ghostview: http://pages.cs.wisc.edu/~ghost/gsview/

; some test code:
;(define maze1 (init-maze 4 3))
;(define maze2 (open-s 2 1 maze1))
;(maze-pp maze2)

(define (mazeGen n m)
  (let ((maze (init-maze n m)))
    'TODO))
