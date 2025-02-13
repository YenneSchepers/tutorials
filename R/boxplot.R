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
  )
