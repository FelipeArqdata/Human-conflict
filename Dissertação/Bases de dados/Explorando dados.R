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


#Adicionando frequencia relativa de trauma 
dados_base_fr<-dados_base %>% 
  mutate(fr_trauma = N_id_afetados/N_id, fr_trauma_anti = N_id_antimortem/N_id, 
         fr_trauma_peri = N_id_perimortem/N_id)
dados_base_com_fr <- left_join(dados_base,dados_base_fr)
#dados_base_com_fr%>%
  #relocate(fr_trauma,.after = N_id_afetados)

#Seprando a base de dados por sexo e vari??veis de interesse

dados_base_M = dados_base %>%  
  filter(Sexo == "M") %>% select(Regi??o:Lateral.D)
dados_base_F = dados_base %>%  
  filter(Sexo == "F") %>% select(Regi??o:Lateral.D)
dados_base_Nid = dados_base %>%  
  filter(Sexo == "Nid") %>% select(Regi??o:Lateral.D)

#m??dia de idividuos com trauma por sexo
media_tr_sexo<- dados_base %>%
  group_by(Sexo)%>%
  summarise(N_id_afetados_media = mean(N_id_afetados, na.rm = TRUE))
media_id_sexo<- dados_base %>%
  group_by(Sexo)%>%
  summarise(N_id_media = mean(N_id, na.rm = TRUE))

#testando o pacote "forcats" para manipular vari??veis categoricas 
install.packages("forcats")
library(forcats)
library(ggplot2)
library(dplyr)

dados_base_com_fr %>%
  pull(Sexo)%>% unique()
dados_base_com_fr %>%
  mutate(sexo = as.factor(Sexo))%>%
  pull(Sexo)%>%
  unique()
 
#explorando constru????o de gr??ficos

install.packages("ggplot2")
library(ggplot2)
dados_base_fr<-dados_base %>% 
  mutate(fr_trauma = N_id_afetados/N_id, fr_trauma_anti = N_id_antimortem/N_id, 
         fr_trauma_peri = N_id_perimortem/N_id)
dados_base_com_fr <- left_join(dados_base,dados_base_fr)

dados_base_com_fr%>%
  group_by(Cronologia)
  ggplot()+
  geom_line(aes(x=Cronologia, y=fr_trauma))
  
  