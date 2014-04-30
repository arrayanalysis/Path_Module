#============================================================================#
# ArrayAnalysis                                                               #
#                                                                             #
# Copyright 2010-2011 BiGCaT Bioinformatics                                   #
#                                                                             #
# Licensed under the Apache License, Version 2.0 (the "License");             #
# you may not use this file except in compliance with the License.            #
# You may obtain a copy of the License at                                     #
#                                                                             #
# http://www.apache.org/licenses/LICENSE-2.0                                  #
#                                                                             #
# Unless required by applicable law or agreed to in writing, software         #
# distributed under the License is distributed on an "AS IS" BASIS,           #
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.    #
# See the License for the specific language governing permissions and         #
# limitations under the License.                                              #
#=============================================================================#

# Called by Path module 
selectHeaders <-function(filename=NULL, extension){

  if(is.null(filename)) stop("data parameter not provided");
  library(gdata)
  dataTable = NULL;
  switch(extension,
         ".txt" = dataTable<-trim(read.delim(filename, fill = FALSE)),
         ".tab" = dataTable<-trim(read.delim(filename, fill = FALSE)),
         ".csv" = dataTable<-trim(read.csv(filename, fill = FALSE)),
         ".xls" = dataTable<-trim(read.xls(filename)),
         ".xlsx" = dataTable<-trim(read.xls(filename))
	)
  if(is.null(dataTable)) stop(paste("extension",extension,"not recognised"))
  # Select headers whose columns are numeric
  colnum<-colnames(dataTable[,sapply(dataTable[1,],function(x) {is.numeric(x)})==TRUE,drop=F])
  # Select headers whose columns are NOT numeric
  colstring<-colnames(dataTable[,sapply(dataTable[1,],function(x) {is.numeric(x)})==FALSE,drop=F])
  
  if(length(colnum)>0) {
    for(i in 1:length(colnum)){
	  print(colnum[i]) # numeric: potential variable for color rule definition
    }
  }
  
  cat("[2]")
  
  if(length(colstring)>0) {
    for(i in 1:length(colstring)){
	  print(colstring[i]) # non numeric: potential gene id (the first of them will be proposed as default)
    }
  }
  
  write.table(dataTable, file=filename, sep="\t",row.names=FALSE, quote=FALSE)
}

#Function in R to get the column number of idcolumn 
getIdColumn <- function(filename, idcolName) {
  idcolNum <- ""
  # Load the data  
  if(is.null(filename)) stop("filename has to be provided")
  file <- read.csv(filename, sep="\t")
  if(idcolName != ""){
    for(i in 1:length(colnames(file))){
      if(colnames(file)[i] == idcolName){
        idcolNum <- i
        idcolNum <- as.character(idcolNum)
      }
    }
  }
  return (as.character(idcolNum))
 }

#Function in R to get the column number of syscode column
getSysColumn <- function(filename, syscolName) {
  syscolNum <- ""
  # Load the data  
  if(is.null(filename)) stop("filename has to be provided")
  file <- read.csv(filename, sep="\t")
  if(syscolName !="" ){	  
	for(i in 1:length(colnames(file))){
    		if(colnames(file)[i] == syscolName){
        	syscolNum <- i
        	syscolNum <- as.character(syscolNum)
      		}  
    	}
  }
  return (as.character (syscolNum))
}
