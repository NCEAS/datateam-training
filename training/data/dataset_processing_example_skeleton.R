###### The Setup ###########

# Reminder Get test server token

#Load your libraries
library(dataone)
library(arcticdatautils)
library(EML)
library(tidyverse)

#set up your nodes (in this case using the arcticdata node)
cn <- CNode("___________")
adc <- getMNode(cn,"___________") # the mn

#get the resource map


#make sure you have the most recent resource map in the version chain


#get the package


#fix up the system metadata


###### Make your changes to the metadata ###########

# adding FAIR information

#the below will change depending on what your dataset needs
#convert other to datatable


#attribute table


#set physicals


###### Check your changes ###########

#validate


###### Publish your changes ###########

#update

#set rights and access - to make sure the researcher has access and can make changes

