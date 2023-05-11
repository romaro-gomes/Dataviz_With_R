library(here)
library(tidyverse)
library(glue)


data = read_csv(here('data/List_of_Unicorn_Startup_Companies.csv'))

data = data[-1]


sum(is.na(data))

data = na.omit(data)
sum(is.na(data))

columns_names= tolower(names(data)) |> iconv(from = 'UTF-8', to = 'ASCII//TRANSLIT')
columns_names =str_replace_all(columns_names," ","_")
columns_names =str_replace_all(columns_names,"[\\(\\)]","_")


columns_names
#columns_names= str_replace_all( names(data),"-", "_")  

names(data)=columns_names
names(data)
data <- data |>
        separate(valuation_date, c('month', 'year','discard')) |>
        select(!discard)

month_list=c('January',
             'February',
             'March',
             'April',
             'May',
             'June',
             'July',
             'August',
             'September',
             'October',
             'November',
             'December')

month <- factor(data$month, levels = month_list)

data$month =ordered(month, month_list) |> as.numeric()
data$month

data = mutate(data,usd_billions =as.numeric(`valuation_us$_billions_`))
data= data |>
  mutate(date=paste0(year,'-',month,'-','01'))

data$date=as.Date(x = data$date)
data$date

data = na.omit(data)

data |>
  group_by(industry) |>
  summarise(total_in_billions =sum(usd_billions)) |> 
  arrange(desc(total_in_billions)) |> 
  head(10) |> 
  ggplot(aes(y=total_in_billions, x=reorder(industry,desc(total_in_billions)), fill=industry)) +
  ylab('Billions Accumalate') +
  xlab('Industry') +
  labs(title = 'Unicorn Industries') +
  geom_col() +
  coord_flip() +
  theme(
    legend.position = 'none'
  )


data |>
  ggplot( aes(x=date, y=log10(usd_billions)) )+
  geom_line() +
  geom_point(aes(color=as.factor(month)))

