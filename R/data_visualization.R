#primes
primes <- c(2,3,5)
primes * 2
seq(10, 20)

#filter  "then"
flights |>
  filter(dest == "IAH") |> 
  group_by(year, month, day) |> 
  summarize(
    arr_delay = mean(arr_delay, na.rm = TRUE)
    
    ### dplyr basics
    *Pipe: takes the thing on its left and passes it along to the function on its right
    
    *Arrange: changes the order of the rows based on the value of the columns. It takes a data frame and set of column names to order by.
    ** ** flights|> arrange( year, month, day, dep_time)
    *Distinct: finds all unique rows in a dataset 
    ** ** flights|>distinct ()
    *Count: to find number of occurrences
    ### Columns
    * Mutate (): to create new columns derived from existing columns
    .before = before another column
    .after = after column
    flights |> 
      mutate(
        gain = dep_delay - arr_delay,
        speed = distance / air_time * 60,
        .before = 1
      )    
    *flights |> select(year:day)
    *relocate to move variables to front
    flights |> relocate (time_hour)
    * combination
    flights |> 
      filter(dest == "IAH") |> 
      mutate(speed = distance / air_time * 60) |> 
      select(year:day, dep_time, carrier, flight, speed) |> 
      arrange(desc(speed))
    
    *mean value   change na.rm to TRUE to avoid missing values
    flights |> 
      group_by(month) |> 
      summarize(
        avg_delay = mean(dep_delay, na.rm = TRUE)
      )
    
    #take first row of each group
    df |> slice_head(n = 1) 
    #last row of each group
    df |> slice_tail(n = 1)
    #row with smallest value of column x
    df |> slice_min(x, n = 1)
    #row with largest value of column x
    df |> slice_max(x, n = 1)
    #random row
    df |> slice_sample(n = 1)
    
    #read data from file
    students <- read_csv()

