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

commit: book pdf
	ghp-import -n -p -f _build/html

cleanall:
	jupyter-book clean ./ --all
    
clean:
	jupyter-book clean ./

pdf:
	jupyter-book build ./ --builder pdfhtml
	cp _build/pdf/book.pdf mek4300.pdf