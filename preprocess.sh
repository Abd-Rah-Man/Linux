#!/usr/bin/bash

input_path="$HOME/data_pipeline/input"
output_path="$HOME/data_pipeline/output"
log_path="$HOME/data_pipeline/logs"

#Ingesting the data from source
echo "[$(date)] Ingestion Begins..." >> $log_path/preprocess.log 
curl --output-dir $input_path --create-dirs -O https://raw.githubusercontent.com/dataengineering-community/launchpad/refs/heads/main/Linux/sales_data.csv

#Monitoring 
if [ $? == 0 ]
then
        echo "[$(date)] Ingestion Successful" >> $log_path/preprocess.log

        #Transforming the data
        echo  "[$(date)] Transformation Begins..." >> $log_path/preprocess.log

        cut -d ',' -f1-6 $input_path/sales_data.csv | awk 'BEGIN{FS=","} $6 != "Failed" {print $0}' > $output_path/cleaned_sales_data.csv

        #Monitoring
        if [ $? == 0 ]
        then
                echo "[$(date)] Transformation Successful" >> $log_path/preprocess.log 
        else
                echo "[$(date)] Transformation Failed!!!" >> $log_path/preprocess.log 
        fi

else
        echo "[$(date)] Ingestion Failed!!!" >> $log_path/preprocess.log 
fi
