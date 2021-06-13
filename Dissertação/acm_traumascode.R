
#https://www.reddit.com/r/statistics/comments/1eg8wh/fishers_exact_test_in_r_i_can_do_one_but_how_do_i/

#https://stackoverflow.com/questions/46651518/apply-fisher-test-in-a-large-dataset-that-join-all-contingency-tables

#http://www.sthda.com/english/articles/31-principal-component-methods-in-r-practical-guide/114-mca-multiple-correspondence-analysis-in-r-essentials/


#Realizando teste Fisher no arquivo 'Fisher.test.xlsx' em todas as observa????es, para comparar propor????o de ocorr??ncia de traumas entre os sexos.
#As vari??veis consideradas para formar a tabela de conting??ncia foram as 'afetado' e 'n??o afetado' para ambos os sexos.


#install.packages('xlsx')
library(xlsx)
teste <- read.xlsx(file.choose(),1, colIndex = c(5,6,9,10))
p_valores <- apply(teste,1, function(x) fisher.test(matrix(x,nr=2))$p.value)
View(p_valores)
View(teste)
View(p_valores)

#Realizando MCA nos dados do Arquivo 'ACM.xlsx', o arquivo cont??m os dados bin??rios (sim/n??o) obtido dos p-valores do teste feito anteriormente
#sim = <0,05, n??o = >0,05. A ideia da an??lise ?? representar graficamente a rela????o entre per??odo de ocupa????o, regi??o geogr??fica com a presen??a ou aus??ncia de signific??ncia na compara????o dos traumas entre os sexos. 

dados <- read.xlsx(file.choose(), 1, colIndex = c(1,2,3,13))
View(dados)
#install.packages('FactoMineR')
#install.packages('factoextra')
library(FactoMineR)
library(factoextra)
res.mca <- MCA(dados)
get_mca_var(res.mca)
get_mca_ind(res.mca)
fviz_mca_var(res.mca, repel = T)
grupo <- as.factor(dados[,4])
grupo

#gerando o gr??fico fatorial tendo como fator a presen??a ou aus??ncia de signific??ncia Exato de Fisher (coluna 4)
fviz_mca_biplot(res.mca, habillage = grupo, addEllipses = T, repel = T, title = "Mapa fatorial p-valor< 0,05 ", geom.ind = c("point"))

grupo <- as.factor(dados[,3])
#gerando gr??fico fatorial, agora considerando qual sexo apresentou a maior fr??quencia de traumas
fviz_mca_biplot(res.mca, habillage = grupo, addEllipses = T, repel = T, title = "Mapa fatorial sexo com maior frequ??ncia ", geom.ind = c("point"))



