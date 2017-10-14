library(pinnacle.data)
library(odds.converter)
library(ggplot2)

USA_Election_2016 <- data.frame(USA_Election_2016)

class(USA_Election_2016)

class(USA_Election_2016$EnteredDateTime)

class(USA_Election_2016$MoneyUS1)



ggplot()+ 
  geom_line(data = USA_Election_2016, mapping = aes(x = EnteredDateTime
                                                    , y = odds.us2prob(USA_Election_2016$MoneyUS1))) + 
  geom_line(data = USA_Election_2016, mapping = aes(x = EnteredDateTime
                                                    , y = odds.us2prob(USA_Election_2016$MoneyUS2)))