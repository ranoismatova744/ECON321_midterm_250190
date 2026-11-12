#loading the data
library(MASS)
data("birthwt")
#assigning as df
df<-birthwt
#converting "smoke" from (0,1) to a label(no, yes)
df$smoke<-factor(df$smoke,
                 levels=c(0,1),
                 labels=c("No","Yes"))
head(df)
#Task 3.1
#structure of data frame
str(df)
#first 6 rows
head(df)
#dataset documentation
?birthwt

#Task 3.2
#overall summary
summary(df$bwt)
sd(df$bwt)
IQR(df$bwt)

tapply(df$bwt, df$smoke, mean)     # Mean birth weight by smoking group
tapply(df$bwt, df$smoke, sd)       # Standard deviation by smoking group
tapply(df$bwt, df$smoke, median)   # Median by smoking group
tapply(df$bwt, df$smoke, IQR)      # IQR by smoking group

#Graph1 histogram of birth weight
hist(df$bwt, 
     main = "Figure 1: Distribution of Infant Birth Weights", 
     xlab = "Birth Weight (grams)", 
     ylab = "Frequency", 
     col = "skyblue", 
     border = "white",
     las = 1)

#Graph2 boxplot of birth weight by somking status
boxplot(bwt ~ smoke, data = df, 
        main = "Figure 2: Birth Weight by Mother's Smoking Status", 
        xlab = "Mother Smoked During Pregnancy", 
        ylab = "Birth Weight (grams)", 
        col = c("#a8e6cf", "#ff8b94"),
        las = 1)
#Task 3.3
#histogram and Q-Q plot
hist(df$bwt, main = "Normality Check: Histogram", xlab = "Birth Weight (g)")
qqnorm(df$bwt)
qqline(df$bwt, col = "red")
#t-test
t_test_result <- t.test(df$bwt, mu = 2500, conf.level = 0.95)
#print t test result
print(t_test_result)
