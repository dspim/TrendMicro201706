argv <- commandArgs(TRUE)
if (interactive()) argv <- "2017-06-07.html"
doc <- xml2::read_html(argv)
bg.list <- dir("background", full.names = TRUE)
for(bg in bg.list) {
  css.class <- tools::file_path_sans_ext(basename(bg))
  targets <- xml2::xml_find_all(doc, sprintf("//article[contains(@class, '%s')]", css.class))
  lapply(targets, xml2::xml_parents)
}
