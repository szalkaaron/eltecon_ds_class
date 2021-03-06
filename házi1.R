#Az adatok a maygar mozi-statisztik�k 2014-b�l elk�l�m Drive-on, de innen is le lehet t�lteni: http://nmhh.hu/nemzeti-filmiroda/mozgokep-statisztika
#Egyed�l fogom a kutat�st elk�sz�teni �gy t�nik



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

hist(filmek_2014$`L�togat�k sz�ma (f�)`)

summary(filmek_2014$`P�nzt�ri jegybev.(Ft) (brutt�)`)

filmek_2014[, .N, filmek_2014$`L�togat�k sz�ma (f�)`][order(filmek_2014$`L�togat�k sz�ma (f�)`)]

ggplot(filmek_2014, aes(filmek_2014$`L�togat�k sz�ma (f�)`, filmek_2014$`P�nzt�ri jegybev.(Ft) (brutt�)`)) + geom_point()

ggplot(filmek_2014, aes(filmek_2014$`L�togat�k sz�ma (f�)`, filmek_2014$`P�nzt�ri jegybev.(Ft) (brutt�)`)) + geom_point() + facet_wrap(~ as.factor(filmek_2014$`Gy�rt� orsz�g (ISO-k�ddal)`))