
all : 2017-06-07.html LR.html

%.html : %.Rmd
	Rscript -e "rmarkdown::render('$<')"
	Rscript gen_css.R $@

clean :
	rm 2017-06-07.html