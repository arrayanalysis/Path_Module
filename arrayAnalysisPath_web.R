#=============================================================================#
# ArrayAnalysis - ArrayAnalysisPath                                           #
# a tool for visualisation of expression set on a pathways                    #
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

###############################################################################
# Get input parameters                          		              #
###############################################################################

arrayAnalysisPath<-function(...) {

# GenePattern command line of this type: 
#          <R2.5> <libdir>myscript.R myfunction -i<input.file> 
# Input parameters formatted for GenePattern and arrayanalysis.org
# Default values managed by GP and web input forms
  
	args <- list(...)
	for(i in 1:length(args)) {
		flag <- substring(args[[i]], 0, 2)
		value <- substring(args[[i]], 3, nchar(args[[i]]))
		if(flag=='-r'){
			refName = value
		}			
		if(flag=='-i'){
			inputFile = value
		}
		if(flag=='-D'){
			idcolName = value
		}	
		if(flag=='-y'){
			sysCode = value
		}
		if(flag=='-a'){
			syscolName = value		
		}
		if(flag=='-s'){
			species = value
		}	
		if(flag=='-w'){
			wpCol = value
		}	
		if(flag=='-g'){
			gdbFile = value
		}	
		if(flag=='-G'){
			gColorSet = value
		}			
		if(flag=='-c'){
			gColor = value
		}
		if(flag=='-v'){
			gValue = value
		}
		if(flag=='-R'){
			rColorSet = value
		}
		if(flag=='-C'){
			rColor = value
		}
		if(flag=='-e'){
			rExpr = value
		}
		if(flag=='-Z'){
			exprZ = value
		}
	}
  
###############################################################################
# Run functions 		                          				              
###############################################################################

  source("setParametersPath_web.R",local=TRUE)
  source("processFilePath_web.R",local=TRUE)
  source("run_arrayAnalysisPath_web.R",local=TRUE)

# DESCRIPTION : 
# inputFile <- name of the file containing statistical comparison table 
#				[give full path if the file is not present in your WORK.DIR]
# gdbFile 	<- database file name (.bridgedb file corresponding to your species) 
#				[give full path if the file is not present in your WORK.DIR]
# gColorSet <- string representing a list of unique sample names (file headers), 
#				on which a gradient is applied. Sample names are separated by ";" 
#				Attribute NULL value if no gradient is required
# gColor 	<- string representing a list of list of colors: 2 to 3 colors are 
#				applied to each gradient. The first separator ";" splits the 
#				groups of colors belonging to the same gradient and the second 
#				"," splits the colors for each given gradient.
# gValue 	<- string representing a list of list of values corresponding to 
#				gColor and is organized the same way.
# rColorSet <- string representing a list of unique ids. These color sets may 
#				contain one or several color rules. The color set separator is ";". 
#				Attribute NULL value if no color rule is required
# rColor 	<- rColor is a string representing a list of list of colors: for 
#				each rule, only one color is set but many rules may be defined 
#				for one color set. The first separator ";" splits the  groups 
#				of colors belonging to the same color set the second "," splits 
#				the colors for each given rule.
# rExpr		<- string representing a list of list of boolean expression 
#				corresponding to rColor and is organized the same way. 
# exprZ 	<- boolean expression for zscore calculation
}
