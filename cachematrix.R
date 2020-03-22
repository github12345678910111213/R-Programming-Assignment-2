## Put comments here that give an overall description of what your
## functions do
#
## Write a short comment describing this function
#This function creates a matrix objects that caches its inverse
makeCacheMatrix <- function(x = matrix()) {                               #define the function
   inverse_matrix<- NULL                                                  #initialize inverse_matrix
   set<-function(y){                                                      #define set function
     x<<-y
     inverse_matrix<<-NULL                
   }
   get<-function() x                                                      #define the get function to return the value of the matrix 
   setInverse <- function(inverse) inverse_matrix <<- inverse             #assign value of inverse_matrix in the parent environment
   getInverse <- function() inverse_matrix                                #This function gets the value of inverse_matrix
   list(set = set, get = get,
        setInverse = setInverse,
        getInverse = getInverse)
}


## Write a short comment describing this function
#This function computes the inverse of the matrix
cacheSolve <- function(x, ...) {                                          #deine function
   inverse_matrix<-x$getInverse()
   if(!is.null(inverse_matrix)){
     message("Getting cached data")
     return(inverse_matrix)
   }
   data<-x$get()                                                          #creating a subset of get() from x
   inverse_matrix<-Inverse(data,...)
   x$setInverse(inverse_matrix)
   inverse_matrix
}
