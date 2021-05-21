###### The Setup ###########

# Reminder Get test server token

library(dataone)
library(datapack)
library(digest)
library(uuid)
library(dataone)
library(arcticdatautils)
library(EML)

d1c <- D1Client("____________", "____________")
packageId <- "____________"
dp <- getDataPackage(____________, identifier=____________, lazyLoad=TRUE, quiet=FALSE)

#get metadata id
metadataId <-____________(dp, name="sysmeta@formatId", value="https://eml.ecoinformatics.org/eml-2.2.0")

#edit the metadata
doc <- ____________(getObject(____________, ____________))

#add the publisher info
doc <- eml_add_publisher(doc)
doc <- eml_add_entity_system(doc)

#format award info
doc$dataset$project <- ____________("____________")

#check and save the metadata
____________(____________)
eml_path <- paste0(str_replace_all(word(doc$dataset$title, end = 6), " ", "_"), ".xml")
____________(doc, ____________h)

dp <- replaceMember(____________, ____________, replacement=____________)

#upload the dataset
myAccessRules <- data.frame(subject="____________", permission="changePermission")
packageId <- uploadDataPackage(d1c, dp, public=F, accessRules=myAccessRules, quiet=FALSE)
#datamgmt::categorize_dataset("doi", c("theme1"), "Jasmine")
