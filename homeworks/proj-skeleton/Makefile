all: proj.cmo

proj.cmo: proj.ml lexer.cmo
	ocamlc -c proj.ml

lexer.cmo: lexer.ml parser.cmo
	ocamlc -c lexer.ml

lexer.ml: lexer.mll
	ocamllex lexer.mll

parser.cmo: parser.ml syntax.cmo
	ocamlc -c parser.ml

syntax.cmo: syntax.ml
	ocamlc -c syntax.ml

clean:
	rm *.cmo *.cmi lexer.ml

test: proj_selfgrader.ml proj.cmo
	ocaml syntax.cmo parser.cmo lexer.cmo proj.cmo proj_selfgrader.ml
