

proc import datafile='C:\Users\lesleyls\Downloads\soup.csv'
out=work.soup
dbms=CSV;
run;

proc print data=soup;
run;

proc freq data=soup;
tables GENDER;
tables SURENESS;
run;

proc means data=soup;
var SURENESS;
run;

proc freq data=soup;
tables SURENESS*SOUPTYPE / norow nocol missprint;
tables SURENESS*SOUPFREQ / norow nocol missprint;
tables SURENESS*COLD / norow nocol missprint;
run;

proc logistic data=soup;
class SOUPTYPE(ref='Canned') COLD(ref='No') SURENESS(ref='1') GENDER(ref='Female')/ param=reference;
model SURENESS= SOUPTYPE GENDER COLD;
run;

proc logistic data=soup desc;
class SOUPTYPE(ref='Canned') SURENESS(ref='1') / param=reference;
model SURENESS= SOUPTYPE;
estimate "Pr prob SURENESS=1 at SOUPTYPE='Self-made' " intercept 1 / ilink category='2';
estimate "Pr prob SURENESS=1 at SOUPTYPE='Dry-mix' " intercept 1 / ilink category='2';

run;

