R Cheatbook (Getting and Cleaning Data)
================

This is an R notebook for me to reference to when I decide to clean or sort data. However, after learning the DPLYR package, I'm not so confident I will use most of this.

Subsetting and Sorting
----------------------

data.frame() column variables must be the same atomic class

``` r
df <- data.frame("var1" = c(2,1,3), "var20" = c('b', 'a', 'c'))
df
```

    ##   var1 var20
    ## 1    2     b
    ## 2    1     a
    ## 3    3     c

To subset, we use the square brakets \[\] after a dataframe e.g. df\[row, column\]. Square brackets can take index values as well as logical values including ands and ors.

``` r
df[df$var1 > 2,]
```

    ##   var1 var20
    ## 3    3     c

However, if we're dealing with NA values, then we'd want to use the which function which returns positions and indices.

``` r
df[which(df$var1 > 2),]
```

    ##   var1 var20
    ## 3    3     c

We can also order rows using the order funcion.

``` r
df[order(df$var1),]
```

    ##   var1 var20
    ## 2    1     a
    ## 1    2     b
    ## 3    3     c

Summarizing Data
----------------

Summary Sample output

``` r
library(datasets)
data(iris)
summary(iris)
```

    ##   Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
    ##  Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
    ##  1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
    ##  Median :5.800   Median :3.000   Median :4.350   Median :1.300  
    ##  Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
    ##  3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
    ##  Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
    ##        Species  
    ##  setosa    :50  
    ##  versicolor:50  
    ##  virginica :50  
    ##                 
    ##                 
    ## 

c Summary is pretty good for informing about NA values.

Cross Tabs
----------

``` r
data(UCBAdmissions)
df <- as.data.frame(UCBAdmissions)
head(df, 5) 
```

    ##      Admit Gender Dept Freq
    ## 1 Admitted   Male    A  512
    ## 2 Rejected   Male    A  313
    ## 3 Admitted Female    A   89
    ## 4 Rejected Female    A   19
    ## 5 Admitted   Male    B  353

``` r
xt <- xtabs(Freq ~ Gender + Admit, data=df)
xt
```

    ##         Admit
    ## Gender   Admitted Rejected
    ##   Male       1198     1493
    ##   Female      557     1278

New Variables
-------------

df*n**e**w**v**a**r* &lt; −*c*(...)*d**f*newvar &lt;- ifelse(x &lt; y, TRUE, FALSE)
