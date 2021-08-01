DROP TABLE IF EXISTS commerce.tax_compliance_eg_enriched_transactions_with_exception_temp;
CREATE EXTERNAL TABLE `commerce.tax_compliance_eg_enriched_transactions_with_exception_temp`(
`booking_id` int
,`booking_item_id` int
,`booking_event_date` string
,`booking_event_datetime` string
,`transaction_type_name` string
,`transaction_type_key` int
,`source_system_id` int
,`cost_currency_code` string
,`stay_date` string
,`event_info` struct<run_id: string
                           ,published_timestamp: string
                           ,event_uuid: string
                           ,post_to_tax_engine:boolean>
,`exceptions` array<struct<exception_code: int
                          ,exception_type: string
                          ,exception_description: string
                          ,is_critical_exception: boolean>>
)
PARTITIONED BY (
    `transaction_liability_date` string
    ,`transaction_liability_date_type` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://daps-cdfs-compliance-data/{git-branch-name}/tax_compliance_eg_enriched_transactions_with_exception_temp';
MSCK REPAIR TABLE commerce.tax_compliance_eg_enriched_transactions_with_exception_temp;
