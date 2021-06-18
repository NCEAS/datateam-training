 [![R build status](https://github.com/NCEAS/datateam-training/workflows/R-CMD-check/badge.svg)](https://github.com/NCEAS/datateam-training/actions)
 
# Introduction
This repo stores reference materials for the NCEAS data team. All reference materials can be accessed at the following address.

https://nceas.github.io/datateam-training/reference

Select reference material has additionally been curated into a training document that can be accessed at the following address.

https://nceas.github.io/datateam-training/training

# Contributing
This is written using bookdown. On more information on style conventions please see `CONTRIBUTING.md`. 

To render the book:

`xfun::in_dir('training', bookdown::render_book('index.Rmd', 'bookdown::gitbook'))`
`xfun::in_dir('reference', bookdown::render_book('index.Rmd', 'bookdown::gitbook'))`

