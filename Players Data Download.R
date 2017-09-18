#Players World Cup data download from Stats.cricinfo
### Sachin Tendulkar = Player1, Rahul Dravid = Player2 ###

library(XML)
#Player1 Data download
URL1 <- ('http://stats.espncricinfo.com/ci/engine/player/35320.html?class=2;filter=advanced;orderby=start;template=results;trophy=12;type=batting;view=innings')
Player1_WC <- readHTMLTable(URL1,header = T,which=4,stringsAsFactors=FALSE)

#Player2 Data download
URL2 <- ('http://stats.espncricinfo.com/ci/engine/player/28114.html?class=2;filter=advanced;orderby=start;template=results;trophy=12;type=batting;view=innings')
Player2_WC <- readHTMLTable(URL2,header = T,which=4,stringsAsFactors=FALSE)

#Player DataSets Structures
str(Player1_WC)
str(Player2_WC)

#Change DataType for 'Runs'
Player1_WC$Runs <- as.numeric(Player1_WC$Runs,is.na=FALSE)
Player2_WC$Runs <- as.numeric(Player2_WC$Runs,is.na=FALSE)

#Change DataType for 'Balls Faced (BF)'
Player1_WC$BF <- as.numeric(Player1_WC$BF,is.na=FALSE)
Player2_WC$BF <- as.numeric(Player2_WC$BF,is.na=FALSE)

#Change DataType for 'Strike Rate (SR)'
Player1_WC$SR <- as.numeric(Player1_WC$SR,is.na=FALSE)
Player2_WC$SR <- as.numeric(Player2_WC$SR,is.na=FALSE)

#Change DataType for 'Number of Fours, Sixes (4s, 6s)'
Player1_WC$`4s` <- as.numeric(Player1_WC$`4s`,is.na=FALSE)
Player1_WC$`6s` <- as.numeric(Player1_WC$`6s`,is.na=FALSE)

Player2_WC$`4s` <- as.numeric(Player2_WC$`4s`,is.na=FALSE)
Player2_WC$`6s` <- as.numeric(Player2_WC$`6s`,is.na=FALSE)


#Review Updated Player DataSets Structures
str(Player1_WC)
str(Player2_WC)

#Understand the Player Datasets distribution
summary(Player1_WC)
summary(Player2_WC)




