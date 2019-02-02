## Trying to write functions 'makeCacheMatrix' and cacheSolve to cache the inverse of matrix
## 

## makeCacheMatrix function is creating a special object which can cache

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
set <- function (y) {
        x <<- y
        inv <<- NULL
}
get <- function() x
setinv <- function(inverse) inv <<- inverse
getinv <- function() inv
list (set = set, get = get, setinv = setinv, getinv = getinv)
}

## cacheSolve function computes inverse of the special 'matrix' from makeCacheMatrix
## If inverse has been calculated for the same matrix, then cacheSolve is to
## retrieve the inverse from cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
   inv <- x$getinv()
   if(!is.null(inv)) {
     message ("getting cached result")
     return(inv)
}
data <- x$get()
inv <- solve(data, ...)
x$setinv(inv)
inv
}
