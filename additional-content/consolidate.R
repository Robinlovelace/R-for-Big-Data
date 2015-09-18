
# aim: read data and subset
url <- "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv"

# library(downloader)


eq <- read.csv(url(url))

# Task 1 - subset 
mag7 <- eq$mag > 7 

# mag7 can be used to subset the data
eq7 <- eq[mag7, c("place", "mag")]

# this is the same as:
eq7 <- eq[eq$mag > 7,]

# eq7 now contains the rows for large earthquakes

# equals doesn't work
sel <- eq$place == "California" 
summary(sel)

# to match a character, use grep
sel <- grep("Ca", eq$place)
sell <- grepl("Cali", eq$place)
sel5 <- eq$mag > 4
summary(sel)
sel_final <- sel5 & sell

mag5Cali <- eq[sel_final,]

# in cali
sp <- grepl("Cali", eq$place)
# magnitude > 3.5
sm <- eq$mag > 3.5

# final selection
s <- sp & sm
m5c <- eq[s,]

plot(eq$latitude, eq$longitude)

# create the same thing with no new objects
m5c2 <- eq[grepl("Cali", eq$place) & eq$mag > 3.5,]

identical(m5c, m5c2)
# eq[1:3, 4:5]

library(dplyr)
names(eq)

eqmini <- select(eq, contains("l"), contains("e"))

eqmini <- eq[seq(1, 15, 5)]



names(eqmini)

summary(mag7)  
names(eq)

eq_ag <- group_by(eq, magType) %>% 
  summarise(median = quantile(mag, probs = 0.5))

eq_joined <- inner_join(eq, eq_ag)

glimpse(eq_joined)

# 
