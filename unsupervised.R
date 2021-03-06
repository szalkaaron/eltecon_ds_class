library(data.table)
library(ggplot2)

data <- fread("hazi6/sales_data_for_clustering.csv")

set.seed(2)

#a quantity �s a price t�nt a k�t legink�bb �rtelmesen �sszef�gg� v�ltoz�nak
x <- data.table(a = data$quantity, b = data$price)

#outlier kiszed�se
x <- x[b <= 9000]

# 5 cluster k�sz�t�se
km_output <- kmeans(x, centers = 5, nstart = 20)
km_output
km_output$cluster

ggplot(x, aes(x = a, y = b)) +
  geom_point()

ggplot(x, aes(x = a, y = b)) +
  geom_point(colour = (km_output$cluster + 1), size = 4) 

#L�that�, hogy az adatb�zis �r-mennyis�g grafikonj�n, ha 5 clustert k�pz�nk, azok els�sorban az �r szerint fognak elhelyezkedni.
#Ennek logikus oka az, hogy a legt�bb v�s�rl�s sor�n viszonyleg kev�s mennyis�get v�s�roltak, �gy a nagyobb darabsz�m� v�s�rl�sok s�lya nem lesz jelent�s a clusterek
#kialakul�sa szempontj�b�l.