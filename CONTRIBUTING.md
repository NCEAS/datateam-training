# Contributing to the repo

If you would like to contribute to the repo, please follow these conventions:

* Determine the most appropriate location to add your new material to. All materials are stored in .Rmd files within the 'workflows' folder. You can add to an existing file or create a new .Rmd file. Try to keep each file general and specific to a certain task. If the task you are detailing is dependent on other tasks, cross-reference those tasks instead of repeating them in your file.

* Make sure your code is consistent with other reference material. For example, the variable `mn` is set as the member node in `Set DataONE nodes` documentation. Therefore, `mn` should be used as the variable representing the member node in any subsequent documentation.

* **IMPORTANT** Do not change existing folder/file names. If you must, you should ensure all crosslinks referencing the old names are updated as well.

* If you are creating a new .Rmd file, choose the most appropriate folder to add the file to. Note that each folder within the 'workflows' folder represents a chapter in the 'Reference Guide' part of the bookdown site.

* If you would like to create a new folder, make sure to also create a new chapter in the 'reference.Rmd' file within the 'reference' folder. Each chapter consists of a first level heading (the same as the folder name) followed by two code chunks that compile the .Rmd files in the named folder (see code for other chapters for examples).

* The 'Reference Guide' part of the bookdown site will auto update when you add new .Rmd files to existing 'workflows' folders, but the 'Training' part will not. If you want your new material to be added to the training, you will have to insert a code chunk into the appropriate chapter .Rmd file within the 'training' folder (see existing chapter files for examples).

* Capitalize only the first word of headings in .Rmd files (but still capitalize words that are normally capitalized, e.g. a proper noun, acronym, etc.).

* Use the root form of verbs in filenames (e.g., edit not editing).

* Hyperlinks to external sites should open in a new tab or window. Use the HTML code `<a href="https://..." target="_blank">text</a>`.

* Use the custom 'styles.css' to format exercises, notes, and warnings (see existing chapters for examples).
