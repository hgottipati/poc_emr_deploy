drop table if exists commerce.tax_compliance_eg_data_collector_job_info;
CREATE EXTERNAL TABLE `commerce.tax_compliance_eg_data_collector_job_info`(
`job_name` String
,`start_date` String
,`end_date` String
,`published_timestamp` String
)
PARTITIONED BY (
    `run_id` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://daps-cdfs-compliance-data/{git-branch-name}/tax_compliance_eg_data_collector_job_info';
MSCK REPAIR TABLE commerce.tax_compliance_eg_data_collector_job_info;
