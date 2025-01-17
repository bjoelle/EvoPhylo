
<!-- README.md is generated from README.Rmd. Please edit that file -->

# EvoPhylo: Pre- and Postprocessing of Morphological Data from Relaxed Clock Bayesian Phylogenetics

A package to perform automated morphological character partitioning for
phylogenetic analyses and analyze macroevolutionary parameter outputs
from clock (time-calibrated) Bayesian inference analyses. `EvoPhylo` was
initially released for pre- and postprocess data using the software
[Mr. Bayes](https://nbisweden.github.io/MrBayes/), but since version 0.3
it also handles data pre- and post-processing for the software package
[BEAST2](http://www.beast2.org/).

The ideas and rationale behind the original functionality and objectives
of the analyses available in this package were first presented by
[Simões & Pierce (2021)](https://doi.org/10.1038/s41559-021-01532-x).
It’s current functionality is described in detail by [Simões, Grifer,
Barido-Sottani & Pierce (2022)](https://doi.org/10.32942/osf.io/3mkf9).

## Installing package **EvoPhylo**

Install the latest release version (v. 0.3) directly from CRAN:

``` r
install.packages("EvoPhylo")
```

or development version from Github:

``` r
# install.packages("devtools")
devtools::install_github("tiago-simoes/EvoPhylo")
```

## Tutorials

See `vignette("char-part")`,`vignette("data_treatment")`,
`vignette("rates-selection")`, `vignette("fbd-params")`, and
`vignette("offset_handling")`, for step-by-step guides on using
`EvoPhylo` to perform these analyses, also available on the [EvoPhylo
website](https://tiago-simoes.github.io/EvoPhylo/).

## Authors

## Authors (including current developers)

-   [**Tiago R. Simões**](https://tiago-simoes.com/): *Conceptualization
    and code development* - [Github
    Profile](https://github.com/tiago-simoes)
-   [**Noah Greifer**](https://github.com/ngreifer): *Code development*
-   [**Joëlle Barido-Sottani**](https://github.com/bjoelle): *Code
    development*
-   [**Stephanie
    E.Pierce**](https://projects.iq.harvard.edu/spierce/home): *Project
    supervision*

## License

This project is licensed under General Public License, version 2.
