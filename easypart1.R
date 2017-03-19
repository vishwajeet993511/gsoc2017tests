library(XML) 
library(RCurl) 
#Sys.setenv(http_proxy="http://10.3.100.207:8080")

url <- "http://ftp.funet.fi/pub/sci/bio/life/insecta/lepidoptera/ditrysia/papilionoidea/papilionidae/papilioninae/lamproptera/"

xData <- getURL(url) # This allows us to use https

# parsing the html content
doc <- htmlTreeParse(xData,useInternalNodes = TRUE)

x <- as(doc, "character")

# finally getting the genus name by regular expression search and replace
genusName <- sub(".*?<i>(.*?)</i>.*", "\\1", x)

genusName