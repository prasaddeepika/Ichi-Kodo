#!usr/bin/perl -w

$file = "ADEF_test.csv";
$file1 = "ADSL_test_7.csv";

open(FH, $file);
open(FH1, $file1);

@file = <FH>;
@file1 = <FH1>;

##format for ADEF_test.csv file
##JNJ00ND3001,JNJ00ND3001-1047,WEEK 24,DAS,Disease Activity Score,8,Y

##format for ADSL_test.csv intermediate files
##JNJ00ND3001-1001,TREATMENT_A,54,F,KOR,8,21.8858131487889


print "USUBJID,TRT01P,AGE,SEX,COUNTRY,DDUR,BMIBL,DAS_WEEK_0,DAS_WEEK_24";

##opening ADEF and ADSL intermediate diles
foreach $fil(@file)
	{
	
	foreach $fil1(@file1)
		{
#print $fil1;

####regex for ADEF file - extracting information of interest
	
		if($fil=~/(JNJ00ND3001\,JNJ00ND3001\-(\d+)\,WEEK 24\,DAS,Disease Activity Score,(\d+)\,Y)/ || $fil=~/(JNJ00ND3001\,JNJ00ND3001\-(\d+)\,WEEK 24\,DAS,Disease Activity Score,(\d+)\,)/) 	
			{
				my $var = $2;
$DAS = $3;
#				print "$var\n";


##regex for ADSL intermediate files - extracting information of interest
		if($fil1=~/(JNJ00ND3001\-(\d+)\,TREATMENT_[AB]\,\d+\,[MF]\,\w+\,\d+\,\d*\.?\d*\,\d+)/ || $fil1=~/(JNJ00ND3001\-(\d+)\,TREATMENT_[AB]\,\d+\,[MF]\,\w+\,\,\d*\.?\d*\,\d+)/)
			{
				$full_l = $1;			

				my $var1 = $2;
#				print $var1, "\n";

##matching unique ids for information extraction and matching

		if ($var == $var1)
			{
			$fil1=~s/$fil1/$full_l,$DAS\n/;	



			}
		

} 
}
}
} 
print @file1;			
