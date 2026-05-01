##########################################
# Lista de exercícios 3
# Autor: Dennis Gustavo Alves de Mello nº11799405
# Data: 01/05/2026
##########################################

# Removendo os objetos ativos
rm(list=ls())

# Leitura banco
urlfile <- "https://codeberg.org/edsonzmartinez/CursoR/raw/branch/main/dadosclimaticosRP.csv"
clima   <- read.csv2(urlfile, fileEncoding = "Windows-1252")

#(a) Escreva a função R que mostra o nome das variáveis da base de dados.
names(clima)

#(b) Escreva a função R que mostra as seis primeiras linhas da base de dados.
head(clima)

#(c) Escreva a função R que mostra as seis últimas linhas da base de dados.
tail(clima)

#(d) Escreva a função R que mostra as linhas 20 a 40 da base de dados.
clima[20:40,]

#(e) Escreva a função R que mostra somente as linhas correspondentes ao ano de 1993.
clima[clima$ano == 1993, ] #ou
clima93 <- subset(clima, ano==1993)

#(f) Para mostrar quais são os meses com mais chuva e com menos chuva em Ribeirão Preto, escreva um código R para construir um box-plot para a variável precipitação, igual a este:

clima$mes <- trimws(clima$mes)
unique(clima$mes)

clima$mes <- gsub("marÃ§o","março",clima$mes)

clima$mes <- factor(clima$mes, levels= c("janeiro","fevereiro","março","abril","maio","junho","julho","agosto","setembro","outubro","novembro","dezembro"))

boxplot(clima$precipitacao ~ clima$mes, xlab = "Mês", ylab = "Precipitação")

#(g) Usando esta base de dados, escreva um código R para gerar uma figura igual a esta: 

plot(clima$tempmenmensal,
     main = "Temperaturas mínima e máxima em Ribeirão Preto (1991–2021)",
     type = "l",col="blue",
     ylim = range(c(clima$tempmaxmensal,clima$tempmenmensal)),
     ylab = "Temperatura (graus)",
     xlab = "",
     xaxp = c(-500,500,1) #unica forma que encontrei de remover os tick marcks
     )

lines(clima$tempmaxmensal,col="red")
indices_janeiro <- which(clima$mes == "janeiro")

axis(side = 1,
     at = indices_janeiro,
     labels = paste("Jan\n", clima$ano[indices_janeiro]),
     las = 1,
     cex.axis = .4)

legend("bottom",
       inset = c(0, -0.55),
       legend = c("Temperatura máxima", "Temperatura mínima"),
       col = c("red", "blue"),
       lty = 1,
       bty = "n",
       xpd = TRUE
       )

