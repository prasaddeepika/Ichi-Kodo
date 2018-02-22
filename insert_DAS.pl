#!usr/bin/perl -w

$file = "ADEF_test.csv";
$file1 = "ADSL_test_6v.csv";

open(FH, $file);
open(FH1, $file1);

@file = <FH>;
@file1 = <FH1>;

##format for ADEF_test.csv file
##JNJ00ND3001,JNJ00ND3001-1047,WEEK 0,DAS,Disease Activity Score,8,Y

##format for ADSL_test.csv intermediate files
##JNJ00ND3001-1001,TREATMENT_A,54,F,KOR,8,21.8858131487889


##opening ADEF and ADSL intermediate diles
foreach $fil(@file)
	{
	
	foreach $fil1(@file1)
		{

##regex for ADEF file - extracting information of interest

		if($fil=~/(JNJ00ND3001\,JNJ00ND3001\-(\d+)\,WEEK 0\,DAS,Disease Activity Score,(\d+)\,Y)/ || $fil=~/(JNJ00ND3001\,JNJ00ND3001\-(\d+)\,WEEK 0\,DAS,Disease Activity Score,(\d+)\,)/) 	
			{
				$var = $2;
				$DAS = $3;
#				print "$var\n";

##regex for ADSL intermediate files - extracting information of interest

		if($fil1=~/(JNJ00ND3001\-(\d+)\,TREATMENT_[AB]\,\d+\,[MF]\,\w+\,\d+\,\d*\.?\d*)/ || $fil1=~/(JNJ00ND3001\-(\d+)\,TREATMENT_[AB]\,\d+\,[MF]\,\w+\,\,\d*\.?\d*)/)
			{
				$full_l = $1;			

				$var1 = $2;
#				print $var1, "\n";

##matching unique ids for information extraction and matching

		if ($var == $var1)
			{

##substituting original elements of array

			$fil1=~s/$fil1/$full_l,$DAS\n/;	


			#print "$DAS\n";


			}
		

} 
}
}
} 
print @file1;			
