hc_theme_eem <- function(...){
  theme <-
    list(
      colors = c("#A84A44","#E47D04",
                 "#D8A19E","#ae8b38",
                 "#4d7c28","#38b6a6",
                 "#2080c7","#94127a",
                 "#155685","#157d85",
                 "#731585","#848515",
                 "#d06347","#d0ca47",
                 "#d04785","#a19c9b",
                 "#b5bcbf","#62686b",
                 "#021118",
                 "#daf3ff"),
      chart = list(
        backgroundColor = "#F2F0E8",
        style = list(
          fontFamily = "Verdana",
          color = "black"
        )
      ),
      title = list(
        align = "center",
        style = list(
          fontWeight = "bold"
        )
      ),
      subtitle = list(
        align = "left"
      ),
      yAxis = list(
        gridLineColor = "#E5D770",
        lineColor = "#E5D770",
        minorGridLineColor = "#E5D770",
        tickColor = "#E5D770",
        tickWidth = 1,
        title = list(
          style = list(
            color = "#E5D770"
          )
        )
      ),
      tooltip = list(
        backgroundColor = "#FFFFFF",
        borderColor = "#ae8b38",
        style = list(
          color = "black"
        )
      ),
      legend = list(
        itemStyle = list(
          color = "#3C3C3C"
        ),
        itemHiddenStyle = list(
          color = "#606063"
        )
      ),
      credits = list(
        style = list(
          color = "#666"
        )
      ),
      labels = list(
        style = list(
          color = "#D7D7D8"
        )
      ),
      navigation = list(
        buttonOptions = list(
          symbolStroke = "#DDDDDD",
          theme = list(
            fill = "#505053"
          )
        )
      ),
      legendBackgroundColor = "rgba(0, 0, 0, 0.5)",
      background2 = "#F2F0E8",
      dataLabelsColor = "#B0B0B3",
      textColor = "#C0C0C0",
      contrastTextColor = "#F0F0F3",
      maskColor = "rgba(255,255,255,0.3)"
    )
  theme <- structure(theme, class = "hc_theme")
  if (length(list(...)) > 0) {
    theme <- hc_theme_merge(
      theme,
      hc_theme(...)
    )
  } 
  theme
}