
## myman: Sequence of posts by Kevin Kruse starting with 'My man ...'

[![CI](https://github.com/eddelbuettel/myman/workflows/ci/badge.svg)](https://github.com/eddelbuettel/myman/actions?query=workflow%3Aci)
[![License](https://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](https://www.gnu.org/licenses/gpl-2.0.html) 
[![r-universe](https://eddelbuettel.r-universe.dev/badges/myman)](https://eddelbuettel.r-universe.dev/myman)
[![Last Commit](https://img.shields.io/github/last-commit/eddelbuettel/myman)](https://github.com/eddelbuettel/myman)

### Motivation

During one and half days starting on the afternoon of July 17, 2026, Kevin Kruse fired off an astonishing
array of over three hundred fourty BlueSky replies to [an initial post of
his](https://bsky.app/profile/did:plc:cnpe7qvcyjrhm6w7w7e4atur/post/3mqum4mxsuk2g) 
featuring a certain government figure. All posts start with "My man ..." and make for excellent input
to a `fortunes`-like package. So this small package obliges and offers a random draw each time its `myman()`
function is called.  The overall package structure follows package `fortunes`, and `atrrr` was used to
(bulk-)retrieve posts. Neither package is required to run this package to display random selections.

### Example

```{r}
> library(myman)                       # load the package
> set.seed(1)                          # so that this is predictable
> myman()
My man looks like Old Sheldon.
>
```

### Package Status

Complete and functional, no dependencies, passes checks.

### Installation

The package is at this point only on GitHub so one can rely on the `remotes` package to do

```{r}
> remotes::install_github("eddelbuettel/myman")
```

### Acknowledgements

The structure of the `fortunes` package has long served as an excellent template (see for example package
[gaussfacts](https://github.com/eddelbuettel/gaussfacts) for another application), and package `atrrr` was key
in retrieving the posts.

### Author

Dirk Eddelbuettel

### License

GPL (>= 2)
