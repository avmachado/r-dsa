# Solução Lista de Exercícios - Capítulo 5

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/Users/User/Documents/IES/DSA/FCD/BigDataRAzure/Cap05")
getwd()


# Exercicio 1 - Encontre e faça a correção do erro na instrução abaixo:
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")


# Exercicio 2 - Encontre e faça a correção do erro na instrução abaixo:
library(readr)
help(read_csv)
df_iris <- read_csv("iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))


# Exercício 3 - Abaixo você encontra dois histogramas criados separadamente.
# Mas isso dificulta a comparação das distribuições. Crie um novo plot que faça a união 
# de ambos histogramas em apenas uma área de plotagem.

# Dados aleatórios
dataset1=rnorm(4000 , 100 , 30)     
dataset2=rnorm(4000 , 200 , 30) 

# Histogramas
par(mfrow=c(1,2))
hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="", add = TRUE)


# Exercício 4 - Encontre e corrija o erro no gráfico abaixo
install.packages("plotly")
library(plotly)
head(iris)

plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = ~Species , marker=list(size=20 , opacity=0.5))


# Exercício 5 - Em anexo você encontra o arquivo exercicio5.png. Crie o gráfico que resulta nesta imagem.
library(plotly)
head(volcano)

# 3D plot
p <- plot_ly(z = volcano, type = "surface")
p

# Exercício 6 - Carregue o arquivo input.json anexo a este script e imprima o conteúdo no console
# Dica: Use o pacote rjson
install.packages("rjson")
library(rjson)
result <- fromJSON(file = "input.json")
result
class(result)

# Exercício 7 - Converta o objeto criado ao carregar o arquivo json do exercício anterior 
# em um dataframe e imprima o conteúdo no console.
df1 <- data.frame(result)
df1

# Exercício 8 - Carregue o arquivo input.xml anexo a este script.
# Dica: Use o pacote XML
install.packages("XML")
library(XML)
library(methods)

result2 <- xmlParse(file = "input.xml")
result2

# Exercício 9 - Converta o objeto criado no exercício anterior em um dataframe
df2 <- xmlToDataFrame(result2)
df2

# Exercício 10 - Carregue o arquivo input.csv em anexo e então responda às seguintes perguntas:
data <- read_csv("input.csv")


# Pergunta 1 - Quantas linhas e quantas colunas tem o objeto resultante em R?
#8 linhas e 5 colunas

# Pergunta 2 - Qual o maior salário?
maior_salario <- max(data$salary)
maior_salario

# Pergunta 3 - Imprima no console o registro da pessoa com o maior salário.
registro <- filter(data, data$salary == maior_salario)
registro

# Pergunta 4 - Imprima no console todas as pessoas que trabalham no departamento de IT.
pessoas_TI <- filter(data, data$dept == "IT")
pessoas_TI

# Pergunta 5 - Imprima no console as pessoas do departamento de IT com salário superior a 600. 
pessoas_TI2 <- filter(data, data$dept == "IT" & data$salary > 600)
pessoas_TI2
