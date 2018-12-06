/*Importing the data set*/
import delimited "soup_data.csv"

/*Showing the first five rows of the data*/
list if v1 <= 10

/*Creating variables as numbers so they can be treated*/
/*As factors. When trying to run ologit on the character*/
/*was not able to treat as factors*/
gen gender2 = 1 if gender == "Male"
replace gender2 = 0 if gender == "Female"

gen cold2 = 1 if cold == "Yes"
replace cold2 = 0 if cold == "No"

gen souptype2 = 0 if souptype == "Self-made"
replace souptype2 = 1 if souptype == "Canned"
replace souptype2 = 2 if souptype == "Dry-mix"

gen agegroup2 = 0 if agegroup == "18-30"
replace agegroup2 = 1 if agegroup == "31-40"
replace agegroup2 = 2 if agegroup == "41-50"
replace agegroup2 = 3 if agegroup == "51-65"

gen location2 = 0 if location == "Region 1"
replace location2 = 1 if location == "Region 2"
replace location2 = 2 if location == "Region 3"

/*descriptive statistics of the variables of interest*/
tab sureness
tabstat sureness, s(n mean SD)

tab sureness souptype2

tab sureness cold2

/*ordinal logistic regression and odds ratios*/
ologit sureness i.souptype2 i.cold2

/*margins command so that we can make predictions*/
margins souptype2 cold2

/*making predictions at souptype 1,2 and cold = 1 and then plotting*/
margins, at(souptype2 = (1/2) cold2 = 1) predict(outcome(2)) 
marginsplot, recast(line) recastci(rarea) xtitle("Soup Type") ytitle("Prob.")
