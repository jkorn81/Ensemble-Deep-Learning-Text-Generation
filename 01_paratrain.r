#######################################################################################
#######################################################################################
#######################################################################################
#######################################################################################
# - [-] - Set Working Directory ----
setwd("C:/Users/jonat/Desktop/project.deeptxtgen")#create a data folder in wd...
#######################################################################################
#######################################################################################
#######################################################################################
#######################################################################################
library(reticulate)
use_python("C:/Users/jonat/Anaconda3/python.exe")
#######################################################################################
#######################################################################################
#######################################################################################
#######################################################################################
# - [-] - Required Packages ----
library(keras)
#library(tidyverse) 
library(dplyr)
library(readr)
library(stringr)
library(purrr)
library(tokenizers)
library(tm)
#library(tfdatasets)
library(data.table)
library(harrypotter)
library(doParallel)
#######################################################################################
#######################################################################################
#######################################################################################
#######################################################################################
cl = makeCluster(detectCores() - 1)
registerDoParallel(cl)

files <- list.files(path = "models/.", recursive = TRUE,
                          pattern = "\\.r$", 
                          full.names = TRUE)

foreach(i = 1:length(files)) %dopar%
{
  source(files[i])
}

stopCluster(cl)