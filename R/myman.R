
.mm.env <- new.env()

.read.mm <- function() {
    filename <- system.file("myman", "myman.csv", package="myman")
    if (!file.exists(filename)) stop("Hm, file", filename, "is missing.", call.=FALSE)
    data <- read.csv(filename)
}

##' Function to display a randomly chosen 'my man' skeet by Kevin Kruse
##'
##' This function displays a randomly chosen line from the included
##' data set of 'my man' skeets by Kevin Kruse posted on Bluesky during July 2026
##' in replies to the initial post
##' \url{https://bsky.app/profile/did:plc:cnpe7qvcyjrhm6w7w7e4atur/post/3mqum4mxsuk2g}.
##' @title Display a Random 'my man' Skeet by Kevin Kruse
##' @param ind Optional index of a quote; if missing a random value is sampled
##' @return A character vector containing one randomly selected line
##'  from the included file. It is of class \code{myman} for
##' which an S3 print method will be invoked.
##' @author Dirk Eddelbuettel
##' @examples
##' set.seed(123)
##' myman()
##' @export
myman <- function(ind) {
    if (is.null(.mm.env$mm.data)) .mm.env$mm.data <- .read.mm()
    mm.data <- .mm.env$mm.data

    if (missing(ind)) {
        n <- nrow(mm.data)
        ind <- sample(1:n, 1)
    }
    v <- mm.data[ind,"post"]
    class(v) <- "myman"
    return(v)
}

##' @rdname myman
##' @param x Default object for \code{print} method
##' @param width Optional column width parameter
##' @param ... Other optional arguments
##' @exportS3Method myman::print
print.myman <- function(x, width = NULL, ...) {
    if (is.null(width)) width <- 0.9 * getOption("width")
    if (width < 10) stop("'width' must be greater than 10", call.=FALSE)
    invisible(sapply(strwrap(paste0(x, "."), width), cat, "\n"))
}

##' @importFrom utils read.csv
NULL
