library(MASS)
library(data.table)
library(ordinal)

data(soup)
soup_test = data.table(soup)
head(soup_test)
  
lapply(soup_test[,c("SOUPTYPE", "COLD", "SURENESS")], table)
ftable(xtabs(~ SOUPTYPE + COLD + SURENESS, data = soup_test))

m = polr(SURENESS ~ SOUPTYPE + COLD, data = soup_test, Hess = TRUE)
summary(m)

#add p-values
(ctable = coef(summary(m)))
p = pnorm(abs(ctable[, "t value"]), lower.tail = FALSE) * 2
(ctable = cbind(ctable, "p value" = p))

(ci = confint(m))

exp(coef(m))
exp(cbind(OR = coef(m), ci))

newdat = data.frame(SOUPTYPE = soup_test$SOUPTYPE,
                    COLD = soup_test$COLD)
newdat_p = cbind(newdat, predict(m, newdat, type = "probs"))
deduped.data = unique(newdat_p[, 1:8])
deduped.data


