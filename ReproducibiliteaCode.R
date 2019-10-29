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
cutworld <- world + ylim(c(-33.9249, 77.8750))

## Input data for jounral club locations


Location <- c("Oxford", "Cambridge", "Bristol", "Manchester", "UCL", "Graz", "Groningen", 
              "Amsterdam", "Surrey", "York", "Nanyang", "Frankfurt", "Kingston", "Leiden", 
              "Sheffield", "Chester", "Minnesota", "Swansea")
Long <- c(-1.257726, 0.121817, -2.587910, -2.242631, -0.127758, 15.439504, 6.566480, 
          4.895168, -0.587770, -1.051778, 103.683141, 8.667758, -0.293708, 4.485233, 
          -1.487951, -2.899173, -93.227747, -3.979959)
Lat <- c(51.752022, 52.205338, 51.454514, 53.480759, 51.507351, 47.070713, 53.214470, 
         52.370216, 51.242724, 53.946025, 1.348221, 50.126993, 51.410435, 52.157032, 
         53.380927, 53.200184, 44.973891, 51.609162)


Order <- seq_along(1:length(Long))
Image <- rep("ReproducibiliTeaLogo2.png", length(Location))
data <- data.frame(Location = Location, Long = Long, Lat = Lat, Order = Order, Image=Image)

## Create map of journal club locations

map <- cutworld +
  geom_image(aes(x = Long, y = Lat, image=Image, by="length"),
             data = data)

map

## Create animation of jounral clubs

ReproducibiliTea <- map + transition_states(Order, transition_length = 3, state_length = 1, wrap = FALSE) +
  shadow_mark()
ReproducibiliTea
anim_save("ReproducibiliTea29.10.gif")

