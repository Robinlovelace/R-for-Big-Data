## $* = filename without extension
## $@ = the output file
## $< = the input file

MAIN = book

book.pdf: *.Rmd build.R in_header.tex
	Rscript -e "source('build.R')"

clean:
	rm -fvr $(MAIN).pdf $(MAIN).tex $(MAIN).Rmd $(MAIN)_files $(MAIN).html
	rm -fvr $(MAIN)_cache
	rm -fv *.aux *.dvi *.log *.toc *.bak *~ *.blg *.bbl *.lot *.lof
	rm -fv  *.nav *.snm *.out *.pyc \#*\# _region_* _tmp.* *.vrb
	rm -fv Rplots.pdf

cleaner:
	make clean
	rm -fv ../graphics/*.pdf
	rm -fvr auto/

