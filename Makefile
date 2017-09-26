LATEX=latex
BIBTEX=bibtex
DVIPS=dvips
DVIPDF=dvipdf
DVIPDF=dvipdfm
PDFLATEX=pdflatex

FIG-FILES = figures/*.png img/*.tex
TEX-FILES = *.tex
BIB-FILES = *.bib
TOP-LEVEL-ROOT = strongbox
CRNAME = dickens-ceres-2017

all: ${TOP-LEVEL-ROOT}.pdf

${TOP-LEVEL-ROOT}.pdf: ${PDF-FILES} ${TEX-FILES} ${BIB-FILES}
	$(PDFLATEX) -shell-escape ${TOP-LEVEL-ROOT}
	$(PDFLATEX) -shell-escape ${TOP-LEVEL-ROOT}
	$(BIBTEX) ${TOP-LEVEL-ROOT}
	$(PDFLATEX) -shell-escape ${TOP-LEVEL-ROOT}
	$(PDFLATEX) -shell-escape ${TOP-LEVEL-ROOT}

final: poster.pdf
	gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dEmbedAllFonts=true -sOutputFile=${CRNAME}.pdf -f poster.pdf

clean:
	rm -f *.auxlock *-blx.bib *.run.xml *.aux *.bbl *.blg *.log *.dvi *.out *.idx *.bak *~ *.toc *.lof out/*
	rm -f *.pdf
