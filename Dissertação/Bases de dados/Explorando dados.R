#Carregando pacotes uteis

#install.packages("tidyverse")
setwd("~/PROJETOS/Human-conflict/Disserta????o/Bases de dados")
library(tidyverse)
#library(readxl)
#dados <- read_excel("PROJETOS/Human-conflict/Disserta????o/Bases de dados/dados.xlsx")
#View(dados)
library(readr)
dados_base <- read.csv2(file ="dados_base.csv")
#dados_base
#install.packages("magrittr")
library(magrittr)

#install.packages(c("dplyr", "tidyr"))
library(dplyr)
library(tidyr)

#install.packages("tibble")
library(tibble)
as_tibble(dados_base)

#selecionando vari??veis para an??lise usando fun????es do pacote "dplyr"

dados_analise = select(dados_base,Regi??o,S??tio,Eleva????o.m.:Perimortem_anterior,Total_posterior:Perimortem_posterior)
dados_analise

dados_analise %>%
  filter(Sexo == "M") %>%
  select(Regi??o,S??tio,Cronologia,Sexo)


