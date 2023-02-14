all: preview.png antoine-bolvy-resume.pdf antoine-bolvy-resume-fr.pdf

antoine-bolvy-resume.pdf: resume.tex resume-openfont.cls
	lualatex resume
	mv resume.pdf antoine-bolvy-resume.pdf

antoine-bolvy-resume-fr.pdf: resume-fr.tex resume-openfont.cls
	lualatex resume-fr
	mv resume-fr.pdf antoine-bolvy-resume-fr.pdf

preview.png: antoine-bolvy-resume.pdf
	pdftoppm $< antoine-bolvy-resume -png -f 1 -singlefile -rx 150 -ry 150
	convert \
		antoine-bolvy-resume.png	 \
		-density 300 \
		\( -background white -flatten \) -layers merge +repage \
		\( +clone -background black -shadow 15x15+0+0 \) +swap -background none -layers merge +repage \
		$@
	rm antoine-bolvy-resume.png

clean-tmp:
	rm -f *.aux *.fls *.log *.out *.fdb_latexmk *.synctex.gz pdfa.xmpi

clean: clean-tmp
	rm -f antoine-bolvy-resume.pdf antoine-bolvy-resume-fr.pdf preview.png

.PHONY: all clean
