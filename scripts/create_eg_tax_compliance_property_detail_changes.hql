drop table if exists commerce.tax_compliance_property_detail_changes;
CREATE EXTERNAL TABLE `commerce.tax_compliance_property_detail_changes`(
    `current_tax_area_id` String
    ,`previous_tax_area_id` String
    ,`current_geocode_override` String
    ,`previous_geocode_override` String
    ,`beardsley_property_id` int
    ,`property_source_id` string
    ,`property_status` String
    ,`seller_id` int
    ,`content_source` String
    ,`geocode_override_content_source` String
    ,`street_address1` String
    ,`street_address2` String
    ,`city` String
    ,`postal_code` String
    ,`Jurisdiction_Name` String
    ,`Jurisdiction_Level` String
)
    PARTITIONED BY (
        `published_date` date
        ,`country_code` string
        ,`state` String)
    ROW FORMAT SERDE
        'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
    STORED AS INPUTFORMAT
        'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
        OUTPUTFORMAT
            'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
    LOCATION
        's3://daps-cdfs-compliance-data/{git-branch-name}/tax_compliance_property_detail_changes';
MSCK REPAIR TABLE commerce.tax_compliance_property_detail_changes;
