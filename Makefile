.PHONY: help book clean serve

help:
	@echo "Please use 'make <target>' where <target> is one of:"
	@echo "  book        to build the book"
	@echo "  clean       to clean out site build files"
	@echo "  commit      to build the book and commit to gh-pages online"
	@echo "  pdf         to build the sites PDF"
    

book:
	jupyter-book build ./
	python scripts/preprocess.py

commit:
	jupyter-book build ./
	python scripts/preprocess.py
	ghp-import -n -p -f _build/html

clean:
	python scripts/clean.py

pdf:
	jupyter-book build ./ --builder pdflatex
