LATEXMK := latexmk
LATEXMK_BUILD := ${LATEXMK} -xelatex
TEX_SOURCES := *.tex

# Build all PDFs
default:
	${LATEXMK_BUILD} ${TEX_SOURCES}

# Clean all output files except for PDFs
clean:
	${LATEXMK} -c ${TEX_SOURCES}

# Clean all output files including PDFs
realclean:
	${LATEXMK} -C ${TEX_SOURCES}

# Build the PDF, watch the source for changes, and rebuild if changed
%.pdf: %.tex
	${LATEXMK_BUILD} -pvc $<
