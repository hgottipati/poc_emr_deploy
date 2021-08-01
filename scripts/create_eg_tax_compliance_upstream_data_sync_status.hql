DROP TABLE IF EXISTS commerce.tax_compliance_eg_upstream_data_sync_status;
CREATE EXTERNAL TABLE `commerce.tax_compliance_eg_upstream_data_sync_status`(
`run_id` String
,`replication_end_time` String
,`replication_mode` String
,`etl_date_time` String
,`workflow_to_be_triggered` String
,`product_line_name` String
)
PARTITIONED BY (
    `replication_date` date)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://daps-cdfs-compliance-data/{git-branch-name}/tax_compliance_eg_upstream_data_sync_status';
MSCK REPAIR TABLE commerce.tax_compliance_eg_upstream_data_sync_status;
