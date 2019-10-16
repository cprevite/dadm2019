# Library

library(here)
library(Hmisc)
library(dplyr)
library(DataExplorer)
library(ggplot2)
library(lattice)


# Loading data

bands <- read.csv(file = here('bands3.csv'), sep = ';')

# EDA

summary(bands)

bands <- apply(bands,2,toupper) # uppercase for all the values

str(bands)

describe(bands)

introduce(bands)

plot_intro(bands)

plot_histogram(bands)

plot_density(bands)

plot_boxplot(bands, by= 'band_type',  ncol = 2, title = "Side-by-side boxplots")

plot_correlation(bands, type= 'c', cor_args = list( 'use' = 'complete.obs'))



