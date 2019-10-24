# latexmk does a good job cleaning up, but some files still remain
# this is a list of all extensions of temporary files
EXTENSIONS:=aux bbl blg cut dvi log out pdfsync ps synctex.gz tdo toc tex~ backup bcf fdb_latexmk fls

.PHONY: contents aspell
LATEX := latexmk -pdf -xelatex

default: pdf

pdf:
	$(LATEX) -pdf thesis.tex

clean:
	$(LATEX) -c thesis.tex
	@for i in $(EXTENSIONS); \
	do \
		for file in `find . -name "*.$$i"`; do rm $$file; done; \
	done

wordlist=lint/aspell.en.pws
replist=lint/aspell.en.prepl
ASPELL=aspell --lang=en_US --mode=tex --personal=$(PWD)/$(wordlist) --repl=$(PWD)/$(replist)
TEXFILES = $(shell find . -name "*.tex" -not -path "./figures/*")

aspell: $(addsuffix .spchk,$(basename $(TEXFILES)))
%.spchk: %.tex
	$(ASPELL) check $<

check: redpen-conf.xml
	redpen -r plain -c redpen-conf.xml thesis.tex
