
## myman: Sequence of posts by Kevin Kruse starting with 'My man ...'

[![CI](https://github.com/eddelbuettel/myman/workflows/ci/badge.svg)](https://github.com/eddelbuettel/myman/actions?query=workflow%3Aci)
[![License](https://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](https://www.r-project.org/Licenses/GPL-2) 
[![CRAN](https://www.r-pkg.org/badges/version/myman)](https://cran.r-project.org/package=myman) 
[![Dependencies](https://tinyverse.netlify.app/badge/myman)](https://cran.r-project.org/package=myman)
[![r-universe](https://eddelbuettel.r-universe.dev/badges/myman)](https://eddelbuettel.r-universe.dev/myman)
[![Last Commit](https://img.shields.io/github/last-commit/eddelbuettel/myman)](https://github.com/eddelbuettel/myman)
[![pypi](https://img.shields.io/pypi/v/myman?color=3776ab)](https://pypi.org/project/myman/)

### Motivation

Starting on the afternoon of July 17, 2026, and lasting for one initial week, Kevin Kruse fired off
an astonishing array of over six hundred ninety eight BlueSky replies to [an initial post of
his][postone] featuring a certain government figure. Additional waves followed: [two][posttwo]
(August 12, 2026), [three][postthree] (August 17, 2026), [four][postfour] (August 27, 2026),
[five][postfive] (August 30, 2026), [six][postsix] (September 4, 2026), [seven][postseven]
(September 12, 2026), [eighth][posteight] (Septemer 16, 2026), [nine][postnine] (October 1, 2026),
[ten][postten] (October 4, 2026), [eleven][posteleven] (October 9, 2026), [twelve][posttwelve]
(October 14, 2026).  The total now stands at two thousand one hundred eighty four one posts.

All posts start with "My man ..." and make for excellent input to a `fortunes`-like package. So this
small package obliges and offers a random draw each time its `myman()` function is called.  The
overall package structure follows package `fortunes`, and `atrrr` was used to (bulk-)retrieve
posts. Neither package is required to run this package to display random selections.

### Example

```r
> library(myman)                       # load the package
> example(myman)

myman> set.seed(123)

myman> myman(target="Miller")    # random draw against first target
My man looks like he carries a flask filled with ether.
	 -- about Stephen Miller on 2026-07-22


myman> myman("maitre")           # all posts mentioning a "maitre'd"
My man looks like he's inquiring with the maitre'd about the house curly fries.
	 -- about Howard Lutnick on 2026-08-28

My man looks like a maitre'd who deeply doubts you have a reservation.
	 -- about Scott Bessent on 2026-08-31

My man looks like he's asked the maitre'd to remove a party of four he finds
visually unpleasant.
	 -- about Scott Bessent on 2026-08-31

> 
```

### Package Status

Complete and functional, no dependencies, passes checks.

### Installation

The package is on CRAN so the standard installation via

```r
> install.packages("myman")
```

will work.  It can also be installed from GitHub using the `remotes` package via the command

```r
> remotes::install_github("eddelbuettel/myman")
```

### Acknowledgements

The structure of the `fortunes` package has long served as an excellent template (see for example
package [gaussfacts](https://github.com/eddelbuettel/gaussfacts) for another application), and
package `atrrr` was key in retrieving the posts.

### See Also

There is also a [Python variant](https://github.com/eddelbuettel/myman-py) on PyPI.

### Author

Dirk Eddelbuettel

### License

GPL (>= 2)

[postone]: https://bsky.app/profile/did:plc:cnpe7qvcyjrhm6w7w7e4atur/post/3mqum4mxsuk2g
[posttwo]: https://bsky.app/profile/kevinmkruse.bsky.social/post/3mstvbjpagc2a
[postthree]: https://bsky.app/profile/kevinmkruse.bsky.social/post/3mtcpiw7gi22j
[postfour]: https://bsky.app/profile/kevinmkruse.bsky.social/post/3mu3pugs2yk2f
[postfive]: https://bsky.app/profile/kevinmkruse.bsky.social/post/3mudbzy5ksk25
[postsix]: https://bsky.app/profile/kevinmkruse.bsky.social/post/3muparqtdkk2w
[postseven]: https://bsky.app/profile/kevinmkruse.bsky.social/post/3mvdol6xu5k2s
[posteight]: https://bsky.app/profile/kevinmkruse.bsky.social/post/3mvnmq23nw22y
[postnine]: https://bsky.app/profile/kevinmkruse.bsky.social/post/3mwtx2jztkk2g
[postten]: https://bsky.app/profile/kevinmkruse.bsky.social/post/3mx333hlmdc2o
[posteleven]: https://bsky.app/profile/kevinmkruse.bsky.social/post/3mxgzqblov22r
[posttwelve]: https://bsky.app/profile/leftistwonk.bsky.social/post/3mxsfblcuh22d
