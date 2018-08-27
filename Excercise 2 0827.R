# Install the pacakge Affy
if (!requireNamespace("BiocManager", quietly=TRUE))
    install.packages("BiocManager")
BiocManager::install("affy", version = "devel")

OR

source("https://bioconductor.org/biocLite.R")
biocLite("affy")

# Install the package SpikeInSubset
biocLite("SpikeInSubset")
OR
source("https://bioconductor.org/biocLite.R")
biocLite("SpikeInSubset")

# Loading this package
library(SpikeInSubset)
library(affy)

# Load data
data(spikein95)

# check the chips
image(spikein95)

# collect the gene id from this dataset and put it into an object

ids <- geneNames(spikein95)

# perfrom Mas 5.0 normalization
Mas <- mas5(spikein95)

#Box plot for raw data, and boxplot for nomalized on log fold
boxplot(spikein95)
mas_log <- log2(exprs(Mas))
x11()
boxplot(mas_log)

# Density plot
density <- density(mas_log[,1])
plot(density, main="Mas normalization")

density2 <- density(mas_log[,2])
lines(density2, col="red")

density3 <- density(mas_log[,3])
lines(density3, col="blue")



