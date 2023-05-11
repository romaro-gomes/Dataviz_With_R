library(emmeans)
library(tidyverse)
emmeans::neuralgia 

neuralgia |>
  ggplot(aes(x=Treatment,y=Age,fill=Treatment)) +
  geom_boxplot()+
  labs(title = "Patients years old by interventions") +
  theme(
    legend.position = 'none'
  )

neuralgia |>
  group_by(Treatment,Sex) |> 
  summarise(total=n()) |> 
  ggplot(aes(x=Treatment,y=total,fill=Sex)) +
  geom_col(position ='dodge' )+
  labs(title = "Patients sex by interventions") +
  theme(
    legend.position = 'none'
  )

neuralgia |> 
  ggplot(aes(x=Duration,color=Pain)) +
  geom_freqpoly(binwidth=10, size=1) +
  facet_grid(rows=vars(Treatment)) 

