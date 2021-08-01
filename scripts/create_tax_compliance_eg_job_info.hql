DROP TABLE IF EXISTS commerce.tax_compliance_eg_job_info;

CREATE EXTERNAL TABLE `commerce.tax_compliance_eg_job_info`(
`job_run_id` String
,`table_name` String
,`job_name` String
,`job_description` String
,`pipeline_process_type` String
,`workflow_type` String
,`job_update_date_time` String
,`run_status` String
,`is_active` String
,`triggered_by` String
,`start_liability_date` date
)
PARTITIONED BY (
    `end_liability_date` date)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://daps-cdfs-compliance-data/{git-branch-name}/tax_compliance_eg_job_info';
MSCK REPAIR TABLE commerce.tax_compliance_eg_job_info;
