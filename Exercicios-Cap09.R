# Solução Lista de Exercícios - Capítulo 9

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/Users/User/Documents/IES/DSA/FCD/BigDataRAzure/Cap09")
getwd()


# Exercício 1 - Gere 1000 números de uma distribuição normal com média 3 e sd = .25 e grave no objeto chamado x.
help(rnorm)
x <- rnorm(1000, 3, 0.25)
x

# Exercício 2 - Crie o histograma dos dados gerados no item anterior e adicione uma camada com a curva da normal.
hist(x, prob = TRUE, ylim=c(0, 1.6), breaks = 20)
curve(dnorm(x, 3, 0.25), add = TRUE, lwd=1)


# Exercício 3 - Suponha que 80% dos adultos com alergias relatem alívio sintomático com uma medicação específica. 
# Se o medicamento é dado a 10 novos pacientes com alergias, qual é a probabilidade de que ele seja 
# eficaz em exatamente sete?
dbinom(7, 10, 0.8)


# Exercício 4 - Suponha que os resultados dos testes de um vestibular se ajustem a uma distribuição normal. 
# Além disso, a pontuação média do teste é de 72 e o desvio padrão é de 15,2. 
# Qual é a porcentagem de alunos que pontuaram 84 ou mais no exame?
pnorm(84, mean = 72, sd = 15.2, lower.tail = FALSE)


# Exercício 5 - Suponha que o tempo médio de check-out de um caixa de supermercado seja de três minutos. 
# Encontre a probabilidade de um check-out do cliente ser concluído pelo caixa em menos de dois minutos.
pexp(2, rate = 1/3)



# Exercício 6 - Selecione dez números aleatórios entre um e três.
# Aplicamos a função de geração runif da distribuição uniforme para gerar dez números aleatórios entre um e três.
runif(10, min=1, max=3)


# Exercício 7 - Se houver 12 carros atravessando uma ponte por minuto, em média, 
# encontre a probabilidade de ter 15 ou mais carros cruzando a ponte em um determinado minuto.
ppois(14, lambda = 12, lower.tail = FALSE)


# Exercício 8 - Suponha que haja 12 questões de múltipla escolha em um questionário de inglês. 
# Cada questão tem cinco respostas possíveis e apenas uma delas está correta. 
# Encontre a probabilidade de ter quatro ou menos respostas corretas se um aluno tentar 
# responder a cada pergunta aleatoriamente.

pbinom(4, size = 12, prob = 0.2)


