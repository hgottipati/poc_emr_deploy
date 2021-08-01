drop table if exists commerce.tax_compliance_eg_booking_transactions_trans_date_liability;
CREATE EXTERNAL TABLE `commerce.tax_compliance_eg_booking_transactions_trans_date_liability`(
   `book_date` string
   ,`begin_use_date` string
   ,`end_use_date` string
   ,`business_model_name` string
   ,`business_model_subtype_name` string
   ,`room_night_count` int
   ,`booking_item_id` int
   ,`booking_id` int
   ,`transaction_type_name` string
   ,`stay_date` string
   ,`booking_event_datetime` string
   ,`source_system_id` int
   ,`base_price_amt_local` decimal(18,2)
   ,`purchase_base_price_amt_local` decimal(18,2)
   ,`purchase_totl_price_adj_amt_local` decimal(18,2)
   ,`purchase_totl_fee_price_amt_local` decimal(18,2)
   ,`purchase_totl_tax_price_amt_local` decimal(18,2)
   ,`purchase_price_currency_code` string
   ,`othr_price_adj_amt_local` decimal(18,2)
   ,`pnlty_price_adj_amt_local` decimal(18,2)
   ,`expe_pnlty_price_adj_amt_local` decimal(18,2)
   ,`totl_price_adj_amt_local` decimal(18,2)
   ,`svc_fee_price_amt_local` decimal(18,2)
   ,`totl_fee_price_amt_local` decimal(18,2)
   ,`totl_tax_price_amt_local` decimal(18,2)
   ,`svc_chrg_price_amt_local` decimal(18,2)
   ,`cncl_chg_fee_price_amt_local` decimal(18,2)
   ,`base_cost_amt_usd` decimal(18,2)
   ,`othr_cost_adj_amt_usd` decimal(18,2)
   ,`suppl_cost_adj_amt_usd` decimal(18,2)
   ,`totl_cost_adj_amt_usd` decimal(18,2)
   ,`totl_cost_amt_usd` decimal(18,2)
   ,`totl_fee_cost_amt_usd` decimal(18,2)
   ,`totl_tax_cost_amt_usd` decimal(18,2)
   ,`gross_bkg_amt_local` decimal(18,2)
   ,`property_id` int
   ,`price_currency_code` string
   ,`cost_currency_code` string
   ,`product_line_name` string
   ,`lgl_entity_code` string
   ,`lgl_entity_name` string
   ,`transaction_type_key` int
   ,`coupn_price_amt_local` decimal(18,2)
   ,`expe_gdwll_price_adj_amt_local` decimal(18,2)
   ,`gdwll_price_adj_amt_local` decimal(18,2)
   ,`genric_coupn_price_amt_local` decimal(18,2)
   ,`refund_price_adj_amt_local` decimal(18,2)
   ,`rebate_price_amt_local` decimal(18,2)
   ,`tcm_price_adj_amt_local` decimal(18,2)
   ,`cncl_pnlty_waivr_price_adj_amt_local` decimal(18,2)
   ,`loylty_point_price_adj_amt_local` decimal(18,2)
   ,`emp_disc_price_adj_amt_local` decimal(18,2)
   ,`suppl_recon_price_adj_amt_local` decimal(18,2)
   ,`travel_product_id` int
   ,`total_traveler_count` int
   ,`other_fee_price_amount_local` decimal(18,2)
   ,`agent_assisted_purchase_fee_amount_local` decimal(18,2)
   ,`point_of_sale_key` int
   ,`point_of_sale_brand_name` string
   ,`point_of_sale_name` string
   ,`management_unit_key` int
   ,`management_unit_code` string
   ,`management_unit_name` string
   ,`management_unit_level_6_name` string
   ,`oracle_gl_product_key` int
   ,`exceptions` array<struct<exception_code: int
                              ,exception_type: string
                              ,exception_description: string
                              ,is_critical_exception: boolean>>
   ,`event_info` struct<run_id: string
                              ,published_timestamp: string
                              ,event_uuid: string>
    ,`totl_cost_amt_local` decimal(18,2)
    ,`base_cost_amt_local` decimal(18,2)
    ,`totl_cost_adj_amt_local` decimal(18,2)
    ,`suppl_cost_adj_amt_local` decimal(18,2)
    ,`eca_cost_adj_amt_local` decimal(18,2)
    ,`othr_cost_adj_amt_local` decimal(18,2)
    ,`var_margn_cost_adj_local` decimal(18,2)
    ,`suppl_recon_cost_adj_amt_local` decimal(18,2)
    ,`totl_fee_cost_amt_local` decimal(18,2)
    ,`svc_chrg_cost_amt_local` decimal(18,2)
    ,`othr_fee_cost_amt_local` decimal(18,2)
    ,`eca_fee_cost_amt_local` decimal(18,2)
    ,`totl_tax_cost_amt_local` decimal(18,2)
    ,`var_margn_credt_local` decimal(18,2)
    ,`margn_amt_usd` decimal(18,2)
    ,`pure_margn_amt_usd` decimal(18,2)
    ,`extra_persn_cost_amt_local` decimal(18,2)
    ,`rate_pln_restr_cost_amt_local` decimal(18,2)
    ,`sngl_supplmnt_cost_amt_local` decimal(18,2)
    ,`dyn_rate_rule_cost_amt_local` decimal(18,2)
    ,`purchase_totl_cost_amt_local` decimal(18,2)
    ,`purchase_totl_tax_cost_amt_local` decimal(18,2)
    ,`purchase_totl_cost_adj_amt_local` decimal(18,2)
    ,`purchase_cost_currency_code` string
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
  's3://daps-cdfs-compliance-data/{git-branch-name}/tax_compliance_eg_booking_transactions_trans_date_liability';
MSCK REPAIR TABLE commerce.tax_compliance_eg_booking_transactions_trans_date_liability;


