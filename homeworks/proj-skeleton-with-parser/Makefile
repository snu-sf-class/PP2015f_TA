all: proj.cmo

proj.cmo:
	ocamlc -c proj.ml

clean:
	rm proj.cmo proj.cmi

test: proj.cmo
	ocaml syntax.cmo parser.cmo lexer.cmo proj.cmo proj_selfgrader.ml
