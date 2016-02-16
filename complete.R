complete <- function(directory, id = 1:332){
  files_list <- list.files(directory, full.names=TRUE)
  dat <- data.frame()
  dat2 <- data.frame()
    for(i in id){
      dat <- rbind(dat, read.csv(files_list[i]))
      cc <- sum(complete.cases(dat[which(dat[, "ID"] == i),]))
      x <- c(i, cc)
      dat2<- rbind(dat2,x)
    }
  colnames(dat2) <- c("id","nobs")
  dat2
}
