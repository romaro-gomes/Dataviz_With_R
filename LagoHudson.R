library(ggdemetra)
library(here)
here()



lake=ggdemetra::ts2df(LakeHuron)


p <- ggplot(lake, aes(x=date, y=LakeHuron)) +
  geom_line(color="white") + 
  xlab("") +
  ylab("") +
  ggtitle("Nivel do Lago Huron de de 1875 à 1975") +
  theme(
    panel.background = element_rect(fill = "#0088a3", color = "black"),
    plot.background = element_rect(fill = "#36a300", color ="#36a300"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.text=element_text(size=12, colour = "black"),
    plot.title = element_text(size = rel(1), hjust = 0.5),
    plot.title.position="plot"
  )

p

ggplot2::ggsave("LagoHuron.png",path=here())
