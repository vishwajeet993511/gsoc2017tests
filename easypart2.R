library(XML) 
library(RCurl) 
Sys.setenv(http_proxy="http://10.3.100.207:8080")

url <- "https://www.abdb-africa.org/genus/Papilio"

xData <- getURL(url) # This allows us to use https

# parsing the URL
doc <- htmlTreeParse(xData,useInternalNodes = TRUE)

x <- as(doc, "character")

string1 <- gsub(".*?<i>(.*?)</a>", "\\1", x)

# data obtaines is still in the form of single string

string2 <- gsub( "</i>", "", string1)
pos = gregexpr('[pP]apilio', string2)

pos2 = gregexpr(', [0-9]', string2)

pos <- unlist(pos)
pos2 <- unlist(pos2)
storenames <- character(length(pos))


# loop to get through the string and devide it into various required substrings
for(i in 1:length(pos))
{ 
  if(i == length(pos))
  {
    # precision at last part of the string so pos2 has been created
    storenames[i] <- substr(string2,pos[i],pos2[length(pos2)]+5)
  }
  else
  storenames[i] <- substr(string2,pos[i],pos[i+1]-1)
  
}
storenames

