#!bin/bash
# $1 is the folder where all fastq report are stored
# Multiqc report will be generated in that folder too
# $2 is the number of parrallels 

for file in $1/*fastq.gz
do 
fastqc $file -o quality_check &
while [[ $(ps aux |grep $USER |grep "[f]astqc"|wc -l) -ge $2 ]]
do
	sleep 1m
done
done

multiqc --interactive -f $1 -o $1
