##########################################
# Lista de exercícios 4
# Autor: Dennis Gustavo Alves de Mello nº11799405
# Data: 01/05/2026
##########################################

# Removendo os objetos ativos
rm(list=ls())

# Leitura banco
w <- read.table("https://codeberg.org/edsonzmartinez/CursoR/raw/branch/main/antropo.txt", header = TRUE)
head(w)

# 1
w$weightkg <- w$Weight*0.45359237

#2 
w$Heightcm <- w$Height*2.54

#3
par(mar = rep(4, 4))
varnumericas <- names(w)[c(1:2,4:17)] #selecao variaveis numericas do db
for (v in varnumericas) {
  boxplot(w[[v]],
          main = v,
          ylab=v)
}

#4
bpweight <- boxplot(w$weightkg)
bpheight <- boxplot(w$Heightcm)

outliers <- which(w$Heightcm %in% bpheight$out | w$weightkg %in% bpweight$out)

plot(w$Heightcm, w$weightkg)

points(w$Heightcm[outliers], w$weightkg[outliers], col = "red",  pch = 19)

#5
hist(w$Age,
     main="Histograma idade")

hist(w$Heightcm,
     main="Histograma altura")

hist(w$weightkg,
     main="Histograma peso")

#6
varInteresse <- names(w)[(names(w)!="Fat")]

for (v in varInteresse){
  plot(w[[v]], w$Fat,
       main = paste0("Fat vs ", v),
       xlab = v,
       ylab = "Fat (%)"
  )
}
grid()

#7
cor(w$Fat,w[,varInteresse])
# % de gordura tem um correlação forte negativa com a  densidade corporal. Posteriormente, circunferencia da coxa, peso, circunferecnia peitral e abdominal possuem correlação moderadamente positivas/fortemente positivas com % de gordura. Aqui temos outliers de peso e altura que não foram removidos!

#8
cor(w$Age,w$Abdomen)
# correalação entre fracamente/moderadamante positiva

#9
w$Age[(w$Age>45)]

idade45 <- ifelse(w$Age <= 45,0,1)

#10
varnumericas <- names(w)[c(1:2,4:17)] #selecao variaveis numericas do db
for (v in varnumericas) {
  boxplot(w[[v]]~idade45,
          main = v,
          ylab= v,
          xlab= ">45 anos")
}

#11
for (v in names(w)) {
  shapiro <- shapiro.test(w[[v]])
  qqnorm(w[[v]],
         main = paste0("QQPlot - ",v,"\nShapiro-Wilk p-valor ",shapiro$p.value))
  qqline(w[[v]], col = "green")
  }

#12
for (v in names(w)) {
  variance <- var.test(w[[v]]~idade45)
  if (variance$p.value>0.05){
    teste <- t.test(w[[v]]~idade45, var.equal=TRUE)
  }else{
    teste <- t.test(w[[v]]~idade45, var.equal=FALSE)
  }
  print(paste0(v,"~Idade45"))
  print(teste)
}
