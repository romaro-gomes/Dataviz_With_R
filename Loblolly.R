library(ggplot2)
library(here)
#devtools::install_github("EdwinTh/dutchmasters")
library("dutchmasters")

boxplot(height~Seed, data= Loblolly)
ggplot2::ggplot(data=Loblolly,aes(x=Seed,y=height, fill=Seed)) +
  ggplot2::geom_boxplot() +
  xlab("Origem da semente")+
  ylab("Altura das arvores")+
  ggtitle("Tamanho das Arvores de Pinheiro")+
  scale_fill_dutchmasters(pearl_earring) +
  theme(legend.position = 'none',
        panel.background = element_blank(),
        plot.title =element_text(hjust = 0.5))
  
ggsave('Loblolly.png', path=here())
