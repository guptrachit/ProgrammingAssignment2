
## Creates a special "Matrix" which is really a list

##  contains a function to:

makeCacheMatrix <- function(x = matrix()) {

        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }

        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}



## Given a makeCacheMatrix object, returns the inverse 

cacheSolve <- function(x, ...) {
        m <- x$getsolve() # retrieve from cache
        if(!is.null(m)) { # we got something...
                message("getting cached data")
                return(m)
        }

        data <- x$get()       # get it
        m <- solve(data, ...) # solve it
        x$setsolve(m)	      # set it
        m		      # return it
}
