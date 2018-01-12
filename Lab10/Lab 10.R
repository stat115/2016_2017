#' ---
#' title: "Just an R Script"
#' author: "Stat 115"
#' date: "`r Sys.Date()`"
#' ---


#+ echo=FALSE, message=TRUE, warning=TRUE
library(plotly)

#' ### Yikes, those loading messages are ugly; let's try a silient loading -- 
#+ cache = FALSE, message=FALSE, warning=FALSE, echo = FALSE, eval = FALSE
library(tidyverse)

NULL
#' # Big Heading
# This is a commend in the R chunk now; below are the chunk options

#+ cache = TRUE, message=FALSE, warning=FALSE, echo = TRUE, fig.align='center', fig.cap = "Figure 1; an example of plotly"
df <- data.frame(x = rnorm(100), y = 0)
df <- df %>% mutate(z = x^2, name = paste0("dataPoint", as.character(1:100)))
p <- ggplot(df, aes(x=x, y=y, colour=z)) + geom_point() + 
  scale_color_gradientn(colors = c("dodgerblue", "firebrick", "black")) +
  theme_bw()

ggplotly(p)

# Code chunk options sometimes don't play nice with plotly

#' # Rendering in Plotly
plot_ly(df, x = ~x, y = ~y, color = ~z, text = ~paste0("Color Val: ",  z, "<br>", "Name: ", name),
        type="scatter", mode="markers")
