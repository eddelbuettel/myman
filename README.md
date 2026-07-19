
## myman: Sequence of posts by Kevin Kruse starting with 'My man ...'

### Motivation

Starting on the afternoon of July 17, 2026, Kevin Kruse fired off an astonishing array of BlueSky replies to
[an initial post of his](https://bsky.app/profile/did:plc:cnpe7qvcyjrhm6w7w7e4atur/post/3mqum4mxsuk2g)
featuring a certain government figure. All posts start with "My man ..." and make for excellent input
to a `fortunes`-like package. So this small package obliges and offers a random draw each time its `myman()`
function is called.  The overall package structure follows package `fortunes`, and `atrrr` was used to
(bulk-)retrieve posts. Neither package is required to run this package to display random selections.

### Example

```{r}
R> library(myman)                       # load the package
R> set.seed(1)                          # so that this is predictable
R> myman()
My man looks like that stripper really likes him.
R>
```

### Package Status

Complete and functional, no dependencies, passes checks.

### Installation

The package is at this point only on GitHub so one can rely on the `remotes` package to do

```{r}
R> remotes::install_github("eddelbuettel/myman")
```

### Acknowledgements

The structure of the `fortunes` package has long served as an excellent template (see for example package
[gaussfacts](https://github.com/eddelbuettel/gaussfacts) for another application), and package `atrrr` was key
in retrieving the posts.

### Author

Dirk Eddelbuettel

### License

GPL (>= 2)
