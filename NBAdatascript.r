library(tidyverse)
library(readxl)
library(tidyr)
library(stringr)
library(plotly)
library(ggrepel)

#Read the basketball data, taken from Sports Reference
season2000 <- read.csv("2000.csv")
season2001 <- read.csv("2001.csv")
season2002 <- read.csv("2002.csv")
season2003 <- read.csv("2003.csv")
season2004 <- read.csv("2004.csv")
season2005 <- read.csv("2005.csv")
season2006 <- read.csv("2006.csv")
season2007 <- read.csv("2007.csv")
season2008 <- read.csv("2008.csv")
season2009 <- read.csv("2009.csv")
season2010 <- read.csv("2010.csv")
season2011 <- read.csv("2011.csv")
season2012 <- read.csv("2012.csv")
season2013 <- read.csv("2013.csv")
season2014 <- read.csv("2014.csv")
season2015 <- read.csv("2015.csv")
season2016 <- read.csv("2016.csv")
season2017 <- read.csv("2017.csv")
season2018 <- read.csv("2018.csv")
season2019 <- read.csv("2019.csv")
season2020 <- read.csv("2020.csv")
season2021 <- read.csv("2021.csv")



#Join the individual regular season data into one big joined regular season 
#First add the year into each dataframe so that when it joins it can distinguish the years 
season2000 <- mutate(season2000, year = "2000")
season2001 <- mutate(season2001, year = "2001")
season2002 <- mutate(season2002, year = "2002")
season2003 <- mutate(season2003, year = "2003")
season2004 <- mutate(season2004, year = "2004")
season2005 <- mutate(season2005, year = "2005")
season2006 <- mutate(season2006, year = "2006")
season2007 <- mutate(season2007, year = "2007")
season2008 <- mutate(season2008, year = "2008")
season2009 <- mutate(season2009, year = "2009")
season2010 <- mutate(season2010, year = "2010")
season2011 <- mutate(season2011, year = "2011")
season2012 <- mutate(season2012, year = "2012")
season2013 <- mutate(season2013, year = "2013")
season2014 <- mutate(season2014, year = "2014")
season2015 <- mutate(season2015, year = "2015")
season2016 <- mutate(season2016, year = "2016")
season2017 <- mutate(season2017, year = "2017")
season2018 <- mutate(season2018, year = "2018")
season2019 <- mutate(season2019, year = "2019")
season2020 <- mutate(season2020, year = "2020")
season2021 <- mutate(season2021, year = "2021")

#JoinedSeason is the dataframe that will contain all of the dataframes of each season
joinedSeason <- full_join(season2010, season2011)
joinedSeason <- joinedSeason %>% full_join(season2000)
joinedSeason <- joinedSeason %>% full_join(season2001)
joinedSeason <- joinedSeason %>% full_join(season2002)
joinedSeason <- joinedSeason %>% full_join(season2003)
joinedSeason <- joinedSeason %>% full_join(season2004)
joinedSeason <- joinedSeason %>% full_join(season2005)
joinedSeason <- joinedSeason %>% full_join(season2006)
joinedSeason <- joinedSeason %>% full_join(season2007)
joinedSeason <- joinedSeason %>% full_join(season2008)
joinedSeason <- joinedSeason %>% full_join(season2009)
joinedSeason <- joinedSeason %>% full_join(season2020)
joinedSeason <- joinedSeason %>% full_join(season2012)
joinedSeason <- joinedSeason %>% full_join(season2013)
joinedSeason <- joinedSeason %>% full_join(season2014)
joinedSeason <- joinedSeason %>% full_join(season2015)
joinedSeason <- joinedSeason %>% full_join(season2016)
joinedSeason <- joinedSeason %>% full_join(season2017)
joinedSeason <- joinedSeason %>% full_join(season2018)
joinedSeason <- joinedSeason %>% full_join(season2019)
joinedSeason <- joinedSeason %>% full_join(season2020)
joinedSeason <- joinedSeason %>% full_join(season2021)

#The * in the team name signifies in Basketball reference that they made the playoffs
#This will make it so that There is a column that shows whether they are a playoff team or not
joinedSeason <- joinedSeason %>% separate(Team, c("Team", "Made_Playoffs"), "\\*")
joinedSeason <- replace_na(joinedSeason, list(Made_Playoffs = FALSE))
joinedSeason$Made_Playoffs[joinedSeason$Made_Playoffs == ""] <- TRUE

#Replace the NAs in All Stars with zero since it means the team has no all stars
joinedSeason <- replace_na(joinedSeason, list(All.Stars = 0))



#Now to add playoff data into the picture

#Read the basketball data, taken from Sports Reference
playoff2000 <- read.csv("playoff2000.csv")
playoff2001 <- read.csv("playoff2001.csv")
playoff2002 <- read.csv("playoff2002.csv")
playoff2003 <- read.csv("playoff2003.csv")
playoff2004 <- read.csv("playoff2004.csv")
playoff2005 <- read.csv("playoff2005.csv")
playoff2006 <- read.csv("playoff2006.csv")
playoff2007 <- read.csv("playoff2007.csv")
playoff2008 <- read.csv("playoff2008.csv")
playoff2009 <- read.csv("playoff2009.csv")
playoff2010 <- read.csv("playoff2010.csv")
playoff2011 <- read.csv("playoff2011.csv")
playoff2012 <- read.csv("playoff2012.csv")
playoff2013 <- read.csv("playoff2013.csv")
playoff2014 <- read.csv("playoff2014.csv")
playoff2015 <- read.csv("playoff2015.csv")
playoff2016 <- read.csv("playoff2016.csv")
playoff2017 <- read.csv("playoff2017.csv")
playoff2018 <- read.csv("playoff2018.csv")
playoff2019 <- read.csv("playoff2019.csv")
playoff2020 <- read.csv("playoff2020.csv")

#Add the year into the data
playoff2000 <- mutate(playoff2000, year = "2000")
playoff2001 <- mutate(playoff2001, year = "2001")
playoff2002 <- mutate(playoff2002, year = "2002")
playoff2003 <- mutate(playoff2003, year = "2003")
playoff2004 <- mutate(playoff2004, year = "2004")
playoff2005 <- mutate(playoff2005, year = "2005")
playoff2006 <- mutate(playoff2006, year = "2006")
playoff2007 <- mutate(playoff2007, year = "2007")
playoff2008 <- mutate(playoff2008, year = "2008")
playoff2009 <- mutate(playoff2009, year = "2009")
playoff2010 <- mutate(playoff2010, year = "2010")
playoff2011 <- mutate(playoff2011, year = "2011")
playoff2012 <- mutate(playoff2012, year = "2012")
playoff2013 <- mutate(playoff2013, year = "2013")
playoff2014 <- mutate(playoff2014, year = "2014")
playoff2015 <- mutate(playoff2015, year = "2015")
playoff2016 <- mutate(playoff2016, year = "2016")
playoff2017 <- mutate(playoff2017, year = "2017")
playoff2018 <- mutate(playoff2018, year = "2018")
playoff2019 <- mutate(playoff2019, year = "2019")
playoff2020 <- mutate(playoff2020, year = "2020")

#joinedPlayoffSeason is the equivalent of joinedSeason just for the playoffs
#join all of the playoff series into one datatable
joinedPlayoffSeason <- full_join(playoff2010, playoff2011)
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2000) 
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2001) 
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2002) 
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2003)
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2004)
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2005)
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2006)
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2007)
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2008)
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2009)
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2012) 
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2013)
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2014)
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2015)
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2016)
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2017)
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2018)
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2019)
joinedPlayoffSeason <- joinedPlayoffSeason %>% full_join(playoff2020) 


#Mutate the graph to distinguish playoff stats from regular season stats 
joinedPlayoffSeason <- transmute(joinedPlayoffSeason,
                                 Team = Team,
                                 playoffG = G, 
                                 playoffW = W,
                                 playoffL = L,
                                 playoffW.L. = W.L.,
                                 playoffPW = PW,
                                 playoffPL = PL,
                                 playoffORtg = ORtg,
                                 playoffDRtg = DRtg,
                                 playoffNRtg = NRtg,
                                 playoffPace = Pace,
                                 playoffFTr = FTr, 
                                 playoffX3PAr = X3PAr,
                                 playoffTS. = TS.,
                                 playoffeFG. = eFG.,
                                 playoffTOV. = TOV.,
                                 playoffORB. = ORB.,
                                 playoffFT.FGA = FT.FGA, 
                                 playoffeFG..1 = eFG..1,
                                 playoffTOV..1 = TOV..1,
                                 playoffDRB. = DRB.,
                                 playoffFT.FGA.1 = FT.FGA.1, 
                                 year = year,
                                 teamyear = paste(Team, year, sep = "_") )

#mutate the joinedSeason so that there is an identifer that includes the team name and year
#This is so that each Team during a particular season has a unique identifier 
joinedSeason <- joinedSeason %>%  mutate(teamyear= paste(Team, year, sep="_"))

#Finally join the playoff Stats with the regular season stats
joinedSeason <- left_join(joinedSeason,joinedPlayoffSeason)

#This is to remove the NAs in playoff games, basically just putting it in the database that there are no playoff games there
joinedSeason <- replace_na(joinedSeason, list(playoffG = 0))
joinedContendersSeason <- filter(joinedSeason, playoffG > 0)

# 
#
#ALL OF THE PREVIOUS CODE WAS FOR HANDLING AND MANAGING THE DATA
#BELOW IS MULTIPLE CALLS TO GGPLOT AND PLOTLY WHERE I PLOTTED MULTIPLE SETS OF DATA TO WINS AND PLAYOFF WINS TO SEE WHICH METRICS ARE HIGHLY CORRELATED TO WINNING 
#MOST OF THE PLOTS ARE SCATTER PLOTS, IF IT MORE STRONGLY RESEMBLES A LINE, THEN IT IS STRONGLY CORRELATED AND VICE VERSA
#
#

#plotly precursor variables 
f1 <- list(
  family = "Arial, sans-serif",
  size = 18,
  color = "black"
)
f2 <- list(
  family = "Old Standard TT, serif",
  size = 14,
  color = "black"
)

#check Regular season Net Rating with  regular season Wins
#Using ggplot
ggplot(joinedSeason, aes(x=NRtg, y=W)) + 
  geom_point() + 
  labs(x = "Net Rating", 
       y = "Regular Season Wins",
       title = "Relationship between Net Rating and Regular Season Wins") +
  geom_smooth(method = "lm")

#check Regular season Net Rating with  regular season Wins
#using plotly exclusively
comp_NRtg_to_W <- plot_ly(data = joinedSeason, x = ~NRtg, y= ~W, 
                          text = ~paste("Team: ", teamyear)
                          )
comp_NRtg_to_W <- comp_NRtg_to_W %>% layout(title = "Relationship between Net Rating and Regular Season Wins")
comp_NRtg_to_W


#check Regular season Offensive Rating with  regular season Wins
#Using ggplot
ggplot(joinedSeason, aes(x=ORtg, y=W)) + 
  geom_point() + 
  labs(x = "Offensive Rating", 
       y = "Regular Season Wins",
       title = "Relationship between Offensive Rating and Regular Season Wins") +
  geom_smooth(method = "lm")

#check Regular season Net Rating with playoff Wins
#Using ggplot
ggplot(joinedSeason, aes(x=NRtg, y=playoffW)) + 
  geom_point() + 
  labs(x = "Regular Season Net Rating", 
       y = "Playoff Wins",
       title = "Relationship between Net Rating and Playoff Wins") +
  geom_smooth(method = "lm")

#check Regular season Net Rating with playoff Wins
#using plotly exclusively
comp_NRtg_to_playoffW <- plot_ly(data = joinedSeason, x = ~NRtg, y= ~playoffW, 
                          text = ~paste("Team: ", teamyear)
)
comp_NRtg_to_playoffW <- comp_NRtg_to_W %>% layout(title = "Relationship between Net Rating and Playoff Wins")
comp_NRtg_to_playoffW

#check Age with  regular season Wins
#Using ggplot
ggplot(joinedSeason, aes(x=Age, y=W)) + 
  geom_point() + 
  labs(x = "Age", 
       y = "Regular Season Wins",
       title = "Relationship between Age and Regular Season Wins") +
  geom_smooth(method = "lm")

#check Regular season Net Rating with  regular season Wins
#Using ggplot
ggplot(joinedSeason, aes(x=DRtg, y=W)) + 
  geom_point() + 
  labs(x = "Defensive Rating", 
       y = "Regular Season Wins",
       title = "Relationship between Defensive Rating and Regular Season Wins") +
  geom_smooth(method = "lm")

#check Pace with  regular season Wins
#Using ggplot
ggplot(joinedSeason, aes(x=Pace, y=W)) + 
  geom_point() + 
  labs(x = "Pace", 
       y = "Regular Season Wins",
       title = "Relationship between Pace and Regular Season Wins") 


#check Regular season Defensive Rating with playoff Wins
#using plotly exclusively
xAxis <- list(
  title = "Defensive Rating",
  titlefont = f1,
  showticklabels = TRUE,
  tickangle = 0,
  tickfont = f2
)

yAxis <- list(
  title = "Regular Season Wins",
  titlefont = f1,
  showticklabels = TRUE,
  tickangle = 0,
  tickfont = f2  
)

comp_DRtg_to_W <- plot_ly(data = joinedSeason, x = ~DRtg, y= ~W, 
                                 text = ~paste("Team: ", teamyear)
)
comp_DRtg_to_W <- comp_DRtg_to_W %>% layout(title = "Relationship between Defensive Rating and Regular Season Wins",
                                            xaxis = xAxis,
                                            yaxis = yAxis
                                            )
comp_DRtg_to_W




#check Pace with  Wins
#using plotly exclusively
xAxis <- list(
  title = "Pace",
  titlefont = f1,
  showticklabels = TRUE,
  tickangle = 0,
  tickfont = f2
)

yAxis <- list(
  title = "Regular Season Wins",
  titlefont = f1,
  showticklabels = TRUE,
  tickangle = 0,
  tickfont = f2  
)

comp_Pace_to_W <- plot_ly(data = joinedSeason, x = ~Pace, y= ~W, 
                          text = ~paste("Team: ", teamyear)
)
comp_Pace_to_W <- comp_Pace_to_W %>% layout(title = "Relationship between Pace and Regular Season Wins",
                                            xaxis = xAxis,
                                            yaxis = yAxis
)
comp_Pace_to_W

#Fins summary statistics with all star teams 
joinedSeason %>%
  filter(Made_Playoffs == TRUE & year != 2021) %>% 
  group_by(All.Stars) %>% 
  summarize(average = mean(playoffW)) 

data <- joinedSeason %>%  
  group_by(All.Stars) %>% 
  summarize(average = mean(playoffW))


#check All Stars with Playoff Wins 
#using plotly exclusively
xAxis <- list(
  title = "Number of All Stars ",
  titlefont = f1,
  showticklabels = TRUE,
  tickangle = 0,
  tickfont = f2
)

yAxis <- list(
  title = "Playoff Wins ",
  titlefont = f1,
  showticklabels = TRUE,
  tickangle = 0,
  tickfont = f2  
)

comp_AllStars_to_playoffW <- plot_ly(data = joinedSeason, x = ~All.Stars, y= ~playoffW, 
                          text = ~paste("Team: ", teamyear)
)
comp_AllStars_to_playoffW <- comp_AllStars_to_playoffW %>% layout(title = "Relationship between All Stars and Playoff Wins",
                                            xaxis = xAxis,
                                            yaxis = yAxis
)
comp_AllStars_to_playoffW


#Fins summary statistics with all star teams 
joinedSeason %>%
  filter(Made_Playoffs == TRUE & year != 2021) %>% 
  group_by(All.Stars) %>% 
  summarize(average = mean(W), median = median(W), stdev = sd(W)) 

#Compare All Stars to W 
#Using GGplot
joinedSeason %>% filter(Team != "League Average") %>% 
  ggplot(aes(x=All.Stars, y=W)) + 
  geom_boxplot() 


#Compare All Stars to W 
#Using GGplot
joinedSeason %>% filter(Team != "League Average") %>% 
ggplot(aes(x=All.Stars, y=W)) + 
  geom_point() 



#check Regular season Net Rating with  playoff Wins
#Using ggplot
ggplot(joinedSeason, aes(x=NRtg, y=playoffW)) + 
  geom_point() + 
  labs(x = "Net Rating", 
       y = "Playoff Wins",
       title = "Relationship between Net Rating and Playoff Wins") + 
  scale_x_continuous(limits = c(-5,15)) +
  geom_smooth()

#check Regular season Age with  playoff Wins
#Using ggplot
ggplot(joinedSeason, aes(x=Age, y=playoffW)) + 
  geom_point() + 
  labs(x = "Age", 
       y = "Playoff Wins",
       title = "Relationship between Age and Playoff Wins") 


#Create test statistics 
joinedSeason <- joinedSeason %>% mutate(offdeffactors = eFG.*2 - TOV./100 + (ORB./100)/2 + FT.FGA - (eFG..1*2 - TOV..1/100 - (DRB./100)/2 +FT.FGA.1))

#check offdeffactors with  Wins
#Using ggplot
ggplot(joinedSeason, aes(x=offdeffactors, y=W)) + 
  geom_point() + 
  labs(x = "offdefffactors", 
       y = "Wins",
       title = "Relationship between offdeffactors and Regular Season Wins") 

#check offdeffactors with playoff Wins
#Using ggplot
ggplot(joinedSeason, aes(x=offdeffactors, y=playoffW)) + 
  geom_point() + 
  labs(x = "offdefffactors", 
       y = "playoffWins",
       title = "Relationship between offdeffactors and Playoff Wins") 

#Create test statistics 
joinedSeason <- joinedSeason %>% mutate(playoffrating = (All.Stars-1)*1.5 + NRtg)

#check playoffrating with Wins
#Using ggplot
ggplot(joinedSeason, aes(x=playoffrating, y=playoffW)) + 
  geom_point() + 
  labs(x = "playoffrating", 
       y = "Wins",
       title = "Relationship between Playoff Rating and Playoff Wins ") +
  scale_x_continuous(limits = c(-5,15)) 
