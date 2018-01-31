01\_explore-libraries\_spartan.R
================
jhiggins
Wed Jan 31 14:20:44 2018

Which libraries does R search for packages?

``` r
library(tidyverse)
```

    ## -- Attaching packages ------------------------------------------- tidyverse 1.2.1 --

    ## v ggplot2 2.2.1     v purrr   0.2.4
    ## v tibble  1.3.4     v dplyr   0.7.4
    ## v tidyr   0.7.2     v stringr 1.2.0
    ## v readr   1.1.1     v forcats 0.2.0

    ## -- Conflicts ---------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

Installed packages

``` r
## use installed.packages() to get all installed packages

all.pack<- data.frame(installed.packages())

## how many packages?
#171
```

Exploring the packages

``` r
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
```

Reflections

``` r
## reflect on ^^ and make a few notes to yourself; inspiration
##   * does the number of base + recommended packages make sense to you?

base_count<- all.pack %>% 
  group_by(Priority) %>% 
  count()

##   * how does the result of .libPaths() relate to the result of .Library?
```

Going further

``` r
## if you have time to do more ...

## is every package in .Library either base or recommended?
#no



## study package naming style (all lower case, contains '.', etc
## use `fields` argument to installed.packages() to get more info and use it!
```
