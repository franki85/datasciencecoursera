## In order to avoid a greater computational cost calculating the inverse of a matrix, 
## we build up two functions that cache the value so that when we need it again, it can be retrieved there rather than recomputed

## This function creates a special "matrix" object wich is a list of function to:
##  1. set the value of the matrix via function *set()*
##  2. get the value of the matrix via function *get()*
##  3. set the value of the inverse matrix via function *setInv*
##  4. get the value of the inverse matrix via function *getInv

makeCacheMatrix <- function(x = matrix()) {
  inverse<-NULL
  set<-function(y){
    x<<-y
    inverse<<-NULL
  }
  get<-function() x
  setInv<-function(solve) inverse<<- solve
  getInv<-function() inverse
  list(set=set, get=get,
       setInv=setInv,
       getInv=getInv)
}


## Function **cacheSolve()** computes the inverse of the matrix.
##  1. If calculated, 
##   retrives the inverse from the cache and return the object; 

##  2. Otherwise, 
##   it calculates the inverse of the matrix 
##   sets this value in the cache via setInv() function.

cacheSolve <- function(x, ...) {
  inverse<-x$getInv()
    if(!is.null(inverse)){
      message("getting cached data")
    return(inverse)
  }
  matrix<-x$get()
  inverse<-solve(matrix, ...)
  x$setInv(inverse)
  inverse
}