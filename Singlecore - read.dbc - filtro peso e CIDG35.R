### DATA_SUS TESTE 2
library(microdatasus)  ## nao funciona no pc da firma
library(read.dbc)
library(tidyverse)
dados <- fetch_datasus(year_start = 2023, year_end = 2023,month_start = 4, month_end = 5, information_system = "SIA-AM")

setwd("C://Users//M319523//Downloads//Datasus-siasus")
f_names <- dir()

#df <- do.call(rbind, lapply(f_names, function(x) cbind(read.csv(x), name=strsplit(x,'\\.')[[1]][1]))) #### EXEMPLO ####

df <- read.dbc(f_names[1])

# Alentu = 0604320205
# Nata = 0604320116
# azatioprina = 0604530013
# betainterferona 1a 22mcg = 	0604390084
#betainteferona 1a 30mcg = 0604390092 
#betainterferona 44mcg = 0604390106
# Glatiramer 20 mcg = 0604520018
# glatiramer 40 mcg = 0604520026
# Fingolimode = 0604320132
# teriflunimida = 0604540043
# betainterferona 1b = 0604390114
# fumarato de dimetila 120 = 	0604540027
#fumarato de dimetila240 = 0604540035

cod_meds = c(0604320205,0604320116,
             0604530013,0604390084,
             0604390092,0604390106,
             0604520018,0604520026,
             0604320132,0604540043,
             0604390114,0604540027,
             0604540035)


df <- do.call(rbind, lapply(f_names, function(x) cbind(filter(select(read.dbc(x), c("AM_PESO", "AP_SEXO", "AP_PRIPAL", "AP_CIDPRI")), AP_CIDPRI == "G35"), name= strsplit(x, "\\.")[[1]][[1]])))

## CODIGOS AP_PRIPAL filtro conversa nati --> nome sigtap
## CID EM: G35
## SExo
## Peso

##Se não der certo, selecionar as colunas especificar e filtrar pelas observações de interesse