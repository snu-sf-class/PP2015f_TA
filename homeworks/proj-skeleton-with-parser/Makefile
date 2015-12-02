all: proj.cmo

proj.cmo: proj.ml
	ocamlc -c proj.ml

clean:
	rm proj.cmo proj.cmi

test: proj.cmo proj_selfgrader.ml
	ocaml syntax.cmo parser.cmo lexer.cmo proj.cmo proj_selfgrader.ml
