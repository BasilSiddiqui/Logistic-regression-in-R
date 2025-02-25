library(ggplot2)
library(cowplot)
install.packages("ggplot2")

url = "https://raw.githubusercontent.com/StatQuest/logistic_regression_demo/master/processed.cleveland.data"

data = read.csv(url, header=FALSE)

head(data)

colnames(data) = c(
  "age",
  "sex",
  "cp",
  "trestbps",
  "chol",
  "fbs",
  "restecg",
  "thalach",
  "exang",   
  "oldpeak", 
  "slope", 
  "ca",
  "thal",
  "hd"
)

head(data)

str(data)

data[data == "?"] = NA

data$sex = ifelse(data$sex == 0, "F", "M")
data$sex = as.factor(data$sex)

data$cp = as.factor(data$cp)
data$fbs = as.factor(data$fbs)
data$restecg = as.factor(data$restecg)
data$exang = as.factor(data$exang)
data$slope = as.factor(data$slope)
  
data$ca = as.integer(data$ca)
data$ca = as.factor(data$ca)

data$thal = as.integer(data$thal)
data$thal = as.factor(data$thal)

data$hd = ifelse(data$hd == 0, "Healthy", "Unhealthy")
data$hd = as.factor(data$hd)

str(data)

nrow(data[is.na(data$ca) | is.na(data$thal),])

data[is.na(data$ca) | is.na(data$thal),]


xtabs(~ hd + sex, data=data)
xtabs(~ hd + cp, data=data)
xtabs(~ hd + fbs, data=data)
xtabs(~ hd + restecg, data=data)
xtabs(~ hd + exang, data=data)
xtabs(~ hd + slope, data=data)
xtabs(~ hd + ca, data=data)
xtabs(~ hd + thal, data=data)

logistic = glm(hd ~ sex, data = data, family = "binomial")
summary(logistic)

logistic = glm(hd ~ ., data = data, family = "binomial")
summary(logistic)

ll_null = logistic$null.deviance/-2
ll_proposed = logistic$deviance/-2

R_squared = (ll_null - ll_proposed)/(ll_null) #Psuedo R squared 

p_value = 1 - pchisq(2*(ll_proposed - ll_null), df =(length(logistic$coefficients)-1))

predicted_data = data.frame(
  prob_hd = logistic$fitted.values, 
  hd = data$hd
)

predicted_data = predicted_data[order(predicted_data$prob_hd, decreasing = FALSE),]

predicted_data$rank = 1:nrow(predicted_data)

ggplot(data = predicted_data, aes(x = rank, y = prob_hd)) +
geom_point(aes(color = hd), alpha = 1, shape = 4, stroke = 2) +
xlab("Index") +
ylab("Predicted probability of getting heart disease")

ggsave("heart_disease_probabilities.pdf")