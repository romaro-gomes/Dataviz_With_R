library(here)
library(tidyverse)

dados <- read.csv(here("dubois2023","c01","data.csv"))
summary(dados)
dados$Other <- replace_na(dados$Other,0.1)
dado

dados2= pivot_longer(dados,cols = c('Rent', 'Food', 'Clothes', 'Tax', 'Other'), values_to = "Percentage")
dados2

ggplot(data=dados2, aes(fill=name,x=Class,y=Percentage )) +
                geom_bar(position="stack", stat="identity") +
                coord_flip() +
                scale_fill_viridis_d()+
                labs(title ="Income and Expenditure of 150 Negro Families",
                     subtitle = "In Atlanta.GA,USA",
                     fill="Expendures",
                     caption= "Source: Dubois Visualization Challenge / https://github.com/ajstarks/dubois-data-portraits/tree/master/challenge/2023/challenge01") +
 
                theme(
                  plot.background = element_rect(fill="grey"),
                  plot.title = element_text(hjust=0.5),
                  plot.subtitle = element_text(hjust=0.5),
                  plot.caption=element_text(hjust =-1.2, size= 6.5),
                  
                  panel.background = element_blank(),
                  panel.grid.major = element_blank(),
                  panel.grid.minor = element_blank(),
                  
                  
                  axis.text= element_text(colour = "black"),
                  
                  legend.background = element_rect(fill='grey',color = 'grey'),
                  legend.position = 'bottom'
                  
                )
ggsave(path =here(),file="c01_2023.png")

