#Write a function that reads a directory full of files and reports the number of completely observed
#cases in each data file. The function should return a data frame where the first column is the name
#of the file and the second column is the number of complete cases. A prototype of this function follows
#You can see some example output from this function. The function that you write should be able to match
#this output. Please save your code to a file named complete.R.

complete <- function(directory, id) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
	nobs=sapply(id,function(x) {
	if(x<10) {
			file<-paste("00",x,".csv",sep="")
		} else if(x<100 && x>=10) {
			file<-paste("0",x,".csv",sep="")
		} else {
			file<-paste(x,".csv",sep="")
		}
		f<-read.csv(paste(directory,"/",file,sep=""))
		f<-f[apply(f,1,function(x)!any(is.na(x))),,drop=F]
		length(f$ID)
	})
	data.frame(cbind(id,nobs))
}