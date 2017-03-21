  library(stringr)
  data <- read.table("taxo01.txt",sep = "\t")
  #distribution <- grep("^Distribution", data$V1)
  namesindex <- grep("^[0-9]",data$V1)
  
  #DISTRIBUTION <- data[distribution,]
  NAMES <- data[namesindex,]
  NAMES <- sub("^[0-9].|^[0-9][0-9]. ","",NAMES)
  #col1 <- data$V1[1]
  #finaldata <- data.frame(col1,NAMES,DISTRIBUTION)
  
  stringnew <- paste(data$V1,collapse = " ")
  
   
  #x <- str_locate_all(pattern ='[0-9]. ',stringnew)
  
  y <- str_locate_all(pattern ='Distribution.*?[0-9.]',stringnew)
  y <- data.frame(y)
  distributionlist <- character(length(y$start))
  for(i in 1:length(y$start))
  distributionlist[i] <- substr(stringnew,y$start[i],y$end[i]-2)
   
  distributionlist <- gsub("^Distribution: ","",distributionlist)
  finaldata <- data.frame("NAME"= NAMES , "DISTRIBUTION"= distributionlist)
  

  write.csv(finaldata,"hardpart1formatted_data.csv")


