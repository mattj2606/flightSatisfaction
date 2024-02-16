# Load the necessary libraries
library(rpart)
library(rpart.plot)
library(klaR)
library(caret)

# Load and prepare the data
train <- read.csv("train.csv")
test <- read.csv("test.csv")
train$satisfaction <- as.factor(train$satisfaction)
test$satisfaction <- as.factor(test$satisfaction)


# Data Visualizations

# Prepare Data
satisfaction_df <- as.data.frame(table(train$satisfaction))
names(satisfaction_df) <- c("satisfaction", "count")
satisfaction_df$percentage <- round(100 * satisfaction_df$count / sum(satisfaction_df$count), 1)

# Create the Pie Chart
ggplot(satisfaction_df, aes(x = "", y = percentage, fill = satisfaction)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  geom_text(aes(label = paste(percentage, "%")), position = position_stack(vjust = 0.5)) +
  theme_void() +
  labs(title = "Passenger Satisfaction Distribution", fill = "Satisfaction")

hist(train$Age, col = "red", main = "Age Distribution of Passengers", xlab = "Age")
barplot(table(train$Gender), col = "blue", main = "Gender Distribution", xlab = "Gender", ylab = "Count")
boxplot(Flight.Distance ~ satisfaction, data = train, col = "green", main = "Flight Distance by Satisfaction", xlab = "Satisfaction", ylab = "Flight Distance")

# Build and evaluate the Decision Tree model
model <- rpart(satisfaction ~ ., data = train, method = "class")
rpart.plot(model)
dt_predictions <- predict(model, newdata = test, type = "class")
dt_confusion_matrix <- table(Predicted = dt_predictions, Actual = test$satisfaction)
dt_cm <- caret::confusionMatrix(dt_confusion_matrix)

# Build and evaluate the Naive Bayes model
nb_model <- NaiveBayes(satisfaction ~ Online.boarding + Inflight.wifi.service + Type.of.Travel, data = train)
nb_predictions <- predict(nb_model, test[, c("Online.boarding", "Inflight.wifi.service", "Type.of.Travel")])
nb_confusion_matrix <- table(Predicted = nb_predictions$class, Actual = test$satisfaction)
nb_cm <- caret::confusionMatrix(nb_confusion_matrix)

# Output accuracies and confusion matrices
print(dt_cm)
print(nb_cm)
