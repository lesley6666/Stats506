import delimited "soup_data.csv"

list if v1 <=5

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




tab sureness

tab sureness souptype2

tab sureness cold2

ologit sureness i.souptype2 i.cold2
ologit sureness i.souptype2 i.cold2, or

margins souptype2 cold2

margins, at(souptype2 = (1/2) cold2 = 1) predict(outcome(2)) 
marginsplot, recast(line) recastci(rarea)
margins, at(souptype2 = (0/2)) atmeans vsquish post
marginsplot, recast(line) recastci(rarea)
ologit sureness i.souptype2 i.cold2, or

omodel logit sureness souptype2 cold2

gologit2 sureness souptype2 cold2, npl

lrtest, saving(0)

ologit sureness i.souptype2 i.cold2
lrtest
