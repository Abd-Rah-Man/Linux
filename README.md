# Linux: Building a Simple Data Pipeline Using Bash Scripting.

As a data engineer, I have been tasked to set up a data processing pipeline using Linux commands and bash scripts. This project would cover how I approached the data ingestion, file manipulation, automation, permissions management, scheduling with cron, and logging.

## Initial Project Directory Structure
```
./data_pipeline
./data_pipeline/input
./data_pipeline/logs
./data_pipeline/output

```
## Data Source
The source is a csv file located in [sales_data.csv](https://raw.githubusercontent.com/dataengineering-community/launchpad/refs/heads/main/Linux/sales_data.csv)

## Data Ingestion and File Manipulation

The data is ingested using the `curl -o`.

Data is transformed with `cut` and `awk` commands with pipes.

The transformed data is loaded into [cleaned_sales_data.csv](./output/cleaned_sales_data.csv)

The full script for the ingestion and transformation can be found here [preprocess.sh](./preprocess.sh
) 

## Logging

At each stage of the ingestion and transformation, logs are sent to [preprocess.log](./logs/preprocess.log) in the logs directory.

[monitor.sh](./monitor.sh) reads through the `preprocess.log` file to search for possible errors in the `prepocess.log`. It then sends summary log to [summary.log](./logs/summary.log).

## Automation and Scheduling

The `preprocess.sh` script is scheduled to run 12:00AM daily, and `monitor.sh` is scheduled to run 5minutes after. This is done with cron jobs via the crontab.

## Permissions

Necessary permissions are in place to protect delicate files.

## Final Project Directory Structure

```
./data_pipeline
./data_pipeline/preprocess.sh
./data_pipeline/monitor.sh
./data_pipeline/input
./data_pipeline/input/sales_data.csv
./data_pipeline/logs
./data_pipeline/logs/summary.log
./data_pipeline/logs/preprocess.log
./data_pipeline/output
./data_pipeline/output/cleaned_sales_data.csv

```



