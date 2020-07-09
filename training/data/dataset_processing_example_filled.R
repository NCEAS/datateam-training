#Not meant to be run fully use this as an example to refer to

###### The Setup ###########

# Reminder Get test server token

#Load your libraries
library(dataone)
library(arcticdatautils)
library(EML)
library(tidyverse)

#set up your nodes (in this case using the arcticdata node)
cn <- CNode("PROD")
adc <- getMNode(cn, "urn:node:ARCTIC") # the mn

#get the resource map
rm_original <- "resource_map_urn:uuid:ae5f4e50-df80-4b59-8133-91c57b824df7"

#make sure you have the most recent resource map in the version chain
all_versions <- get_all_versions(adc, rm_original)
rm <- all_versions[length(all_versions)]

#get the package
pkg <- get_package(adc, rm) # has the resource map, metadata and data PIDs
doc <- read_eml(getObject(adc, pkg$metadata)) # the metadata document

#fix up the system metadata
sysmeta <- getSystemMetadata(adc, pkg$data)
sysmeta@formatId <- "text/csv" #set the right formatId
updateSystemMetadata(adc, pkg$data, sysmeta) #make sure changes are updated

###### Make your changes to the metadata ###########

# adding FAIR information
doc <- eml_add_publisher(doc)
doc <- eml_add_entity_system(doc)

#the below will change depending on what your dataset needs
#convert other to datatable
doc <- eml_otherEntity_to_dataTable(doc, 1, validate_eml = F)

#attribute table
data <- read.csv("floatplanedata4_051320.csv")
att <- EML::shiny_attributes(data = data)
write_csv(att$attributes, "attribute_tbl.csv") #save your attribute table for later just incase

att_tbl <- read_csv("attribute_tbl.csv")
att <- EML::shiny_attributes(attributes = att_tbl)
att <- set_attributes(att$attributes)

#set physicals
physical <- pid_to_eml_physical(adc, pkg$data)

dataTable <- eml$dataTable(entityName = "example.csv",
                           entityDescription = "example flight frequencies in 2015",
                           physical = physical,
                           attributeList = att)

doc$dataset$dataTable <- dataTable

###### Check your changes ###########

#validate
eml_validate(doc) # errors? go back and change the above until it passes as TRUE
eml_path <- "example_eml.xml" # where your file will be saved
write_eml(doc, eml_path) # save your metadata

###### Publish your changes ###########

#update - commented out to prevent accidental changes DO NOT RUN
# update <- publish_update(adc,
#                          metadata_pid = pkg$metadata,
#                          data_pids = pkg$data,
#                          resource_map_pid = pkg$resource_map,
#                          metadata_path = eml_path,
#                          public = F)

#set rights and access - to make sure the researcher has access and can make changes
jasmine <- "http://orcid.org/0000-0001-8888-547X"
set_rights_and_access(adc, c(update$metadata, update$resource_map, update$data), jasmine)
