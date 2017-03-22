  library(stringr)
  data <- read.table("taxo01.txt",sep = "\t")
  distribution <- grep("^Distribution", data$V1)
  namesindex <- grep("^[0-9]",data$V1)
  
  #DISTRIBUTION <- data[distribution,]
  NAMES <- data[namesindex,]
  NAMES <- sub("^[0-9].|^[0-9][0-9]. ","",NAMES)
  #col1 <- data$V1[1]
  #finaldata <- data.frame(col1,NAMES,DISTRIBUTION)
  
  stringnew <- paste(data$V1,collapse = " ")
  
   
  #x <- str_locate_all(pattern ='[0-9]. ',stringnew)
  # determining distribution
  y <- str_locate_all(pattern ='Distribution.*?[0-9.]',stringnew)
  y <- data.frame(y)
  distributionlist <- character(length(y$start))
  for(i in 1:length(y$start))
  distributionlist[i] <- substr(stringnew,y$start[i],y$end[i]-1)
  
  # determining familyname
  familyname <- character(length(data$V1))
  familyname[1] <- as.character( data$V1[1])
  for(i in 1:length(data$V1))
  {
    if(substr( as.character(data$V1[i]), nchar(as.character(data$V1[i])),
               nchar(as.character(data$V1[i]))) == "." && grepl("[0-9].",data$V1[i+2])==TRUE
       )
      familyname[i+1] <- as.character( data$V1[i+1])
    else familyname[i+1] <- familyname[i]
  }
  
  family1 <- character(length(distribution))
  
  for(i in 1: length(distribution))
    family1[i] <- familyname[distribution[i]]
   
  # cleaning 
  distributionlist <- gsub("^Distribution: ","",distributionlist)
  finaldata <- data.frame("FAMILY" = family1 , "NAME"= NAMES , "DISTRIBUTION"= distributionlist)
  

  write.csv(finaldata,"hardpart1formatted_data.csv")


