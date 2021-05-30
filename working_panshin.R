raw_glioma <- read_xlsx('/Users/Donel/Desktop/Glioma/raw_data/Gliome.xlsx')
raw_glioma <- raw_glioma[,1:57]

str(raw_glioma)

library(tidyverse)
library(readxl)
library(dplyr)
library(funModeling) 
library(Hmisc)
library(ggplot2)
library(PerformanceAnalytics)
library(pROC)       
library(forecast)
library(ResourceSelection)
library(vcd)


names(raw_glioma)[names(raw_glioma) == "Гистология"] <- "Histology"
names(raw_glioma)[names(raw_glioma) == "Возраст"] <- "Age"
names(raw_glioma)[names(raw_glioma) == "Глубина обьемного образования в мм"] <- "Neoplasm_depth"
names(raw_glioma)[names(raw_glioma) == "Головная боль (0- нет,  1 - есть)"] <- "Headache"
names(raw_glioma)[names(raw_glioma) == "Группа послеоперационная"] <- "Postgroup"
names(raw_glioma)[names(raw_glioma) == "Группа тотальности >98 ; 95-98; <95"] <- "Total_group"
names(raw_glioma)[names(raw_glioma) == "Дата контроля"] <- "Control_date"
names(raw_glioma)[names(raw_glioma) == "Дата МРТ"] <- "MRI_date"
names(raw_glioma)[names(raw_glioma) == "Дата Операции"] <- "Operation_date"
names(raw_glioma)[names(raw_glioma) == "двигательные нарушения (0-нет,1-асимптомные,-2 легкий геми- монопарез, 3 - умеренный геми- монопарез, 4 - глубокий гемипарез и гемиплегия)"] <- "Movement_disorders"
names(raw_glioma)[names(raw_glioma) == "Доля (1-лобная, 2-височная, 3-затылочная, 4-островковая,5-теменная, 6 - таламус)"] <- "Lobe"
names(raw_glioma)[names(raw_glioma) == "Застой на глазном дне (0-нет, 1-есть)"] <- "Fundus_congestion"
names(raw_glioma)[names(raw_glioma) == "Зона кровоснабжения (1-магистр сосуд (сильвиева щель, перфоранты) 2-пма; 3-сма; 4-зма)"] <- "Blood_supply_zone"
names(raw_glioma)[names(raw_glioma) == "Инвазия в базальные ядра, таламус."] <- "Invasion_basal_nuclei"
names(raw_glioma)[names(raw_glioma) == "Индекс Карнофски"] <- "Karnofsky"
names(raw_glioma)[names(raw_glioma) == "Критерий Макдональда, мм2"] <- "Macdonald"
names(raw_glioma)[names(raw_glioma) == "Локализация: (1-правое полушарие, левая затылочная доля; 2-левое полушарие кроме затылка; 3- мозолистое тело,  таламус)"] <- "C_localization"
names(raw_glioma)[names(raw_glioma) == "мозолистое тело, билатеральное расположение (0-нет, 1-да)"] <- "M_bilateral_location_corcall"
names(raw_glioma)[names(raw_glioma) == "МРТиндекс>2 (0-нет, 1-да)"] <- "S_MRI_index"
names(raw_glioma)[names(raw_glioma) == "Наибольший диаметр контрастируемой зоны, мм"] <- "Largest_diameter"
names(raw_glioma)[names(raw_glioma) == "Наибольший перпендикуляр мм"] <- "Great_perpendicular"
names(raw_glioma)[names(raw_glioma) == "Наличие кистозного компонента (0-нет, 1-да)"] <- "S_cystic_component"
names(raw_glioma)[names(raw_glioma) == "Неврологический дефицит (0-нет, 1-да)"] <- "S_neuro_deficit"
names(raw_glioma)[names(raw_glioma) == "Общая сумма балов...51"] <- "M_sum_point"
names(raw_glioma)[names(raw_glioma) == "Общая сумма балов...56"] <- "C_Sum_point"
names(raw_glioma)[names(raw_glioma) == "Объем образования, куб.мм"] <- "Education_volume"
names(raw_glioma)[names(raw_glioma) == "Обьем неудаленной опухоли по сегментации мм3"] <- "Unremoved_volume"
names(raw_glioma)[names(raw_glioma) == "Обьем образования посчитанный при помощи сегментации"] <- "Volume_segmentation"
names(raw_glioma)[names(raw_glioma) == "Обьем резекции %"] <- "Resection_Volume"
names(raw_glioma)[names(raw_glioma) == "Осложнения (0-нет, 1-гем., 2-отек, 3- воспалительные в/черепные, 4- воспалительные внечерепные, 5 - смерть)"] <- "Complications"
names(raw_glioma)[names(raw_glioma) == "Осложнения невр (0-нет, 1-общемозг., 2 -очаг)"] <- "Complications_neurological"
names(raw_glioma)[names(raw_glioma) == "Отек > 10 мм (0-нет, 1-да)"] <- "M_swelling"
names(raw_glioma)[names(raw_glioma) == "Первично - множественный"] <- "Primary_plural"
names(raw_glioma)[names(raw_glioma) == "Площадь инвазии"] <- "Invasion_area"
names(raw_glioma)[names(raw_glioma) == "Площадь патологической зоны"] <- "Patological_area"
names(raw_glioma)[names(raw_glioma) == "ПОЛ (1-ж, 2-м)"] <- "Sex"
names(raw_glioma)[names(raw_glioma) == "Послеоперационный обьем"] <- "Postoperative_volume"
names(raw_glioma)[names(raw_glioma) == "Послеоперационный Обьем образования посчитанный при помощи сегментации"] <- "Postoperative_volume_segmentation"
names(raw_glioma)[names(raw_glioma) == "Прогностический индекс"] <- "S_predictive_index"
names(raw_glioma)[names(raw_glioma) == "размер обьеного образования >5см"] <- "C_size_more"
names(raw_glioma)[names(raw_glioma) == "Разница"] <- "Difference"
#
names(raw_glioma)[names(raw_glioma) == "Речевые нарушения  (0- нет, 2- ненарушена способность общения, 3- нарушена способность общения, 4 - неспособность к общению)"] <- "Speech_disorders"
names(raw_glioma)[names(raw_glioma) == "Сложность тотальной резекции по Giannantonio Spena 0-лег 1-ср 2-тяж"] <- "S_Difficulty_by_Spena"
names(raw_glioma)[names(raw_glioma) == "Сложность тотальной резекции по Hani J. Marcus 0-лег 1-ср 2-тяж"] <- "M_difficulty_by_Marcus"
names(raw_glioma)[names(raw_glioma) == "Сложность тотальной резекции по Jaume Capellades (0-лег 1-ср 2-тяж)"] <- "C_difficulty_by_Capellades"
names(raw_glioma)[names(raw_glioma) == "Смещение срединных структур, мм"] <- "Displacement_midline_str"
names(raw_glioma)[names(raw_glioma) == "степень накопления КВ (0-нет, 1-да)"] <- "S_accumulation_CV"
names(raw_glioma)[names(raw_glioma) == "Сторона поражения (правое-1, левое-2, обе-3, мозолистое тело - 4)"] <- "The_affected_side"
#
names(raw_glioma)[names(raw_glioma) == "Судороги (0 - нет, 2- фокальные, 3 - генерализованные, 4 - эпистатус)"] <- "Convulsions"
names(raw_glioma)[names(raw_glioma) == "судорожный синдром (0-нет, 1-да)"] <- "S_convulsive_syndrome"
names(raw_glioma)[names(raw_glioma) == "Тошнота рвота  (0- нет, 1 - есть)"] <- "Nausea"
names(raw_glioma)[names(raw_glioma) == "Трактография"] <- "Tractography"
names(raw_glioma)[names(raw_glioma) == "Третий размер, мм"] <- "Third_size"
names(raw_glioma)[names(raw_glioma) == "Уровень сознания (0-ясное,1- умеренное оглушение, 2 -глубокое оглушение, 3- сопор, 4 -кома)"] <- "Consciousness"
names(raw_glioma)[names(raw_glioma) == "ФИО"] <- "Name"
names(raw_glioma)[names(raw_glioma) == "функционально важная зона"] <- "M_funct_important_area"
names(raw_glioma)[names(raw_glioma) == "функционально важная структура"] <- "C_Functionally__structure"
names(raw_glioma)[names(raw_glioma) == "Хирург Свистов Д.В. - 1; Мартынов Б.В. - 2; Лапшин Р.А. - 3; Гайворонский А.И. - 4; Долги В.Н. - 5; Гаврилов Г.В. - 6;"] <- "Surgeon"
names(raw_glioma)[names(raw_glioma) == "Четкие края опухоли (0-нет, 1-да)"] <- "S_clear_tumor_edges"
names(raw_glioma)[names(raw_glioma) == "Butterfly -глиомы"] <- "Butterfly_gliome"
names(raw_glioma)[names(raw_glioma) == "<10мм до желудочков (0-нет, 1-да)"] <- "M_less_10_distance"
names(raw_glioma)[names(raw_glioma) == "> 40 мм (0-нет, 1-да)"] <- "M_dist_more_40"
names(raw_glioma)[names(raw_glioma) == "> 80см3 (0-нет, 1-да)"] <- "S_dist_more_80"
names(raw_glioma)[names(raw_glioma) == "Наибольший перпендикуляр по Т2"] <- "Grea_perpendicular_T2"
names(raw_glioma)[names(raw_glioma) == "Наибольший диаметр по Т2"] <- "Larg_diameter_Т2"

work_gl <- raw_glioma
work_gl <- select(raw_glioma, -c(Histology, MRI_date, Operation_date, Control_date))

raw_glioma$Tractography

# Замена значений переменных, на те что возможно использовать
raw_glioma$Tractography[raw_glioma$Tractography == '+'] <- '1'
raw_glioma$Tractography[raw_glioma$Tractography == '-'] <- '0'
raw_glioma$Primary_plural[raw_glioma$Primary_plural == '-'] <- '0'
raw_glioma$Primary_plural[raw_glioma$Primary_plural == '+'] <- '1'

raw_glioma$Invasion_area[raw_glioma$Invasion_area == '-'] <- '0'
raw_glioma$Invasion_area[raw_glioma$Invasion_area == '+'] <- '1'


raw_glioma$Invasion_basal_nuclei[raw_glioma$Invasion_basal_nuclei == '-'] <- '0'
raw_glioma$Invasion_basal_nuclei[raw_glioma$Invasion_basal_nuclei == '+'] <- '1'
raw_glioma$Butterfly_gliome[raw_glioma$Butterfly_gliome == '-'] <- '0'
raw_glioma$Butterfly_gliome[raw_glioma$Butterfly_gliome == '+'] <- '1'

work_gl$Convulsions[work_gl$Convulsions == '1'] <- NA

#Группа тотальности >98 ; 95-98; <95
raw_glioma$Totality_group[raw_glioma$Totality_group == '<95%'] <- '1'
raw_glioma$Totality_group[raw_glioma$Totality_group == '95-98%'] <- '2'
raw_glioma$Totality_group[raw_glioma$Totality_group == '>98%'] <- '3'


#Группа послеоперационная 
raw_glioma$Postoperative_group[raw_glioma$Postoperative_group == '<1000'] <- '1'
raw_glioma$Postoperative_group[raw_glioma$Postoperative_group == '1000-2000'] <- '2'
raw_glioma$Postoperative_group[raw_glioma$Postoperative_group == '>2000'] <- '3'
str(raw_glioma)

raw_glioma$MRI_date[raw_glioma$MRI_date == '-'] <- '.'
raw_glioma$[raw_glioma$ == '-'] <- '0'
raw_glioma$[raw_glioma$ == '-'] <- '0'
raw_glioma$[raw_glioma$ == '-'] <- '0'
raw_glioma$[raw_glioma$ == '-'] <- '0'
raw_glioma$[raw_glioma$ == '-'] <- '0'
raw_glioma$[raw_glioma$ == '-'] <- '0'
raw_glioma$[raw_glioma$ == '-'] <- '0'

#Подрубим NA
work_gl$Convulsions[work_gl$Convulsions == '1'] <- NA
work_gl$Speech_disorders[work_gl$Speech_disorders == '1'] <- NA
work_gl$Movement_disorders[work_gl$Movement_disorders == '1'] <- NA
Movement_disorders

#C_localization
work_gl$C_localization <- as.character(gsub(2,"left_hemisphere_except_occiput" , gsub(1,"right_hemisphere_left_occipital_lobe" ,
                                                             gsub(3, "corpus_callosum_thalamus", work_gl$C_localization))))

#Convulsions
work_gl$Convulsions <- as.character(gsub(2,"deep_stun" , gsub(1,"NA" ,
                                                                gsub(3, "generalized", gsub(4, "status_epilepticus", gsub(2, "focal", 
                                                                                       gsub(0, "False", work_gl$Convulsions)))))))
#Speech_disorders
work_gl$Speech_disorders <- as.character(gsub(2,"deep_stun" , gsub(1,"NA" ,
                                                              gsub(3, "ability_communicate", gsub(4, "inability_communicate", gsub(2, "ability_communicate_not_impaired", 
                                                                                                                        gsub(0, "False", work_gl$Speech_disorders)))))))

#Sex
work_gl$Sex <- as.character(gsub(2,"man" , gsub(1,"woman" , work_gl$Sex)))

work_gl$The_affected_side <- as.character(gsub(2,"Right" , gsub(1,"Left" ,gsub(3, "both_sides", gsub(4, "corpus_callosum", work_gl$The_affected_side)))))
 
work_gl$S_convulsive_syndrome <- as.character(gsub(0,"False" , gsub(1,"True" , work_gl$S_convulsive_syndrome)))


#
work_gl$The_affected_side <- as.character(gsub(2,"Right" , gsub(1,"Left" ,gsub(3, "both_sides", gsub(4, "corpus_callosum", work_gl$The_affected_side)))))
#
work_gl$Lobe <- as.character(gsub(2,"temporal" , gsub(1,"frontal" ,
                                                      gsub(3, "occipital", gsub(4, "insular", 
                                                                                gsub(5, "parietal",gsub(6, "thalamus", work_gl$Lobe)))))))
#
work_gl$Consciousness <- as.character(gsub(2,"deep_stun" , gsub(1,"moderate_stun" ,
                                                                gsub(3, "stupor", gsub(4, "coma", 
                                                                                       gsub(0, "clear", work_gl$Consciousness))))))
#
work_gl$Headache <- as.character(gsub(0,"False" , gsub(1,"True" , work_gl$Headache)))
Nausea
#
work_gl$Nausea <- as.character(gsub(0,"False" , gsub(1,"True" , work_gl$Nausea)))


#Fundus_congestion
work_gl$Fundus_congestion <- as.character(gsub(0,"False" , gsub(1,"True" , work_gl$Fundus_congestion)))
#Complications

work_gl$Complications <- as.character(gsub(2,"edema" , gsub(1,"hem" ,
                                                      gsub(3, "inflammatory_intracranial", gsub(4, "inflammatory_extracranial", 
                                                                                gsub(5, "death",gsub(0, "False", work_gl$Complications)))))))
#Complications_neurological
work_gl$Complications_neurological <- as.character(gsub(0,"False" , gsub(1,"cerebral" , gsub(2,"focal" ,work_gl$Complications_neurological))))

#S_clear_tumor_edges
work_gl$S_clear_tumor_edges <- as.character(gsub(0,"False" , gsub(1,"True" , work_gl$S_clear_tumor_edges)))

#S_cystic_component
work_gl$S_cystic_component <- as.character(gsub(0,"False" , gsub(1,"True" , work_gl$S_cystic_component)))

#S_dist_more_80
work_gl$S_dist_more_80 <- as.character(gsub(0,"False" , gsub(1,"True" , work_gl$S_dist_more_80)))

#S_convulsive_syndrome
work_gl$S_convulsive_syndrome <- as.character(gsub(0,"False" , gsub(1,"True" , work_gl$S_convulsive_syndrome)))

#S_neuro_deficit
work_gl$S_neuro_deficit <- as.character(gsub(0,"False" , gsub(1,"True" , work_gl$S_neuro_deficit)))

#S_MRI_index
work_gl$S_MRI_index <- as.character(gsub(0,"False" , gsub(1,"True" , work_gl$S_MRI_index)))

#S_accumulation_CV
work_gl$S_accumulation_CV <- as.character(gsub(0,"False" , gsub(1,"True" , work_gl$S_accumulation_CV)))

#S_Difficulty_by_Spena
work_gl$S_Difficulty_by_Spena <- as.character(gsub(0,"easy" , gsub(1,"medium" , gsub(2,"hard" ,work_gl$S_Difficulty_by_Spena))))

#M_less_10_distance
work_gl$M_less_10_distance <- as.character(gsub(0,"False" , gsub(1,"True" , work_gl$M_less_10_distance)))

#M_bilateral_location_corcall
work_gl$M_bilateral_location_corcall <- as.character(gsub(0,"False" , gsub(1,"True" , work_gl$M_bilateral_location_corcall)))

#M_funct_important_area
work_gl$M_funct_important_area <- as.character(gsub(0,"False" , gsub(1,"True" , work_gl$M_funct_important_area)))

#M_swelling
work_gl$M_swelling <- as.character(gsub(0,"False" , gsub(1,"True" , work_gl$M_swelling)))

#M_dist_more_40
work_gl$M_dist_more_40 <- as.character(gsub(0,"False" , gsub(1,"True" , work_gl$M_dist_more_40)))

#M_difficulty_by_Marcus
work_gl$M_difficulty_by_Marcus <- as.character(gsub(0,"easy" , gsub(1,"medium" , gsub(2,"hard" ,work_gl$M_difficulty_by_Marcus))))

#C_size>5cm
work_gl$C_size_more <- as.character(gsub(0,"False" , gsub(1,"True" , work_gl$C_size_more)))

#C_Functionally__structure
work_gl$C_Functionally__structure <- as.character(gsub(0,"False" , gsub(1,"True" , work_gl$C_Functionally__structure)))

#C_difficulty_by_Capellades
work_gl$C_difficulty_by_Capellades <- as.character(gsub(0,"easy" , gsub(1,"medium" , gsub(2,"hard" ,work_gl$C_difficulty_by_Capellades))))

#Movement_disorders
work_gl$Movement_disorders <- as.character(gsub(2,"mild_hemimonoparesis" , gsub(1,"asymptomatic" ,
                                                            gsub(3, "moderate_hemimonoparesis", 
                                                                 gsub(4, "deep_hemiparesis_hemiplegia",
                                                                    gsub(0, "False", work_gl$Movement_disorders))))))



#EDA

basic_eda <- function(data)
{
  glimpse(data)
  print(status(data))
  freq(data) 
  print(profiling_num(data))
  plot_num(data)
  describe(data)
}
basic_eda(work_gl)

#Categorial analys
freq_gl <- freq(work_gl, path_out = "/Users/type/Documents/Git/Glioma/Glioma/processed_data/Character_graph/")

#Numeric analys
plot_num(work_gl, path_out = "/Users/type/Documents/Git/Glioma/Glioma/processed_data/Numeric_graph/")

#Numeric
data_prof=profiling_num(work_gl)

#Boxplots
chart.Boxplot(work_gl)
Chart_correl <- chart.Correlation(select(work_gl, c(data_prof$variable)))


plotar(work_gl,  plot_type=boxplot)

plot_num(work_gl, bins = 10, path_out = NA)

test_comp <- v_compare(work_gl$Postoperative_volume, work_gl$Postoperative_volume_segmentation)

post_volume <- prcomp(c(work_gl$Postoperative_volume, work_gl$Postoperative_volume_segmentation), center = TRUE, scale = TRUE)

summary(post_volume)

work_gl$M_bilateral_location_corcall



post_volume <- prcomp(raw_gliom, center = TRUE, scale = TRUE)


plot(work_gl$Postoperative_volume, work_gl$Postoperative_volume_segmentation, log = TRUE)



                                                                                                      
Marc_ac <- raw_glioma$M_difficulty_by_Marcus
Capell_ac <- as.numeric(raw_glioma$C_difficulty_by_Capellades)
Spena_ac <- raw_glioma$S_Difficulty_by_Spena




#Precigion
precision <- function(x, y){
  t       = table(x, y)
  p       = (t[2,2] / (t[2,2] + t[1,2]))
  p       = round(p, 2)
  paste0('The precision is: ', p)
}
                                                                                                 
precision(class, scored.class)



#Plot ROC
get.rocPlot.auc = function(df){
  library(ggplot2)
  threshold.grid = seq(0,1, by= 0.01)
  predicted.classes = data.frame(row.names = 1:nrow(df))
  x = seq_along(threshold.grid)
  y = seq_along(threshold.grid)
  for (i in threshold.grid) {
    yhat = as.numeric(df$scored.probability>i)
    predicted.classes = cbind(predicted.classes, yhat)
  }
  for (j in 1:length(threshold.grid)){
    class.factor = factor(df$class,levels = c(0,1))
    predicted.class.factor = factor(predicted.classes[,j], levels = c(0,1))
    t = table(class.factor, predicted.class.factor)
    sensitivity = t[2,2] / (t[2,2] + t[2,1])
    specificity = t[1,1] / (t[1,1] + t[1,2])
    y[j] = sensitivity
    x[j] = 1 - specificity
  }
  
  roc.data = data.frame(fpr = x, tpr = y)
  roc.plot = ggplot(roc.data, aes(x=fpr, y=tpr)) + geom_step()
  roc.plot = roc.plot + geom_abline(slope = 1, intercept = c(0,0), colour="red", lty=2)
  
  my_auc <- function(outcome, proba){
    N = length(proba)
    N_pos = sum(outcome)
    df = data.frame(out = outcome, prob = proba)
    df = df[order(-df$prob),]
    df$above = (1:N) - cumsum(df$out)
    return( 1- sum( df$above * df$out ) / (N_pos * (N-N_pos) ) )
  }
  
  auc1 = my_auc(class,scored.probability)
  results = list("Plot"=roc.plot, "Area under curve"=auc1)
  results
}

get.rocPlot.auc(df)
#roc

Marc_ac <- as.numeric(raw_glioma$M_difficulty_by_Marcus)
Capell_ac <- as.numeric(raw_glioma$C_difficulty_by_Capellades)
Spena_ac <- as.numeric(raw_glioma$S_Difficulty_by_Spena)

# Истинные
les <- c(2,0,1,2,0,2,0,2,0,2,1,0,2,2,0,0,0,1,1,0,1,2,0,0,2,2,0,0,0,0,0,2,0,NA,2,2,0,0,0,2,0,0,0,0,0,0,0,0,0,1,0,2,1,0,0,0,2,1,0,0,0,0,2,2,1,0,0,0,0,1,0,2,2,0,0,0,0,0,0,0,0,2,0,0,0,0,2,2,1,0,2,0,2,2,0,1,0,0,1,2,2,2,0,2,1,2,2,0,2,2,0,0,2,0)
 
forest_list <- c(2,1,2,1,2,0,0,0,0,0,0,0,0,2,0,2,1,0,0,2,0,0,2,2,2,0,0,1,2,0,0,0,2,2,2,0,0,0,0,1,0,0)
forest_predict <- c(0, 2, 0, 0, 2, 2, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 2, 2, 0, 0, 0, 2, 0, 2, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 2)

roc1 <- plot.roc(les, Marc_ac, main="ROC comparison", percent=TRUE, col= "red")
roc2 <- lines.roc(les, Capell_ac, percent=TRUE, col="blue")

roc1 <- plot.roc(Marc_ac, les)
roc2 <- plot.roc(Capell_ac, les)
roc3 <- plot.roc(Spena_ac, les)
roc4 <- plot.roc(forest_predict, forest_list)

tr <- roc(Marc_ac, les)

recol <- c(roc1, roc2, roc3)
legend <- c("Marcus", "Capell", "Spena")

#Multiple rocs

ggrocs <- function(rocs, breaks = seq(0,1,0.1), legendTitel = "Legend") {
  if (length(rocs) == 0) {
    stop("No ROC objects available in param rocs.")
  } else {
    require(plyr)
    # Store all sensitivities and specifivities in a data frame
    # which an be used in ggplot
    RocVals <- plyr::ldply(names(rocs), function(rocName) {
      if(class(rocs[[rocName]]) != "roc") {
        stop("Please provide roc object from pROC package")
      }
      data.frame(
        fpr = rev(rocs[[rocName]]$specificities),
        tpr = rev(rocs[[rocName]]$sensitivities),
        names = rep(rocName, length(rocs[[rocName]]$sensitivities)),
        stringAsFactors = T
      )
    })
    
    aucAvg <- mean(sapply(rocs, "[[", "auc"))
    
    rocPlot <- ggplot(RocVals, aes(x = fpr, y = tpr, colour = names)) +
      geom_segment(aes(x = 0, y = 1, xend = 1,yend = 0), alpha = 0.5, colour = "gray") + 
      geom_step() +
      scale_x_reverse(name = "False Positive Rate (1 - Specificity)",limits = c(1,0), breaks = breaks) + 
      scale_y_continuous(name = "True Positive Rate (Sensitivity)", limits = c(0,1), breaks = breaks) +
      theme_bw() + 
      coord_equal() + 
      annotate("text", x = 0.1, y = 0.1, vjust = 0, label = paste("AUC =",sprintf("%.3f",aucAvg))) +
      guides(colour = guide_legend(legendTitel)) +
      theme(axis.ticks = element_line(color = "grey80"))
    
    rocPlot
  }
}

auc(roc1)
auc(roc2)
auc(roc3)

plot(roc3, col="red")
plot(roc2, add = TRUE, col="blue")
plot(roc1, add = TRUE, col="blue")

print.multiclass.auc(tr)



auc(roc1)
auc(roc2)
auc(roc3)
auc(roc4)


par(mar=c(6.1,4.1,6,2.1), xpd=TRUE)
plot(roc1, col = 1, lty = 2, main = "ROC", )
plot(roc2, col = 2, lty = 2, add = TRUE)
plot(roc3, col = 3, lty = 2, add = TRUE)
plot(roc4, col = 4, lty = 2, add = TRUE)

legend("bottomright", c("Marcus scale       (AUC = 0.5758)", "Capellades scale (AUC = 0.5952)", "Spena scale         (AUC = 0.4595)", "RandomForest    (AUC = 0.6352)"), lty=2, 
       col = c(1, 2, 3, 4))

les_data <- data.frame(les)
wri

side_sc <- as.numeric(raw_glioma$The_affected_side)
lobe_sc <- as.numeric(raw_glioma$Lobe)

cor(les, raw_glioma$Largest_diameter, method = "spearman")

#Sum Capel
sum(Capell_ac == 0)
sum(Capell_ac == 1)
sum(Capell_ac == 2)

# Sum MArc

sum(Marc_ac == 0)
sum(Marc_ac == 1)
sum(Marc_ac == 2)

# Sum Spena

sum(Spena_ac == 0)
sum(Spena_ac == 1)
sum(Spena_ac == 2)

# les

(length(which(les == 0)))/114
length(which(les == 1))
length(which(les == 2))


numeric_predictor <- raw_glioma[, c(3, 8, 20, 21, 22, 23, 24, 25, 26, 27, 28, 30, 31, 58)]


chart.Correlation(numeric_predictor)



#Accuracy

prediction_accuracy <- function(x, y){
  
  t        = table(x, y)
  accuracy = (t[2,2] + t[1,1]) / (t[2,2] + t[1,2] + t[1,1] + t[2,1])
  accuracy = round(accuracy, 2)
  paste0("The prediction accuracy is: ", accuracy)
}


prediction_accuracy(Marc_ac, les)
prediction_accuracy(Spena_ac, les)
prediction_accuracy(Capell_ac, les)



f1.score <- function(x ,y){
  t = table(x, y)
  p = (t[2,2] / (t[2,2] + t[1,2]))
  s = t[2,2] / (t[2,2] + t[2,1])
  f1 = (2*p*s) / (p + s)
  f1 = round(f1, 2)
  paste0("The F1 score is: ", f1)
}


f1.score(Marc_ac, les)
f1.score(Spena_ac, les)
f1.score(Capell_ac, les)



chart.Correlation(raw_glioma)



str(raw_glioma)

raw_glioma <- select(raw_glioma, -c(Postgroup, Total_group, Operation_date))
raw_glioma <- select(raw_glioma, -c(Operation_date))
raw_glioma <- select(raw_glioma, -c(Name))


raw_glioma$Lobe<- as.numeric(raw_glioma$Lobe)
raw_glioma$Complications<- as.numeric(raw_glioma$Complications)
raw_glioma$M_difficulty_by_Marcus<- as.numeric(raw_glioma$M_difficulty_by_Marcus)
raw_glioma$C_difficulty_by_Capellades<- as.numeric(raw_glioma$C_difficulty_by_Capellades)
raw_glioma$S_Difficulty_by_Spena<- as.numeric(raw_glioma$S_Difficulty_by_Spena)
raw_glioma$S_convulsive_syndrome<- as.numeric(raw_glioma$S_convulsive_syndrome)
raw_glioma$The_affected_side<- as.numeric(raw_glioma$The_affected_side)

raw_glioma$S_dist_more_80<- as.numeric(raw_glioma$S_dist_more_80)
raw_glioma$Complications<- as.numeric(raw_glioma$Complications)


forest2 <- raw_glioma[,c(2, 3, 5, 6, 7, 8, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31)]

