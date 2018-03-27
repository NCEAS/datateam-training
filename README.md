# Introduction
This repo stores reference materials for the NCEAS data team. All reference materials can be accessed at the following address.

https://nceas.github.io/datateam-training/reference

Select reference material has additionally been curated into a training document that can be accessed at the following address.

https://nceas.github.io/datateam-training/training

# Contributing to repo

If you would like to contribute to the repo, please follow these conventions.

* Determine the most appropriate location to add your new material to. All materials are stored in .Rmd files within the workflows folder. You can add to an existing file or create a new .Rmd file. Try to keep each file general and specific to a certain task. If the task you are detailing is dependent on other tasks cross-reference those tasks instead of repeating them in your file.

* Make sure your coding is consistent with other reference material. For example, the variable `mn` is set as the member node in `Set DataONE nodes` documentation. Therefore `mn` should be used as the variable representing the member node in any subsequent documentation.

* **IMPORTANT** Do not change existing folder/file names. If you must, you'll have go through all documents and ensure all crosslinks referencing the old name are updated as well.

* If you are creating a new .Rmd file choose the most appropriate folder to add the file to. Note, that each folder represents a chapter in the reference bookdown. 

* If you would like to create a new folder, make sure to also create a new markdown chapter in the reference folder. Each chapter is a .Rmd file consisting of a first level heading (the same as the folder name) followed by two r scripts which compile the .Rmd files in the named folder (see other chapters for code examples). 

* The reference document will auto update when you add new .Rmd files to existing workflow folders, but the training document will not. If you want your new material to be added to the training, you will have to do so by inserting an r code chunk into the training bookdown (see existing chapters for examples)

* Capitalize only the first word of headings in .Rmd files (but still capitalize words that are normally capitalized, e.g. a proper noun, acronym, etc.)

* Use the root form of verbs in file names (e.g. edit not editing)

* Use the custom css styles.css to format exercices, notes, and warnings.


  

