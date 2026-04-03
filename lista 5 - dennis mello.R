##########################################
# Lista de exercícios 5
# Autor: Dennis Gustavo Alves de Mello nº11799405
# Data: 03/04/2026
##########################################
# Removendo os objetos ativos
rm(list=ls())

ldlc <- function(ct, hdl, tg, jejum=TRUE) {
  ldl <- ct-hdl-(tg/5)
  
  if (tg >= 400) {
    warning("Imprecisão no cálculo (TG>=400)")
  }
  
  if(jejum & ldl >= 160 & tg >=150) {
    message("Hipercolesterolemia mista.\nLDL: ",ldl,"\nTG: ",tg)
  } else if (tg >= 175) {
    message("Hipercolesterolemia mista sem jejum.\nLDL: ",ldl,"\nTG:",tg)
  } else if (ldl >= 160) {
    message("Hipercolesterolemia isolada.\nLDL: ",ldl)
  }
}

ldlc(500,54,175,0) #hipercolesterolemia mista sem jejum
ldlc(500,54,175) #hipercolesterolemia mista com jejum
ldlc(500,54,125,0) #hipercolesterolemia isolada
ldlc(500,54,400,0) #warning tg>400
