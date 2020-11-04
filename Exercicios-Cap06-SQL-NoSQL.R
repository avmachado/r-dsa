# Solução Lista de Exercícios - Capítulo 6

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/Users/User/Documents/IES/DSA/FCD/BigDataRAzure/Cap06")
getwd()


# Exercicio 1 - Instale a carregue os pacotes necessários para trabalhar com SQLite e R
library(RSQLite)
library(dbplyr)
library(dplyr)

# Exercicio 2 - Crie a conexão para o arquivo mamiferos.sqlite em anexo a este script
help(dbConnect)
drv <- dbDriver("SQLite")
con <- dbConnect(drv, dbname = "mamiferos.sqlite")

# Exercicio 3 - Qual a versão do SQLite usada no banco de dados?
# Dica: Consulte o help da função src_dbi()
??src_dbi
src_dbi(con) # Versão 3.30.1

# Exercicio 4 - Execute a query abaixo no banco de dados e grave em um objero em R:
# SELECT year, species_id, plot_id FROM surveys
query <- "select year, species_id, plot_id from surveys"
res <- dbSendQuery(con, query)
dados <- fetch(res, n = -1)
dados

# Exercicio 5 - Qual o tipo de objeto criado no item anterior?
class(query)
class(res)
class(dados) # Dataframe

# Exercicio 6 - Já carregamos a tabela abaixo para você. Selecione as colunas species_id, sex e weight com a seguinte condição:
# Condição: weight < 5
pesquisas <- tbl(con, "surveys")
dados2 <- pesquisas %>%
  select(species_id, sex, weight) %>%
  filter(weight < 5) %>%
  collect()
dados2

# Exercicio 7 - Grave o resultado do item anterior em um objeto R. O objeto final deve ser um dataframe
dados2_df <- as.data.frame(dados2)
dados2_df

# Exercicio 8 - Liste as tabelas do banco de dados carregado
dbListTables(con)

# Exercicio 9 - A partir do dataframe criado no item 7, crie uma tabela no banco de dados
dbWriteTable(con, "dados2_df", dados2_df)
dbListTables(con)

# Exercicio 10 - Imprima os dados da tabela criada no item anterior
read_dados2_df <- dbReadTable(con, "dados2_df")
read_dados2_df


