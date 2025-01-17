\name{plot_treerates_sgn_BEAST2}
\alias{plot_treerates_sgn_BEAST2}

\title{
Plot Bayesian evolutionary tree with rate thresholds for selection mode (on BEAST2 output)
}
\description{
Plots the summary Bayesian evolutionary tree with branches, according to user-defined thresholds (in units of standard deviations) used to infer the strength and mode of selection (BEAST2 version).
}
\usage{
plot_treerates_sgn_BEAST2(tree, pwt_rate_table, clock = 1,
       threshold = c("1 SD", "2 SD"),
       offset = 0,
       low = "blue", mid = "gray90", high = "red",
       branch_size = 2, tip_size = 2,
       xlim = NULL, nbreaks = 10, geo_size=list(2, 3),
       geo_skip = c("Quaternary", "Holocene", "Late Pleistocene"))
}
\arguments{
  \item{tree}{
A \code{tidytree} object containing the summary tree with the clock to plot, as produced by \code{\link[treeio:read.beast]{treeio::read.beast}}.
}
  \item{pwt_rate_table}{
Data frame of clades, absolute and relative clock rates. Such data frame can be produced using \code{\link{get_pwt_rates_BEAST2}}. See the \code{\link{posterior1p}} or \code{\link{posterior3p}} datasets for an examples of how the input file should look.
}
  \item{clock}{
The clock number to plot.
}
  \item{offset}{
Age of the youngest sample in the tree. Default 0.
}
  \item{threshold}{
A vector of threshold values. Default is to display thresholds of ±1 relative standard deviation (SD) of the relative posterior clock rates. Should be specified as a number of standard deviations (e.g., \code{"1 SD"}) or the confidence level for a confidence interal around the mean relative posterior clockrate (e.g., \code{"95\%"}). Multiple values are allowed to produce a plot with multiple thresholds. Set to \code{NULL} to omit thresholds.
}
  \item{low, mid, high}{
Colors passed to \code{\link{scale_color_steps2}} to control the colors of the branches based on which thresholds are exceeded. When no thresholds are supplied, use \code{mid} to control the color of the tree.
}
  \item{branch_size}{
The thickness of the lines that form the tree.
}
  \item{tip_size}{
The font size for the tips of the tree.
}
  \item{xlim}{
The x-axis limits. Should be two negative numbers (though the axis labels will be in absolute value, i.e., Ma).
}
  \item{nbreaks}{
The number of interval breaks in the geological timescale.
}
  \item{geo_size}{
The font size for the labels in the geological scale. The first value in \code{list()} is the font size for geological epochs and the second value is for geological periods. Passed directly to the \code{size} argument of \code{\link[deeptime:coord_geo]{deeptime::coord_geo}}.
}
 \item{geo_skip}{
A vector of interval names indicating which intervals should not be labeled. Passed directly to the \code{skip} argument of \code{\link[deeptime:coord_geo]{deeptime::coord_geo}}.
}
}
\details{
Plots the phylogentic tree contained in \code{tree} using \code{\link[ggtree:ggtree]{ggtree::ggtree}}. Branches undergoing accelerating evolutionary rates (e.g., >\code{"1 SD"}, \code{"3 SD"}, or \code{"5 SD"} relative to the background rate) for each morphological partition suggest directional (or positive) selection for that morphological partition in that branch of the tree. Branches undergoing decelerating evolutionary rates (e.g., <\code{"1 SD"}, \code{"3 SD"}, or \code{"5 SD"} relative to the background rate) for each morphological partition suggest stabilizing selection for that morphological partition in that branch of the tree. For details methods and rationale, see Simões & Pierce (2021).
}

\value{
A \code{ggtree} object, which inherits from \code{ggplot}.
}
\references{
Simões, T. R. and S. E. Pierce (2021). Sustained High Rates of Morphological Evolution During the Rise of Tetrapods. \emph{Nature Ecology & Evolution} 5: 1403–1414.
}
\seealso{
\code{vignette("rates-selection")} for the use of this function as part of an analysis pipeline.
\code{\link{plot_treerates_sgn_MrBayes}} for the equivalent function for MrBayes output files.
\code{\link[ggtree:ggtree]{ggtree::ggtree}}, \code{\link[deeptime:coord_geo]{deeptime::coord_geo}}
}
\examples{
# See vignette("rates-selection") for how to use this
# function as part of an analysis pipeline

# Load example tree
data(tree_clock2)

# Load example rate table
rate_table_file <- system.file("extdata", "ex_pwt_rate_table.csv", package = "EvoPhylo")
pwt_rate_table <- read.csv(rate_table_file, header = TRUE)

plot_treerates_sgn_BEAST2(
  tree_clock2, pwt_rate_table,
  # show rates for clock partition 1
  clock = 2,
  offset = 0,
  # set size for tree elements
  branch_size = 1.5, tip_size = 3,
  # set limits, breaks, and size for geological scale
  xlim = c(-450, -260), nbreaks = 8, geo_size = list(3, 3),
  # set rate threshold for selection strength
  threshold = c("1 SD", "2 SD"))
}



