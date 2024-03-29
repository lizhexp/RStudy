#Write a function that takes a directory of data files and a threshold for complete cases and calculates
#the correlation between sulfate and nitrate for monitor locations where the number of completely
#observed cases (on all variables) is greater than the threshold. The function should return a vector
#of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold
#requirement, then the function should return a numeric vector of length 0. A prototype of this function follows
#For this function you will need to use the 'cor' function in R which calculates the correlation between
#two vectors. Please read the help page for this function via '?cor' and make sure that you know how to use it.
#You can see some example output from this function. The function that you write should be able to match
#this output. Please save your code to a file named corr.R. 

corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
	vect<-numeric(0)
	for(file in list.files(directory)) {
		f<-read.csv(paste(directory,"/",file,sep=""))
		f<-f[apply(f,1,function(x)!any(is.na(x))),,drop=F]
		if(length(f$ID)>threshold) {
			vect<-c(vect,cor(f$sulfate,f$nitrate))
		}
	}
	return(vect)
}