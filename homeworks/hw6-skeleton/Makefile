all: 2 3 4 5 6 7

2: commonGrade.cmo hw6_2.cmo
	ocaml commonGrade.cmo hw6_2.cmo hw6_2_selfgrader.ml
3: commonGrade.cmo hw6_3.cmo
	ocaml commonGrade.cmo hw6_3.cmo hw6_3_selfgrader.ml
4: commonGrade.cmo hw6_4.cmo
	ocaml commonGrade.cmo hw6_4.cmo hw6_4_selfgrader.ml
5: commonGrade.cmo hw6_5.cmo
	ocaml commonGrade.cmo hw6_5.cmo hw6_5_selfgrader.ml
6: commonGrade.cmo hw6_6.cmo
	ocaml commonGrade.cmo hw6_6.cmo hw6_6_selfgrader.ml
7: commonGrade.cmo hw6_7.cmo
	ocaml commonGrade.cmo hw6_7.cmo hw6_7_selfgrader.ml

.SUFFIXES: .cmo .ml
.ml.cmo:
	ocamlc -c $<
clean:
	rm -f *.cmo
	rm -f *.cmi
