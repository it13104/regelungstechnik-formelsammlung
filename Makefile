DOCUMENT=Formelsammlung

all: pdf clean

pdf: $(DOCUMENT).pdf
	@echo

%.pdf: %.tex */*.tex
	pdflatex -src -interaction=nonstopmode $^
	-makeindex -s nomencl.ist -t $(DOCUMENT).nlg -o $(DOCUMENT).nls $(DOCUMENT).nlo
	pdflatex -src -interaction=nonstopmode $^

.PHONY: clean
clean:
	rm -f *.aux *.bbl *.blg *.brf *.idx *.lof *.log *.lot *.nlg *.nlo *.nls *.out *.synctex.gz *.toc
