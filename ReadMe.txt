Group Project - readme.txt

Files Included with this project:

GroupProject.Rmd	GroupPorject.html	ReadMe.txt	sas3g.png	sas4g1.png
sas4g2.png	sas4g3.png	sas5g1.png	sas5g2.png	sas5g3.png	soup.R
soup.csv	soup.sas	soup_script.do	stata3g.png	stata4g.png
stata5g.png	stata6g1.png	stata6g2.png	stata6g3.png	to_do_list

Data Set Discription:

Column 1:	Resp	Respondents in the study
Column 2:	Prod	Index and test products
Column 3:	Prodid	Index reference and test product variants
Column 4:	Sureness	Respondents ratings
Column 5:	Day	Split over two days
Column 6:	Souptype	Three levels:Type of soup used
Column 7:	Cold	Does the respondent have a cold
Column 8:	Easy	How easy did the respondent find the discimination test
Column 9:	Gender	Gender
Column 10:	Agegroup	Four factors: Age of respondent
Column 11:	Location	Three different locations used


Things to Consider:
	SAS produced different results for prediction values than R and Stata. We have tried to figure out the reason for this discrepancy.

	 There is no exact R-squared in ordinal logistic regression. Because of this there is no exact way to check the proportion of the variance that is predicted by the independent variables.

	Diagnostics can be difficult for ordered logit models.

	Empty or small cells can have an effect on the model that will make the model unstable or not run.
