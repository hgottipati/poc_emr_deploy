DROP TABLE IF EXISTS commerce.tax_compliance_eg_enriched_transactions;

 CREATE EXTERNAL TABLE `commerce.tax_compliance_eg_enriched_transactions`(
  `booking_item` struct<stay_date:string,
                        book_date:string,
                        begin_use_date:string,
                        end_use_date:string,
                        room_night_count:int,
                        booking_item_id:string,
                        booking_id:int,
                        source_system_id:int,
                        booking_event_date:string,
                        booking_event_datetime:string,
                        transaction_type_name:string,
                        business_model_name:string,
                        business_model_subtype_name:string,
                        product_line_name:string,
                        travel_product_id:int,
                        total_traveler_count:int,
                        transaction_type_key:int,
                        total_room_night_count:int,
                        night_number:int,
                        travel_record_locator:int>,
  `item_amount` struct<base_price_amount_local:decimal(18,2),
                        other_price_adjustment_amount_local:decimal(18,2),
                        penalty_price_adjustment_amount_local:decimal(18,2),
                        expedia_penalty_price_adjustment_amount_local:decimal(18,2),
                        total_price_adjustment_amount_local:decimal(18,2),
                        service_fee_price_amount_local:decimal(18,2),
                        total_fee_price_amount_local:decimal(18,2),
                        total_tax_price_amount_local:decimal(18,2),
                        service_charge_price_amount_local:decimal(18,2),
                        cancel_change_fee_price_amount_local:decimal(18,2),
                        base_cost_amount_usd:decimal(18,2),
                        other_cost_adjustment_amount_usd:decimal(18,2),
                        supplier_cost_adjustment_amount_usd:decimal(18,2),
                        total_cost_adjustment_amount_usd:decimal(18,2),
                        total_cost_amount_usd:decimal(18,2),
                        total_fee_cost_amount_usd:decimal(18,2),
                        total_tax_cost_amount_usd:decimal(18,2),
                        gross_booking_amount_local:decimal(18,2),
                        other_fee_price_amount_local:decimal(18,2),
                        agent_assisted_purchase_fee_amount_local:decimal(18,2),
                        price_currency_code:string,
                        cost_currency_code:string,
                        gross_booking_amount_usd:decimal(18,2),
                        exchange_rate_book_date:decimal(24,6),
                        exchange_rate_stay_date:decimal(24,6),
                        coupon_price_amount_local:decimal(18,2),
                        expedia_goodwill_price_adjustment_amount_local:decimal(18,2),
                        goodwill_price_adjustment_amount_local:decimal(18,2),
                        generic_coupon_price_amount_local:decimal(18,2),
                        refund_price_adjustment_amount_local:decimal(18,2),
                        rebate_price_amount_local:decimal(18,2),
                        tcm_price_adjustment_amount_local:decimal(18,2),
                        cancel_penalty_waiver_price_adjustment_amount_local:decimal(18,2),
                        loyalty_point_price_adjustment_amount_local:decimal(18,2),
                        employee_discount_price_adjustment_amount_local:decimal(18,2),
                        supplier_reconciliation_price_adjustment_amount_local:decimal(18,2),
                        penalty_amount_local:decimal(18,2),
                          tax_rate_book_date:decimal(18,6),
                          purchase_base_price_amount_local:decimal(18,2),
                          total_cost_amount_local:decimal(18,2),
                          base_cost_amount_local:decimal(18,2),
                          total_cost_adjustment_amount_local:decimal(18,2),
                          supplier_cost_adjustment_amount_local:decimal(18,2),
                          eca_cost_adjustment_amount_local:decimal(18,2),
                          other_cost_adjustment_amount_local:decimal(18,2),
                          variable_margin_cost_adjustment_amount_local:decimal(18,2),
                          supplier_reconciliation_cost_adjustment_local:decimal(18,2),
                          total_fee_cost_amount_local:decimal(18,2),
                          service_charge_cost_amount_local:decimal(18,2),
                          other_fee_cost_amount_local:decimal(18,2),
                          eca_fee_cost_amount_local:decimal(18,2),
                          total_tax_cost_amount_local:decimal(18,2),
                          variable_margin_credit_local:decimal(18,2),
                          margin_amount_usd:decimal(18,2),
                          pure_margin_amount_usd:decimal(18,2),
                          extra_person_cost_amount_local:decimal(18,2),
                          rate_plan_restriction_cost_amount_local:decimal(18,2),
                          single_supplement_cost_amount_local:decimal(18,2),
                          dynamic_rate_rule_cost_amount_local:decimal(18,2),
                          penalty_cost_amount_local:decimal(18,2),
                          tax_rate_book_date_cost:decimal(18,6),
                          exchange_rate_stay_date_cost:decimal(24,6)>,
  `property_item` struct<property_id:string,
                        property_name:string,
                        property_address_line_1:string,
                        property_address_line_2:string,
                        property_city_name:string,
                        property_state_province_name:string,
                        property_postal_code:string,
                        property_longitude:string,
                        property_latitude:string,
                        property_type_name:string,
                        property_country_code:string,
                        tax_area_id:string,
                        property_brand_id:int,
                        property_brand_name:string,
                        property_parent_chain_id:int,
                        property_parent_chain_name:string>,
  `booking_detail` struct<legal_entity_name:string,
                         legal_entity_code:string,
                         general_ledger_account:string,
                         general_ledger_liability_account:string,
                         point_of_sale_key:int,
                         point_of_sale_brand_name:string,
                         point_of_sale_name:string,
                         management_unit_key:int,
                         management_unit_code:string,
                         management_unit_name:string,
                         management_unit_level_6_name:string,
                         oracle_gl_product_key: int>,
  `event_info` struct<run_id:string,
                        published_timestamp:string,
                        event_uuid:string,
                        post_to_tax_engine:boolean>,
  `car_item` struct<car_vendor_name:string,
                    car_pick_up_location_name:string,
                    car_pick_up_location_city_name:string,
                    car_pick_up_location_state_province_name:string,
                    car_pick_up_location_country_code:string,
                    car_drop_off_location_name:string,
                    car_drop_off_location_city_name:string,
                    car_drop_off_location_state_province_name:string,
                    car_drop_off_location_country_code:string,
                    rental_day_count:int>
)
PARTITIONED BY (
  `transaction_liability_date` date,
  `transaction_liability_date_type` string,
  `product_line_name` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://daps-cdfs-compliance-data/{git-branch-name}/tax_compliance_eg_enriched_transactions';
MSCK REPAIR TABLE commerce.tax_compliance_eg_enriched_transactions;