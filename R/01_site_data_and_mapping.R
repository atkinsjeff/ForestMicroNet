# ForestMicroNet Map File

require(raster)
require(maptools)
require(mapdata)
require(sf)
require(sp)
library(usmap) #import the package
library(ggplot2) #use ggplot2 to add layer for visualization
library(ggrepel)

### import site data
pts <- read.csv("./data/site_data.csv")

pts <- usmap_transform(pts)

x11()
plot_usmap(include = .south_region, exclude = c("TX", "OK", "AR", "LA", "WV", "DE", "MD", "DC", "KY"), labels = FALSE)+
    ggrepel::geom_label_repel(data = pts,
                              aes(x = x, y = y, label = Site),
                              size = 3, alpha = 1, label.size = 0.5,
                              segment.color = "red", segment.size = 1.25, box.padding = 1.5, max.overlaps = Inf) +
    geom_point(
        data = pts,
        aes(x = x, y = y, size = 3),
        color = "red", alpha = 0.5)+
    labs(title = "ForestMicroNet",
         subtitle = "Proposed Sites for 2022-2023") + 
    theme(panel.background=element_blank())+
    theme(legend.position="none")


