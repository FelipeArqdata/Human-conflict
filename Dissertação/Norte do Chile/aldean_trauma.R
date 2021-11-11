#Testes exato de Fisher entre as amostras de traumas masculino e feminino 
# ao longo da ocupagco andina:


fatores <- matrix(c(20,33,55,68,59,46,24,11), nr=4)
fatores
chisq.test(fatores)

# carregando e exibindo os dados em tabela:
dados = read.table(file.choose(), header= TRUE, sep =";")
show(dados)


#Matrizes 2x2 de comparagco Masculino vs Feminino por periodo:
ARC <- matrix(c(31,12,100,111), nr=2, dimnames = list(c("masculino", "feminino"), c("afetado", "nao afetado")))

fisher.test(ARC)


F <- matrix(c(38,8,115,127), nr=2,  dimnames = list(c("masculino", "feminino"),
                                                    c("afetado", "nco afetado")))
fisher.test(F)

Fi <- matrix(c(8,38,127,115), nr=2,  dimnames = list(c("masculino", "feminino"),
                                                    c("afetado", "nco afetado")))
fisher.test(Fi)

EIP <- matrix(c(30,20,222,151), nr=2,  dimnames = list(c("masculino", "feminino"),
                                                       c("afetado", "nco afetado")))
fisher.test(EIP)

MH <- matrix(c(113,62,535,696),nr=2,  dimnames = list(c("masculino", "feminino"),
                                                      c("afetado", "nco afetado")))
fisher.test(MH)

LIP <- matrix(c(460,313,1079,853), nr=2,  dimnames = list(c("masculino", "feminino"),
                                                          c("afetado", "nco afetado")))
fisher.test(LIP)

LH <- matrix(c(230,112,1025,821), nr=2,  dimnames = list(c("masculino", "feminino"),
                                                         c("afetado", "nco afetado")))
fisher.test(LH)

TOTAL <- matrix(c(902,527,3076,2759), nr=2,  dimnames = list(c("masculino", "feminino"),
                                                             c("afetado", "nco afetado")))
fisher.test(TOTAL)

# criando matrizes para comparar a frequencia de traumas entre os periodos 
# subsequentes, em seguida executando Fisher test


#masculino:
ARC_F_M <- matrix(c(31,38,100,115), nr=2,  dimnames = list(c("Periodo anterior", "Periodo posterior"),
                                                           c("Afetado", "Nco afetado")))
fisher.test(ARC_F_M)

ARC_F_Mi <- matrix(c(38,31,115,100), nr=2,  dimnames = list(c("Periodo F", "Periodo ARC"),
                                                           c("Afetado", "Nco afetado")))
fisher.test(ARC_F_Mi)

F_EIP_M <-matrix(c(38,30,115,222), nr=2, dimnames = list(c("Periodo anterior", "Periodo posterior"),
                                                         c("Afetado", "Nco afetado")))
fisher.test(F_EIP_M)

EIP_MH_M <- matrix(c(30,113,222,535), nr=2, dimnames = list(c("Periodo anterior", "Periodo posterior"),
                                                            c("Afetado", "Nco afetado")))
fisher.test(EIP_MH_M)

#invertendo a ordem de compara????o quando a frequencia do periodo posterior ?? maior 
EIP_MH_Mi <- matrix(c(113,30,535,222), nr=2, dimnames = list(c("Periodo MH", "Periodo EIP"),
                                                            c("Afetado", "Nco afetado")))
fisher.test(EIP_MH_Mi)


MH_LIP_M <- matrix(c(113,460,535,1079), nr=2, dimnames = list(c("Periodo anterior", "Periodo posterior"),
                                                              c("Afetado", "Nco afetado")))
fisher.test(MH_LIP_M)

#invertendo a ordem de compara????o quando a frequencia do periodo posterior ?? maior 

MH_LIP_Mi <- matrix(c(460,113,1079,535), nr=2, dimnames = list(c("Periodo LIP", "Periodo MH"),
                                                              c("Afetado", "Nco afetado")))
fisher.test(MH_LIP_Mi)

LIP_LH_M <- matrix(c(460,230,1079,1025), nr=2, dimnames = list(c("Periodo anterior", "Periodo posterior"),
                                                               c("Afetado", "Nco afetado")))
fisher.test(LIP_LH_M)

#feminino:

ARC_F_F <- matrix(c(12,8,111,127), nr=2, dimnames = list(c("Periodo anterior", "Periodo posterior"),
                                                         c("Afetado", "Nco afetado")))
fisher.test(ARC_F_F)

F_EIP_F <- matrix(c(8,20,127,151), nr=2, dimnames = list(c("Periodo anterior", "Periodo posterior"),
                                                         c("Afetado", "Nco afetado")))
fisher.test(F_EIP_F)

F_EIP_Fi <- matrix(c(20,8,151,127), nr=2, dimnames = list(c("Periodo EIP", "Periodo F"),
                                                         c("Afetado", "Nco afetado")))
fisher.test(F_EIP_Fi)

EIP_MH_F <- matrix(c(20,62,151,696), nr=2, dimnames = list(c("Periodo anterior", "Periodo posterior"),
                                                           c("Afetado", "Nco afetado")))
fisher.test(EIP_MH_F)

MH_LIP_F <- matrix(c(62,313,696,853), nr=2, dimnames = list(c("Periodo anterior", "Periodo posterior"),
                                                            c("Afetado", "Nco afetado")))
fisher.test(MH_LIP_F)

MH_LIP_Fi <- matrix(c(313,62,853,696), nr=2, dimnames = list(c("Periodo LIP", "Periodo MHr"),
                                                            c("Afetado", "Nco afetado")))
fisher.test(MH_LIP_Fi)

LIP_LH_F <- matrix(c(313,112,853,821), nr=2, dimnames = list(c("Periodo anterior", "Periodo posterior"),
                                                             c("Afetado", "Nco afetado")))
fisher.test(LIP_LH_F)

