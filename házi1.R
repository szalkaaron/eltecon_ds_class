#Az adatok a maygar mozi-statisztikák 2014-bõl elkülöm Drive-on, de innen is le lehet tölteni: http://nmhh.hu/nemzeti-filmiroda/mozgokep-statisztika
#Egyedül fogom a kutatást elkészíteni úgy tûnik



library (ggplot2)
library(data.table)
library(magrittr)

filmek_2014 <- read_excel("G:/Egyetem/R/workingdirectoryezlegyenmost/filmek 2014.xlsx", 
                          +     col_types = c("text", "text", "text", 
                                              +         "date", "numeric", "numeric", "numeric", 
                                              +         "numeric", "numeric", "numeric", 
                                              +         "numeric", "numeric", "text", "numeric", 
                                              +         "numeric", "text"))

summary(filmek_2014)

hist(filmek_2014$`Látogatók száma (fõ)`)

summary(filmek_2014$`Pénztári jegybev.(Ft) (bruttó)`)

filmek_2014[, .N, filmek_2014$`Látogatók száma (fõ)`][order(filmek_2014$`Látogatók száma (fõ)`)]

ggplot(filmek_2014, aes(filmek_2014$`Látogatók száma (fõ)`, filmek_2014$`Pénztári jegybev.(Ft) (bruttó)`)) + geom_point()

ggplot(filmek_2014, aes(filmek_2014$`Látogatók száma (fõ)`, filmek_2014$`Pénztári jegybev.(Ft) (bruttó)`)) + geom_point() + facet_wrap(~ as.factor(filmek_2014$`Gyártó ország (ISO-kóddal)`))