#!usr/bin/perl -w

$file = "ADSL_test_3.csv";

open(FH, "$file");

@file = <FH>;

#print @file;

print "BMIBL\n";

foreach $fil(@file)
	{
#		print $a;
	
		if($fil=~/(JNJ00ND3001\-\d+\,\w+\,\d+\,\w\,\w+\,\d+\,(\d*\.?\d*)\,(\d*\.?\d*))/ || $fil=~/(JNJ00ND3001\-\d+\,\w+\,\d+\,\w\,\w+\,\,(\d*\.?\d*)\,(\d*\.?\d*))/)
{
#print $2, $3;

$weight=$2;
$height=$3;

##(Weightbl /(HeightBL *HeightBL)) * 10000

$ratio=(($weight/($height*$height))*10000);

#print "BMIBL\n";
print "$ratio\n";
 
} 
	



	}
