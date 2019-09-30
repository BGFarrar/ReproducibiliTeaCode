## ReproductibiliTea journal club locations, Ben Farrar

## load packages
library(ggplot2)
library(gganimate)
library(maps)
library(ggthemes)
library(ggimage)
setwd("~/Talks/Reproducibilitea")

## Create the image of the map to be used. 

world <- ggplot() +
  borders("world", colour = "lightblue3", fill = "lightblue1") +
  theme_map() 
europe <- world + xlim(c(-15,28.9784)) + ylim(c(33.83469, 62.1466))

## Input data for jounral club locations

Location <- c("Oxford", "Cambridge", "Bristol", "Manchester", "UCL", "Graz", "Groningen", "Amsterdam")
Long <- c(-1.257726, 0.121817, -2.587910, -2.242631, -0.127758, 15.439504, 6.566480, 4.895168)
Lat <- c(51.752022, 52.205338, 51.454514, 53.480759, 51.507351, 47.070713, 53.214470, 52.370216)
Order <- seq_along(1:length(Long))
Image <- rep("ReproducibiliTeaLogo2.png", length(Location))
data <- data.frame(Location = Location, Long = Long, Lat = Lat, Order = Order, Image=Image)

## Create map of journal club locations

map <- europe +
  geom_image(aes(x = Long, y = Lat, image=Image, by="length"),
             data = data)

## Create animation of jounral clubs

ReproducibiliTea <- map + transition_states(Order, transition_length = 3, state_length = 1, wrap = FALSE) +
  shadow_mark()
ReproducibiliTea
anim_save("ReproducibiliTea.gif")

