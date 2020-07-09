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
rm_original <- "___________"

#make sure you have the most recent resource map in the version chain
all_versions <- get_all_versions(adc, _______)
rm <- ______[length(_______)]

#get the package
pkg <- get_package(adc, rm) # has the resource map, metadata and data PIDs
doc <- read_eml(getObject(adc, _______)) # the metadata document

#fix up the system metadata
sysmeta <- getSystemMetadata(adc, __________)
sysmeta@formatId <- "___________" #set the right formatId
updateSystemMetadata(adc, ________, sysmeta) #make sure changes are updated

###### Make your changes to the metadata ###########

# adding FAIR information
doc <- eml_add_publisher(____)
doc <- eml_add_entity_system(____)

#the below will change depending on what your dataset needs
#convert other to datatable
doc <- eml_otherEntity_to_dataTable(doc, ____, validate_eml = F)

#attribute table
data <- read.csv("_____________")
att <- EML::shiny_attributes(data = _____)
write_csv(att$_______, "attribute_tbl.csv") #save your attribute table for later just incase

att_tbl <- read_csv("attribute_tbl.csv")
att <- EML::shiny_attributes(attributes = att_tbl)
att <- set_attributes(att$attributes)

#set physicals
physical <- pid_to_eml_physical(adc, pkg$_____)

dataTable <- eml$dataTable(entityName = "_____",
                           entityDescription = "_________",
                           physical = ______,
                           attributeList = _____)

doc$dataset$dataTable <- _______

###### Check your changes ###########

#validate
eml_validate(______) # errors? go back and change the above until it passes as TRUE
eml_path <- "example_eml.xml" # where your file will be saved
write_eml(______, _______) # save your metadata

###### Publish your changes ###########

#update - commented out to prevent accidental changes DO NOT RUN
update <- publish_update(adc,
                         metadata_pid = ________,
                         data_pids = _______,
                         resource_map_pid = _______,
                         metadata_path = _______,
                         public = F)

#set rights and access - to make sure the researcher has access and can make changes
orcid <- "__________"
set_rights_and_access(adc, c(________, _________, ________), orcid)
