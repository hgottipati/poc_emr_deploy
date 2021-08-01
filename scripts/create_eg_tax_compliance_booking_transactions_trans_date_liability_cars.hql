drop table if exists commerce.tax_compliance_eg_booking_transactions_trans_date_liability_cars;
CREATE EXTERNAL TABLE `commerce.tax_compliance_eg_booking_transactions_trans_date_liability_cars`(
    `book_date` string
   ,`begin_use_date` string
   ,`end_use_date` string
   ,`business_model_name` string
   ,`business_model_subtype_name` string
   ,`rental_day_count` int
   ,`booking_item_id` int
   ,`booking_id` int
   ,`booking_event_type_name` string
   ,`use_date` string
   ,`booking_event_datetime` string
   ,`source_system_id` int
   ,`base_price_amount_local` decimal(18,2)
   ,`other_price_adjustment_amount_local` decimal(18,2)
   ,`total_price_adjustment_amount_local` decimal(18,2)
   ,`total_fee_price_amount_local` decimal(18,2)
   ,`total_tax_price_amount_local` decimal(18,2)
   ,`cancel_change_fee_price_amount_local` decimal(18,2)
   ,`gross_booking_amount_local` decimal(18,2)
   ,`car_vendor_name` string
   ,`car_pick_up_location_name` string
   ,`car_pick_up_location_city_name` string
   ,`car_pick_up_location_state_province_name` string
   ,`car_pick_up_location_country_code` string
   ,`car_drop_off_location_name` string
   ,`car_drop_off_location_city_name` string
   ,`car_drop_off_location_state_province_name` string
   ,`car_drop_off_location_country_code` string
   ,`price_currency_code` string
   ,`cost_currency_code` string
   ,`product_line_name` string
   ,`legal_entity_code` string
   ,`legal_entity_name` string
   ,`booking_event_type_key` int
   ,`coupon_price_amount_local` decimal(18,2)
   ,`travel_product_id` int
   ,`other_fee_price_amount_local` decimal(18,2)
   ,`agent_assisted_purchase_fee_amount_local` decimal(18,2)
   ,`margin_amount_usd` decimal(18,2)
   ,`pure_margin_amount_usd` decimal(18,2)
   ,`base_cost_amount_local` decimal(18,2)
   ,`total_cost_adjustment_amount_local` decimal(18,2)
   ,`total_fee_cost_amount_local` decimal(18,2)
   ,`other_fee_cost_amount_local` decimal(18,2)
   ,`total_tax_cost_amount_local` decimal(18,2)
   ,`total_cost_amount_local` decimal(18,2)
   ,`management_unit_key` int
   ,`management_unit_code` string
   ,`management_unit_name` string
   ,`management_unit_level_6_name` string
   ,`oracle_gl_product_key` int
   ,`travel_record_locator` int
   ,`exceptions` array<struct<exception_code: int
                              ,exception_type: string
                              ,exception_description: string
                              ,is_critical_exception: boolean>>
   ,`event_info` struct<run_id: string
                              ,published_timestamp: string
                              ,event_uuid: string>
   )
    PARTITIONED BY (
     `booking_event_date` date)
   ROW FORMAT SERDE
     'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
   STORED AS INPUTFORMAT
     'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
   OUTPUTFORMAT
     'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
   LOCATION
     's3://daps-cdfs-compliance-data/{git-branch-name}/tax_compliance_eg_booking_transactions_trans_date_liability_cars';
   MSCK REPAIR TABLE commerce.tax_compliance_eg_booking_transactions_trans_date_liability_cars;
