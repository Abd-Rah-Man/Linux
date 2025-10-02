#!/usr/bin/bash

input_path="$HOME/Linux/data_pipeline/input"
output_path="$HOME/Linux/data_pipeline/output"
log_path="$HOME/Linux/data_pipeline/logs"

#Ingesting the data from source
echo -e "$(date)\nIngestion Begins..." >> $log_path/preprocess.log 
curl --create-dirs https://raw.githubusercontent.com/dataengineering-community/launchpad/refs/heads/main/Linux/sales_data.csv -o $input_path/sales_data.csv

#Monitoring 
if [ $? == 0 ]
then
        echo "Ingestion Successful" >> $log_path/preprocess.log

        #Transforming the data
        echo  "Transformation Begins..." >> $log_path/preprocess.log

        cut -d ',' -f1-6 $input_path/sales_data.csv | awk 'BEGIN{FS=","} $6 != "Failed" {print $0}' > $output_path/cleaned_sales_data.csv

        #Monitoring
        if [ $? == 0 ]
        then
                echo "Transformation Successful" >> $log_path/preprocess.log 
        else
                echo "Transformation Failed!!!" >> $log_path/preprocess.log 
        fi

else
        echo -e "$(date)\nIngestion Failed!!!" >> $log_path/preprocess.log 
fi
