# Solução Lista de Exercícios - Capítulo 10

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/IES/DSA/FCD/BigDataRAzure/Cap10")
getwd()


# Pacotes
library('ggplot2')
library('dplyr')
library("tidyr")
library('nycflights13')
View(flights)
?flights


# Definindo o Problema de Negócio
# Crie um teste de hipótese para verificar se os voos da Delta Airlines (DL)
# atrasam mais do que os voos da UA (United Airlines)


##### ATENÇÃO #####
# Você vai precisar do conhecimento adquirido em outros capítulos do curso 
# estudados até aqui para resolver esta lista de exercícios!


# Exercício 1 - Construa o dataset pop_data com os dados de voos das 
# companhias aéreas UA (United Airlines) e DL (Delta Airlines). 
# O dataset deve conter apenas duas colunas, nome da companhia e atraso nos voos de chegada.
# Os dados devem ser extraídos do dataset flights para construir o dataset pop_data
# Vamos considerar este dataset como sendo nossa população de voos
pop_data <- flights %>%
  select(carrier, arr_delay) %>%
  filter(carrier == c("UA","DL")) %>%
  filter(arr_delay >= 0) %>%
  drop_na()
pop_data
View(pop_data)


# Exercício 2  - Crie duas amostras de 1000 observações cada uma a partir do 
# dataset pop_data apenas com dados da companhia DL para amostra 1 e apenas dados 
# da companhia UA na amostra 2
help(sample)

# AMOSTRA 1

pop_data1 <- pop_data %>%
  filter(carrier == "DL")

index1 <- sample(1:nrow(pop_data1), 1000)

amostra1 <- pop_data1[index1, ] %>%
  mutate(indice = 1)
View(amostra1)

# AMOSTRA 2

pop_data2 <- pop_data %>%
  filter(carrier == "UA")

index2 <- sample(1:nrow(pop_data2), 1000)

amostra2 <- pop_data2[index2, ] %>%
  mutate(indice = 2)
View(amostra2)

# Dica: inclua uma coluna chamada sample_id preenchida com número 1 para a primeira 
# amostra e 2 para a segunda amostra



# Exercício 3 - Crie um dataset contendo os dados das 2 amostras criadas no item anterior. 
dataset_final <- rbind(amostra1, amostra2)
View(dataset_final)

# Exercício 4 - Calcule o intervalo de confiança (95%) da amostra1

# Erro padrão

erro_padrao_amostra1 = sd(amostra1$arr_delay) / sqrt(nrow(amostra1))
erro_padrao_amostra1

# Limites inferior e superior
# 1.96 é o valor de z score para 95% de confiança
lim_inferior <- mean(amostra1$arr_delay) - (1.96*erro_padrao_amostra1)
lim_superior <- mean(amostra1$arr_delay) + (1.96*erro_padrao_amostra1)

# Intervalo de confiança
ic1 <- c(lim_inferior, lim_superior)
ic1


# Exercício 5 - Calcule o intervalo de confiança (95%) da amostra2
erro_padrao_amostra2 = sd(amostra2$arr_delay) / sqrt(nrow(amostra2))
erro_padrao_amostra2

lim_inferior2 <- mean(amostra2$arr_delay) - (1.96*erro_padrao_amostra2)
lim_superior2 <- mean(amostra2$arr_delay) + (1.96*erro_padrao_amostra2)

ic2 <- c(lim_inferior2, lim_superior2)
ic2


# Exercício 6 - Crie um plot Visualizando os intervalos de confiança criados nos itens anteriores
# Dica: Use o geom_point() e geom_errorbar() do pacote ggplot2
grafico = summarise(group_by(dataset_final, indice), mean = mean(arr_delay))
grafico = mutate(grafico, lower = ifelse(grafico$indice == 1, ic1[1],ic2[1]))
grafico = mutate(grafico, upper = ifelse(grafico$indice == 1, ic1[2],ic2[2]))
ggplot(grafico, aes(x = indice, y = mean, colour = indice)) +
  geom_point() + geom_errorbar(aes(ymin=lower, ymax=upper), width = .1)


# Exercício 7 - Podemos dizer que muito provavelmente, as amostras vieram da mesma população? 
# Por que?
# Sim, os intervalos de confiança e a média são bastante aproximados.


# Exercício 8 - Crie um teste de hipótese para verificar se os voos da Delta Airlines (DL)
# atrasam mais do que os voos da UA (United Airlines)

# H0 e H1 devem ser mutuamente exclusivas.
# H0 = Não há diferença das médias, ou seja, não há diferença significativa entre
# os atrasos da UA e DL.
# H1 = A diferença entre as médias é maior que zero, ou seja, DL atrasa mais que UA.

t.test(amostra1$arr_delay, amostra2$arr_delay, alternative = "greater")

# Resultado: valor-p = 0.976
# Como o valor-p é maior que o nível de significância (0.05), pode-se dizer que 
# não há evidências para rejeitar a hipótese nula. Ou seja, há evidências que as
# médias são iguais e que não há diferença significativa entre os atrasos de 
# ambas as companhias aéreas.