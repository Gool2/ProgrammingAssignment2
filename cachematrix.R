## Here are two functions that create a an object which stores a matrix and cache's its iversion.

## Following function creates list containing a functions:
##(1. seting value of matrix, 2. getting value of the matrix, 3. setting value of inversion, 4. gettin value of inversion)

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setSolve <- function(Solve) m <<- Solve
        getSolve <- function() m
        list(set = set, get = get,
             setSolve = setSolve,
             getSolve = getSolve)
}


## The following functios creates the inversion of the "matrix" created with the above function

cacheSolve <- function(x, ...) {
        m <- x$getSolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setSolve(m)
        m
}
