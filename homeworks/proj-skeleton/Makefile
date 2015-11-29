all: proj.cmo

proj.cmo: lexer.cmo
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

test: proj.cmo
	ocaml syntax.cmo parser.cmo lexer.cmo proj.cmo proj_selfgrader.ml
