# Lista de Exercícios - Capítulo 3

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/Users/User/Documents/IES/DSA/FCD/BigDataRAzure/Cap03")
getwd()

# Exercício 1 - Pesquise pela função que permite listar todos os arquivo no diretório de trabalho
list.files()

# Exercício 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, um lógico e um de números
v1 <- c("Ana", "Paula", "Machado")
v2 <- c("3", "5", "7")
v3 <- c(TRUE, FALSE, FALSE)
df1 <- data.frame(v1, v2, v3)
df1

# Exercício 3 - Considere o vetor abaixo. 
# Crie um loop que verifique se há números maiores que 10 e imprima o número e uma mensagem no console.
for (i in vec1) {
  if (i > 10){
    print(i)
    print("Foram encontrados valores maiores que 10 em vec1")
  }
}
  
  
# Criando um Vetor
vec1 <- c(12, 3, 4, 19, 34)
vec1

# Exercício 4 - Conisdere a lista abaixo. Crie um loop que imprima no console cada elemento da lista
lst2 <- list(2, 3, 5, 7, 11, 13)
lst2

for(i in lst2) {
  print(i)
}

# Exercício 5 - Considere as duas matrizes abaixo. 
# Faça uma multiplicação element-wise e multiplicação normal entre as materizes
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
mat2 <- t(mat1)
mat2

# Multiplicação element-wise

mat1*mat2

# Multiplicação de matrizes

mat1%*%mat2

# Exercício 6 - Crie um vetor, matriz, lista e dataframe e faça a nomeação de cada um dos objetos
v4 <- c("Ana", "Thiago", "Vitória")
v5 <- c(23, 37, 20)
names(v4) = "Nomes"
v4

mat3 <- matrix(data = c(v4, v5), nr = 3, ncol = 2)
mat3
colnames(mat3) = list("Nome", "Idade")
rownames(mat3) = list("Linha1", "Linha2", "Linha3")

lst2 <- list("Ana", "Thiago", "Vitória")
names(lst2) = "Nomes"
lst2

lst3 <- list(23, 37, 20)
lst3
data <- cbind(lst2, lst3)
data
df3 <- data.frame(data)
dimnames(df3) = list(c("Linha1", "Linha2", "Linha3"), c("Nome", "Idade"))
df3

# Exercício 7 - Considere a matriz abaixo. Atribua valores NA de forma aletória para 50 elementos da matriz
# Dica: use a função sample()
mat2 <- matrix(1:90, 10)
mat2
help(sample)

mat2[sample(1:90, 50)] = NA
mat2

# Exercício 8 - Para a matriz abaixo, calcule a soma por linha e por coluna
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1

apply(mat1, 1, sum) # rowSums(mat1)
apply(mat1, 2, sum) # colSums(mat1)


# Exercício 9 - Para o vetor abaixo, ordene os valores em ordem crescente
a <- c(100, 10, 10000, 1000)
a
order(a)
a[order(a)] # Coloca a função order como índice do vetor

# # Exercício 10 - Imprima no console todos os elementos da matriz abaixo que forem maiores que 15
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1

for(i in mat1) {
  if(i > 15) {
    print(i)
  }
}