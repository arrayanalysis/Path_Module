#for compatibility with R local script, set every variable to a boolean depending on whether it exists
# only to be run when the code is called from the webportal or GenePattern

# deduced from the species:

if(!exists("refName")) refName <- "" 
if(!exists("inputFile")) inputFile <- "" 
if(!exists("idcolName")) idcolName<-""
if(!exists("syscolName")) syscolName<-""
if(!exists("sysCode"))sysCode<="En"
if(!exists("gdbFile")) gdbFile <- "Hs_Derby_20120602.bridge"
if(!exists("wpCol")) wpCol <- "wikipathways_Homo_sapiens_Curation-AnalysisCollection__gpml"
if(!exists("species")) species<-"HomoSapiens"
if(!exists("gColorSet")) gColorSet<-"logFC"
if(!exists("gColor")) gColor<-"#0000FF,#FFFFFF,#FF0000"
if(!exists("gValue")) gValue <- "-1,0,1"
if(!exists("rColorSet")) rColorSet <- "color rules"
if(!exists("rColor")) rColor <- "#00FF00,#FF0000"
if(!exists("rExpr")) rExpr <- "[P.Value] < 0.01 AND [Fold Change] > 0,[P.Value] < 0.01 AND [Fold Change] < 0"
if(!exists("exprZ")) exprZ <- "[P.Value]< 0.05" 

print ("Parameters have been registered")

# PARAMETERS DESCRIPTION : see affyAnalysisStat.R
