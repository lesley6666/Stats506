library(MASS)
library(data.table)
library(ordinal)
library(Hmisc)

data(soup)
soup_test = data.table(soup)
soup_test[1:10,]
  
summary(soup_test$SURENESS)
mean(as.numeric(soup_test$SURENESS))

lapply(soup_test[,c("SOUPTYPE", "SOUPFREQ", "COLD", "SURENESS")], table)
ftable(xtabs(~ SOUPTYPE + SOUPFREQ + COLD + SURENESS, data = soup_test))

m = polr(SURENESS ~ SOUPTYPE + COLD, data = soup_test, Hess = TRUE)
summary(m)

#add p-values
(ctable = coef(summary(m)))
p = pnorm(abs(ctable[, "t value"]), lower.tail = FALSE) * 2
(ctable = cbind(ctable, "p value" = p))

(ci = confint(m))

exp(coef(m))
exp(cbind(OR = coef(m), ci))

sf = function(y) {
  c('Y>=1' = qlogis(mean(y >= 1)),
    'Y>=2' = qlogis(mean(y >= 2)),
    'Y>=3' = qlogis(mean(y >= 3)),
    'Y>=4' = qlogis(mean(y >= 4)),
    'Y>=5' = qlogis(mean(y >= 5)),
    'Y>=6' = qlogis(mean(y >= 6)))
}

s = with(soup_test, 
          summary(as.numeric(SURENESS) ~ SOUPTYPE + COLD, fun = sf))
s


newdat = data.frame(SOUPTYPE = soup_test$SOUPTYPE,
                    COLD = soup_test$COLD)
newdat_p = cbind(newdat, predict(m, newdat, type = "probs"))
deduped.data = unique(newdat_p[, 1:8])
deduped.data


