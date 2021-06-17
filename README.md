# Preoperative assessment of glioblastoma resectability. Development of a phenotypic rating scale.

**Objective:** 
Development / validation of a method for assessing the resectability of glioblastomas.

**Tasks:**
1. Data preprocessing
2. EDA dataset
3. Evaluate the effectiveness of the available scales for predicting the outcome of operations, choose the best
4. Try to develop your own rating scale


Glioblastoma is the most common and most aggressive form of brain tumor. Surgery remains the standard treatment. Several rating scales have been developed to determine the degree of tumor resectability. They are based on the patient's history. However, the effectiveness of these scales has not been evaluated in real practice. We obtained a dataset containing 60 phenotypic features for 114 operated patients with glioblastoma. The aim of our work is to compare the effectiveness of the 3 proposed scales by assessing the predicted and real outcome of the operation. In case of ineffectiveness of any of the scales, try to develop your own approach to assessment based on the available data. The predictive abilities of the scales were assessed and compared with each other using ROC-curves, as well as using the F-score. None of the scales showed an exceptional result, the best of the proposed was the scale proposed by Capellades (AUC = 0.5952, f1-score = 0.36). I did not have enough time to develop a decent scale, which is why I decided to apply machine learning methods in our work. I trained the forest, it showed the best results (AUC = 0.6352, f1 - score = 0.4). The development of an effective prognostic scale is an important task that can greatly alleviate the problems of modern medicine.

**In our project was used next Rpackages:**
tidyverse, readxl, dplyr, funModeling, Hmisc, ggplot2, PerformanceAnalytics, pROC, forecast, ResourceSelection, vcd


![alt text](https://github.com/DaniilPanshin/Preoperative_assessment_of_glioblastoma_resectability/blob/main/ROC.jpeg)
Fig.1 Comparison of different rating scales with random forest
