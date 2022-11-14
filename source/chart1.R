library(tidyverse)

race_washington <- c(29.3, 9.9, 42.5, 35.4, 34.4)
chart_one <- barplot(race_washington,
<<<<<<< HEAD
        main = "% Obesity by Race in Washington",
        xlab = "Race",
        ylab = "% Obesity",
        names.arg = c("White", "Asian", "AI/AN", "Black", "Hispanic"),
        col = "red",
        ylim=c(0,100),
        horiz = FALSE)


=======
                     main = "% Obesity by Race in Washington",
                     xlab = "Race",
                     ylab = "% Obesity",
                     names.arg = c("White", "Asian", "AI/AN", "Black", "Hispanic"),
                     col = "red",
                     ylim=c(0,100),
                     horiz = FALSE)
>>>>>>> 8ff5492592a003138f148d75c22ec45f6df2307f
