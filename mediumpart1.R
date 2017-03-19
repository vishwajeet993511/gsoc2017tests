require(RCurl)
require(XML)
require(rvest) 
#Sys.setenv(http_proxy="")

url <- "http://ftp.funet.fi/pub/sci/bio/life/insecta/lepidoptera/ditrysia/papilionoidea/papilionidae/papilioninae/lamproptera/"
readhtml <- read_html(url)
species <- readhtml %>% html_nodes(".NAMES .SN li") %>% html_text()
speciesListfinal <- gsub("=|;.*","",species)

write.csv(speciesListfinal,"mediumpart1speciesList.csv")