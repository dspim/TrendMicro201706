argv <- commandArgs(TRUE)
if (interactive()) argv <- "2017-06-07.html"
doc <- XML::htmlParse(argv)
src <- readLines(argv)
bg.list <- dir("background", full.names = TRUE)
css.content <- c()
for(bg in bg.list) {
  css.class <- tools::file_path_sans_ext(basename(bg))
  xpath <- sprintf("//article[contains(@class, '%s')]", css.class)
  # targets <- xml2::xml_find_all(doc, )
  XML::xpathSApply(doc, xpath, fun = function(node) {
    # browser()
    slide <- XML::xmlParent(node)
    class.new <- paste(XML::xmlGetAttr(slide, "class"), "nobackground", css.class, sep = " ")
    XML::xmlAttrs(slide) <- c(class = class.new)
  })
  # lapply(targets, function(node) {
  #   parents <- xml2::xml_parents(node)
  #   target.id <- which(xml2::xml_name(parents) == "slide")
  #   slide <- parents[target.id]
  #   as.character(slide)
  #   grepl(slide, src, fixed = TRUE)
  #   xml2::xml_attr(slide, "class") <- css.class
  # })
  css.content <- append(
    css.content, 
    sprintf(".%s { background-image: url(../%s); background-repeat: no-repeat; background-position: center; background-size: 100%% 100%%; } ", css.class, bg)
    )
}
# XML::saveXML(doc, file = tmp.path <- sprintf("%s.tmp", argv))
# dst <- readLines(tmp.path)
XML::saveXML(doc, argv)
output.path <- sprintf("css/%s.css", tools::file_path_sans_ext(basename(argv)))
write(css.content, file = output.path)
