#' ---
#' output: github_document
#' ---



#' Which libraries does R search for packages?

library(tidyverse)

#' Installed packages

## use installed.packages() to get all installed packages

all.pack<- data.frame(installed.packages())

## how many packages?
#171

#' Exploring the packages

## count some things! inspiration
##   * tabulate by LibPath, Priority, or both
libpath_tab<- all.pack %>% 
  group_by(LibPath) %>% 
  summarize(n())

priority_tab<- all.pack %>% 
  group_by(Priority) %>% 
  summarize(n())

both_tab<- all.pack %>% 
  group_by(LibPath, Priority) %>% 
  summarize(n())

##   * what proportion need compilation?
Prop_comp<- all.pack %>% 
  count(NeedsCompilation) %>% 
  mutate(Prop=n/sum(n))

##   * how break down re: version of R they were built on
Version_tab<- all.pack %>% 
  count(Version) 


#' Reflections

## reflect on ^^ and make a few notes to yourself; inspiration
##   * does the number of base + recommended packages make sense to you?

base_count<- all.pack %>% 
  group_by(Priority) %>% 
  count()

##   * how does the result of .libPaths() relate to the result of .Library?


#' Going further

## if you have time to do more ...

## is every package in .Library either base or recommended?
#no



## study package naming style (all lower case, contains '.', etc
## use `fields` argument to installed.packages() to get more info and use it!
