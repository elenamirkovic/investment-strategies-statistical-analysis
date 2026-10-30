rm(list = ls())
install.packages("quantmod")
library(quantmod)

getSymbols("GLD",
           src = "yahoo",
           from = "2022-06-05",
           to = "2026-06-05")

cene <- Ad(GLD)

prinosi <- dailyReturn(cene, type = "log")

r <- as.numeric(prinosi)
datumi <- index(prinosi)

hist(prinosi,
     breaks = 30,
     main = "Dnevni log-prinosi ZLATO",
     xlab = "Prinos")

k <- 20

# 1. GODINA ZA MERU STABILNOSTI

mera_indeksi <- which(datumi >= "2022-06-05" &
                        datumi < "2023-06-05")

volatilnosti_mera <- c()

for(t in mera_indeksi){
  
  if(t >= k){
    
    s20 <- sd(r[(t-k+1):t])
    
    volatilnosti_mera <- c(volatilnosti_mera, s20)
  }
}

granica_stabilnosti <- median(volatilnosti_mera)

granica_stabilnosti

# 2. TEST PERIOD: 2023-2026

test_indeksi <- which(datumi >= "2023-06-05" &
                        datumi < "2026-06-05")

momentum_prinosi <- c()
mean_prinosi <- c()

momentum_rez <- c()
mean_rez <- c()

broj_stabilnih_dana <- 0

for(t in test_indeksi){
  
  if(t >= k && t < length(r)){
    
    prosek20 <- mean(r[(t-k+1):t])
    s20 <- sd(r[(t-k+1):t])
    
    if(s20 < granica_stabilnosti){
      
      broj_stabilnih_dana <- broj_stabilnih_dana + 1
      
      # MOMENTUM
      
      if(prosek20 > 0){
        momentum_prinosi <- c(momentum_prinosi, r[t+1])
        momentum_rez <- c(momentum_rez, r[t+1])
      } else {
        momentum_rez <- c(momentum_rez, 0)
      }
      
      # MEAN REVERSION
      
      if(r[t] < prosek20 - 0.5*s20){
        mean_prinosi <- c(mean_prinosi, r[t+1])
        mean_rez <- c(mean_rez, r[t+1])
      } else {
        mean_rez <- c(mean_rez, 0)
      }
    }
  }
}
broj_stabilnih_dana

length(momentum_prinosi)
length(mean_prinosi)

mean(momentum_prinosi)
mean(mean_prinosi)

summary(momentum_prinosi)
summary(mean_prinosi)

sd(momentum_prinosi)
sd(mean_prinosi)

length(momentum_rez)
length(mean_rez)

mean(momentum_rez)
mean(mean_rez)

summary(momentum_rez)
summary(mean_rez)

sd(momentum_rez)
sd(mean_rez)
# 1. Welch t-test
t.test(mean_prinosi,
       momentum_prinosi,
       alternative = "greater")

# 2. Mann-Whitney / Wilcoxon rank-sum test
wilcox.test(mean_prinosi,
            momentum_prinosi,
            alternative = "greater")

# 3. Upareni t-test
t.test(mean_rez,
       momentum_rez,
       paired = TRUE,
       alternative = "greater")

# 4. Wilcoxon signed-rank test
wilcox.test(mean_rez,
            momentum_rez,
            paired = TRUE,
            alternative = "greater")
D <- mean_rez - momentum_rez

mean(D)
summary(D)
sd(D)