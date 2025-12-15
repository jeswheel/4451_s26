# REXE = Rscript --vanilla
# For some reason, --vanilla fails on my Mac 
REXE = Rscript --no-save --no-restore --no-init-file
ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

slides.pdf handout.pdf notes.pdf: main.tex

.INTERMEDIATE: main.tex slides.tex notes.tex

%.html: %.Rmd
	$(REXE) -e "rmarkdown::render(\"$*.Rmd\",output_format=\"html_document\")"

%.html: %.md
	$(REXE) -e "rmarkdown::render(\"$*.md\",output_format=\"html_document\")"

%.R: %.Rnw
	$(REXE) -e "knitr::purl(\"$*.Rnw\",output=\"$*.R\",documentation=0)"

%.R: %.Rmd
	$(REXE) -e "knitr::purl(\"$*.Rmd\",output=\"$*.R\",documentation=0)"

%.tex: %.Rnw
	$(REXE) -e "knitr::knit(\"$*.Rnw\",output=\"$*.tex\")"

%.pdf: export BSTINPUTS=$(ROOT_DIR)

%.pdf: %.tex
	pdflatex $*
	bibtex $*
	pdflatex $*
	pdflatex $*

syllabus.pdf: syllabus.tex
	pdflatex syllabus
	pdflatex syllabus

clean:
	$(RM) *.bak
	$(RM) *.o *.so
	$(RM) *.log *.aux *.out *.blg *.toc *.nav *.snm *.vrb *.brf *.synctex.gz  *-concordance.tex
	$(RM) Rplots.*

fresh: clean
	$(RM) *.bbl
	$(RM) -r tmp

