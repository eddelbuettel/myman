
mm.env <- new.env()

read.mm <- function() {
    filename <- system.file("myman", "myman.csv", package="myman")
    if (!file.exists(filename)) stop("Hm, file", filename, "is missing.", call. = FALSE)
    data <- read.csv(filename, colClasses=c("character", "POSIXct", "factor"))
}

##' Function to display a randomly chosen 'my man' skeet by Kevin Kruse
##'
##' This function displays a randomly chosen line from the included
##' data set of one thousand one hundred and thirty four 'my man' skeets
##' by Kevin Kruse posted on Bluesky
##' starting in July 2026 in replies to the initial post
##' \url{https://bsky.app/profile/did:plc:cnpe7qvcyjrhm6w7w7e4atur/post/3mqum4mxsuk2g},
##' and in August 2026 starting with
##' \url{https://bsky.app/profile/kevinmkruse.bsky.social/post/3mstvbjpagc2a} as well as
##' starting with
##' \url{https://bsky.app/profile/kevinmkruse.bsky.social/post/3mtcpiw7gi22j}, again
##' starting with \url{https://bsky.app/profile/kevinmkruse.bsky.social/post/3mu3pugs2yk2f}, and
##' again starting with \url{https://bsky.app/profile/kevinmkruse.bsky.social/post/3mudbzy5ksk25}.
##' @title Display a Random 'my man' Skeet by Kevin Kruse
##' @param ind Optional index of a quote, or character expression to be matched;
##' if missing a random index value is sampled
##' @param target Optional character value to describe target of posts, can be a part of the name
##' as regular expression matching is used
##' @return A character vector containing one randomly selected line
##'  from the included file. It is of class \code{myman} for
##' which an S3 print method will be invoked.
##' @author Dirk Eddelbuettel
##' @examples
##' set.seed(123)
##' myman(target="Miller")    # random draw against first target
##' myman("maitre")           # all posts mentioning a "maitre'd"
##' @export
myman <- function(ind, target) {
    if (is.null(mm.env$mm.data)) mm.env$mm.data <- read.mm()
    mm.data <- mm.env$mm.data

    if (!missing(target)) {
        tgt <- grepv(target, levels(myman:::mm.env$mm.data$man))
        if (length(tgt) > 0) {
            mm.data <- subset(mm.data, man==tgt)
        }
    }

    if (missing(ind)) {
        n <- nrow(mm.data)
        ind <- sample(1:n, 1)
    } else if (is.character(ind)) {
        ind <- grep(ind, mm.data[,"post"])
    }
    v <- mm.data[ind,"post"]
    class(v) <- "myman"
    attr(v, "created") <- mm.data[ind,"created"]
    attr(v, "man") <- mm.data[ind,"man"]
    return(v)
}

##' @rdname myman
##' @param x Default object for \code{print} method
##' @param width Optional column width parameter
##' @param ... Other optional arguments
##' @exportS3Method myman::print
print.myman <- function(x, width = NULL, ...) {
    if (length(x) == 0) return(invisible())
    if (is.null(width)) width <- 0.9 * getOption("width")
    if (width < 41) stop("'width' must be greater than 45", call. = FALSE)
    mapply(\(x, m, d) cat(paste0(strwrap(x, width), collapse="\n"),
                          ".\n\t -- about ", m, " on ", d, "\n\n", sep=""),
           x = x,
           m = as.character(attr(x, "man")),
           d = format(as.Date(attr(x, "created"))))
}

##' @importFrom utils read.csv
NULL
