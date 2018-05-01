#=============================================================================#
# ArrayAnalysis - ArrayAnalysisPath                                           #
# a tool for visualisation of expression set on a pathways                    #
#                                                                             #
# Copyright 2010-2014 BiGCaT Bioinformatics                                   #
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

#inputFile <- "/home/x_array/arrayanalysis.dev/arrayanalysis/temp/example_set1_2013-09-25_12-29_22_0_1_Path/example_set1_2013-09-25_12-29_22_0.txt"
gexFile <- paste(inputFile,".pgex",sep="")

## Load required libraries
library(methods)
library(XMLRPC)
print("Libraries are loaded")

## Load required scripts
source("preProcessingPath_web.R")

## Set working directory
setwd (WORK.DIR)

## Set address
host <- "http://localhost:7777"

## QUICH TEST HACK, ASSUME THE DATA IS HUMAN AND EITHER AFFY, ENSG, OR ENTREZG ANNOTATED
## and the IDs are in the first column
#dfile <- read.delim(inputFile,sep="\t",as.is=T)
#dfile <- cbind(dfile[,1,drop=F],SystemCode=rep("L",dim(dfile)[1]),dfile[,2:(dim(dfile)[2]),drop=F])
#dfile[,2] <- as.character(dfile[,2])
#dfile[grep("_at",dfile[,1],fixed=T),2] <- "X"
#dfile[grep("ENS",dfile[,1],fixed=T),2] <- "En"
#inputFile2 <- paste(inputFile,"_pv.txt",sep="")
#write.table(dfile,file=inputFile2,row.names=F,col.names=T,quote=F,sep="\t")
#printing
print(paste("ID",idcolName,"sys",syscolName,"in",inputFile, "code",sysCode,"gc",gColor,"gV",gValue,"rc",rColor,"rExpr",rExpr)) 

## Get idcolNum using the function getIdColumn
idcolNum <- getIdColumn(inputFile, idcolName)
# Get syscolNum using the function getSysColumn
syscolNum <- getSysColumn(inputFile, syscolName)

print(paste("inum",idcolNum,"snum",syscolNum))

##Make pgex
print("Importing Data ....")
pgex <- xml.rpc(host,"PathVisio.importData", inputFile, idcolNum, sysCode, syscolNum, "", gdbFile, getwd())
print (paste(pgex,"file created!",sep=""))	

##Check if rExpr is set 
#If not set rColor to ""
if(rExpr==""){
  rColor=""
}
##Check if gColorset is set
#If not set gColor and gValue to ""
if(gColorSet==""){
  gColor=""
  gValue=""
}

##pgex returns the address of the pgex file
## Create Visualization
print("Creating visualisation...")
vis <- xml.rpc(host,"PathVisio.createVisualization", pgex, gColorSet, gColor, gValue, rExpr, rColor)
print (vis)

## Get results
print("Caluclating Pathway Statistics and Exporting results...")
result <- xml.rpc(host,"PathVisio.calculatePathwayStatistics", pgex, gdbFile, wpCol, exprZ, getwd())
#, TRUE, refName, "http://ArrayAnalysis.org")
print (result)
print("Run completed")

