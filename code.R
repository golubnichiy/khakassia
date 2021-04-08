library(leaflet)
library(readr)
library(dplyr)
library(purrr)

## A set of functions for writing and editing files ----

set_point <- readRDS("set_point.rds")
#write_excel_csv2(set_point, "set_point.csv", )
#set_point <- read_csv2("set_point.csv")
#saveRDS(set_point, "set_point.rds")


### Template ----

adm_ter_del <- read_delim("adm_ter_del.csv", ",") 

char_to_vector <- function(lat_lng){ 
  as.numeric(unlist(strsplit(lat_lng, split = ","))) 
}

adm_ter_del$lat_1 <- map(adm_ter_del$lat_1, char_to_vector)
adm_ter_del$lng_1 <- map(adm_ter_del$lng_1, char_to_vector)

#example_polygon <- Polygon(cbind(adm_ter_del$lat_1[[14]], adm_ter_del$lng_1[[14]]))


## Create leaflet ----

leaflet() %>% 
  addTiles() %>% 
  addCircleMarkers(data = set_point %>% 
                     filter(mun_1 == unique(set_point$mun_1)[1]), 
                   popup = ~title_rus, lat = ~lat, lng = ~lng, 
                   radius = ~log(pop_10, 4), color = "green",
                   clusterOptions = markerClusterOptions(),
                   group = unique(set_point$mun_1)[1]) %>% 
  addCircleMarkers(data = set_point %>% 
                     filter(mun_1 == unique(set_point$mun_1)[2]), 
                   popup = ~title_rus, lat = ~lat, lng = ~lng, 
                   radius = ~log(pop_10, 4), color = "blue",
                   clusterOptions = markerClusterOptions(),
                   group = unique(set_point$mun_1)[2]) %>% 
  addCircleMarkers(data = set_point %>% 
                     filter(mun_1 == unique(set_point$mun_1)[3]), 
                   popup = ~title_rus, lat = ~lat, lng = ~lng,
                   radius = ~log(pop_10, 4), color = "cayen",
                   clusterOptions = markerClusterOptions(),
                   group = unique(set_point$mun_1)[3]) %>% 
  addCircleMarkers(data = set_point %>% 
                     filter(mun_1 == unique(set_point$mun_1)[4]), 
                   popup = ~title_rus, lat = ~lat, lng = ~lng,
                   radius = ~log(pop_10, 4), color = "purple",
                   clusterOptions = markerClusterOptions(),
                   group = unique(set_point$mun_1)[4]) %>% 
  addCircleMarkers(data = set_point %>% 
                     filter(mun_1 == unique(set_point$mun_1)[5]), 
                   popup = ~title_rus, lat = ~lat, lng = ~lng,
                   radius = ~log(pop_10, 4), color = "red",
                   clusterOptions = markerClusterOptions(),
                   group = unique(set_point$mun_1)[5]) %>% 
  addCircleMarkers(data = set_point %>% 
                     filter(mun_1 == unique(set_point$mun_1)[6]), 
                   popup = ~title_rus, lat = ~lat, lng = ~lng,
                   radius = ~log(pop_10, 4), color = "orange",
                   clusterOptions = markerClusterOptions(),
                   group = unique(set_point$mun_1)[6]) %>% 
  addCircleMarkers(data = set_point %>% 
                     filter(mun_1 == unique(set_point$mun_1)[7]), 
                   popup = ~title_rus, lat = ~lat, lng = ~lng,
                   radius = ~log(pop_10, 4), color = "black",
                   clusterOptions = markerClusterOptions(),
                   group = unique(set_point$mun_1)[7]) %>%
  addCircleMarkers(data = set_point %>% 
                     filter(mun_1 == unique(set_point$mun_1)[8]), 
                   popup = ~title_rus, lat = ~lat, lng = ~lng,
                   radius = ~log(pop_10, 4), color = "yellow",
                   clusterOptions = markerClusterOptions(),
                   group = unique(set_point$mun_1)[8]) %>% 
  addCircleMarkers(data = set_point %>% 
                     filter(mun_1 == unique(set_point$mun_1)[9]), 
                   popup = ~title_rus, lat = ~lat, lng = ~lng,
                   radius = ~log(pop_10, 4), color = "gray",
                   clusterOptions = markerClusterOptions(),
                   group = unique(set_point$mun_1)[9]) %>% 
  addCircleMarkers(data = set_point %>% 
                     filter(mun_1 == unique(set_point$mun_1)[10]), 
                   popup = ~title_rus, lat = ~lat, lng = ~lng,
                   radius = ~log(pop_10, 4), color = "magenta",
                   clusterOptions = markerClusterOptions(),
                   group = unique(set_point$mun_1)[10]) %>%
  addLayersControl(overlayGroups = unique(set_point$mun_1))

