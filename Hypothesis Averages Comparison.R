#### First Calculate Average for 2 Players, Per match ####

#Adding new column for storing averages
Player1_avg <- data.frame(matrix(nrow=nrow(Player1_WC), ncol=1))
colnames(Player1_avg) <- c("Average")
str(Player1_avg)
Player1_Updated <- cbind(Player1_WC,Player1_avg)

Player2_avg <- data.frame(matrix(nrow=nrow(Player2_WC), ncol=1))
colnames(Player2_avg) <- c("Average")
str(Player2_avg)
Player2_Updated <- cbind(Player2_WC,Player2_avg)

#Removing DNB matches
Player1_Updated <- Player1_Updated[!Player1_Updated$Bat1=='DNB',]
Player2_Updated <- Player2_Updated[!Player2_Updated$Bat1=='DNB',]

Runs[1] <- Player1_Updated$Runs[1]
s <- 0
Innings[0] <- 0

#avg calculation Player1
for(i in 1:nrow(Player1_Updated)){
x[i] <- substr(Player1_Updated$Bat1[i],nchar(Player1_Updated$Bat1[i]),nchar(Player1_Updated$Bat1[i]))
if(x[i]=="*"){
  s <- (s+1)
  }
Runs[i+1] <- Runs[i]+Player1_Updated$Runs[i+1]
Innings[i] <- (i-s)
Player1_Updated$Average[i] <- Runs[i]/Innings[i]
}

Runs[1] <- Player2_Updated$Runs[1]
s <- 0
Innings[0] <- 0

#avg calculation Player2
for(i in 1:nrow(Player2_Updated)){
  x[i] <- substr(Player2_Updated$Bat1[i],nchar(Player2_Updated$Bat1[i]),nchar(Player2_Updated$Bat1[i]))
  if(x[i]=="*"){
    s <- (s+1)
  }
  Runs[i+1] <- Runs[i]+Player2_Updated$Runs[i+1]
  Innings[i] <- (i-s)
  Player2_Updated$Average[i] <- Runs[i]/Innings[i]
}


#----------------------------------------------------------------------------------#
### Null Hypothesis: Sachin Avg (Player1) not better than Dravid Avg (Player2)
### Alternate Hypothesis: Sachin Avg (Player1) better than Dravid Avg (Player2)


##Descriptive Statistics for 2 Players:
summary(Player1_Updated$Average)
summary(Player2_Updated$Average)


par(mfrow=c(2,2))
hist(Player1_Updated$Average)
hist(Player2_Updated$Average)

boxplot(Player1_Updated$Average)
boxplot(Player2_Updated$Average)

#Test of Variance
var(Player1_Updated$Average)
var(Player2_Updated$Average)
var.test(Player1_Updated$Average,Player2_Updated$Average)
# Variance of 2 Players not equal

#t-test
t.test(Player1_Updated$Average,Player2_Updated$Average,alternative = "greater",paired=FALSE,var.equal = FALSE,conf.level = 0.95)

#Welch Two Sample t-test

#data:  Player1_Updated$Average and Player2_Updated$Average
#t = -1.6583, df = 28.013, p-value = 0.9458
#alternative hypothesis: true difference in means is greater than 0
#95 percent confidence interval:
# -11.845     Inf
#sample estimates:
# mean of x mean of y 
#9.78792  65.63489 

### Result: We fail to reject the null hypothesis ### 
