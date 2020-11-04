.PHONY: help book clean serve

help:
	@echo "Please use 'make <target>' where <target> is one of:"
	@echo "  book        to build the book"
	@echo "  clean       to clean out site build files"
	@echo "  commit      to build the book and commit to gh-pages online"
	@echo "  pdf         to build the sites PDF"

clear:
	find ./content/ -name "*.ipynb" -exec jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace {} +

book:
	jupyter-book build ./
	python scripts/thebe_mikaem.py
	python scripts/preprocess.py

commit: pdf latexpdf book
	ghp-import -n -p -f _build/html

cleanall:
	jupyter-book clean ./ --all

clean:
	jupyter-book clean ./

pdf:
	jupyter-book build ./ --builder pdfhtml
	cp _build/pdf/book.pdf mek4300.pdf

pdflatex:
	jupyter-book build ./ --builder pdflatex
	cp _build/latex/python.pdf mek4300_latex.pdf

latexpdf:
	jupyter-book build ./ --builder latex
	python scripts/no_numbering.py
	make -C _build/latex
	cp _build/latex/python.pdf mek4300_latex.pdf
