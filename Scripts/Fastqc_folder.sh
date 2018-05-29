#!bin/bash
# $1 is the folder where all data are stored
# A new folder called Quality_Check, will be generated in folder $1
# Multiqc report will be generated in that folder too
# $2 is the number of parrallels 

for file in $1/*fastq.gz
do 
fastqc $file -o $1/Quality_Check &
while [[ $(ps aux |grep $USER |grep "[f]astqc"|wc -l) -ge $2 ]]
do
	sleep 1m
done
done

multiqc --interactive -f $1/Quality_Check -o $1/Quality_Check
