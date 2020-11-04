# Solução Lista de Exercícios - Capítulo 7

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/Users/User/Documents/IES/DSA/FCD/BigDataRAzure/Cap07")
getwd()

# Formatando os dados de uma página web
library(rvest)
library(stringr)
library(tidyr)
library(dplyr)

# Exercício 1 - Faça a leitura da url abaixo e grave no objeto pagina
# http://forecast.weather.gov/MapClick.php?lat=42.31674913306716&lon=-71.42487878862437&site=all&smap=1#.VRsEpZPF84I
pagina <- read_html("http://forecast.weather.gov/MapClick.php?lat=42.31674913306716&lon=-71.42487878862437&site=all&smap=1#.VRsEpZPF84I")


# Exercício 2 - Da página coletada no item anterior, extraia o texto que contenha as tags:
# "#detailed-forecast-body b  e .forecast-text"
results <- pagina %>% html_nodes("#detailed-forecast-body") %>% html_nodes(".forecast-text")
results

# Exercício 3 - Transforme o item anterior em texto
results2 <- results %>% html_text(trim = TRUE)
results2

# Exercício 4 - Extraímos a página web abaixo para você. Agora faça a coleta da tag "table"
url <- 'http://espn.go.com/nfl/superbowl/history/winners'
pagina <- read_html(url)

result <- pagina %>% html_nodes("table") %>%
  html_table()
View(result)
class(result)

# Exercício 5 - Converta o item anterior em um dataframe
result_df <- as.data.frame(result)
View(result_df)
class(result_df)

# Exercício 6 - Remova as duas primeiras linhas e adicione nomes as colunas
result_df <- result_df %>% slice(3:n())
result_df

names(result_df) <- list("Número Super Bowl", "Data", "Local", "Resultado")
help(names)
result_df

# Exercício 7 - Converta de algarismos romanos para números inteiros
class(result_df$`Número Super Bowl`)
result_df$`Número Super Bowl` <- 1:54


# Exercício 8 - Divida as colunas em 4 colunas
result_df <- separate(result_df, Resultado, c("Vencedores", "Perdedores"),
                      sep = ",", remove = T)
result_df


# Exercício 9 - Inclua mais 2 colunas com o score dos vencedores e perdedores
# Dica: Você deve fazer mais uma divisão nas colunas
result_df <- separate(result_df, Vencedores, c("Vencedores", "Score Vencedores"),
                      sep = -2, remove = T)
result_df <- separate(result_df, Perdedores, c("Perdedores", "Score Perdedores"),
                      sep = -2, remove = T)
result_df

help(separate)

# Exercício 10 - Grave o resultado em um arquivo csv
library(readr)

write_csv(result_df, "superbowl.csv")
read_csv("superbowl.csv")
