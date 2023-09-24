# Corrida general del workflow
rm(list = ls()) # Borro todos los objetos
gc() # Garbage Collection

library("data.table")
library("yaml")
library("Rcpp")
library("ranger")
library("randomForest") # solo se usa para imputar nulos
library("R6")
library("lightgbm")



options(error = function() {
  traceback(20)
  options(error = NULL)
  stop("exiting after script error")
})


# corrida de cada paso del workflow

# primeros pasos, relativamente rapidos
source("~/labo2023ba/src/workflow-inicial/611_CA_reparar_dataset_v5.r")
source("~/labo2023ba/src/workflow-inicial/621_DR_corregir_drifting_v5.r")
source("~/labo2023ba/src/workflow-inicial/631_FE_historia_v5.r")
source("~/labo2023ba/src/workflow-inicial/641_TS_training_strategy_v5.r")

# ultimos pasos, muy lentos
source("~/labo2023ba/src/workflow-inicial/651_HT_lightgbm_v5.r")
source("~/labo2023ba/src/workflow-inicial/661_ZZ_final_v5.r")
