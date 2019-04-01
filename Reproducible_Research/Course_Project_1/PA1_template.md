Reproducible Research - Course Project 1
================
Ziq
March 29, 2019

### Load Data

``` r
library(ggplot2)
library(dplyr)
```

``` r
Activity <- read.csv('activity.csv')
Activity <- mutate(Activity, weekday = weekdays(as.Date(date, "%Y-%m-%d")))
head(Activity)
```

    ##   steps       date interval weekday
    ## 1    NA 2012-10-01        0  Monday
    ## 2    NA 2012-10-01        5  Monday
    ## 3    NA 2012-10-01       10  Monday
    ## 4    NA 2012-10-01       15  Monday
    ## 5    NA 2012-10-01       20  Monday
    ## 6    NA 2012-10-01       25  Monday

What is mean total number of steps taken per day?
=================================================

### 1. Calculate the total number of steps taken per day

Since each date is a factor that represents a day, we can use the tapply function to sum over the number of steps taken by each specific day. Since there are a total of 61 days, we should have 61 total sums.

``` r
daily_steps <- tapply(Activity$steps, Activity$date, FUN = sum, na.rm = TRUE)
head(daily_steps)
```

    ## 2012-10-01 2012-10-02 2012-10-03 2012-10-04 2012-10-05 2012-10-06 
    ##          0        126      11352      12116      13294      15420

### 2. Make a histogram of the total number of steps taken each day.

Let's use ggplot to make some nicer looking graphs. Before that we'll need a new data frame with the date and total steps.

``` r
Total_steps <- data.frame(date = unique(Activity$date), dailysteps = daily_steps)
ggplot(data = Total_steps, aes(x = dailysteps)) + 
    geom_histogram(bins = 15) +
    labs(title = 'Frequency of number of steps taken per day', 
         x = "Total steps taken per day",
         y = "Frequency")
```

![](PA1_template_files/figure-markdown_github/figure%201-1.png)

### 3. Calculate and report the mean and median of the total number of steps taken per day

Here we can just take the mean and median of the daily\_steps list of values.

``` r
mean(daily_steps)
```

    ## [1] 9354.23

``` r
median(daily_steps)
```

    ## [1] 10395

What is the average daily activity pattern?
===========================================

``` r
interval_steps <- Activity %>% 
                    group_by(interval) %>% 
                    summarize(avg_steps = mean(steps, na.rm = TRUE)) 
interval_steps %>% 
    ggplot(aes(x = interval, y = avg_steps)) + 
    geom_line() +
    labs(title = 'Average number of steps per interval', x = 'Interval', y = 'Average Steps')
```

![](PA1_template_files/figure-markdown_github/figure%202-1.png)

### 2. Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?

We'd want to filter out the data frame to the selection where the average steps are at the maxed. We will use the dyplr package for this.

``` r
filter(interval_steps, avg_steps == max(avg_steps))
```

    ## # A tibble: 1 x 2
    ##   interval avg_steps
    ##      <int>     <dbl>
    ## 1      835      206.

Inputting missing values
========================

### Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with start color red, NA, end color redNAs)

Here we can just use the dplyr package to filter out the NA rows and check the dimension of the new dataframe.

``` r
dim(Activity %>% filter(is.na(steps)))[1] #Total number of missing values
```

    ## [1] 2304

### Create a new dataset that is equal to the original dataset but with the missing data filled in.

Since we already have the interval means calculated in the earlier part of the project, we can impute the values with the interval means.

``` r
Imputed_Activity <- Activity %>% 
    group_by(interval) %>%
    mutate(steps = ifelse(is.na(steps), yes = mean(steps, na.rm = TRUE), no = steps))
```

### Make a histogram of the total number of steps taken each day and Calculate and report the mean and median total number of steps taken per day. Do these values differ from the estimates from the first part of the assignment? What is the impact of imputing missing data on the estimates of the total daily number of steps?

``` r
Imputed_Activity %>% 
    group_by(date) %>%
    summarise(mean_steps = mean(steps)) %>%
    ggplot(aes(x = mean_steps)) + 
    geom_histogram(bins = 15) +
    labs(title = 'Daily steps taken', x = 'Average number of steps', y = 'Frequency')
```

![](PA1_template_files/figure-markdown_github/figure%203-1.png)

Mean and median number of steps taken per day.

``` r
new_daily_steps <- tapply(Imputed_Activity$steps, Imputed_Activity$date, FUN = sum)
mean(new_daily_steps)
```

    ## [1] 10766.19

``` r
median(new_daily_steps)
```

    ## [1] 10766.19

``` r
head(new_daily_steps)
```

    ## 2012-10-01 2012-10-02 2012-10-03 2012-10-04 2012-10-05 2012-10-06 
    ##   10766.19     126.00   11352.00   12116.00   13294.00   15420.00

The average and the median has both increased because the na values are replaced by the interval's averages.

Are there differences in activity patterns between weekdays and weekends?
=========================================================================

### Make a panel plot containing a time series plot (i.e. start color red, type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all weekday days or weekend days (y-axis). See the README file in the GitHub repository to see an example of what this plot should look like using simulated data.

``` r
Activity$weekday <- as.character(Activity$weekday)
Activity <- mutate(Activity, 
                weekends = 
                    ifelse(weekday %in% c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday"),
                    yes = "Weekday",
                    no = "Weekend"))
```

``` r
Activity$weekends <- as.factor(Activity$weekends)
Activity %>%
    group_by(interval, weekends) %>%
    summarise(mean_steps = mean(steps, na.rm = TRUE)) %>%
    ggplot(aes(x = interval, y = mean_steps, colour = weekends)) + 
    facet_grid(weekends~.) +
    geom_line() + 
    labs(title = "Average daily steps by date type", x = "Time Interval", y = "Average steps")
```

![](PA1_template_files/figure-markdown_github/figure%204-1.png)

\`\`\`
