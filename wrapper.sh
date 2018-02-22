
#!/bin/bash 

grep -v "SCREEN FAILURE" ADSL_test.csv > ADSL_test_1.csv
 
awk -F ',' '{print $2,$4,$9,$11,$12,$13,$14,$15}' ADSL_test_1.csv > ADSL_test_2.csv

sed 's/ /,/g' ADSL_test_2.csv > ADSL_test_3.csv

perl ratio.pl > BMIBL

awk -F ',' '{print $1,$2,$3,$4,$5,$6}' ADSL_test_3.csv > ADSL_test_4.csv

sed 's/ /,/g' ADSL_test_4.csv > ADSL_test_5.csv

paste -d , ADSL_test_5.csv BMIBL > ADSL_test_6.csv

sed 's/USUBJID,TRT01P,AGE,SEX,COUNTRY,DDUR,BMIBL//' ADSL_test_6.csv > ADSL_test_6v.csv

perl insert_DAS.pl > ADSL_test_7.csv

perl insert_DAS_1.pl > result_final.csv

sed 's/,/	/g' result_final.csv > result_final.txt  

rm ADSL_test_1.csv ADSL_test_2.csv ADSL_test_3.csv BMIBL ADSL_test_4.csv ADSL_test_5.csv ADSL_test_6.csv ADSL_test_6v.csv ADSL_test_7.csv  

