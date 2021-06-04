#Not meant to be run fully use this as an example to refer to

###### The Setup ###########

# Reminder Get test server token

library(dataone)
library(datapack)
library(digest)
library(uuid)
library(dataone)
library(arcticdatautils)
library(EML)

d1c <- D1Client("PROD", "urn:node:ARCTIC")
packageId <- "id here"
dp <- getDataPackage(d1c, identifier=packageId, lazyLoad=TRUE, quiet=FALSE)

#get metadata id
metadataId <- selectMember(dp, name="sysmeta@formatId", value="https://eml.ecoinformatics.org/eml-2.2.0")

#edit the metadata
doc <- read_eml(getObject(d1c@mn, metadataId))

#add the publisher info
doc <- eml_add_publisher(doc)
doc <- eml_add_entity_system(doc)

doc$dataset$project <- eml_nsf_to_project("nsf id here")

#check and save the metadata
eml_validate(doc)
eml_path <- arcticdatautils::title_to_file_name(doc$dataset$title)
write_eml(doc, eml_path)

dp <- replaceMember(dp, metadataId, replacement=eml_path)

#upload the dataset
myAccessRules <- data.frame(subject="CN=arctic-data-admins,DC=dataone,DC=org", permission="changePermission")
packageId <- uploadDataPackage(d1c, dp, public=F, accessRules=myAccessRules, quiet=FALSE)
#datamgmt::categorize_dataset("doi", c("theme1"), "Jasmine")
