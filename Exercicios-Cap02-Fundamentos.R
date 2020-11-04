# Lista de Exercícios - Capítulo 2

# Obs: Caso tenha problemas com a acentuaçãoo, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Nãoo use diretórios com espaço no nome
setwd("C:/Users/User/Documents/IES/DSA/FCD/BigDataRAzure/Cap02")
getwd()

# Exercício 1 - Crie um vetor com 30 números inteiros
vetor1 <- c(1:30)
vetor1

# Exercício 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com números inteiros
vetor2 <- c(1:16)
matriz1 <- matrix(vetor2, nr=4, ncol=4)
matriz1

# Exercício 3 - Crie uma lista unindo o vetor e matriz criados anteriormente
lista1 = list(vetor1, matriz1)
lista1

# Exercício 4 - Usando a função read.table() leia o arquivo do link abaixo para uma dataframe
# http://data.princeton.edu/wws509/datasets/effort.dat
help(read.table)
help(url)
tabela <- url("https://data.princeton.edu/wws509/datasets/effort.dat")
tabela
df1 <- read.table(tabela, header=TRUE)
df1
View(df1)

# Outra forma de fazer o exercício 4
df2 <- data.frame(read.table("https://data.princeton.edu/wws509/datasets/effort.dat"))
df2

# Exercício 5 - Transforme o dataframe anterior, em um dataframe nomeado com os seguintes labels:
# c("config", "esfc", "chang")
names(df1) <- c("config", "esfc", "chang")
df1

# Exercício 6 - Imprima na tela o dataframe iris, verifique quantas dimensões existem no dataframe iris e imprima um resumo do dataset
print(iris)
length(iris)
nrow(iris)
ncol(iris)
summary(iris)
str(iris) # Também mostra um resumo com o tipo de dados das variáveis, sem as estatísticas do summary

# Olhar as dimensões
dim(iris) # Número de colunas e linhas

# Exercício 7 - Crie um plot simples usando as duas primeiras colunas do dataframe iris
plot(iris$Sepal.Length, iris$Sepal.Width)


# Exercício 8 - Usando a função subset, crie um novo dataframe com o conjunto de dados do dataframe iris em que Sepal.Length > 7
# Dica: consulte o help para aprender como usar a função subset()
help(subset)
iris2 <- subset(iris, Sepal.Length > 7)
iris2


# Exercício 9 (Desafio) - Crie um dataframe que seja cópia do dataframe iris e usando a função slice(), divida o dataframe em um subset de 15 linhas
# Dica 1: Você vai ter que instalar e carregar o pacote dplyr
# Dica 2: Consulte o help para aprender como usar a função slice()
iris3 <- iris
library(dplyr)
help(slice)
sliced_iris <- slice_head(iris3, n=15)
# Outra forma de fazer o slice
sliced_iris2 <- slice(iris3, 1:15)
sliced_iris2

# Exercício 10 - Use a função filter no seu novo dataframe criado no item anterior e retorne apenas valores em que Sepal.Length > 6
# Dica: Use o RSiteSearch para aprender como usar a função filter
RSiteSearch("filter")
help(filter)
filter(iris3, Sepal.Length > 6)
