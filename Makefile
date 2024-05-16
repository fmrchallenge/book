BUILDDIR=build/

all: intro_formalsynthrobo exercises

intro_formalsynthrobo: intro_formalsynthrobo.tex
	pdflatex -output-directory $(BUILDDIR) $@
	bibtex $(BUILDDIR)$@
	pdflatex -output-directory $(BUILDDIR) $@
	pdflatex -output-directory $(BUILDDIR) $@

date: intro_formalsynthrobo
	cp $(BUILDDIR)$<.pdf $(BUILDDIR)$<-DRAFT-`date -u "+%Y%m%d-%H%M"`.pdf

exercises: intro_formalsynthrobo_exercises.tex
	pdflatex -output-directory $(BUILDDIR) intro_formalsynthrobo_exercises
	bibtex $(BUILDDIR)intro_formalsynthrobo_exercises
	pdflatex -output-directory $(BUILDDIR) intro_formalsynthrobo_exercises
	pdflatex -output-directory $(BUILDDIR) intro_formalsynthrobo_exercises

clean:
	rm -f *~ $(BUILDDIR)*
