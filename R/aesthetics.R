# facets = split_in_subplots
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  facet_wrap(~cyl)
#facet_plot_with_two_variables
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  facet_grid(drv ~ cyl)
## free scales
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  facet_grid(drv ~ cyl, scales = "free")
# statistical_transformation
ggplot(diamonds) + 
  stat_summary(
    aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )
#color_bar_chart
ggplot(mpg, aes(x = drv, color = drv)) + geom_bar()
## fill_bar_chart
ggplot(mpg, aes(x = drv, fill = drv)) + geom_bar()
## stacked_bar 
ggplot(mpg, aes(x=drv, fill = class)) + geom_bar()
## make_bar_transparent
ggplot(mpg, aes(x = drv, fill = class)) + 
  geom_bar(alpha = 1/5, position = "identity")

### completely_transparent
ggplot(mpg, aes(x = drv, color = class)) + 
  geom_bar(fill = NA, position = "identity")

#exploratory_data_analysis_reordering
ggplot(mpg, aes(x = fct_reorder(class, hwy, median),y = hwy)) + geom_boxplot()
 ## count_two_categorical_variables_and_fill_in_tiles-Aesthetically
diamonds |> 
  count(color, cut) |>  
  ggplot(aes(x = color, y = cut)) +
  geom_tile(aes(fill = n))

# labels -> labs()
ggplot(mpg, aes(x = displ, y = hwy)) + geom_point(aes(color = class)) + geom_smooth(se = FALSE) + labs(x = "Engine displacement (L)", y = "Highway fuel economy (mpg)", color = "Car type", title = "Fuel efficiency generally decreases with engine size", subtitle = "Two seaters (sports cars) are an exception", caption = "Data from fueleconomy.gov")

#annonations_non-overlapping
ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point(alpha = 0.3) +
  geom_smooth(se = FALSE) +
  geom_label_repel(
    data = label_info, 
    aes(x = displ, y = hwy, label = drive_type),
    fontface = "bold", size = 5, nudge_y = 2
  ) +
  theme(legend.position = "none")

