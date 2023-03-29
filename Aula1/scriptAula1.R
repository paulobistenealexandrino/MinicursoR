# Minicurso de Introdução ao R para Análise de Dados
# Aula 1 - 23/03/2023
# Paulo Alexandrino


# Operadores Matemáticos ####


# Soma (+)
5 + 7

# Subtração (-)
10 - 16

# Multiplicação (*)
2 * 7

# Exponenciação (^)
2^4

# Divisão (/)
5 / 2

# Divisão Inteira (%/%)
5 %/% 2

# Módulo - Resto da divisão inteira (%%)
5 %% 2


# Operadores Lógicos ####


# Menor que (<)
5 < 3

# Menor ou igual que (<=)
2.5 <= 7

# Maior que (>)
10 > 15

# Maior ou igual que (>=)
11 >= 11

# Igual a (==)
2 == 3

# Diferente de (!=)
5 != 4

# Negação (!)
2 > 5
!(2 > 5)

# E (&)
(2 > 1) & (3 != 0)
(3 < 2) & (5 < 11)

# OU (|)
(3 < 2) | (5 < 11)
(5 == 6) | (12 < 8)


# Objetos, Tipos de Dados e Variáveis ####

# logical: TRUE ou FALSE
# integer: números inteiros
# numeric/double: números reais
# character: texto

# Para atribuir um valor a uma variável utilizados "<-" ou então "=".
# Não confundiro o = de atribuição com o == operador lógico.
# Vetores podem ser criados, ou concatenados como veremos mais adiante,
# utilizando a função c().

# Criando a variável vetor_vazio e deixando ela vazia
vetor_vazio <- c()

# Imprimindo a variável vetor_vazio
vetor_vazio

# Podemos atribuir apenas um valor a uma variável
var_texto <- "Palavra"
var_texto

# Podemos atribuir qualquer valor a uma variável
var_numerica <- 3*(5 + 2)
var_numerica

# Criando um vetores com três valores
var_texto <- c("Palavra","Word","Mot")
var_texto

# Criando um vetor lógico
var_logico = c(3 + 4 < 5, 2 == 1 + 1)
var_logico


# Criando um data frame:
estados_sudeste <- data.frame(
  estado = c("Rio de Janeiro", "Sao Paulo", "Minas Gerais","Espirito Santo"),
  sigla = c("RJ", "SP", "MG", "ES"),
  capital = c("Rio de Janeiro", "Sao Paulo", "Belo Horizonte", "Vitoria"),
  DDD_capital = c(21, 11, 31, 27),
  mar_na_capital = c(TRUE, FALSE, FALSE, TRUE)
)

estados_sudeste


# Funções: Explorando dados ####


# Vendo a estrutura dos dados:
str(USArrests)

# Vendo um resumo dos dados:
summary(USArrests)

# Vendo as primeiras observações:
head(USArrests)

# Vendo as últimas observações:
tail(USArrests)

# Número de linhas:
nrow(USArrests)

# Número de colunas:
ncol(USArrests)


# Selecionando apenas a coluna Murder:
USArrests$Murder

# Classe de um objeto:
class(USArrests$Murder)

# Mínimo:
min(USArrests$Murder)

# Máximo:
max(USArrests$Murder)

# Somatório:
sum(USArrests$Murder)

# Comprimento de um vetor:
length(USArrests$Murder)

# Ordenar um vetor em ordem crescente:
sort(USArrests$Murder)

# A função sort possui o argumento opcional decreasing = FALSE. 
# Para ordenar a lista de forma decrescente, podemos alterá-lo.
sort(USArrests$Murder, decreasing = TRUE)


# Funções: Estatísticas descritivas ####


# Média:
mean(USArrests$Assault)

# Mediana:
median(USArrests$Assault)

# Quantis:
quantile(USArrests$Assault)

# Variância:
var(USArrests$Assault)

# Desvio padrão:
sd(USArrests$Assault)

# Covariância: 
cov(USArrests$Assault, USArrests$Murder)

# Correlação:
cor(USArrests$Assault, USArrests$Murder)

# A função utilizada para arredondar um número é round().
# Para que tenha 2 casa decimais, precisaremos ajustar o parâmetro digits.
round(cor(USArrests$Assault, USArrests$Murder), digits = 3)


# Funções: Criação de vetores


# Criar um vetor de com o valor x repetido n vezes:
rep(2, 3)

# Criar uma sequencia de números: seq()
seq(from = 1, to = 50, by = 3)

# Podemos substituir, por exemplo seq(from = x, to = y, by = 1)
3:15

# Vamos atribuir os valores anteriormente encontrados a variáveis:
var1 <- rep(2, 3)
var2 <- seq(from = 1, to = 50, by = 3)

# Para concatenar vetores, utilizamos a função c()
meu_vetor <- c(var1, var2)
meu_vetor


# Funções:  Amostragem ####


# Permutação aleatórias dos números naturais menores que 7:
sample(7)

# Permutação aleatória dos números entre 2 e 5:
sample(2:5)

# Sorteio, sem reposição, de 5 números aleatórios 
# da variável var2 que criamos anteriormente:
sample(var2, 5)

# Sorteio, com reposição, de 6 números aleatórios entre 1 e 4:
sample(1:4, size = 6, replace = TRUE)

# Sorteio, sem reposição, de uma palavra em uma lista:
sample(c("pera", "uva", "banana", "caqui"), 1)



sample(c("pera", "uva", "banana", "caqui"), 1)

# Baixando e importanto pacotes externos


# Instalando o tidyverse
# install.packages("tidyverse")

# Carregando o tidyverse
library("tidyverse")


# Importação: .csv ####


# Primeira forma: ajustando os parâmetros da função read.csv
gapminderCountries <- read.csv("Aula1/gapminderCountries.csv",
                               sep = ";",
                               dec = ",")

# Segunda forma: utilizando a função read.csv2
gapminderCountries <- read.csv2("Aula1/gapminderCountries.csv")

# Mostrando um pedaço do dataset
head(gapminderCountries)


# Importação: .xlsx ####


# Carregando o pacote necessário
library(readxl)

# Importando o arquivo de interesse
gapminder2007 <- read_excel("Aula1/gapminder2007.xlsx")

# Mostrando um pedaço do dataset
head(gapminder2007)


# Visualização: Linha ####


gapminderCountries %>%
  ggplot() +
  geom_line(aes(x = year, 
                y = gdpPercap/10^3, 
                color = country)) +
  labs(title = "Gapminder",
       subtitle = "1952-2007",
       color = "País") +
  xlab("Ano") +
  ylab("PIB per capita \n (US$ mil)")


# Visualização: Dispersão ####


gapminder2007 %>%
  ggplot() +
  geom_point(aes(x = gdpPercap/10^3, 
                 y = lifeExp, 
                 color = continent, 
                 size = pop/10^6)) +
  labs(title = "Gapminder",
       subtitle = "2007",
       color = "Continente",
       size = "População \n (milhões de habitantes)") +
  xlab("PIB per capita \n (US$ mil)") +
  ylab("Expectativa de Vida \n (anos)")
