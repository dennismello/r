#Cheat Sheet - Dennis

# Fundamentos do R: Tudo é um objeto e tudo que acontece no R é uma função

ls() #lista todos objetos
ls.str(w) #lista a estrutura do objeto (pode ser sem especificar)
rm(dados) #remover um objeto
rm(ls.str()) #remove todos objetos
rm(list=ls()) #cria uma lista com o nome de todos objetos e a remove todos objetos
history() #histórico de todos os comandos executados pode ser útil algum dia

# Estrutura de dados: numeric, integer, logic, character, complex
a <- 32.2 # tipo numeric
b <- 32L # tipo integer
c <- TRUE # tipo logic (TRUE, FALSE)
d <- "Character" #character
e <- 2i #complexo com parte imaginária

# Verificar tipo de dado com retorno do tipo lógico (TRUE, FALSE)
is.numeric(a)
is.integer(b)
is.logical(c)
is.character(d)
is.complex(e)

# Verificar tipo de dado com retorno do tipo (Numeric, integer, logic, character, complex)
class(a)

# Converter um dado para outro tipo
as.numeric(a)
as.integer(b)
as.logical(c)
as.character(d)
as.complex(e)

# Estrutura de dados: Vetor, matriz, fator, arrays, dataframes, listas
# Vetores
vetor_numeric <- c(1,2,3) #conjunto de dados unidimensional
vetor_character <- c("a","b","c")
vetor_coercao <- c(1,"a",2,"b") #coerção para assumir o mesmo tipo de dado

vetor_numeric[2] # Retornar o valor da observação 2
vetor_numeric[2:3] # Retorna o valor da observação 2 a 3
vetor_numeric[-1] # Retorna todos os valores exceto da observacao 1
vetor_numeric[vetor_numeric>2] #Retorna todos os valores maiores que 2


vetor_numeric[2] <- 200 #Substitui o valor da observação 2

is.vector(vetor_numeric) #verifica se é vetor e retorna TRUE e FALSE
class(vetor_numeric)

# Matrizes
matriz <- matrix(c(1,2,3,4,5,6), ncol = 3, nrow = 2, byrow = FALSE) #cria o vetor, define numero coluna ou linha, byrow=true para preencher da esquerda para direita

M[2,1]        #retorna valor coluna 2, item 1
M[1,1]        # retorna o elemento da linha 1 e coluna 1 da matriz M
M[1,]         # retorna a linha 1 da matriz M
M[,1]         # retorna a coluna 1 da matriz M

dim(M)        # retorna a dimensão da matriz M (linhas e colunas)
nrow(M)       # retorna o número de linhas da matriz M
ncol(M)       # retorna o número de colunas da matriz M

t(M)          # retorna a transposta da matriz M
solve(M)      # retorna a inversa da matriz M
det(M)        # retorna o determinante da matriz M
diag(M)       # retorna os elementos da diagonal da matriz M
eigen(M)      # retorna os autovalores e autovetores da matriz M
addmargins(M) # adiciona margens em uma matriz, com totais

is.matrix(M)  # retorna TRUE se M é uma matriz e FALSE caso contrário
as.matrix(M)  # converte o objeto em matriz

# Fator
ecivil <- c(6, 2, 1, 2, 1, 4, 5, 6, 2, 3, 6, 3, 6, 2, 2, 3, 3, 2, 2, 3) #criaçao do vetor com as variaveis categoricas
ecivilF <- factor(ecivil, levels=c(1,2,3,4,5,6), labels=c("solteiro","casado","casado","separado","separado","viuvo")) #forma de atribuir fatores a um objeto; define os niveis e depois os labels

is.factor(ecivilF) #verifica se é um fator e retorna TRUE FALSE
as.factor(ecivil) #converte o objeto e fator

# Array - Matriz com mais de duas dimensões
a <- array(1:12,  dim = c(3, 2, 2))

# Data frame - Combinação de vetores com o mesmo tamanho
dataframe_teste <- data.frame(nome=a, nota=b, aprovado=c) #criação do df

dataframe_teste$aprovado #Retorna a coluna aprovado do dataframe

mean(dataframe_teste$nota, na.rm = TRUE) #executar funções na coluna aprovado
dataframe_teste[,1] #retorna todas observações da coluna 1

(dd <- data.frame(d, fac = letters[1:10], stringsAsFactors = TRUE)) #usar stringasfactors para converter em fatores

# Listas - União das diversas estruturas de dados Comum nos outputs estatísticos
lista <- list(dataframe_teste,ecivilF,a,b)

# Funções typeof, class, mode
typeof(a) # retorna o tipo de dado ou estrutura de dado
mode() # mesma coisa que o typeof mas é generalista (valores decimais aparece como numerico)
class(a) # intercambeavel - preciso decidir qual seria melhor

# Valores faltantes (missings)
idade1filho <- c(30, NA, 24, NA, 26, 22, 24, 28, 23, 20)
anyNA(idade1filho) #retorna TRUE e FALSE caso tenha algum valor ausente (baixa especificidade)
is.na(idade1filho) #corre todo objeto e retorna como TRUE ou FALSE para cada observação

complete.cases(idade1filho) #retorna um objeto somente com os casos completos
completos <- idade1filho[complete.cases(idade1filho)] #armazena o resultado dos complete cases e um novo objeto

sum(is.na(idade1filho)) #retorna a soma dos valoers faltantes se usar !is.na retorna o a soma dos valores completos

x1 <- c(3,7,4,NA,9,2,6)
x2 <- c(NA,3,5,6,9,8,NA)
x3 <- c(9,7,2,5,8,3,4)
dat <- data.frame(x1,x2,x3)

is.na(dat) #avalia  colunas com algum dado faltante
complete.cases(dat) #retorna apenas linhas completas
newdat <- na.omit(dat) #criamos um vetor apenas com as linhas completas

# Combinar estrutura de dados
rbind (a,b) #combinamos as estruturas por linhas Row Bind
cbind (a,b[,2:3]) #combinamos as estruturas por colunas Column Bind

#Sequencias e repetições
23:56      # sequência dos números inteiros de 23 a 56
56:20      # sequência decrescente de 56 a 20
1:10+5     # sequência crescente de 6 a 15
1:(10+5)   # sequência crescente de 1 a 15

seq(from=15, to=30, by=2) #sequencia regular de 15 a 30, aumentandod de 2 em 2.
seq(10,20,length=2) #especificar o numero de repeticoes
rep(1:2,5, each=1) #repeticao do numero 2 por 5 vezes uma unica vez

rep("casa",8)     # retorna "casa" oito vezes
rep(1,10)         # retorna o número 1 dez vezes
rep(NA,20)        # retorna NA vinte vezes
rep(1:4,4:1)      # retorna o número 1 quatro vezes, o 2 três vezes...
rep(1:5,each=2)   # retorna duas vezes cada valor da sequência de 1 a 5
rep(1:5,2)        # repete a sequência de 1 a 5

#Operações com strings
casefold(frutas) #transforma o vetor em letra minuscula util para padronizar
toupper(frutas) #forma abreviada para MAIUSCULO
tolower(frutas) #forma abreviada para minusculo
nchar(animais) #retorna o tamanho da string em valor inteiro
nzchar(frutas) #retorna os objetos NA. 
sub("e","k",animais) #substitui a letra e, por k, mas so na primeiro encontro
gsub("e","k",animais) #substituição global da letra e por k
strsplit("Axraposaxpulouxaxcercaxexfugiuxparaxaxfloresta","x")
medicamentos <- strsplit("Dipirona, Paracetamol, Ibuprofeno, Cetoprofeno, Nimesulida, Prednisona, Fluconazol",", ")
paste(animais,"azul",sep=" ") #adiciona uma string
paste0()#mesclar texto com objetos sem o espaço
grep("a",animais) #retorna a posicao do vetor que contem "a"
grep("b|a",frutas) #retorna a posicao do vetor que contem b ou a 
grepl("a",animais) #retorna como true ou false para a condição atendinda
agrep("galo"animais) #retorna os valores pareecidos com a condicao
agrepl("galo",animais) #retorna como true false
trimws(x) #apaga espaços em branco 

#operadores aritmeticos
+      # adição
-      # subtração
*      # multiplicação
/      # divisão
^      # potenciação
**     # potenciação
%/%    # divisão inteira
%%     # resto da divisão
  
#operadores comparadores
> #maior que
< #Menor que
>= #maior igual
<= #menor igual
== #igual (nao confundir com = para nao atribur)
!= #diferente
  
#operadores lógicos
!       # NOT
x&y     # AND (retorna TRUE se x e y são verdadeiros)
x&&y    # AND (avalia y se x é verdadeiro)
x|y     # OR  (retorna TRUE se x ou y é verdadeiro)
x||y    # OR  (avalia y se x é falso)
all(8<9, 3>2, 1==1, 4>2, 9>19) #so retorna verdadeiro se todas funcoes sao verdadeiras

#filtros
idade[idade>18] #filtra quem tem idade maior que a condicao, retorna o valor dessas idades e nao como true false, se quiser mostrar o valor real, adicionar a um df
idade[idade>18 & idade<30]
clima[clima$ano == 1993, ] #retorna todas observacoes que ano é igual a 1993
subset(idade, idade>18 & idade<30) #  Alternativamente, podemos usar a função subset() para filtrar

#medidas descritivas
mean(x)      # média dos valores do objeto x
sd(x)        # desvio padrão
var(x)       # variância
median(x)    # mediana
range(x)     # amplitude
min(x)       # mínimo
max(x)       # máximo
quantile(x)  # quantis
IQR(x)       # amplitude do intervalo interquartil
sum(x)       # soma
prod(x)      # produto
sort(x)      # ordenação
summary(x)   # resumos
which.min(x) # posição do mínimo
which.max(x) # posição do máximo

#arredondamento
ceiling(x) #Retorna o menor número inteiro maior que x
floor(x) #Retorna o maior número inteiro menor que x
round(x,digits=1) 

#Leitura banco de dados/dataframes
read.table("https://codeberg.org/edsonzmartinez/CursoR/raw/branch/main/antropo.txt", header = TRUE) #para uma lista
read.csv2("https://codeberg.org/edsonzmartinez/CursoR/raw/branch/main/Dados02.csv", fileEncoding = "Windows-1252")

getwd()
setwd("E:\\Aulas\\R")
list.files()

#Medidas descritivas dataframe
head(w) #mostra as 6 primeiras
tail(w) #mostra as 6 ultimas observacoes
names(w) #mostra o Header do dataframe
df[20:40,] #mostra da observação 20-40

duplicated(w) #retorna verdadeiro ou falso para dados duplicados na segunda ocorrencia da mesma mlinha na base de dados
w[duplicated(w),] #retorna as linhas duplicadas 
wnew <- w[!duplicated(w),] #armazena todos os itens não duplicados em um novo objeto
unique(clima$mes) #retorna os valores unicos de forma mais fácil

mean(w$Idade)
with(w,mean(Idade)) #alternativa ao w$idade
tapply(w$Idade,w$ecivil,mean) #separar os grupos por variaveis categoricas retorna como vetor
aggregate(Idade~ecivil, data=w, mean) #retorna como data frame
aggregate(cbind(w$Idade,w$Peso), by=list(w$ecivil), mean) #combina colunas e retorna os valores em um dataframe

#Funções - If else
ifelse(nota1>nota2,"Se for verdade, faz isso","Se for falso, faz isso") #forma simplificada do ifelse

if(nota1>nota){
  "Se for verdade"
} else {
  "Se for falso"
}

IMC <- function(peso, estatura){
  if (estatura<=0) { stop("Verifique a estatura") }
  IMC <- peso/(estatura*estatura)
  cat("O IMC é",IMC,"\n")
  if (IMC<18.5) { cat("Baixo Peso","\n") }         else
    if (IMC<24.9) { cat("Peso normal","\n") }        else
      if (IMC<29.9) { cat("Pré obesidade","\n") }      else
        if (IMC<34.9) { cat("Obesidade grau I","\n") }   else
          if (IMC<39.9) { cat("Obesidade grau II","\n") }  else
          { cat("Obesidade grau III","\n") }
}

# Exemplo 2
# Usando a função stopifnot()
IMCcalc <- function(peso,estatura) {
  stopifnot(peso>10,peso<200,estatura>1)
  IMC <- peso/(estatura*estatura)     
  return(IMC)
}

# Exemplo 3
# Usando a função warning()
IMCcalc <- function(peso,estatura) {
  if (estatura>3) warning("Confira se a estatura está expressa em centímetros")
  IMC <- peso/(estatura*estatura)     
  return(IMC)
}

# Exemplo 4
# Usando a função readline()
IMCcalc <- function() {
  nome <- readline(prompt="Qual o seu nome? ")
  peso <- readline(prompt=paste(nome,", qual o seu peso em quilogramas? "))
  estt <- readline(prompt=paste(nome,", qual a sua estatura em metros? "))
  imc  <- as.numeric(peso)/(as.numeric(estt)^2)
  cat("Olá,",nome,", seu IMC é",round(imc,2),"kg/m2\n")
}

# Exemplo 5
describe <- function(variab,grupo,ndec=2) { #ndec para deixar duas casas decimais
  n.d<-aggregate(variab~grupo,FUN=length)[,2]
  m.d<-round(aggregate(variab~grupo,FUN=mean)[,2],ndec)
  sd.d<-round(aggregate(variab~grupo,FUN=sd)[,2],ndec)
  q<-aggregate(variab~grupo,FUN=quantile)
  lab.d<-q[,1]
  med.d<-q[,2][,4]
  q1.d<-q[,2][,3]
  q3.d<-q[,2][,5]
  des<-data.frame(lab.d,n.d,m.d,sd.d,med.d,q1.d,q3.d)
  names(des)<-c("Grupo","n","Média","DP","Mediana","Q1","Q3")
  return(des) 
  }

#For
for(k in 1:nvar){ ##laço para varios boxplots
  pdf(file = paste0("figura",k,".pdf"))
  boxplot(get(vetvar[k],w)~w$Tabagismo)
  dev.off()
}

#Testes estatisticos
#Correlação
cor(w$Peso,w$Altura)                     # Retorna a correlação (Pearson) entre Peso e Altura, -0.07115096
cor(w$Peso,w$Altura,method="pearson")    # Correlação de Pearson,  -0.07115096
cor(w$Peso,w$Altura,method="spearman")   # Correlação de Spearman, -0.02004432
cor(w$Peso,w$Altura,method="kendall")    # Correlação de Kendall,  -0.01317936
cor.test(x) #retorna mais completo em formato de lista que pode ser armazenada em um objeto e intervalo de confiança

#quiquadrado
chisq.test(table(w$esaude,w$Tabagismo)) #qui-quadrado

chisq.test(table(w$esaude,w$Tabagismo), simulate.p.value = TRUE) # simulação de montecarlo no teste qui-quadrado

chisq.test(table(w$fet,w$Tabagismo), correct = FALSE) #sem correão de yates

fisher.test(table(w$fet,w$Tabagismo))

#teste t
verificacao variabilidade (boxplot + teste variancia) 
var.test(w$Peso ~ w$fet) #compara variancia
t.test(w$Peso ~ w$fet, var.equal=True) #se variancia é igual (HOMOCEDASTICO)
t.test(w$Peso ~ w$fet) # se variancia é diferente, usa o teste t corrigod por welch

#analise de variancia
fit <- aov(IMC ~ escolaridade, data = w)
summary(fit)
plot(fit)
names(fit)
par(mfrow=c(2,2)) #testar a normalidade dos residuos
plot(fit)
qqnorm(w$IMC)
#testar homeceistacidade com o teste de levene (apenas depois de executar a ANOVA)
teste <- var.test(w$Peso ~ w$fet) #compara variabilidade heterocedastico/homocedastico

# Teste de Tukey
plot(TukeyHSD(fit))

# Teste de Bonferroni
bon <- pairwise.t.test(w$IMC, w$escolaridade, method="bonferroni")
plot(bon)
names(bon)

#Graficos nativos
#varios graficos na mesma tela
split.screen(c(1,2))
screen(1)
boxplot(w$Peso)
screen(2)
boxplot(w$Altura)
close.screen(all=T) #fechar a tela 

layout(matrix(1:4,2,2,byrow=T))
boxplot(w$Idade, main="(a) Idade", ylab="Anos", las=1)
boxplot(w$Peso, main="(b) Peso", ylab="mmHg", las=1)
plot(w$Peso,w$Altura, main="(c) Peso e altura",bty="l", xlab="Peso (kg)", ylab="Altura (m)", las=1)
hist(w$Altura, main="(d) Histograma, altura", las=1, xlab="Altura (m)")
close.screen(all=T)

# Dados de 40 mulheres
w <- read.csv2("https://codeberg.org/edsonzmartinez/CursoR/raw/branch/main/Dados02.csv")
head(w)

#cria uma tabela
table(w$saude) # retorna frequencia absoluta
prop.table(w$saude) #retorna frenquencia relativa (%)

#cria um grafico de barras
barplot(table(w$esaude),
        main="Titulo",
        col = c("Green","Blue","Orange"),
        ylab = "Insere legenda eixo y",
        legend = "Legenda aqui",
        names = c("Bomzao","Regularzao","Ruinzao"),
        las=1 #inverte orientação eixo y e x
        )

#cria um grafico de setores
pie(table(w$esaude),
    main="Titulo",
    labels = c("A","B","C")
    )

#cria um grafico de dispersao
w <- read.csv2("https://codeberg.org/edsonzmartinez/CursoR/raw/branch/main/Dados02.csv")
head(w)

plot(w$Peso,w$Altura,
     main="Titulo",
     xlim=c(0,150),
     ylim=c(0,2), #limites eixos
     bty="n", #modifica as linhas externas do grafico  "o", "7", "c", "u", "]" e "n".
     pch=15, #modifica o tipo de ponto
     #col= #ariavel de agrupamento
     )
text(50,1,"Teste") #insere um texto na figura (usar coordenadas do eixo y e x)
#axis(1,at=seq(40,120,5),labels=seq(40,120,5)) #modica o tamanho a escala do eixo
lines(c(40,120),c(1.6,1.6),lty="dashed",col="red") #insere uma linha na figura

#graficos histograma
hist(w$Altura,
     main="Distribuição das alturas",   # Modifica o título do gráfico
     xlab="Alturas (m)",                # Label do eixo x
     ylab="Frequências",                # Label do eixo y
     ylim=c(0,20),                      # Limites do eixo y
     las=1,
     labels=TRUE,
     
     )                             # Os valores do eixo y são mostrados na posição horizontal

identify(w$Peso,w$Altura) #jeito de pegar os pontos usando o mouse
plot(w$Peso,w$Altura,main="Peso e altura",xlim=c(40,120),ylim=c(1.4,1.8),bty="n",pch=19)
locator(2) #melhor forma de pegar as coordenadas dos pontos (o valor dentro da funcao corresponde a quantidade de pontos que podemos pegar)

# Exemplo forma de colocar a legenda em determinado ponto sem usar os valores predefinidos para ela
tabela <- prop.table(table(w$esaude,w$Tabagismo),2)
cinzas <- gray(seq(0.1,0.9,length=3))
barplot(100*tabela,main="(a) Autoavaliação do estado de saúde",ylab="Número de pessoas (%)",beside=T,names=c("Não fumantes","Fumantes"),cex.lab=1.3,cex.names=1.3,cex.axis=1.3,las=1,col=cinzas)
posicao <- locator(1)
legend(posicao, legend=c("Bom","Regular","Ruim"), cex = 1.2, fill=cinzas, bty="n")

text(58,45, expression(IMC==over(kg,m^2))) #adicionando equacoes no grafico
mtext(side=3,line=3,"Idade (anos)")

#normalidade
graficonormal<-function(mu=0,sd=1,a=-2,b=2) {
  if (a>=b) {stop("Insira valores a<b")}
  x<-seq(mu-4*sd,mu+4*sd,0.1)
  xs<-seq(a,b,0.1)
  xy<-dnorm(xs,mu,sd)
  plot(x,dnorm(x,mu,sd),type="n",ylab="Densidade",xlab="",axes=F,
       ylim=c(0,dnorm(mu,mu,sd)),xlim=c(mu-5*sd,mu+5*sd))
  axis(2)
  axis(1,pos=0)
  polygon(x=c(xs,rev(xs)),y=c(xy,rep(0,length(xs))),col="gray", border=NA)
  points(x,dnorm(x,mu,sd),type="l",lwd=2,col="red")
  lines(c(a,a),c(dnorm(a,mu,sd),-1),lty=3,col="blue")
  lines(c(b,b),c(dnorm(b,mu,sd),-1),lty=3,col="blue")
  mtext(side=1,line=1,at=a,a,col="blue")
  mtext(side=1,line=1,at=b,b,col="blue")
  prob<-pnorm(b,mu,sd)-pnorm(a,mu,sd)
  mtext(side=1,line=3,paste("Área sob a curva =",round(prob,4)))
}
graficonormal(80,2,78,83)

qqnorm(w$IMC,pch=19)
qqline(w$IMC, lty = 2, col = "red")    # Traça uma linha de referência
library(ecostats)
qqenvelope(w$IMC, n.sim=5000, pch=19)

#box plot
boxplot(w$Peso) #boxplot
boxplot.stats(w$Peso) #lista do resultado de boxplot, com outliers, ic, mdiana, q1...
boxplot.stats(w$Peso)$out # retorna observacao outiers

boxplot(w$Peso ~ w$Tabagismo,#boxplot 2 grupos
        staplewex=0.2, #tamanho do bigode
        whisklty=4, #tipo da linha do boxplot
        axes=FALSE
        ) 
axis(2,las=1)
axis(1,at=1:2,label=c("Até 50 anos","Mais de 50 anos"))
mtext(side=1,at=1,line=2,round(mean(w$Peso),2)) #inserir texto com o mtext

##ggplot2 sem usar o ggplot2
library(esquisse)
library(plotly)
esquisser(w)

#exportar figuras
pdf(file = "aa.pdf")
boxplot(w$Peso~w$fet)
boxplot(w$Peso~w$Tabagismo)
dev.off()