tocsv <- function(textfile){
  data <- read.table(textfile,sep = "\t")
  distribution <- grep("^Distribution", data$V1)
  namesindex <- grep("^[0-9]",data$V1)
  
  DISTRIBUTION <- data[distribution,]
  NAMES <- data[namesindex,]
  NAMES <- sub("^[0-9].|^[0-9][0-9]. ","",NAMES)
  col1 <- data$V1[1]
  finaldata <- data.frame(col1,NAMES,DISTRIBUTION)
  
  finaldata
  
}

tocsv("taxo01.txt")