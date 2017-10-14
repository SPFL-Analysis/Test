library(RODBC)
channel <- odbcConnect("SPFL")

Prem <- sqlQuery(channel, "select * from SPFL_Prem_16_17_Goals_n_Assists_n_xG where goals > 6")


##############################################################################################
### try ggplot instead
##############################################################################################

library(ggplot2)
library(lattice)
library(directlabels)

Prem_subset1 <- subset(Prem, Assists > 1 & scorer != 'Niall McGinn' & scorer != 'Steven MacLean' & scorer != 'Kris Boyd' & scorer != 'Tomas Rogic')
Prem_subset2 <- subset(Prem, scorer == 'Niall McGinn' | scorer == 'Steven MacLean' | scorer == 'Kris Boyd' 
                       | scorer == 'Tomas Rogic')
Prem_subset3 <- subset(Prem, Assists < 1)




ggplot() + 
  geom_point(data=Prem, mapping=aes(x = xG_BT
                                    , y = Goals
                                    , size = Assists)
             , shape = 21
             , fill ="red"
             , alpha = 0.6) +
  geom_text(data=Prem_subset1, mapping=aes(x=xG_BT, y=Goals, label=scorer), size=2, vjust=-1, hjust=0.9) +
  geom_text(data=Prem_subset2, mapping=aes(x=xG_BT, y=Goals, label=scorer), size=2, vjust=2, hjust=0) +
  geom_text(data=Prem_subset3, mapping=aes(x=xG_BT, y=Goals, label=scorer), size=2, vjust=1, hjust=0.5) +
  geom_abline(intercept = 0, slope = 1, linetype=2, size = 0.5, color = "grey") +
  labs(title='SPFL Premiership 16/17 - Player Goals, xG & Assists') + 
  labs(caption = "(based on live minute by minute game data from the BBC & Sky Sports)") +
  labs(x = "Expected Goals") +
  labs(y = "Goals Scored")

