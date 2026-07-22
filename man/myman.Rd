% tinyrox says don't edit this manually, but it can't stop you!
\name{myman}
\alias{myman}
\alias{print.myman}
\title{Display a Random 'my man' Skeet by Kevin Kruse}
\usage{
myman(ind)

\method{print}{myman}(x, width = NULL, ...)
}
\arguments{
\item{ind}{Optional index of a quote; if missing a random value is sampled}

\item{x}{Default object for \code{print} method}

\item{width}{Optional column width parameter}

\item{...}{Other optional arguments}
}
\value{
A character vector containing one randomly selected line
 from the included file. It is of class \code{myman} for
which an S3 print method will be invoked.
}
\description{
This function displays a randomly chosen line from the included
data set of over four hundred fifty 'my man' skeets by Kevin Kruse posted on Bluesky
starting in July 2026 in replies to the initial post
\url{https://bsky.app/profile/did:plc:cnpe7qvcyjrhm6w7w7e4atur/post/3mqum4mxsuk2g}.
}
\examples{
set.seed(123)
myman()
}
