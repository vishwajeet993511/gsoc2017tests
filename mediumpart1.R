require(RCurl)
require(XML)
require(rvest) 
#Sys.setenv(http_proxy="")

url <- "http://ftp.funet.fi/pub/sci/bio/life/insecta/lepidoptera/ditrysia/papilionoidea/papilionidae/papilioninae/lamproptera/"
# reading url
readhtml <- read_html(url)
# using rvest library to get the node text
species <- readhtml %>% html_nodes(".NAMES .SN li") %>% html_text()
speciesListfinal <- gsub("=|;.*","",species)
# converting and storing  to csv files
write.csv(speciesListfinal,"mediumpart1speciesList.csv")