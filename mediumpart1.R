require(RCurl)
require(XML)
require(rvest) 
Sys.setenv(http_proxy="http://10.3.100.207:8080")

url <- "http://ftp.funet.fi/pub/sci/bio/life/insecta/lepidoptera/ditrysia/papilionoidea/papilionidae/papilioninae/lamproptera/"
# reading url
readhtml <- read_html(url)
# using rvest library to get the node text
species <- readhtml %>% html_nodes(".NAMES .SN li") %>% html_text()
speciesListfinal <- gsub("=|;.*","",species)
speciesListfinal <-  gsub("^ ","",speciesListfinal)


splitstring <- character(length(speciesListfinal))
genus <- character(length(speciesListfinal))
for(i in 1:length(speciesListfinal))
{
  if((length(unlist(strsplit(speciesListfinal[i],split = " "))) > 3) | (grepl(",",speciesListfinal[i])== FALSE ))
  splitstring[i] <- unlist(strsplit(speciesListfinal[i],split = " "))[2]
  else
    splitstring[i] <- "-"
                           
}
for(i in 1:length(speciesListfinal))
{
genus[i] <- unlist(strsplit(speciesListfinal[i],split = " "))[1]
}

dataframe1 <- data.frame("genus" = genus, "species" = splitstring)                                                           
# some nmes seems to be discoverer names so put "-" 
# converting and storing  to csv files
write.csv(dataframe1,"mediumpart1speciesList.csv")
