# Heart Disease Prediction Analysis

## Overview
This repository contains an analysis of heart disease prediction using logistic regression. The dataset used is from the Cleveland Heart Disease dataset, and the model predicts whether a person is **healthy** or **unhealthy** based on various health metrics.

### Key Steps in the Analysis:
1. **Data Preprocessing:**
   - Cleaning the dataset (handling missing values and encoding categorical variables).
   - Exploratory Data Analysis (EDA) to understand the distribution of variables.
   
2. **Logistic Regression Modeling:**
   - A logistic regression model was trained to predict heart disease (`hd`) based on various features like `sex`, `cp`, `chol`, and others.
   - The model was evaluated using pseudo R-squared and p-values.

3. **Visualization:**
   - A scatter plot was generated to visualize the predicted probabilities of heart disease for each individual.

---

## Getting Started

### Prerequisites

Ensure you have the following packages installed:

- **ggplot2**: For data visualization.
- **cowplot**: For enhanced plot styling (optional).

You can install the required packages using the following commands in R:

```r
install.packages("ggplot2")
install.packages("cowplot")
```

### Loading and Running the Analysis

1. Clone the repository to your local machine.

2. Open the script `heart_disease_prediction.R` and run the code. The dataset will be loaded, preprocessed, and the logistic regression model will be trained.

3. The final output, a plot of predicted probabilities of heart disease, will be saved as `heart_disease_probabilities.pdf` in the project directory.

---

## Final Output

The final output of the analysis is a **scatter plot** of predicted probabilities for heart disease.

![Heart Disease Prediction Plot](heart_disease_probabilities.pdf)

---
