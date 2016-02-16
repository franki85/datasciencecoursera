corr <- function(directory, threshold = 0){
  files_list <- list.files(directory, full.names=TRUE)
  dat <- data.frame()
  my_vector <- numeric()
    for(i in 1:length(files_list)){
      dat <- rbind(dat, read.csv(files_list[i]))
      c <- sum(complete.cases(dat[which(dat[, "ID"] == i),]))
        if(c> threshold) {
          dat2 <- na.omit(subset(dat, dat$ID == i))
          tmp <- cor(dat2$nitrate,dat2$sulfate)
          my_vector <- c(my_vector, tmp)
        }else { 
          my_vector
        }
      }
  my_vector
}
