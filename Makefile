
all : 2017-06-07.html

%.html : %.Rmd
	Rscript -e "rmarkdown::render('$<')"
