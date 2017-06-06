library(optparse)
argv <- parse_args(OptionParser(option_list = list(
  make_option(c("-i", "--input"), help = "Input file path"),
  make_option(c("-o", "--output"), help = "Output file path"),
  make_option(c("-d", "--date"), help = "Date")
)))
print(argv)