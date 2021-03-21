# prestep (This works for mac os, not sure where this is on windows)
# go to folder /Library/Frameworks/R.framework/Versions
# copy packages from <version last>/Resources/library/ 
# paste packages into <version current>/Resources/library/ 
# skip existing base packages
# restart rstudio / r console (if running)

# create a list of all installed packages
packages <- as.data.frame(installed.packages())
# create a list of base r packages
base.packages <- c("base", "boot", "class","cluster","codetools","compiler","datasets","foreign","graphics","grDevices","grid","KernSmooth","lattice","MASS","Matrix","methods","mgcv","nlme","nnet","parallel","rpart","spatial","splines","stats","stats4","survival","tcltk","tools","utils") 
# get lib path
lib.path <- unique(packages$LibPath)
#lib.path <- "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
# subset packages to discard base.packages
user.packages <- subset(packages, !(packages$Package %in% base.packages))
user.packages <- unique(user.packages$Package)
# remove the user.packages
sapply(user.packages, remove.packages, lib = lib.path)
# install the user.packages
sapply(user.packages, install.packages, lib = lib.path)
