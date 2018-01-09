LATEXMK := latexmk
LATEXMK_BUILD := ${LATEXMK} -xelatex
TEX_SOURCES := *.tex

MUSESCORE := mscore

# Build all PDFs
default:
	${LATEXMK_BUILD} ${TEX_SOURCES}
	# Using xvfb: https://musescore.org/en/node/8970#comment-752056
	xvfb-run ${MUSESCORE} --export-to songs.pdf songs.mscx

# Clean all output files except for PDFs
clean:
	${LATEXMK} -c ${TEX_SOURCES}
	rm -f songs.pdf '.songs.mscx,'

# Clean all output files including PDFs
realclean:
	${LATEXMK} -C ${TEX_SOURCES}

# Build the PDF, watch the source for changes, and rebuild if changed
%.pdf: %.tex
	${LATEXMK_BUILD} -pvc $<
