Passenger Satisfaction Analysis
Project Overview
This project aims to analyze passenger satisfaction levels using data from an airline service. The goal is to identify key factors that contribute to passenger satisfaction and dissatisfaction, thereby enabling targeted improvements to enhance the overall passenger experience.

Methodology
Data Preparation: Utilized R for data loading and preparation, converting satisfaction levels into a factor for analysis.
Data Visualization: Created visual representations of passenger satisfaction distribution, age distribution, gender distribution, and flight distance by satisfaction to uncover initial insights.
Model Building: Developed two models to predict passenger satisfaction:
A Decision Tree model using various passenger attributes.
A Naive Bayes model focusing on online boarding, inflight wifi service, and type of travel as predictors.
Key Findings
The Decision Tree model achieved an accuracy of 88.38%, with a sensitivity of 86.45% and specificity of 90.84%. This model effectively distinguished between satisfied and neutral or dissatisfied passengers.
The Naive Bayes model, while slightly less accurate at 86.19%, still provided valuable insights into the importance of online boarding, inflight wifi service, and type of travel in predicting satisfaction.
Data visualizations highlighted a significant variation in satisfaction levels across different age groups, genders, and flight distances, emphasizing the need for personalized approaches to improve passenger satisfaction.
Conclusions and Future Work
The analysis demonstrates the potential of machine learning models to predict and analyze passenger satisfaction, offering airlines actionable insights to enhance service quality. Future work could explore deeper into personalized models that consider a wider range of factors, including in-flight amenities and loyalty programs, to further improve prediction accuracy and customer satisfaction.

Technologies Used
R
R libraries: rpart, rpart.plot, klaR, caret, ggplot2
Data Visualization Techniques
Machine Learning Models: Decision Tree, Naive Bayes
