# Carregando pacotes necessários
library(tidyverse)
library(gapminder)

# Vendo de que forma o dataset está organizado
head(gapminder)

# Mutate
gapminder %>%
  mutate(gdp = pop*gdpPercap) %>%
  head()

# Select
gapminder %>%
  select(country:lifeExp) %>%
  head()

gapminder %>%
  select(-continent) %>%
  head()

gapminder %>%
  select(country:lifeExp,-continent,gdpPercap) %>%
  head()

# Filter
gapminder %>%
  filter(country == "Brazil") %>%
  head()

gapminder %>%
  filter(country %in% c("Brazil", "Argentina"))

gapminder %>%
  filter(country %in% c("Brazil", "Argentina"),
         year < 1977)

# Group by | Summarise
gapminder %>%
  filter(year == 1972) %>%
  group_by(continent) %>%
  summarise(avg_gdpPercap = mean(gdpPercap))

# Arrange
gapminder %>%
  filter(year == 1987) %>%
  arrange(lifeExp) %>%
  head(n = 5)

gapminder %>%
  filter(year == 1987) %>%
  arrange(desc(lifeExp)) %>%
  head(n = 5)

# Salvando
gapminderCountries <- gapminder %>%
  filter(country %in% c("Brazil", "Botswana", "Korea, Rep."))

# Salvando em padrão americano
write.csv(gapminderCountries, file = "Aula2/gapminderCountries.csv")

gapminder2007 <- gapminder %>%
  filter(year == 2007)

# Precisaremos usar o pacote writexl
library(writexl)

# Salvando
write_xlsx(gapminder2007, "Aula2/gapminder2007.xlsx")




# Carregando o pacote wooldrige
library(wooldridge)

# Carregando o dataset wage1
wage1 <- wooldridge::wage1

# Vendo a estrutura do dataset
str(wage1)

# Utilizando a função lm
my_model <- lm(formula = wage ~ educ, data = wage1)

# Mostrando os resultados do modelo
summary(my_model)

# Gráfico
wage1 %>%
  ggplot(aes(x = educ, y = wage)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE) +
  theme_classic()

# Coeficientes
my_model$coefficients

# Informações sobre os coeficientes
summary(my_model)$coefficients

# R^2
summary(my_model)$r.squared

# R^2 ajustado
summary(my_model)$adj.r.squared

# Estatísticas descritivas dos resíduos
summary(my_model$residuals)



# Criando um novo modelo
my_model2 <- lm(wage ~ educ + exper, data = wage1)

# Mostrando resultados da regressão
summary(my_model2)


# Equação Minceriana
wage1 %>%
  lm(log(wage) ~ educ + exper + I(exper^2) + nonwhite + female + married, data = .) %>%
  summary()

# Lendo o dataset
cps91 <- wooldridge::cps91

# Estimando modelo Logit
cps91 %>%
  glm(inlf ~ nwifeinc + educ + exper + I(exper^2) +
        age + kidlt6 + kidge6,
      family = binomial(link = "logit"),
      data = .) %>%
  summary()

# Estimando Probit
cps91 %>%
  glm(inlf ~ nwifeinc + educ + exper + I(exper^2) +
        age + kidlt6 + kidge6,
      family = binomial(link = "probit"),
      data = .) %>%
  summary()