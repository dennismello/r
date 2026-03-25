##########################################
# Lista de exercícios 2
# Autor: Dennis Gustavo Alves de Mello nº11799405
# Data: 22/03/2026
##########################################

# Removendo os objetos ativos
rm(list=ls())

# Leitura banco
jog <- read.csv2("https://raw.githubusercontent.com/edsonzmartinez/cursoR/main/Dados_jogadores.csv")

# Exercicio 1
# (a)
mean(jog$idade)
sd(jog$idade)
median(jog$idade)
max(jog$idade)-min(jog$idade)
range(jog$idade)
IQR(jog$idade)

# (b)
mean(jog$idade[jog$idade>25])
sd(jog$idade[jog$idade>25])

# (c)
tapply(jog$idade,jog$posicao,mean)
tapply(jog$idade,jog$posicao,sd)
tapply(jog$idade,jog$posicao,median)

# (d)
plot(jog$idade,jog$altura)
cor.test(jog$idade,jog$altura,method= "pearson")
#correlação fracamente positiva

# (e)
rbind(table(jog$posicao),round(prop.table(table(jog$posicao))*100,digits = 2))

# (f)
sum(jog$idade>22 & jog$idade<24)
sum(jog$idade>24 & jog$idade<26)
sum(jog$idade>26 & jog$idade<28)
sum(jog$idade>28 & jog$idade<30)
sum(jog$idade>30 & jog$idade<32)
sum(jog$idade>32 & jog$idade<34)

# Exercicio 2
# (a)
seq(40,20,-4)

# (b)
rep(c(9,5,2),times= 3)

# (c)
seq(0,1,0.2)

# (d)
rep(c(9,7),each=3)
