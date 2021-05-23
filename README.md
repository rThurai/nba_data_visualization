# nba_data_visualization

This is a simple data analysis project in where I took nba team data (from basketball-reference.com) for every team in the nba for 20 years. I joined the data for each seperate season into one large dataframe where I can plot the data of all 20 seasons. With this data I tried to plot different information that correlates to wins in order to figure out what attributes are strongly correlates with winning. Things like Age, how fast you play, your offensive and defensive rating and so on. 

Afterwards I took the playoff team data for each season and joined it into the existing dataframe that already had 20 years of regular season data. I tried to plot certain regular season metrics to playoff wins to see if there is any metric that could "reasonably predict" playoff success. However I could not find such such a metric as the playoffs are really unpredictable with a sample size much less than the regular season(Regular season guaruntees 82 games whereas playoffs can range from 4 to 28 games). 

NBADataScript is where the actual R Code is written on. 

The CSV files all contain the basketball data taken from sports reference/basketball-reference.com. 
There are png files with the plots I created using ggplot2 comparing different metrics to wins or playoff wins with a caption to explain the correlations


