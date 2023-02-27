teach_num_lineplot <- function(df, breakdown, metric) {
  print(colnames(df))
  print(breakdown)
  print(metric)
  print(df)
  ggplot(df, aes(x = time_period, y = get(metric), 
                 color = get(breakdown))) +
    geom_line(size = 1.2) +
    theme_classic() +
    theme(
      text = element_text(size = 12),
      axis.title.x = element_text(margin = margin(t = 12)),
      axis.title.y = element_text(margin = margin(r = 12)),
      axis.line = element_line(size = 1.0),
      legend.position = "top"
    ) +
    xlab("Academic year") +
    ylab(ifelse(metric=='headcount',
                'Headcount',"Full Time Equivalent")) 
}

plotAvgRevBenchmark <- function(dfRevenueBalance, inputArea) {
  ggplot(dfRevenueBalance, aes(
    x = area_name,
    y = average_revenue_balance,
    fill = area_name
  )) +
    geom_col() +
    theme_classic() +
    theme(
      text = element_text(size = 12),
      axis.text.x = element_text(angle = 300),
      axis.title.x = element_blank(),
      axis.title.y = element_text(margin = margin(r = 12)),
      axis.line = element_line(size = 1.0),
      legend.position = "none"
    ) +
    scale_y_continuous(
      labels = scales::number_format(accuracy = 1, big = ",", prefix = "£")
    ) +
    xlab("Area") +
    ylab("Average revenue balance") +
    scale_fill_manual(
      "Area",
      breaks = unique(dfRevenueBalance$area_name),
      values = gss_colour_pallette
    )
}
