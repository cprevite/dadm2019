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

bands <- as.data.frame(lapply(bands,function(x) 
  if(is.factor(x)) factor(toupper(x)) 
  else(x))) # uppercase for all the factor values

cols = c( 21:39)  
bands[,cols] = apply(bands[,cols], 2, function(x) as.numeric(as.character(x))) # change class to numeric for numeric column

str(bands)

sapply(bands, mode)
sapply(bands, class)


describe(bands)

introduce(bands)

plot_intro(bands)

plot_histogram(bands)

plot_density(bands)

plot_boxplot(bands, by= 'band_type',  ncol = 2, title = "Side-by-side boxplots")

plot_correlation(bands, type= 'c', cor_args = list( 'use' = 'complete.obs'))



