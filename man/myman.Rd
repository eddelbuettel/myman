% tinyrox says don't edit this manually, but it can't stop you!
\name{myman}
\alias{myman}
\alias{print.myman}
\alias{posts}
\alias{men}
\title{Display a Random 'my man' Skeet by Kevin Kruse}
\usage{
myman(ind, target, posts = 1)

\method{print}{myman}(x, width = NULL, ...)

posts()

men()
}
\arguments{
\item{ind}{Optional index of a quote, or character expression to be matched;
if missing a random index value is sampled}

\item{target}{Optional character value to describe target of posts, can be a part of the name
as regular expression matching is used}

\item{posts}{Optional count for number of posts to sample, defaults to one}

\item{x}{Default object for \code{print} method}

\item{width}{Optional column width parameter}

\item{...}{Other optional arguments}
}
\value{
A character vector containing one randomly selected line from the included file.
It is of class \code{myman} for which an S3 print method will be invoked.
}
\description{
This function displays a randomly chosen line from the included
data set of one thousand nine hundred and eighty four 'my man' skeets
by Kevin Kruse posted on Bluesky starting in July 2026 in replies to the initial post
\url{https://bsky.app/profile/did:plc:cnpe7qvcyjrhm6w7w7e4atur/post/3mqum4mxsuk2g},
in August 2026 starting with
\url{https://bsky.app/profile/kevinmkruse.bsky.social/post/3mstvbjpagc2a} as well as
further series starting with, respectively,
\url{https://bsky.app/profile/kevinmkruse.bsky.social/post/3mtcpiw7gi22j},
\url{https://bsky.app/profile/kevinmkruse.bsky.social/post/3mu3pugs2yk2f},
\url{https://bsky.app/profile/kevinmkruse.bsky.social/post/3mudbzy5ksk25},
\url{https://bsky.app/profile/kevinmkruse.bsky.social/post/3muparqtdkk2w},
\url{https://bsky.app/profile/kevinmkruse.bsky.social/post/3mvdol6xu5k2s},
\url{https://bsky.app/profile/kevinmkruse.bsky.social/post/3mvnmq23nw22y} and
\url{https://bsky.app/profile/kevinmkruse.bsky.social/post/3mwtx2jztkk2g}.

\code{posts} is a convenience function that returns the underlying data
as a data.frame
}
\examples{
set.seed(123)
myman(target="Miller")    # random draw against first target
myman("maitre")           # all posts mentioning a "maitre'd"
}
