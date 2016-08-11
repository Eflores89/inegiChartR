# inegiChartR :bar_chart: :chart_with_upwards_trend:

*Create for dashboard or shiny, ready html charts using [inegiR](https://github.com/Eflores89/inegiR) package and [highcharter](https://github.com/jbkunst/highcharter).*

-----
## :construction: Still under development :construction:
-----

### Introduction
Getting data from INEGI (Mexican Statistics Agency) is cleverly easy using the [inegiR](https://github.com/Eflores89/inegiR) package, but what if you want to graph? 
ggplot2 is great, but getting it to look "publishable" requires some tinkering while [highcharter](https://github.com/jbkunst/highcharter) has a universe of options to configure,
why not just "pack" the basics into one? This is my idea behind this package: create a chart of INEGI data using as few code as possible.


### Installation & set-up

```
library(devtools)
install_github("Eflores89/banxicoR")

library(inegiR)
library(highcharter)
library(inegiChartR)

inegi_token <- "****"
```

### Usage

Basically, the same rules apply as when using [inegiR](https://github.com/Eflores89/inegiR), you still need the token. But now you can easily place calls to the data right inside the pipes when building a chart. Each call to `hc_inegi` will bring the data and add the series. Each call only builds one type of chart (more on that later)... 

```
highchart() %>% 
    hc_inegi(s1, inegi_token, "line",  "Series #1") %>%
    hc_inegi(s2, inegi_token, "column", "Series #2") %>%
    hc_add_theme(hc_theme_eem())
```

```
highchart() %>% 
    hc_inegi(s1, inegi_token, "line",  "Series #1") %>%
    hc_inegi(s2, inegi_token, "column", "Series #2")
```

```
highchart() %>% 
    hc_inegi(c(s1, s2),
             token = inegi_token, 
             type = "line", 
             names = c("Series #1", "Series #2"))
```
