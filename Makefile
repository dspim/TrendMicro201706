
all : 2017-06-07.html LR.html LRLab.html

LRLab.html : LRLab.Rmd
	Rscript -e "rmarkdown::render('$<')"

%.html : %.Rmd
	Rscript -e "rmarkdown::render('$<')"
	Rscript gen_css.R $@

clean :
	rm 2017-06-07.html