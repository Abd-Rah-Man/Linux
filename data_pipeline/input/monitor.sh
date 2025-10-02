#!/usr/bin/bash

log_path="$HOME/Linux/data_pipeline/logs"

cat $log_path/preprocess.log | grep -q "Failed!!!"

if [ $? == 0 ]
then
	echo "[$(date)] An error occurred" >> $log_path/summary.log
else 
	echo "[$(date)] Successful" >> $log_path/summary.log
fi 

