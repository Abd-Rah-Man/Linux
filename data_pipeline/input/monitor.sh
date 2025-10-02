#!/usr/bin/bash

log_path="$HOME/Linux/data_pipeline/logs"

cat $log_path/preprocess.log | grep -q "Failed!!!"

if [ $? == 0 ]
then
	echo -e "$(date)\nAn error occurred" >> $log_path/summary.log
else 
	echo -e "$(date)\nSuccessful" >> $log_path/summary.log
fi 

