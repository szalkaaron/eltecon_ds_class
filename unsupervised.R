library(data.table)
library(ggplot2)

data <- fread("hazi6/sales_data_for_clustering.csv")

set.seed(2)

#a quantity és a price tûnt a két leginkább értelmesen összefüggõ változónak
x <- data.table(a = data$quantity, b = data$price)

#outlier kiszedése
x <- x[b <= 9000]

# 5 cluster készítése
km_output <- kmeans(x, centers = 5, nstart = 20)
km_output
km_output$cluster

ggplot(x, aes(x = a, y = b)) +
  geom_point()

ggplot(x, aes(x = a, y = b)) +
  geom_point(colour = (km_output$cluster + 1), size = 4) 

#Látható, hogy az adatbázis ár-mennyiség grafikonján, ha 5 clustert képzünk, azok elsõsorban az ár szerint fognak elhelyezkedni.
#Ennek logikus oka az, hogy a legtöbb vásárlás során viszonyleg kevés mennyiséget vásároltak, így a nagyobb darabszámú vásárlások súlya nem lesz jelentõs a clusterek
#kialakulása szempontjából.