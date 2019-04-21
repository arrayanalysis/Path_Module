###############################################################################
# Set directories 		                          				              
###############################################################################

  SCRIPT.DIR <- getwd()
  WORK.DIR <- paste("../temp/",refName,"_Path", sep="") # relative path
  
  #workdir <- paste(refName,"_Path",sep="")
  #workdir <- paste(SCRIPT.DIR,"temp",workdir,sep="/") # absolute path
  
	correctDIR <- function(d) { 
	  lastChar <- substr(d,nchar(d),nchar(d))
	  if((lastChar != "/") && (lastChar != "/")) d <- paste(d,"/",sep="")
	  return(d)
	}
	SCRIPT.DIR <- correctDIR(SCRIPT.DIR)
	WORK.DIR <- correctDIR(WORK.DIR)
	wpCol <- correctDIR(wpCol)
	#workdir <- correctDIR(workdir)

	if(file.exists(WORK.DIR)) {
		setwd(WORK.DIR)
		listfile <- list.files()
		unlink(listfile)
		unlink(WORK.DIR) 
	}
	dir.create(WORK.DIR) 
	
###############################################################################
# Move input files to WORK.DIR	                          				              
###############################################################################

	setwd(SCRIPT.DIR)  
	#listfile<-paste("../temp/",inputFile,sep="")
	listfile <- inputFile
	file.copy(listfile, WORK.DIR) 
	#inputFile = paste(workdir,inputFile, sep="")
	
	# Move gdbFile and wpCol files from /temp to WORK.DIR (if there are in /temp and not in /pathways)
	# Or I just copy these files in a /temp/refName_data repository that will be deleted within a month
