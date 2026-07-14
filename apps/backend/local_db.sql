--
-- PostgreSQL database dump
--

\restrict nV2J2rOYgZTQ7YpmRlMFGi2BVBOsG0hfr6UuISm7zHvB62cnh5AuWJz9Di9wBVn

-- Dumped from database version 16.13
-- Dumped by pg_dump version 16.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.store_locale DROP CONSTRAINT IF EXISTS store_locale_store_id_foreign;
ALTER TABLE IF EXISTS ONLY public.store_currency DROP CONSTRAINT IF EXISTS store_currency_store_id_foreign;
ALTER TABLE IF EXISTS ONLY public.stock_location DROP CONSTRAINT IF EXISTS stock_location_address_id_foreign;
ALTER TABLE IF EXISTS ONLY public.shipping_option DROP CONSTRAINT IF EXISTS shipping_option_shipping_profile_id_foreign;
ALTER TABLE IF EXISTS ONLY public.shipping_option DROP CONSTRAINT IF EXISTS shipping_option_shipping_option_type_id_foreign;
ALTER TABLE IF EXISTS ONLY public.shipping_option DROP CONSTRAINT IF EXISTS shipping_option_service_zone_id_foreign;
ALTER TABLE IF EXISTS ONLY public.shipping_option_rule DROP CONSTRAINT IF EXISTS shipping_option_rule_shipping_option_id_foreign;
ALTER TABLE IF EXISTS ONLY public.shipping_option DROP CONSTRAINT IF EXISTS shipping_option_provider_id_foreign;
ALTER TABLE IF EXISTS ONLY public.service_zone DROP CONSTRAINT IF EXISTS service_zone_fulfillment_set_id_foreign;
ALTER TABLE IF EXISTS ONLY public.return_reason DROP CONSTRAINT IF EXISTS return_reason_parent_return_reason_id_foreign;
ALTER TABLE IF EXISTS ONLY public.reservation_item DROP CONSTRAINT IF EXISTS reservation_item_inventory_item_id_foreign;
ALTER TABLE IF EXISTS ONLY public.region_country DROP CONSTRAINT IF EXISTS region_country_region_id_foreign;
ALTER TABLE IF EXISTS ONLY public.refund DROP CONSTRAINT IF EXISTS refund_payment_id_foreign;
ALTER TABLE IF EXISTS ONLY public.provider_identity DROP CONSTRAINT IF EXISTS provider_identity_auth_identity_id_foreign;
ALTER TABLE IF EXISTS ONLY public.promotion_rule_value DROP CONSTRAINT IF EXISTS promotion_rule_value_promotion_rule_id_foreign;
ALTER TABLE IF EXISTS ONLY public.promotion_promotion_rule DROP CONSTRAINT IF EXISTS promotion_promotion_rule_promotion_rule_id_foreign;
ALTER TABLE IF EXISTS ONLY public.promotion_promotion_rule DROP CONSTRAINT IF EXISTS promotion_promotion_rule_promotion_id_foreign;
ALTER TABLE IF EXISTS ONLY public.promotion DROP CONSTRAINT IF EXISTS promotion_campaign_id_foreign;
ALTER TABLE IF EXISTS ONLY public.promotion_campaign_budget_usage DROP CONSTRAINT IF EXISTS promotion_campaign_budget_usage_budget_id_foreign;
ALTER TABLE IF EXISTS ONLY public.promotion_campaign_budget DROP CONSTRAINT IF EXISTS promotion_campaign_budget_campaign_id_foreign;
ALTER TABLE IF EXISTS ONLY public.promotion_application_method DROP CONSTRAINT IF EXISTS promotion_application_method_promotion_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_variant_product_image DROP CONSTRAINT IF EXISTS product_variant_product_image_image_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_variant DROP CONSTRAINT IF EXISTS product_variant_product_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_variant_option DROP CONSTRAINT IF EXISTS product_variant_option_variant_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_variant_option DROP CONSTRAINT IF EXISTS product_variant_option_option_value_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product DROP CONSTRAINT IF EXISTS product_type_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_tags DROP CONSTRAINT IF EXISTS product_tags_product_tag_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_tags DROP CONSTRAINT IF EXISTS product_tags_product_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_option_value DROP CONSTRAINT IF EXISTS product_option_value_option_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_option DROP CONSTRAINT IF EXISTS product_option_product_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product DROP CONSTRAINT IF EXISTS product_collection_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_category_product DROP CONSTRAINT IF EXISTS product_category_product_product_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_category_product DROP CONSTRAINT IF EXISTS product_category_product_product_category_id_foreign;
ALTER TABLE IF EXISTS ONLY public.product_category DROP CONSTRAINT IF EXISTS product_category_parent_category_id_foreign;
ALTER TABLE IF EXISTS ONLY public.price_rule DROP CONSTRAINT IF EXISTS price_rule_price_id_foreign;
ALTER TABLE IF EXISTS ONLY public.price DROP CONSTRAINT IF EXISTS price_price_set_id_foreign;
ALTER TABLE IF EXISTS ONLY public.price DROP CONSTRAINT IF EXISTS price_price_list_id_foreign;
ALTER TABLE IF EXISTS ONLY public.price_list_rule DROP CONSTRAINT IF EXISTS price_list_rule_price_list_id_foreign;
ALTER TABLE IF EXISTS ONLY public.payment_session DROP CONSTRAINT IF EXISTS payment_session_payment_collection_id_foreign;
ALTER TABLE IF EXISTS ONLY public.payment DROP CONSTRAINT IF EXISTS payment_payment_collection_id_foreign;
ALTER TABLE IF EXISTS ONLY public.payment_collection_payment_providers DROP CONSTRAINT IF EXISTS payment_collection_payment_providers_payment_pro_2d555_foreign;
ALTER TABLE IF EXISTS ONLY public.payment_collection_payment_providers DROP CONSTRAINT IF EXISTS payment_collection_payment_providers_payment_col_aa276_foreign;
ALTER TABLE IF EXISTS ONLY public.order_transaction DROP CONSTRAINT IF EXISTS order_transaction_order_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_summary DROP CONSTRAINT IF EXISTS order_summary_order_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_shipping DROP CONSTRAINT IF EXISTS order_shipping_order_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_shipping_method_tax_line DROP CONSTRAINT IF EXISTS order_shipping_method_tax_line_shipping_method_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_shipping_method_adjustment DROP CONSTRAINT IF EXISTS order_shipping_method_adjustment_shipping_method_id_foreign;
ALTER TABLE IF EXISTS ONLY public."order" DROP CONSTRAINT IF EXISTS order_shipping_address_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_line_item DROP CONSTRAINT IF EXISTS order_line_item_totals_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_line_item_tax_line DROP CONSTRAINT IF EXISTS order_line_item_tax_line_item_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_line_item_adjustment DROP CONSTRAINT IF EXISTS order_line_item_adjustment_item_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_item DROP CONSTRAINT IF EXISTS order_item_order_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_item DROP CONSTRAINT IF EXISTS order_item_item_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_credit_line DROP CONSTRAINT IF EXISTS order_credit_line_order_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_change DROP CONSTRAINT IF EXISTS order_change_order_id_foreign;
ALTER TABLE IF EXISTS ONLY public.order_change_action DROP CONSTRAINT IF EXISTS order_change_action_order_change_id_foreign;
ALTER TABLE IF EXISTS ONLY public."order" DROP CONSTRAINT IF EXISTS order_billing_address_id_foreign;
ALTER TABLE IF EXISTS ONLY public.notification DROP CONSTRAINT IF EXISTS notification_provider_id_foreign;
ALTER TABLE IF EXISTS ONLY public.inventory_level DROP CONSTRAINT IF EXISTS inventory_level_inventory_item_id_foreign;
ALTER TABLE IF EXISTS ONLY public.image DROP CONSTRAINT IF EXISTS image_product_id_foreign;
ALTER TABLE IF EXISTS ONLY public.geo_zone DROP CONSTRAINT IF EXISTS geo_zone_service_zone_id_foreign;
ALTER TABLE IF EXISTS ONLY public.fulfillment DROP CONSTRAINT IF EXISTS fulfillment_shipping_option_id_foreign;
ALTER TABLE IF EXISTS ONLY public.fulfillment DROP CONSTRAINT IF EXISTS fulfillment_provider_id_foreign;
ALTER TABLE IF EXISTS ONLY public.fulfillment_label DROP CONSTRAINT IF EXISTS fulfillment_label_fulfillment_id_foreign;
ALTER TABLE IF EXISTS ONLY public.fulfillment_item DROP CONSTRAINT IF EXISTS fulfillment_item_fulfillment_id_foreign;
ALTER TABLE IF EXISTS ONLY public.fulfillment DROP CONSTRAINT IF EXISTS fulfillment_delivery_address_id_foreign;
ALTER TABLE IF EXISTS ONLY public.customer_group_customer DROP CONSTRAINT IF EXISTS customer_group_customer_customer_id_foreign;
ALTER TABLE IF EXISTS ONLY public.customer_group_customer DROP CONSTRAINT IF EXISTS customer_group_customer_customer_group_id_foreign;
ALTER TABLE IF EXISTS ONLY public.customer_address DROP CONSTRAINT IF EXISTS customer_address_customer_id_foreign;
ALTER TABLE IF EXISTS ONLY public.credit_line DROP CONSTRAINT IF EXISTS credit_line_cart_id_foreign;
ALTER TABLE IF EXISTS ONLY public.cart_shipping_method_tax_line DROP CONSTRAINT IF EXISTS cart_shipping_method_tax_line_shipping_method_id_foreign;
ALTER TABLE IF EXISTS ONLY public.cart_shipping_method DROP CONSTRAINT IF EXISTS cart_shipping_method_cart_id_foreign;
ALTER TABLE IF EXISTS ONLY public.cart_shipping_method_adjustment DROP CONSTRAINT IF EXISTS cart_shipping_method_adjustment_shipping_method_id_foreign;
ALTER TABLE IF EXISTS ONLY public.cart DROP CONSTRAINT IF EXISTS cart_shipping_address_id_foreign;
ALTER TABLE IF EXISTS ONLY public.cart_line_item_tax_line DROP CONSTRAINT IF EXISTS cart_line_item_tax_line_item_id_foreign;
ALTER TABLE IF EXISTS ONLY public.cart_line_item DROP CONSTRAINT IF EXISTS cart_line_item_cart_id_foreign;
ALTER TABLE IF EXISTS ONLY public.cart_line_item_adjustment DROP CONSTRAINT IF EXISTS cart_line_item_adjustment_item_id_foreign;
ALTER TABLE IF EXISTS ONLY public.cart DROP CONSTRAINT IF EXISTS cart_billing_address_id_foreign;
ALTER TABLE IF EXISTS ONLY public.capture DROP CONSTRAINT IF EXISTS capture_payment_id_foreign;
ALTER TABLE IF EXISTS ONLY public.auth_verification_token DROP CONSTRAINT IF EXISTS auth_verification_token_provider_identity_id_foreign;
ALTER TABLE IF EXISTS ONLY public.auth_verification_token DROP CONSTRAINT IF EXISTS auth_verification_token_auth_identity_id_foreign;
ALTER TABLE IF EXISTS ONLY public.auth_mfa_recovery_code DROP CONSTRAINT IF EXISTS auth_mfa_recovery_code_auth_identity_id_foreign;
ALTER TABLE IF EXISTS ONLY public.auth_mfa_factor DROP CONSTRAINT IF EXISTS auth_mfa_factor_auth_identity_id_foreign;
ALTER TABLE IF EXISTS ONLY public.application_method_target_rules DROP CONSTRAINT IF EXISTS application_method_target_rules_promotion_rule_id_foreign;
ALTER TABLE IF EXISTS ONLY public.application_method_target_rules DROP CONSTRAINT IF EXISTS application_method_target_rules_application_method_id_foreign;
ALTER TABLE IF EXISTS ONLY public.application_method_buy_rules DROP CONSTRAINT IF EXISTS application_method_buy_rules_promotion_rule_id_foreign;
ALTER TABLE IF EXISTS ONLY public.application_method_buy_rules DROP CONSTRAINT IF EXISTS application_method_buy_rules_application_method_id_foreign;
ALTER TABLE IF EXISTS ONLY public.tax_region DROP CONSTRAINT IF EXISTS "FK_tax_region_provider_id";
ALTER TABLE IF EXISTS ONLY public.tax_region DROP CONSTRAINT IF EXISTS "FK_tax_region_parent_id";
ALTER TABLE IF EXISTS ONLY public.tax_rate DROP CONSTRAINT IF EXISTS "FK_tax_rate_tax_region_id";
ALTER TABLE IF EXISTS ONLY public.tax_rate_rule DROP CONSTRAINT IF EXISTS "FK_tax_rate_rule_tax_rate_id";
DROP INDEX IF EXISTS public.idx_script_name_unique;
DROP INDEX IF EXISTS public."IDX_workflow_execution_workflow_id_transaction_id_run_id_unique";
DROP INDEX IF EXISTS public."IDX_workflow_execution_workflow_id_transaction_id";
DROP INDEX IF EXISTS public."IDX_workflow_execution_workflow_id";
DROP INDEX IF EXISTS public."IDX_workflow_execution_updated_at_retention_time";
DROP INDEX IF EXISTS public."IDX_workflow_execution_transaction_id";
DROP INDEX IF EXISTS public."IDX_workflow_execution_state_updated_at";
DROP INDEX IF EXISTS public."IDX_workflow_execution_state";
DROP INDEX IF EXISTS public."IDX_workflow_execution_run_id";
DROP INDEX IF EXISTS public."IDX_workflow_execution_retention_time_updated_at_state";
DROP INDEX IF EXISTS public."IDX_workflow_execution_id";
DROP INDEX IF EXISTS public."IDX_workflow_execution_deleted_at";
DROP INDEX IF EXISTS public."IDX_view_configuration_user_id";
DROP INDEX IF EXISTS public."IDX_view_configuration_entity_user_id";
DROP INDEX IF EXISTS public."IDX_view_configuration_entity_is_system_default";
DROP INDEX IF EXISTS public."IDX_view_configuration_deleted_at";
DROP INDEX IF EXISTS public."IDX_variant_id_52b23597";
DROP INDEX IF EXISTS public."IDX_variant_id_17b4c4e35";
DROP INDEX IF EXISTS public."IDX_user_preference_user_id_key_unique";
DROP INDEX IF EXISTS public."IDX_user_preference_user_id";
DROP INDEX IF EXISTS public."IDX_user_preference_deleted_at";
DROP INDEX IF EXISTS public."IDX_user_id_64ff0c4c";
DROP INDEX IF EXISTS public."IDX_user_email_unique";
DROP INDEX IF EXISTS public."IDX_user_deleted_at";
DROP INDEX IF EXISTS public."IDX_unique_promotion_code";
DROP INDEX IF EXISTS public."IDX_type_value_unique";
DROP INDEX IF EXISTS public."IDX_tax_region_unique_country_province";
DROP INDEX IF EXISTS public."IDX_tax_region_unique_country_nullable_province";
DROP INDEX IF EXISTS public."IDX_tax_region_provider_id";
DROP INDEX IF EXISTS public."IDX_tax_region_parent_id";
DROP INDEX IF EXISTS public."IDX_tax_region_deleted_at";
DROP INDEX IF EXISTS public."IDX_tax_rate_tax_region_id";
DROP INDEX IF EXISTS public."IDX_tax_rate_rule_unique_rate_reference";
DROP INDEX IF EXISTS public."IDX_tax_rate_rule_tax_rate_id";
DROP INDEX IF EXISTS public."IDX_tax_rate_rule_reference_id";
DROP INDEX IF EXISTS public."IDX_tax_rate_rule_deleted_at";
DROP INDEX IF EXISTS public."IDX_tax_rate_deleted_at";
DROP INDEX IF EXISTS public."IDX_tax_provider_deleted_at";
DROP INDEX IF EXISTS public."IDX_tag_value_unique";
DROP INDEX IF EXISTS public."IDX_store_locale_store_id";
DROP INDEX IF EXISTS public."IDX_store_locale_deleted_at";
DROP INDEX IF EXISTS public."IDX_store_deleted_at";
DROP INDEX IF EXISTS public."IDX_store_currency_store_id";
DROP INDEX IF EXISTS public."IDX_store_currency_deleted_at";
DROP INDEX IF EXISTS public."IDX_stock_location_id_26d06f470";
DROP INDEX IF EXISTS public."IDX_stock_location_id_-e88adb96";
DROP INDEX IF EXISTS public."IDX_stock_location_id_-1e5992737";
DROP INDEX IF EXISTS public."IDX_stock_location_deleted_at";
DROP INDEX IF EXISTS public."IDX_stock_location_address_id_unique";
DROP INDEX IF EXISTS public."IDX_stock_location_address_deleted_at";
DROP INDEX IF EXISTS public."IDX_single_default_region";
DROP INDEX IF EXISTS public."IDX_shipping_profile_name_unique";
DROP INDEX IF EXISTS public."IDX_shipping_profile_id_17a262437";
DROP INDEX IF EXISTS public."IDX_shipping_profile_deleted_at";
DROP INDEX IF EXISTS public."IDX_shipping_option_type_deleted_at";
DROP INDEX IF EXISTS public."IDX_shipping_option_shipping_profile_id";
DROP INDEX IF EXISTS public."IDX_shipping_option_shipping_option_type_id";
DROP INDEX IF EXISTS public."IDX_shipping_option_service_zone_id";
DROP INDEX IF EXISTS public."IDX_shipping_option_rule_shipping_option_id";
DROP INDEX IF EXISTS public."IDX_shipping_option_rule_deleted_at";
DROP INDEX IF EXISTS public."IDX_shipping_option_provider_id";
DROP INDEX IF EXISTS public."IDX_shipping_option_id_ba32fa9c";
DROP INDEX IF EXISTS public."IDX_shipping_option_deleted_at";
DROP INDEX IF EXISTS public."IDX_shipping_method_tax_line_tax_rate_id";
DROP INDEX IF EXISTS public."IDX_shipping_method_option_id";
DROP INDEX IF EXISTS public."IDX_shipping_method_adjustment_promotion_id";
DROP INDEX IF EXISTS public."IDX_service_zone_name_unique";
DROP INDEX IF EXISTS public."IDX_service_zone_fulfillment_set_id";
DROP INDEX IF EXISTS public."IDX_service_zone_deleted_at";
DROP INDEX IF EXISTS public."IDX_sales_channel_id_26d06f470";
DROP INDEX IF EXISTS public."IDX_sales_channel_id_20b454295";
DROP INDEX IF EXISTS public."IDX_sales_channel_id_-1d67bae40";
DROP INDEX IF EXISTS public."IDX_sales_channel_deleted_at";
DROP INDEX IF EXISTS public."IDX_return_reason_value";
DROP INDEX IF EXISTS public."IDX_return_reason_parent_return_reason_id";
DROP INDEX IF EXISTS public."IDX_return_order_id";
DROP INDEX IF EXISTS public."IDX_return_item_return_id";
DROP INDEX IF EXISTS public."IDX_return_item_reason_id";
DROP INDEX IF EXISTS public."IDX_return_item_item_id";
DROP INDEX IF EXISTS public."IDX_return_item_deleted_at";
DROP INDEX IF EXISTS public."IDX_return_id_-31ea43a";
DROP INDEX IF EXISTS public."IDX_return_exchange_id";
DROP INDEX IF EXISTS public."IDX_return_display_id";
DROP INDEX IF EXISTS public."IDX_return_claim_id";
DROP INDEX IF EXISTS public."IDX_reservation_item_location_id";
DROP INDEX IF EXISTS public."IDX_reservation_item_line_item_id";
DROP INDEX IF EXISTS public."IDX_reservation_item_inventory_item_id";
DROP INDEX IF EXISTS public."IDX_reservation_item_deleted_at";
DROP INDEX IF EXISTS public."IDX_region_id_1c934dab0";
DROP INDEX IF EXISTS public."IDX_region_deleted_at";
DROP INDEX IF EXISTS public."IDX_region_country_region_id_iso_2_unique";
DROP INDEX IF EXISTS public."IDX_region_country_region_id";
DROP INDEX IF EXISTS public."IDX_region_country_deleted_at";
DROP INDEX IF EXISTS public."IDX_refund_refund_reason_id";
DROP INDEX IF EXISTS public."IDX_refund_reason_deleted_at";
DROP INDEX IF EXISTS public."IDX_refund_payment_id";
DROP INDEX IF EXISTS public."IDX_refund_deleted_at";
DROP INDEX IF EXISTS public."IDX_rbac_role_id_64ff0c4c";
DROP INDEX IF EXISTS public."IDX_rbac_role_id_-85069d44";
DROP INDEX IF EXISTS public."IDX_publishable_key_id_-1d67bae40";
DROP INDEX IF EXISTS public."IDX_provider_identity_provider_entity_id";
DROP INDEX IF EXISTS public."IDX_provider_identity_deleted_at";
DROP INDEX IF EXISTS public."IDX_provider_identity_auth_identity_id";
DROP INDEX IF EXISTS public."IDX_property_label_entity_property_unique";
DROP INDEX IF EXISTS public."IDX_property_label_entity";
DROP INDEX IF EXISTS public."IDX_property_label_deleted_at";
DROP INDEX IF EXISTS public."IDX_promotion_type";
DROP INDEX IF EXISTS public."IDX_promotion_status";
DROP INDEX IF EXISTS public."IDX_promotion_rule_value_value";
DROP INDEX IF EXISTS public."IDX_promotion_rule_value_rule_id_value";
DROP INDEX IF EXISTS public."IDX_promotion_rule_value_promotion_rule_id";
DROP INDEX IF EXISTS public."IDX_promotion_rule_value_deleted_at";
DROP INDEX IF EXISTS public."IDX_promotion_rule_operator";
DROP INDEX IF EXISTS public."IDX_promotion_rule_deleted_at";
DROP INDEX IF EXISTS public."IDX_promotion_rule_attribute_operator_id";
DROP INDEX IF EXISTS public."IDX_promotion_rule_attribute_operator";
DROP INDEX IF EXISTS public."IDX_promotion_rule_attribute";
DROP INDEX IF EXISTS public."IDX_promotion_is_automatic";
DROP INDEX IF EXISTS public."IDX_promotion_id_-a9d4a70b";
DROP INDEX IF EXISTS public."IDX_promotion_id_-71518339";
DROP INDEX IF EXISTS public."IDX_promotion_deleted_at";
DROP INDEX IF EXISTS public."IDX_promotion_campaign_id";
DROP INDEX IF EXISTS public."IDX_promotion_campaign_deleted_at";
DROP INDEX IF EXISTS public."IDX_promotion_campaign_campaign_identifier_unique";
DROP INDEX IF EXISTS public."IDX_promotion_campaign_budget_usage_deleted_at";
DROP INDEX IF EXISTS public."IDX_promotion_campaign_budget_usage_budget_id";
DROP INDEX IF EXISTS public."IDX_promotion_campaign_budget_usage_attribute_value_budget_id_u";
DROP INDEX IF EXISTS public."IDX_promotion_campaign_budget_deleted_at";
DROP INDEX IF EXISTS public."IDX_promotion_campaign_budget_campaign_id_unique";
DROP INDEX IF EXISTS public."IDX_promotion_application_method_promotion_id_unique";
DROP INDEX IF EXISTS public."IDX_promotion_application_method_deleted_at";
DROP INDEX IF EXISTS public."IDX_promotion_application_method_currency_code";
DROP INDEX IF EXISTS public."IDX_product_variant_upc_unique";
DROP INDEX IF EXISTS public."IDX_product_variant_sku_unique";
DROP INDEX IF EXISTS public."IDX_product_variant_product_image_variant_id";
DROP INDEX IF EXISTS public."IDX_product_variant_product_image_image_id";
DROP INDEX IF EXISTS public."IDX_product_variant_product_image_deleted_at";
DROP INDEX IF EXISTS public."IDX_product_variant_product_id";
DROP INDEX IF EXISTS public."IDX_product_variant_id_product_id";
DROP INDEX IF EXISTS public."IDX_product_variant_ean_unique";
DROP INDEX IF EXISTS public."IDX_product_variant_deleted_at";
DROP INDEX IF EXISTS public."IDX_product_variant_barcode_unique";
DROP INDEX IF EXISTS public."IDX_product_type_id";
DROP INDEX IF EXISTS public."IDX_product_type_deleted_at";
DROP INDEX IF EXISTS public."IDX_product_tag_deleted_at";
DROP INDEX IF EXISTS public."IDX_product_status";
DROP INDEX IF EXISTS public."IDX_product_option_value_option_id";
DROP INDEX IF EXISTS public."IDX_product_option_value_deleted_at";
DROP INDEX IF EXISTS public."IDX_product_option_product_id";
DROP INDEX IF EXISTS public."IDX_product_option_deleted_at";
DROP INDEX IF EXISTS public."IDX_product_image_url_rank_product_id";
DROP INDEX IF EXISTS public."IDX_product_image_url";
DROP INDEX IF EXISTS public."IDX_product_image_rank_product_id";
DROP INDEX IF EXISTS public."IDX_product_image_rank";
DROP INDEX IF EXISTS public."IDX_product_id_20b454295";
DROP INDEX IF EXISTS public."IDX_product_id_17a262437";
DROP INDEX IF EXISTS public."IDX_product_handle_unique";
DROP INDEX IF EXISTS public."IDX_product_deleted_at";
DROP INDEX IF EXISTS public."IDX_product_collection_id";
DROP INDEX IF EXISTS public."IDX_product_collection_deleted_at";
DROP INDEX IF EXISTS public."IDX_product_category_path";
DROP INDEX IF EXISTS public."IDX_product_category_parent_category_id";
DROP INDEX IF EXISTS public."IDX_price_set_id_ba32fa9c";
DROP INDEX IF EXISTS public."IDX_price_set_id_52b23597";
DROP INDEX IF EXISTS public."IDX_price_set_deleted_at";
DROP INDEX IF EXISTS public."IDX_price_rule_price_id_attribute_operator_unique";
DROP INDEX IF EXISTS public."IDX_price_rule_price_id";
DROP INDEX IF EXISTS public."IDX_price_rule_operator_value";
DROP INDEX IF EXISTS public."IDX_price_rule_operator";
DROP INDEX IF EXISTS public."IDX_price_rule_deleted_at";
DROP INDEX IF EXISTS public."IDX_price_rule_attribute_value_price_id";
DROP INDEX IF EXISTS public."IDX_price_rule_attribute_value";
DROP INDEX IF EXISTS public."IDX_price_rule_attribute";
DROP INDEX IF EXISTS public."IDX_price_price_set_id";
DROP INDEX IF EXISTS public."IDX_price_price_list_id";
DROP INDEX IF EXISTS public."IDX_price_preference_deleted_at";
DROP INDEX IF EXISTS public."IDX_price_preference_attribute_value";
DROP INDEX IF EXISTS public."IDX_price_list_rule_value";
DROP INDEX IF EXISTS public."IDX_price_list_rule_price_list_id";
DROP INDEX IF EXISTS public."IDX_price_list_rule_deleted_at";
DROP INDEX IF EXISTS public."IDX_price_list_rule_attribute";
DROP INDEX IF EXISTS public."IDX_price_list_id_status_starts_at_ends_at";
DROP INDEX IF EXISTS public."IDX_price_list_deleted_at";
DROP INDEX IF EXISTS public."IDX_price_deleted_at";
DROP INDEX IF EXISTS public."IDX_price_currency_code";
DROP INDEX IF EXISTS public."IDX_payment_session_payment_collection_id";
DROP INDEX IF EXISTS public."IDX_payment_session_deleted_at";
DROP INDEX IF EXISTS public."IDX_payment_provider_id_1c934dab0";
DROP INDEX IF EXISTS public."IDX_payment_provider_id";
DROP INDEX IF EXISTS public."IDX_payment_provider_deleted_at";
DROP INDEX IF EXISTS public."IDX_payment_payment_session_id_unique";
DROP INDEX IF EXISTS public."IDX_payment_payment_session_id";
DROP INDEX IF EXISTS public."IDX_payment_payment_collection_id";
DROP INDEX IF EXISTS public."IDX_payment_deleted_at";
DROP INDEX IF EXISTS public."IDX_payment_collection_id_f42b9949";
DROP INDEX IF EXISTS public."IDX_payment_collection_id_-4a39f6c9";
DROP INDEX IF EXISTS public."IDX_payment_collection_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_transaction_return_id";
DROP INDEX IF EXISTS public."IDX_order_transaction_reference_id";
DROP INDEX IF EXISTS public."IDX_order_transaction_order_id_version";
DROP INDEX IF EXISTS public."IDX_order_transaction_order_id";
DROP INDEX IF EXISTS public."IDX_order_transaction_exchange_id";
DROP INDEX IF EXISTS public."IDX_order_transaction_currency_code";
DROP INDEX IF EXISTS public."IDX_order_transaction_claim_id";
DROP INDEX IF EXISTS public."IDX_order_summary_order_id_version";
DROP INDEX IF EXISTS public."IDX_order_summary_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_shipping_shipping_method_id";
DROP INDEX IF EXISTS public."IDX_order_shipping_return_id";
DROP INDEX IF EXISTS public."IDX_order_shipping_order_id_version";
DROP INDEX IF EXISTS public."IDX_order_shipping_order_id";
DROP INDEX IF EXISTS public."IDX_order_shipping_method_tax_line_shipping_method_id";
DROP INDEX IF EXISTS public."IDX_order_shipping_method_shipping_option_id";
DROP INDEX IF EXISTS public."IDX_order_shipping_method_adjustment_version_shipping_method";
DROP INDEX IF EXISTS public."IDX_order_shipping_method_adjustment_shipping_method_id";
DROP INDEX IF EXISTS public."IDX_order_shipping_item_id";
DROP INDEX IF EXISTS public."IDX_order_shipping_exchange_id";
DROP INDEX IF EXISTS public."IDX_order_shipping_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_shipping_claim_id";
DROP INDEX IF EXISTS public."IDX_order_shipping_address_id";
DROP INDEX IF EXISTS public."IDX_order_sales_channel_id";
DROP INDEX IF EXISTS public."IDX_order_region_id";
DROP INDEX IF EXISTS public."IDX_order_line_item_variant_id";
DROP INDEX IF EXISTS public."IDX_order_line_item_tax_line_item_id";
DROP INDEX IF EXISTS public."IDX_order_line_item_product_id";
DROP INDEX IF EXISTS public."IDX_order_line_item_adjustment_item_id";
DROP INDEX IF EXISTS public."IDX_order_item_order_id_version";
DROP INDEX IF EXISTS public."IDX_order_item_order_id";
DROP INDEX IF EXISTS public."IDX_order_item_item_id";
DROP INDEX IF EXISTS public."IDX_order_item_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_is_draft_order";
DROP INDEX IF EXISTS public."IDX_order_id_f42b9949";
DROP INDEX IF EXISTS public."IDX_order_id_-e8d2543e";
DROP INDEX IF EXISTS public."IDX_order_id_-71518339";
DROP INDEX IF EXISTS public."IDX_order_id_-71069c16";
DROP INDEX IF EXISTS public."IDX_order_exchange_return_id";
DROP INDEX IF EXISTS public."IDX_order_exchange_order_id";
DROP INDEX IF EXISTS public."IDX_order_exchange_item_item_id";
DROP INDEX IF EXISTS public."IDX_order_exchange_item_exchange_id";
DROP INDEX IF EXISTS public."IDX_order_exchange_item_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_exchange_display_id";
DROP INDEX IF EXISTS public."IDX_order_exchange_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_display_id";
DROP INDEX IF EXISTS public."IDX_order_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_customer_id";
DROP INDEX IF EXISTS public."IDX_order_custom_display_id";
DROP INDEX IF EXISTS public."IDX_order_currency_code";
DROP INDEX IF EXISTS public."IDX_order_credit_line_order_id_version";
DROP INDEX IF EXISTS public."IDX_order_credit_line_order_id";
DROP INDEX IF EXISTS public."IDX_order_credit_line_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_claim_return_id";
DROP INDEX IF EXISTS public."IDX_order_claim_order_id";
DROP INDEX IF EXISTS public."IDX_order_claim_item_item_id";
DROP INDEX IF EXISTS public."IDX_order_claim_item_image_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_claim_item_image_claim_item_id";
DROP INDEX IF EXISTS public."IDX_order_claim_item_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_claim_item_claim_id";
DROP INDEX IF EXISTS public."IDX_order_claim_display_id";
DROP INDEX IF EXISTS public."IDX_order_claim_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_change_version";
DROP INDEX IF EXISTS public."IDX_order_change_status";
DROP INDEX IF EXISTS public."IDX_order_change_return_id";
DROP INDEX IF EXISTS public."IDX_order_change_order_id_version";
DROP INDEX IF EXISTS public."IDX_order_change_order_id";
DROP INDEX IF EXISTS public."IDX_order_change_exchange_id";
DROP INDEX IF EXISTS public."IDX_order_change_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_change_claim_id";
DROP INDEX IF EXISTS public."IDX_order_change_change_type";
DROP INDEX IF EXISTS public."IDX_order_change_action_return_id";
DROP INDEX IF EXISTS public."IDX_order_change_action_ordering";
DROP INDEX IF EXISTS public."IDX_order_change_action_order_id";
DROP INDEX IF EXISTS public."IDX_order_change_action_order_change_id";
DROP INDEX IF EXISTS public."IDX_order_change_action_exchange_id";
DROP INDEX IF EXISTS public."IDX_order_change_action_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_change_action_claim_id";
DROP INDEX IF EXISTS public."IDX_order_billing_address_id";
DROP INDEX IF EXISTS public."IDX_order_address_deleted_at";
DROP INDEX IF EXISTS public."IDX_order_address_customer_id";
DROP INDEX IF EXISTS public."IDX_option_value_option_id_unique";
DROP INDEX IF EXISTS public."IDX_option_product_id_title_unique";
DROP INDEX IF EXISTS public."IDX_notification_receiver_id";
DROP INDEX IF EXISTS public."IDX_notification_provider_id";
DROP INDEX IF EXISTS public."IDX_notification_provider_deleted_at";
DROP INDEX IF EXISTS public."IDX_notification_idempotency_key_unique";
DROP INDEX IF EXISTS public."IDX_notification_deleted_at";
DROP INDEX IF EXISTS public."IDX_line_item_variant_id";
DROP INDEX IF EXISTS public."IDX_line_item_tax_line_tax_rate_id";
DROP INDEX IF EXISTS public."IDX_line_item_product_type_id";
DROP INDEX IF EXISTS public."IDX_line_item_product_id";
DROP INDEX IF EXISTS public."IDX_line_item_adjustment_promotion_id";
DROP INDEX IF EXISTS public."IDX_invite_token";
DROP INDEX IF EXISTS public."IDX_invite_id_-85069d44";
DROP INDEX IF EXISTS public."IDX_invite_email_unique";
DROP INDEX IF EXISTS public."IDX_invite_deleted_at";
DROP INDEX IF EXISTS public."IDX_inventory_level_location_id_inventory_item_id";
DROP INDEX IF EXISTS public."IDX_inventory_level_location_id";
DROP INDEX IF EXISTS public."IDX_inventory_level_inventory_item_id";
DROP INDEX IF EXISTS public."IDX_inventory_level_deleted_at";
DROP INDEX IF EXISTS public."IDX_inventory_item_sku";
DROP INDEX IF EXISTS public."IDX_inventory_item_id_17b4c4e35";
DROP INDEX IF EXISTS public."IDX_inventory_item_deleted_at";
DROP INDEX IF EXISTS public."IDX_image_product_id";
DROP INDEX IF EXISTS public."IDX_image_deleted_at";
DROP INDEX IF EXISTS public."IDX_id_f42b9949";
DROP INDEX IF EXISTS public."IDX_id_ba32fa9c";
DROP INDEX IF EXISTS public."IDX_id_64ff0c4c";
DROP INDEX IF EXISTS public."IDX_id_5cb3a0c0";
DROP INDEX IF EXISTS public."IDX_id_52b23597";
DROP INDEX IF EXISTS public."IDX_id_26d06f470";
DROP INDEX IF EXISTS public."IDX_id_20b454295";
DROP INDEX IF EXISTS public."IDX_id_1c934dab0";
DROP INDEX IF EXISTS public."IDX_id_17b4c4e35";
DROP INDEX IF EXISTS public."IDX_id_17a262437";
DROP INDEX IF EXISTS public."IDX_id_-e8d2543e";
DROP INDEX IF EXISTS public."IDX_id_-e88adb96";
DROP INDEX IF EXISTS public."IDX_id_-a9d4a70b";
DROP INDEX IF EXISTS public."IDX_id_-85069d44";
DROP INDEX IF EXISTS public."IDX_id_-71518339";
DROP INDEX IF EXISTS public."IDX_id_-71069c16";
DROP INDEX IF EXISTS public."IDX_id_-4a39f6c9";
DROP INDEX IF EXISTS public."IDX_id_-31ea43a";
DROP INDEX IF EXISTS public."IDX_id_-1e5992737";
DROP INDEX IF EXISTS public."IDX_id_-1d67bae40";
DROP INDEX IF EXISTS public."IDX_geo_zone_service_zone_id";
DROP INDEX IF EXISTS public."IDX_geo_zone_province_code";
DROP INDEX IF EXISTS public."IDX_geo_zone_deleted_at";
DROP INDEX IF EXISTS public."IDX_geo_zone_country_code";
DROP INDEX IF EXISTS public."IDX_geo_zone_city";
DROP INDEX IF EXISTS public."IDX_fulfillment_shipping_option_id";
DROP INDEX IF EXISTS public."IDX_fulfillment_set_name_unique";
DROP INDEX IF EXISTS public."IDX_fulfillment_set_id_-e88adb96";
DROP INDEX IF EXISTS public."IDX_fulfillment_set_deleted_at";
DROP INDEX IF EXISTS public."IDX_fulfillment_provider_id_-1e5992737";
DROP INDEX IF EXISTS public."IDX_fulfillment_provider_deleted_at";
DROP INDEX IF EXISTS public."IDX_fulfillment_location_id";
DROP INDEX IF EXISTS public."IDX_fulfillment_label_fulfillment_id";
DROP INDEX IF EXISTS public."IDX_fulfillment_label_deleted_at";
DROP INDEX IF EXISTS public."IDX_fulfillment_item_line_item_id";
DROP INDEX IF EXISTS public."IDX_fulfillment_item_inventory_item_id";
DROP INDEX IF EXISTS public."IDX_fulfillment_item_fulfillment_id";
DROP INDEX IF EXISTS public."IDX_fulfillment_item_deleted_at";
DROP INDEX IF EXISTS public."IDX_fulfillment_id_-e8d2543e";
DROP INDEX IF EXISTS public."IDX_fulfillment_id_-31ea43a";
DROP INDEX IF EXISTS public."IDX_fulfillment_deleted_at";
DROP INDEX IF EXISTS public."IDX_fulfillment_address_deleted_at";
DROP INDEX IF EXISTS public."IDX_deleted_at_f42b9949";
DROP INDEX IF EXISTS public."IDX_deleted_at_ba32fa9c";
DROP INDEX IF EXISTS public."IDX_deleted_at_64ff0c4c";
DROP INDEX IF EXISTS public."IDX_deleted_at_5cb3a0c0";
DROP INDEX IF EXISTS public."IDX_deleted_at_52b23597";
DROP INDEX IF EXISTS public."IDX_deleted_at_26d06f470";
DROP INDEX IF EXISTS public."IDX_deleted_at_20b454295";
DROP INDEX IF EXISTS public."IDX_deleted_at_1c934dab0";
DROP INDEX IF EXISTS public."IDX_deleted_at_17b4c4e35";
DROP INDEX IF EXISTS public."IDX_deleted_at_17a262437";
DROP INDEX IF EXISTS public."IDX_deleted_at_-e8d2543e";
DROP INDEX IF EXISTS public."IDX_deleted_at_-e88adb96";
DROP INDEX IF EXISTS public."IDX_deleted_at_-a9d4a70b";
DROP INDEX IF EXISTS public."IDX_deleted_at_-85069d44";
DROP INDEX IF EXISTS public."IDX_deleted_at_-71518339";
DROP INDEX IF EXISTS public."IDX_deleted_at_-71069c16";
DROP INDEX IF EXISTS public."IDX_deleted_at_-4a39f6c9";
DROP INDEX IF EXISTS public."IDX_deleted_at_-31ea43a";
DROP INDEX IF EXISTS public."IDX_deleted_at_-1e5992737";
DROP INDEX IF EXISTS public."IDX_deleted_at_-1d67bae40";
DROP INDEX IF EXISTS public."IDX_customer_id_5cb3a0c0";
DROP INDEX IF EXISTS public."IDX_customer_group_name_unique";
DROP INDEX IF EXISTS public."IDX_customer_group_deleted_at";
DROP INDEX IF EXISTS public."IDX_customer_group_customer_deleted_at";
DROP INDEX IF EXISTS public."IDX_customer_group_customer_customer_id";
DROP INDEX IF EXISTS public."IDX_customer_group_customer_customer_group_id";
DROP INDEX IF EXISTS public."IDX_customer_email_has_account_unique";
DROP INDEX IF EXISTS public."IDX_customer_deleted_at";
DROP INDEX IF EXISTS public."IDX_customer_address_unique_customer_shipping";
DROP INDEX IF EXISTS public."IDX_customer_address_unique_customer_billing";
DROP INDEX IF EXISTS public."IDX_customer_address_deleted_at";
DROP INDEX IF EXISTS public."IDX_customer_address_customer_id";
DROP INDEX IF EXISTS public."IDX_credit_line_deleted_at";
DROP INDEX IF EXISTS public."IDX_credit_line_cart_id";
DROP INDEX IF EXISTS public."IDX_collection_handle_unique";
DROP INDEX IF EXISTS public."IDX_category_handle_unique";
DROP INDEX IF EXISTS public."IDX_cart_shipping_method_tax_line_shipping_method_id";
DROP INDEX IF EXISTS public."IDX_cart_shipping_method_tax_line_deleted_at";
DROP INDEX IF EXISTS public."IDX_cart_shipping_method_deleted_at";
DROP INDEX IF EXISTS public."IDX_cart_shipping_method_cart_id";
DROP INDEX IF EXISTS public."IDX_cart_shipping_method_adjustment_shipping_method_id";
DROP INDEX IF EXISTS public."IDX_cart_shipping_method_adjustment_deleted_at";
DROP INDEX IF EXISTS public."IDX_cart_shipping_address_id";
DROP INDEX IF EXISTS public."IDX_cart_sales_channel_id";
DROP INDEX IF EXISTS public."IDX_cart_region_id";
DROP INDEX IF EXISTS public."IDX_cart_line_item_tax_line_item_id";
DROP INDEX IF EXISTS public."IDX_cart_line_item_tax_line_deleted_at";
DROP INDEX IF EXISTS public."IDX_cart_line_item_deleted_at";
DROP INDEX IF EXISTS public."IDX_cart_line_item_cart_id";
DROP INDEX IF EXISTS public."IDX_cart_line_item_adjustment_item_id";
DROP INDEX IF EXISTS public."IDX_cart_line_item_adjustment_deleted_at";
DROP INDEX IF EXISTS public."IDX_cart_id_-a9d4a70b";
DROP INDEX IF EXISTS public."IDX_cart_id_-71069c16";
DROP INDEX IF EXISTS public."IDX_cart_id_-4a39f6c9";
DROP INDEX IF EXISTS public."IDX_cart_deleted_at";
DROP INDEX IF EXISTS public."IDX_cart_customer_id";
DROP INDEX IF EXISTS public."IDX_cart_currency_code";
DROP INDEX IF EXISTS public."IDX_cart_credit_line_reference_reference_id";
DROP INDEX IF EXISTS public."IDX_cart_billing_address_id";
DROP INDEX IF EXISTS public."IDX_cart_address_deleted_at";
DROP INDEX IF EXISTS public."IDX_capture_payment_id";
DROP INDEX IF EXISTS public."IDX_capture_deleted_at";
DROP INDEX IF EXISTS public."IDX_campaign_budget_type";
DROP INDEX IF EXISTS public."IDX_auth_verification_token_token_hash";
DROP INDEX IF EXISTS public."IDX_auth_verification_token_provider_identity_id";
DROP INDEX IF EXISTS public."IDX_auth_verification_token_expires_at";
DROP INDEX IF EXISTS public."IDX_auth_verification_token_deleted_at";
DROP INDEX IF EXISTS public."IDX_auth_verification_token_auth_identity_id";
DROP INDEX IF EXISTS public."IDX_auth_mfa_recovery_code_deleted_at";
DROP INDEX IF EXISTS public."IDX_auth_mfa_recovery_code_auth_identity_id";
DROP INDEX IF EXISTS public."IDX_auth_mfa_recovery_code_auth_identity_code_hash";
DROP INDEX IF EXISTS public."IDX_auth_mfa_factor_deleted_at";
DROP INDEX IF EXISTS public."IDX_auth_mfa_factor_auth_identity_provider_active";
DROP INDEX IF EXISTS public."IDX_auth_mfa_factor_auth_identity_id";
DROP INDEX IF EXISTS public."IDX_auth_identity_deleted_at";
DROP INDEX IF EXISTS public."IDX_application_method_type";
DROP INDEX IF EXISTS public."IDX_application_method_target_type";
DROP INDEX IF EXISTS public."IDX_application_method_allocation";
DROP INDEX IF EXISTS public."IDX_api_key_type";
DROP INDEX IF EXISTS public."IDX_api_key_token_unique";
DROP INDEX IF EXISTS public."IDX_api_key_revoked_at";
DROP INDEX IF EXISTS public."IDX_api_key_redacted";
DROP INDEX IF EXISTS public."IDX_api_key_deleted_at";
DROP INDEX IF EXISTS public."IDX_account_holder_provider_id_external_id_unique";
DROP INDEX IF EXISTS public."IDX_account_holder_id_5cb3a0c0";
DROP INDEX IF EXISTS public."IDX_account_holder_deleted_at";
ALTER TABLE IF EXISTS ONLY public.workflow_execution DROP CONSTRAINT IF EXISTS workflow_execution_pkey;
ALTER TABLE IF EXISTS ONLY public.view_configuration DROP CONSTRAINT IF EXISTS view_configuration_pkey;
ALTER TABLE IF EXISTS ONLY public.user_rbac_role DROP CONSTRAINT IF EXISTS user_rbac_role_pkey;
ALTER TABLE IF EXISTS ONLY public.user_preference DROP CONSTRAINT IF EXISTS user_preference_pkey;
ALTER TABLE IF EXISTS ONLY public."user" DROP CONSTRAINT IF EXISTS user_pkey;
ALTER TABLE IF EXISTS ONLY public.tax_region DROP CONSTRAINT IF EXISTS tax_region_pkey;
ALTER TABLE IF EXISTS ONLY public.tax_rate_rule DROP CONSTRAINT IF EXISTS tax_rate_rule_pkey;
ALTER TABLE IF EXISTS ONLY public.tax_rate DROP CONSTRAINT IF EXISTS tax_rate_pkey;
ALTER TABLE IF EXISTS ONLY public.tax_provider DROP CONSTRAINT IF EXISTS tax_provider_pkey;
ALTER TABLE IF EXISTS ONLY public.store DROP CONSTRAINT IF EXISTS store_pkey;
ALTER TABLE IF EXISTS ONLY public.store_locale DROP CONSTRAINT IF EXISTS store_locale_pkey;
ALTER TABLE IF EXISTS ONLY public.store_currency DROP CONSTRAINT IF EXISTS store_currency_pkey;
ALTER TABLE IF EXISTS ONLY public.stock_location DROP CONSTRAINT IF EXISTS stock_location_pkey;
ALTER TABLE IF EXISTS ONLY public.stock_location_address DROP CONSTRAINT IF EXISTS stock_location_address_pkey;
ALTER TABLE IF EXISTS ONLY public.shipping_profile DROP CONSTRAINT IF EXISTS shipping_profile_pkey;
ALTER TABLE IF EXISTS ONLY public.shipping_option_type DROP CONSTRAINT IF EXISTS shipping_option_type_pkey;
ALTER TABLE IF EXISTS ONLY public.shipping_option_rule DROP CONSTRAINT IF EXISTS shipping_option_rule_pkey;
ALTER TABLE IF EXISTS ONLY public.shipping_option_price_set DROP CONSTRAINT IF EXISTS shipping_option_price_set_pkey;
ALTER TABLE IF EXISTS ONLY public.shipping_option DROP CONSTRAINT IF EXISTS shipping_option_pkey;
ALTER TABLE IF EXISTS ONLY public.service_zone DROP CONSTRAINT IF EXISTS service_zone_pkey;
ALTER TABLE IF EXISTS ONLY public.script_migrations DROP CONSTRAINT IF EXISTS script_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.sales_channel_stock_location DROP CONSTRAINT IF EXISTS sales_channel_stock_location_pkey;
ALTER TABLE IF EXISTS ONLY public.sales_channel DROP CONSTRAINT IF EXISTS sales_channel_pkey;
ALTER TABLE IF EXISTS ONLY public.return_reason DROP CONSTRAINT IF EXISTS return_reason_pkey;
ALTER TABLE IF EXISTS ONLY public.return DROP CONSTRAINT IF EXISTS return_pkey;
ALTER TABLE IF EXISTS ONLY public.return_item DROP CONSTRAINT IF EXISTS return_item_pkey;
ALTER TABLE IF EXISTS ONLY public.return_fulfillment DROP CONSTRAINT IF EXISTS return_fulfillment_pkey;
ALTER TABLE IF EXISTS ONLY public.reservation_item DROP CONSTRAINT IF EXISTS reservation_item_pkey;
ALTER TABLE IF EXISTS ONLY public.region DROP CONSTRAINT IF EXISTS region_pkey;
ALTER TABLE IF EXISTS ONLY public.region_payment_provider DROP CONSTRAINT IF EXISTS region_payment_provider_pkey;
ALTER TABLE IF EXISTS ONLY public.region_country DROP CONSTRAINT IF EXISTS region_country_pkey;
ALTER TABLE IF EXISTS ONLY public.refund_reason DROP CONSTRAINT IF EXISTS refund_reason_pkey;
ALTER TABLE IF EXISTS ONLY public.refund DROP CONSTRAINT IF EXISTS refund_pkey;
ALTER TABLE IF EXISTS ONLY public.publishable_api_key_sales_channel DROP CONSTRAINT IF EXISTS publishable_api_key_sales_channel_pkey;
ALTER TABLE IF EXISTS ONLY public.provider_identity DROP CONSTRAINT IF EXISTS provider_identity_pkey;
ALTER TABLE IF EXISTS ONLY public.property_label DROP CONSTRAINT IF EXISTS property_label_pkey;
ALTER TABLE IF EXISTS ONLY public.promotion_rule_value DROP CONSTRAINT IF EXISTS promotion_rule_value_pkey;
ALTER TABLE IF EXISTS ONLY public.promotion_rule DROP CONSTRAINT IF EXISTS promotion_rule_pkey;
ALTER TABLE IF EXISTS ONLY public.promotion_promotion_rule DROP CONSTRAINT IF EXISTS promotion_promotion_rule_pkey;
ALTER TABLE IF EXISTS ONLY public.promotion DROP CONSTRAINT IF EXISTS promotion_pkey;
ALTER TABLE IF EXISTS ONLY public.promotion_campaign DROP CONSTRAINT IF EXISTS promotion_campaign_pkey;
ALTER TABLE IF EXISTS ONLY public.promotion_campaign_budget_usage DROP CONSTRAINT IF EXISTS promotion_campaign_budget_usage_pkey;
ALTER TABLE IF EXISTS ONLY public.promotion_campaign_budget DROP CONSTRAINT IF EXISTS promotion_campaign_budget_pkey;
ALTER TABLE IF EXISTS ONLY public.promotion_application_method DROP CONSTRAINT IF EXISTS promotion_application_method_pkey;
ALTER TABLE IF EXISTS ONLY public.product_variant_product_image DROP CONSTRAINT IF EXISTS product_variant_product_image_pkey;
ALTER TABLE IF EXISTS ONLY public.product_variant_price_set DROP CONSTRAINT IF EXISTS product_variant_price_set_pkey;
ALTER TABLE IF EXISTS ONLY public.product_variant DROP CONSTRAINT IF EXISTS product_variant_pkey;
ALTER TABLE IF EXISTS ONLY public.product_variant_option DROP CONSTRAINT IF EXISTS product_variant_option_pkey;
ALTER TABLE IF EXISTS ONLY public.product_variant_inventory_item DROP CONSTRAINT IF EXISTS product_variant_inventory_item_pkey;
ALTER TABLE IF EXISTS ONLY public.product_type DROP CONSTRAINT IF EXISTS product_type_pkey;
ALTER TABLE IF EXISTS ONLY public.product_tags DROP CONSTRAINT IF EXISTS product_tags_pkey;
ALTER TABLE IF EXISTS ONLY public.product_tag DROP CONSTRAINT IF EXISTS product_tag_pkey;
ALTER TABLE IF EXISTS ONLY public.product_shipping_profile DROP CONSTRAINT IF EXISTS product_shipping_profile_pkey;
ALTER TABLE IF EXISTS ONLY public.product_sales_channel DROP CONSTRAINT IF EXISTS product_sales_channel_pkey;
ALTER TABLE IF EXISTS ONLY public.product DROP CONSTRAINT IF EXISTS product_pkey;
ALTER TABLE IF EXISTS ONLY public.product_option_value DROP CONSTRAINT IF EXISTS product_option_value_pkey;
ALTER TABLE IF EXISTS ONLY public.product_option DROP CONSTRAINT IF EXISTS product_option_pkey;
ALTER TABLE IF EXISTS ONLY public.product_collection DROP CONSTRAINT IF EXISTS product_collection_pkey;
ALTER TABLE IF EXISTS ONLY public.product_category_product DROP CONSTRAINT IF EXISTS product_category_product_pkey;
ALTER TABLE IF EXISTS ONLY public.product_category DROP CONSTRAINT IF EXISTS product_category_pkey;
ALTER TABLE IF EXISTS ONLY public.price_set DROP CONSTRAINT IF EXISTS price_set_pkey;
ALTER TABLE IF EXISTS ONLY public.price_rule DROP CONSTRAINT IF EXISTS price_rule_pkey;
ALTER TABLE IF EXISTS ONLY public.price_preference DROP CONSTRAINT IF EXISTS price_preference_pkey;
ALTER TABLE IF EXISTS ONLY public.price DROP CONSTRAINT IF EXISTS price_pkey;
ALTER TABLE IF EXISTS ONLY public.price_list_rule DROP CONSTRAINT IF EXISTS price_list_rule_pkey;
ALTER TABLE IF EXISTS ONLY public.price_list DROP CONSTRAINT IF EXISTS price_list_pkey;
ALTER TABLE IF EXISTS ONLY public.payment_session DROP CONSTRAINT IF EXISTS payment_session_pkey;
ALTER TABLE IF EXISTS ONLY public.payment_provider DROP CONSTRAINT IF EXISTS payment_provider_pkey;
ALTER TABLE IF EXISTS ONLY public.payment DROP CONSTRAINT IF EXISTS payment_pkey;
ALTER TABLE IF EXISTS ONLY public.payment_collection DROP CONSTRAINT IF EXISTS payment_collection_pkey;
ALTER TABLE IF EXISTS ONLY public.payment_collection_payment_providers DROP CONSTRAINT IF EXISTS payment_collection_payment_providers_pkey;
ALTER TABLE IF EXISTS ONLY public.order_transaction DROP CONSTRAINT IF EXISTS order_transaction_pkey;
ALTER TABLE IF EXISTS ONLY public.order_summary DROP CONSTRAINT IF EXISTS order_summary_pkey;
ALTER TABLE IF EXISTS ONLY public.order_shipping DROP CONSTRAINT IF EXISTS order_shipping_pkey;
ALTER TABLE IF EXISTS ONLY public.order_shipping_method_tax_line DROP CONSTRAINT IF EXISTS order_shipping_method_tax_line_pkey;
ALTER TABLE IF EXISTS ONLY public.order_shipping_method DROP CONSTRAINT IF EXISTS order_shipping_method_pkey;
ALTER TABLE IF EXISTS ONLY public.order_shipping_method_adjustment DROP CONSTRAINT IF EXISTS order_shipping_method_adjustment_pkey;
ALTER TABLE IF EXISTS ONLY public.order_promotion DROP CONSTRAINT IF EXISTS order_promotion_pkey;
ALTER TABLE IF EXISTS ONLY public."order" DROP CONSTRAINT IF EXISTS order_pkey;
ALTER TABLE IF EXISTS ONLY public.order_payment_collection DROP CONSTRAINT IF EXISTS order_payment_collection_pkey;
ALTER TABLE IF EXISTS ONLY public.order_line_item_tax_line DROP CONSTRAINT IF EXISTS order_line_item_tax_line_pkey;
ALTER TABLE IF EXISTS ONLY public.order_line_item DROP CONSTRAINT IF EXISTS order_line_item_pkey;
ALTER TABLE IF EXISTS ONLY public.order_line_item_adjustment DROP CONSTRAINT IF EXISTS order_line_item_adjustment_pkey;
ALTER TABLE IF EXISTS ONLY public.order_item DROP CONSTRAINT IF EXISTS order_item_pkey;
ALTER TABLE IF EXISTS ONLY public.order_fulfillment DROP CONSTRAINT IF EXISTS order_fulfillment_pkey;
ALTER TABLE IF EXISTS ONLY public.order_exchange DROP CONSTRAINT IF EXISTS order_exchange_pkey;
ALTER TABLE IF EXISTS ONLY public.order_exchange_item DROP CONSTRAINT IF EXISTS order_exchange_item_pkey;
ALTER TABLE IF EXISTS ONLY public.order_credit_line DROP CONSTRAINT IF EXISTS order_credit_line_pkey;
ALTER TABLE IF EXISTS ONLY public.order_claim DROP CONSTRAINT IF EXISTS order_claim_pkey;
ALTER TABLE IF EXISTS ONLY public.order_claim_item DROP CONSTRAINT IF EXISTS order_claim_item_pkey;
ALTER TABLE IF EXISTS ONLY public.order_claim_item_image DROP CONSTRAINT IF EXISTS order_claim_item_image_pkey;
ALTER TABLE IF EXISTS ONLY public.order_change DROP CONSTRAINT IF EXISTS order_change_pkey;
ALTER TABLE IF EXISTS ONLY public.order_change_action DROP CONSTRAINT IF EXISTS order_change_action_pkey;
ALTER TABLE IF EXISTS ONLY public.order_cart DROP CONSTRAINT IF EXISTS order_cart_pkey;
ALTER TABLE IF EXISTS ONLY public.order_address DROP CONSTRAINT IF EXISTS order_address_pkey;
ALTER TABLE IF EXISTS ONLY public.notification_provider DROP CONSTRAINT IF EXISTS notification_provider_pkey;
ALTER TABLE IF EXISTS ONLY public.notification DROP CONSTRAINT IF EXISTS notification_pkey;
ALTER TABLE IF EXISTS ONLY public.mikro_orm_migrations DROP CONSTRAINT IF EXISTS mikro_orm_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.location_fulfillment_set DROP CONSTRAINT IF EXISTS location_fulfillment_set_pkey;
ALTER TABLE IF EXISTS ONLY public.location_fulfillment_provider DROP CONSTRAINT IF EXISTS location_fulfillment_provider_pkey;
ALTER TABLE IF EXISTS ONLY public.link_module_migrations DROP CONSTRAINT IF EXISTS link_module_migrations_table_name_key;
ALTER TABLE IF EXISTS ONLY public.link_module_migrations DROP CONSTRAINT IF EXISTS link_module_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.invite_rbac_role DROP CONSTRAINT IF EXISTS invite_rbac_role_pkey;
ALTER TABLE IF EXISTS ONLY public.invite DROP CONSTRAINT IF EXISTS invite_pkey;
ALTER TABLE IF EXISTS ONLY public.inventory_level DROP CONSTRAINT IF EXISTS inventory_level_pkey;
ALTER TABLE IF EXISTS ONLY public.inventory_item DROP CONSTRAINT IF EXISTS inventory_item_pkey;
ALTER TABLE IF EXISTS ONLY public.image DROP CONSTRAINT IF EXISTS image_pkey;
ALTER TABLE IF EXISTS ONLY public.geo_zone DROP CONSTRAINT IF EXISTS geo_zone_pkey;
ALTER TABLE IF EXISTS ONLY public.fulfillment_set DROP CONSTRAINT IF EXISTS fulfillment_set_pkey;
ALTER TABLE IF EXISTS ONLY public.fulfillment_provider DROP CONSTRAINT IF EXISTS fulfillment_provider_pkey;
ALTER TABLE IF EXISTS ONLY public.fulfillment DROP CONSTRAINT IF EXISTS fulfillment_pkey;
ALTER TABLE IF EXISTS ONLY public.fulfillment_label DROP CONSTRAINT IF EXISTS fulfillment_label_pkey;
ALTER TABLE IF EXISTS ONLY public.fulfillment_item DROP CONSTRAINT IF EXISTS fulfillment_item_pkey;
ALTER TABLE IF EXISTS ONLY public.fulfillment_address DROP CONSTRAINT IF EXISTS fulfillment_address_pkey;
ALTER TABLE IF EXISTS ONLY public.customer DROP CONSTRAINT IF EXISTS customer_pkey;
ALTER TABLE IF EXISTS ONLY public.customer_group DROP CONSTRAINT IF EXISTS customer_group_pkey;
ALTER TABLE IF EXISTS ONLY public.customer_group_customer DROP CONSTRAINT IF EXISTS customer_group_customer_pkey;
ALTER TABLE IF EXISTS ONLY public.customer_address DROP CONSTRAINT IF EXISTS customer_address_pkey;
ALTER TABLE IF EXISTS ONLY public.customer_account_holder DROP CONSTRAINT IF EXISTS customer_account_holder_pkey;
ALTER TABLE IF EXISTS ONLY public.currency DROP CONSTRAINT IF EXISTS currency_pkey;
ALTER TABLE IF EXISTS ONLY public.credit_line DROP CONSTRAINT IF EXISTS credit_line_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_shipping_method_tax_line DROP CONSTRAINT IF EXISTS cart_shipping_method_tax_line_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_shipping_method DROP CONSTRAINT IF EXISTS cart_shipping_method_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_shipping_method_adjustment DROP CONSTRAINT IF EXISTS cart_shipping_method_adjustment_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_promotion DROP CONSTRAINT IF EXISTS cart_promotion_pkey;
ALTER TABLE IF EXISTS ONLY public.cart DROP CONSTRAINT IF EXISTS cart_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_payment_collection DROP CONSTRAINT IF EXISTS cart_payment_collection_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_line_item_tax_line DROP CONSTRAINT IF EXISTS cart_line_item_tax_line_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_line_item DROP CONSTRAINT IF EXISTS cart_line_item_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_line_item_adjustment DROP CONSTRAINT IF EXISTS cart_line_item_adjustment_pkey;
ALTER TABLE IF EXISTS ONLY public.cart_address DROP CONSTRAINT IF EXISTS cart_address_pkey;
ALTER TABLE IF EXISTS ONLY public.capture DROP CONSTRAINT IF EXISTS capture_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_verification_token DROP CONSTRAINT IF EXISTS auth_verification_token_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_mfa_recovery_code DROP CONSTRAINT IF EXISTS auth_mfa_recovery_code_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_mfa_factor DROP CONSTRAINT IF EXISTS auth_mfa_factor_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_identity DROP CONSTRAINT IF EXISTS auth_identity_pkey;
ALTER TABLE IF EXISTS ONLY public.application_method_target_rules DROP CONSTRAINT IF EXISTS application_method_target_rules_pkey;
ALTER TABLE IF EXISTS ONLY public.application_method_buy_rules DROP CONSTRAINT IF EXISTS application_method_buy_rules_pkey;
ALTER TABLE IF EXISTS ONLY public.api_key DROP CONSTRAINT IF EXISTS api_key_pkey;
ALTER TABLE IF EXISTS ONLY public.account_holder DROP CONSTRAINT IF EXISTS account_holder_pkey;
ALTER TABLE IF EXISTS public.script_migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.return ALTER COLUMN display_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.order_exchange ALTER COLUMN display_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.order_claim ALTER COLUMN display_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.order_change_action ALTER COLUMN ordering DROP DEFAULT;
ALTER TABLE IF EXISTS public."order" ALTER COLUMN display_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.mikro_orm_migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.link_module_migrations ALTER COLUMN id DROP DEFAULT;
DROP TABLE IF EXISTS public.workflow_execution;
DROP TABLE IF EXISTS public.view_configuration;
DROP TABLE IF EXISTS public.user_rbac_role;
DROP TABLE IF EXISTS public.user_preference;
DROP TABLE IF EXISTS public."user";
DROP TABLE IF EXISTS public.tax_region;
DROP TABLE IF EXISTS public.tax_rate_rule;
DROP TABLE IF EXISTS public.tax_rate;
DROP TABLE IF EXISTS public.tax_provider;
DROP TABLE IF EXISTS public.store_locale;
DROP TABLE IF EXISTS public.store_currency;
DROP TABLE IF EXISTS public.store;
DROP TABLE IF EXISTS public.stock_location_address;
DROP TABLE IF EXISTS public.stock_location;
DROP TABLE IF EXISTS public.shipping_profile;
DROP TABLE IF EXISTS public.shipping_option_type;
DROP TABLE IF EXISTS public.shipping_option_rule;
DROP TABLE IF EXISTS public.shipping_option_price_set;
DROP TABLE IF EXISTS public.shipping_option;
DROP TABLE IF EXISTS public.service_zone;
DROP SEQUENCE IF EXISTS public.script_migrations_id_seq;
DROP TABLE IF EXISTS public.script_migrations;
DROP TABLE IF EXISTS public.sales_channel_stock_location;
DROP TABLE IF EXISTS public.sales_channel;
DROP TABLE IF EXISTS public.return_reason;
DROP TABLE IF EXISTS public.return_item;
DROP TABLE IF EXISTS public.return_fulfillment;
DROP SEQUENCE IF EXISTS public.return_display_id_seq;
DROP TABLE IF EXISTS public.return;
DROP TABLE IF EXISTS public.reservation_item;
DROP TABLE IF EXISTS public.region_payment_provider;
DROP TABLE IF EXISTS public.region_country;
DROP TABLE IF EXISTS public.region;
DROP TABLE IF EXISTS public.refund_reason;
DROP TABLE IF EXISTS public.refund;
DROP TABLE IF EXISTS public.publishable_api_key_sales_channel;
DROP TABLE IF EXISTS public.provider_identity;
DROP TABLE IF EXISTS public.property_label;
DROP TABLE IF EXISTS public.promotion_rule_value;
DROP TABLE IF EXISTS public.promotion_rule;
DROP TABLE IF EXISTS public.promotion_promotion_rule;
DROP TABLE IF EXISTS public.promotion_campaign_budget_usage;
DROP TABLE IF EXISTS public.promotion_campaign_budget;
DROP TABLE IF EXISTS public.promotion_campaign;
DROP TABLE IF EXISTS public.promotion_application_method;
DROP TABLE IF EXISTS public.promotion;
DROP TABLE IF EXISTS public.product_variant_product_image;
DROP TABLE IF EXISTS public.product_variant_price_set;
DROP TABLE IF EXISTS public.product_variant_option;
DROP TABLE IF EXISTS public.product_variant_inventory_item;
DROP TABLE IF EXISTS public.product_variant;
DROP TABLE IF EXISTS public.product_type;
DROP TABLE IF EXISTS public.product_tags;
DROP TABLE IF EXISTS public.product_tag;
DROP TABLE IF EXISTS public.product_shipping_profile;
DROP TABLE IF EXISTS public.product_sales_channel;
DROP TABLE IF EXISTS public.product_option_value;
DROP TABLE IF EXISTS public.product_option;
DROP TABLE IF EXISTS public.product_collection;
DROP TABLE IF EXISTS public.product_category_product;
DROP TABLE IF EXISTS public.product_category;
DROP TABLE IF EXISTS public.product;
DROP TABLE IF EXISTS public.price_set;
DROP TABLE IF EXISTS public.price_rule;
DROP TABLE IF EXISTS public.price_preference;
DROP TABLE IF EXISTS public.price_list_rule;
DROP TABLE IF EXISTS public.price_list;
DROP TABLE IF EXISTS public.price;
DROP TABLE IF EXISTS public.payment_session;
DROP TABLE IF EXISTS public.payment_provider;
DROP TABLE IF EXISTS public.payment_collection_payment_providers;
DROP TABLE IF EXISTS public.payment_collection;
DROP TABLE IF EXISTS public.payment;
DROP TABLE IF EXISTS public.order_transaction;
DROP TABLE IF EXISTS public.order_summary;
DROP TABLE IF EXISTS public.order_shipping_method_tax_line;
DROP TABLE IF EXISTS public.order_shipping_method_adjustment;
DROP TABLE IF EXISTS public.order_shipping_method;
DROP TABLE IF EXISTS public.order_shipping;
DROP TABLE IF EXISTS public.order_promotion;
DROP TABLE IF EXISTS public.order_payment_collection;
DROP TABLE IF EXISTS public.order_line_item_tax_line;
DROP TABLE IF EXISTS public.order_line_item_adjustment;
DROP TABLE IF EXISTS public.order_line_item;
DROP TABLE IF EXISTS public.order_item;
DROP TABLE IF EXISTS public.order_fulfillment;
DROP TABLE IF EXISTS public.order_exchange_item;
DROP SEQUENCE IF EXISTS public.order_exchange_display_id_seq;
DROP TABLE IF EXISTS public.order_exchange;
DROP SEQUENCE IF EXISTS public.order_display_id_seq;
DROP TABLE IF EXISTS public.order_credit_line;
DROP TABLE IF EXISTS public.order_claim_item_image;
DROP TABLE IF EXISTS public.order_claim_item;
DROP SEQUENCE IF EXISTS public.order_claim_display_id_seq;
DROP TABLE IF EXISTS public.order_claim;
DROP SEQUENCE IF EXISTS public.order_change_action_ordering_seq;
DROP TABLE IF EXISTS public.order_change_action;
DROP TABLE IF EXISTS public.order_change;
DROP TABLE IF EXISTS public.order_cart;
DROP TABLE IF EXISTS public.order_address;
DROP TABLE IF EXISTS public."order";
DROP TABLE IF EXISTS public.notification_provider;
DROP TABLE IF EXISTS public.notification;
DROP SEQUENCE IF EXISTS public.mikro_orm_migrations_id_seq;
DROP TABLE IF EXISTS public.mikro_orm_migrations;
DROP TABLE IF EXISTS public.location_fulfillment_set;
DROP TABLE IF EXISTS public.location_fulfillment_provider;
DROP SEQUENCE IF EXISTS public.link_module_migrations_id_seq;
DROP TABLE IF EXISTS public.link_module_migrations;
DROP TABLE IF EXISTS public.invite_rbac_role;
DROP TABLE IF EXISTS public.invite;
DROP TABLE IF EXISTS public.inventory_level;
DROP TABLE IF EXISTS public.inventory_item;
DROP TABLE IF EXISTS public.image;
DROP TABLE IF EXISTS public.geo_zone;
DROP TABLE IF EXISTS public.fulfillment_set;
DROP TABLE IF EXISTS public.fulfillment_provider;
DROP TABLE IF EXISTS public.fulfillment_label;
DROP TABLE IF EXISTS public.fulfillment_item;
DROP TABLE IF EXISTS public.fulfillment_address;
DROP TABLE IF EXISTS public.fulfillment;
DROP TABLE IF EXISTS public.customer_group_customer;
DROP TABLE IF EXISTS public.customer_group;
DROP TABLE IF EXISTS public.customer_address;
DROP TABLE IF EXISTS public.customer_account_holder;
DROP TABLE IF EXISTS public.customer;
DROP TABLE IF EXISTS public.currency;
DROP TABLE IF EXISTS public.credit_line;
DROP TABLE IF EXISTS public.cart_shipping_method_tax_line;
DROP TABLE IF EXISTS public.cart_shipping_method_adjustment;
DROP TABLE IF EXISTS public.cart_shipping_method;
DROP TABLE IF EXISTS public.cart_promotion;
DROP TABLE IF EXISTS public.cart_payment_collection;
DROP TABLE IF EXISTS public.cart_line_item_tax_line;
DROP TABLE IF EXISTS public.cart_line_item_adjustment;
DROP TABLE IF EXISTS public.cart_line_item;
DROP TABLE IF EXISTS public.cart_address;
DROP TABLE IF EXISTS public.cart;
DROP TABLE IF EXISTS public.capture;
DROP TABLE IF EXISTS public.auth_verification_token;
DROP TABLE IF EXISTS public.auth_mfa_recovery_code;
DROP TABLE IF EXISTS public.auth_mfa_factor;
DROP TABLE IF EXISTS public.auth_identity;
DROP TABLE IF EXISTS public.application_method_target_rules;
DROP TABLE IF EXISTS public.application_method_buy_rules;
DROP TABLE IF EXISTS public.api_key;
DROP TABLE IF EXISTS public.account_holder;
DROP TYPE IF EXISTS public.return_status_enum;
DROP TYPE IF EXISTS public.order_status_enum;
DROP TYPE IF EXISTS public.order_claim_type_enum;
DROP TYPE IF EXISTS public.claim_reason_enum;
--
-- Name: claim_reason_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.claim_reason_enum AS ENUM (
    'missing_item',
    'wrong_item',
    'production_failure',
    'other'
);


--
-- Name: order_claim_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.order_claim_type_enum AS ENUM (
    'refund',
    'replace'
);


--
-- Name: order_status_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.order_status_enum AS ENUM (
    'pending',
    'completed',
    'draft',
    'archived',
    'canceled',
    'requires_action'
);


--
-- Name: return_status_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.return_status_enum AS ENUM (
    'open',
    'requested',
    'received',
    'partially_received',
    'canceled'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_holder; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.account_holder (
    id text NOT NULL,
    provider_id text NOT NULL,
    external_id text NOT NULL,
    email text,
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: api_key; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.api_key (
    id text NOT NULL,
    token text NOT NULL,
    salt text NOT NULL,
    redacted text NOT NULL,
    title text NOT NULL,
    type text NOT NULL,
    last_used_at timestamp with time zone,
    created_by text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_by text,
    revoked_at timestamp with time zone,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT api_key_type_check CHECK ((type = ANY (ARRAY['publishable'::text, 'secret'::text])))
);


--
-- Name: application_method_buy_rules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.application_method_buy_rules (
    application_method_id text NOT NULL,
    promotion_rule_id text NOT NULL
);


--
-- Name: application_method_target_rules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.application_method_target_rules (
    application_method_id text NOT NULL,
    promotion_rule_id text NOT NULL
);


--
-- Name: auth_identity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_identity (
    id text NOT NULL,
    app_metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: auth_mfa_factor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_mfa_factor (
    id text NOT NULL,
    auth_identity_id text NOT NULL,
    provider text NOT NULL,
    status text NOT NULL,
    provider_metadata jsonb,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: auth_mfa_recovery_code; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_mfa_recovery_code (
    id text NOT NULL,
    auth_identity_id text NOT NULL,
    code_hash text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: auth_verification_token; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_verification_token (
    id text NOT NULL,
    auth_identity_id text NOT NULL,
    provider_identity_id text NOT NULL,
    entity_id text NOT NULL,
    token_hash text NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: capture; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.capture (
    id text NOT NULL,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    payment_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    created_by text,
    metadata jsonb
);


--
-- Name: cart; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart (
    id text NOT NULL,
    region_id text,
    customer_id text,
    sales_channel_id text,
    email text,
    currency_code text NOT NULL,
    shipping_address_id text,
    billing_address_id text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    completed_at timestamp with time zone,
    locale text
);


--
-- Name: cart_address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart_address (
    id text NOT NULL,
    customer_id text,
    company text,
    first_name text,
    last_name text,
    address_1 text,
    address_2 text,
    city text,
    country_code text,
    province text,
    postal_code text,
    phone text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: cart_line_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart_line_item (
    id text NOT NULL,
    cart_id text NOT NULL,
    title text NOT NULL,
    subtitle text,
    thumbnail text,
    quantity integer NOT NULL,
    variant_id text,
    product_id text,
    product_title text,
    product_description text,
    product_subtitle text,
    product_type text,
    product_collection text,
    product_handle text,
    variant_sku text,
    variant_barcode text,
    variant_title text,
    variant_option_values jsonb,
    requires_shipping boolean DEFAULT true NOT NULL,
    is_discountable boolean DEFAULT true NOT NULL,
    is_tax_inclusive boolean DEFAULT false NOT NULL,
    compare_at_unit_price numeric,
    raw_compare_at_unit_price jsonb,
    unit_price numeric NOT NULL,
    raw_unit_price jsonb NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    product_type_id text,
    is_custom_price boolean DEFAULT false NOT NULL,
    is_giftcard boolean DEFAULT false NOT NULL,
    CONSTRAINT cart_line_item_unit_price_check CHECK ((unit_price >= (0)::numeric))
);


--
-- Name: cart_line_item_adjustment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart_line_item_adjustment (
    id text NOT NULL,
    description text,
    promotion_id text,
    code text,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    provider_id text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    item_id text,
    is_tax_inclusive boolean DEFAULT false NOT NULL,
    CONSTRAINT cart_line_item_adjustment_check CHECK ((amount >= (0)::numeric))
);


--
-- Name: cart_line_item_tax_line; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart_line_item_tax_line (
    id text NOT NULL,
    description text,
    tax_rate_id text,
    code text NOT NULL,
    rate real NOT NULL,
    provider_id text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    item_id text
);


--
-- Name: cart_payment_collection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart_payment_collection (
    cart_id character varying(255) NOT NULL,
    payment_collection_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: cart_promotion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart_promotion (
    cart_id character varying(255) NOT NULL,
    promotion_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: cart_shipping_method; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart_shipping_method (
    id text NOT NULL,
    cart_id text NOT NULL,
    name text NOT NULL,
    description jsonb,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    is_tax_inclusive boolean DEFAULT false NOT NULL,
    shipping_option_id text,
    data jsonb,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT cart_shipping_method_check CHECK ((amount >= (0)::numeric))
);


--
-- Name: cart_shipping_method_adjustment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart_shipping_method_adjustment (
    id text NOT NULL,
    description text,
    promotion_id text,
    code text,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    provider_id text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    shipping_method_id text
);


--
-- Name: cart_shipping_method_tax_line; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart_shipping_method_tax_line (
    id text NOT NULL,
    description text,
    tax_rate_id text,
    code text NOT NULL,
    rate real NOT NULL,
    provider_id text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    shipping_method_id text
);


--
-- Name: credit_line; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.credit_line (
    id text NOT NULL,
    cart_id text NOT NULL,
    reference text,
    reference_id text,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: currency; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.currency (
    code text NOT NULL,
    symbol text NOT NULL,
    symbol_native text NOT NULL,
    decimal_digits integer DEFAULT 0 NOT NULL,
    rounding numeric DEFAULT 0 NOT NULL,
    raw_rounding jsonb NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: customer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer (
    id text NOT NULL,
    company_name text,
    first_name text,
    last_name text,
    email text,
    phone text,
    has_account boolean DEFAULT false NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    created_by text
);


--
-- Name: customer_account_holder; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_account_holder (
    customer_id character varying(255) NOT NULL,
    account_holder_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: customer_address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_address (
    id text NOT NULL,
    customer_id text NOT NULL,
    address_name text,
    is_default_shipping boolean DEFAULT false NOT NULL,
    is_default_billing boolean DEFAULT false NOT NULL,
    company text,
    first_name text,
    last_name text,
    address_1 text,
    address_2 text,
    city text,
    country_code text,
    province text,
    postal_code text,
    phone text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: customer_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_group (
    id text NOT NULL,
    name text NOT NULL,
    metadata jsonb,
    created_by text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: customer_group_customer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_group_customer (
    id text NOT NULL,
    customer_id text NOT NULL,
    customer_group_id text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by text,
    deleted_at timestamp with time zone
);


--
-- Name: fulfillment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fulfillment (
    id text NOT NULL,
    location_id text NOT NULL,
    packed_at timestamp with time zone,
    shipped_at timestamp with time zone,
    delivered_at timestamp with time zone,
    canceled_at timestamp with time zone,
    data jsonb,
    provider_id text,
    shipping_option_id text,
    metadata jsonb,
    delivery_address_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    marked_shipped_by text,
    created_by text,
    requires_shipping boolean DEFAULT true NOT NULL
);


--
-- Name: fulfillment_address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fulfillment_address (
    id text NOT NULL,
    company text,
    first_name text,
    last_name text,
    address_1 text,
    address_2 text,
    city text,
    country_code text,
    province text,
    postal_code text,
    phone text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: fulfillment_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fulfillment_item (
    id text NOT NULL,
    title text NOT NULL,
    sku text NOT NULL,
    barcode text NOT NULL,
    quantity numeric NOT NULL,
    raw_quantity jsonb NOT NULL,
    line_item_id text,
    inventory_item_id text,
    fulfillment_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: fulfillment_label; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fulfillment_label (
    id text NOT NULL,
    tracking_number text NOT NULL,
    tracking_url text NOT NULL,
    label_url text NOT NULL,
    fulfillment_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: fulfillment_provider; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fulfillment_provider (
    id text NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: fulfillment_set; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fulfillment_set (
    id text NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: geo_zone; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.geo_zone (
    id text NOT NULL,
    type text DEFAULT 'country'::text NOT NULL,
    country_code text NOT NULL,
    province_code text,
    city text,
    service_zone_id text NOT NULL,
    postal_expression jsonb,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT geo_zone_type_check CHECK ((type = ANY (ARRAY['country'::text, 'province'::text, 'city'::text, 'zip'::text])))
);


--
-- Name: image; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.image (
    id text NOT NULL,
    url text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    rank integer DEFAULT 0 NOT NULL,
    product_id text NOT NULL
);


--
-- Name: inventory_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_item (
    id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    sku text,
    origin_country text,
    hs_code text,
    mid_code text,
    material text,
    weight integer,
    length integer,
    height integer,
    width integer,
    requires_shipping boolean DEFAULT true NOT NULL,
    description text,
    title text,
    thumbnail text,
    metadata jsonb
);


--
-- Name: inventory_level; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_level (
    id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    inventory_item_id text NOT NULL,
    location_id text NOT NULL,
    stocked_quantity numeric DEFAULT 0 NOT NULL,
    reserved_quantity numeric DEFAULT 0 NOT NULL,
    incoming_quantity numeric DEFAULT 0 NOT NULL,
    metadata jsonb,
    raw_stocked_quantity jsonb,
    raw_reserved_quantity jsonb,
    raw_incoming_quantity jsonb
);


--
-- Name: invite; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invite (
    id text NOT NULL,
    email text NOT NULL,
    accepted boolean DEFAULT false NOT NULL,
    token text NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: invite_rbac_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invite_rbac_role (
    invite_id character varying(255) NOT NULL,
    rbac_role_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: link_module_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.link_module_migrations (
    id integer NOT NULL,
    table_name character varying(255) NOT NULL,
    link_descriptor jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: link_module_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.link_module_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: link_module_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.link_module_migrations_id_seq OWNED BY public.link_module_migrations.id;


--
-- Name: location_fulfillment_provider; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.location_fulfillment_provider (
    stock_location_id character varying(255) NOT NULL,
    fulfillment_provider_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: location_fulfillment_set; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.location_fulfillment_set (
    stock_location_id character varying(255) NOT NULL,
    fulfillment_set_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: mikro_orm_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mikro_orm_migrations (
    id integer NOT NULL,
    name character varying(255),
    executed_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: mikro_orm_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mikro_orm_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mikro_orm_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mikro_orm_migrations_id_seq OWNED BY public.mikro_orm_migrations.id;


--
-- Name: notification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notification (
    id text NOT NULL,
    "to" text NOT NULL,
    channel text NOT NULL,
    template text,
    data jsonb,
    trigger_type text,
    resource_id text,
    resource_type text,
    receiver_id text,
    original_notification_id text,
    idempotency_key text,
    external_id text,
    provider_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    status text DEFAULT 'pending'::text NOT NULL,
    "from" text,
    provider_data jsonb,
    CONSTRAINT notification_status_check CHECK ((status = ANY (ARRAY['pending'::text, 'success'::text, 'failure'::text])))
);


--
-- Name: notification_provider; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notification_provider (
    id text NOT NULL,
    handle text NOT NULL,
    name text NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    channels text[] DEFAULT '{}'::text[] NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."order" (
    id text NOT NULL,
    region_id text,
    display_id integer,
    customer_id text,
    version integer DEFAULT 1 NOT NULL,
    sales_channel_id text,
    status public.order_status_enum DEFAULT 'pending'::public.order_status_enum NOT NULL,
    is_draft_order boolean DEFAULT false NOT NULL,
    email text,
    currency_code text NOT NULL,
    shipping_address_id text,
    billing_address_id text,
    no_notification boolean,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    canceled_at timestamp with time zone,
    custom_display_id text,
    locale text
);


--
-- Name: order_address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_address (
    id text NOT NULL,
    customer_id text,
    company text,
    first_name text,
    last_name text,
    address_1 text,
    address_2 text,
    city text,
    country_code text,
    province text,
    postal_code text,
    phone text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: order_cart; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_cart (
    order_id character varying(255) NOT NULL,
    cart_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: order_change; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_change (
    id text NOT NULL,
    order_id text NOT NULL,
    version integer NOT NULL,
    description text,
    status text DEFAULT 'pending'::text NOT NULL,
    internal_note text,
    created_by text,
    requested_by text,
    requested_at timestamp with time zone,
    confirmed_by text,
    confirmed_at timestamp with time zone,
    declined_by text,
    declined_reason text,
    metadata jsonb,
    declined_at timestamp with time zone,
    canceled_by text,
    canceled_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    change_type text,
    deleted_at timestamp with time zone,
    return_id text,
    claim_id text,
    exchange_id text,
    carry_over_promotions boolean,
    CONSTRAINT order_change_status_check CHECK ((status = ANY (ARRAY['confirmed'::text, 'declined'::text, 'requested'::text, 'pending'::text, 'canceled'::text])))
);


--
-- Name: order_change_action; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_change_action (
    id text NOT NULL,
    order_id text,
    version integer,
    ordering bigint NOT NULL,
    order_change_id text,
    reference text,
    reference_id text,
    action text NOT NULL,
    details jsonb,
    amount numeric,
    raw_amount jsonb,
    internal_note text,
    applied boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    return_id text,
    claim_id text,
    exchange_id text
);


--
-- Name: order_change_action_ordering_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_change_action_ordering_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_change_action_ordering_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.order_change_action_ordering_seq OWNED BY public.order_change_action.ordering;


--
-- Name: order_claim; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_claim (
    id text NOT NULL,
    order_id text NOT NULL,
    return_id text,
    order_version integer NOT NULL,
    display_id integer NOT NULL,
    type public.order_claim_type_enum NOT NULL,
    no_notification boolean,
    refund_amount numeric,
    raw_refund_amount jsonb,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    canceled_at timestamp with time zone,
    created_by text
);


--
-- Name: order_claim_display_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_claim_display_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_claim_display_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.order_claim_display_id_seq OWNED BY public.order_claim.display_id;


--
-- Name: order_claim_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_claim_item (
    id text NOT NULL,
    claim_id text NOT NULL,
    item_id text NOT NULL,
    is_additional_item boolean DEFAULT false NOT NULL,
    reason public.claim_reason_enum,
    quantity numeric NOT NULL,
    raw_quantity jsonb NOT NULL,
    note text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: order_claim_item_image; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_claim_item_image (
    id text NOT NULL,
    claim_item_id text NOT NULL,
    url text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: order_credit_line; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_credit_line (
    id text NOT NULL,
    order_id text NOT NULL,
    reference text,
    reference_id text,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    version integer DEFAULT 1 NOT NULL
);


--
-- Name: order_display_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_display_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_display_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.order_display_id_seq OWNED BY public."order".display_id;


--
-- Name: order_exchange; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_exchange (
    id text NOT NULL,
    order_id text NOT NULL,
    return_id text,
    order_version integer NOT NULL,
    display_id integer NOT NULL,
    no_notification boolean,
    allow_backorder boolean DEFAULT false NOT NULL,
    difference_due numeric,
    raw_difference_due jsonb,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    canceled_at timestamp with time zone,
    created_by text
);


--
-- Name: order_exchange_display_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_exchange_display_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_exchange_display_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.order_exchange_display_id_seq OWNED BY public.order_exchange.display_id;


--
-- Name: order_exchange_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_exchange_item (
    id text NOT NULL,
    exchange_id text NOT NULL,
    item_id text NOT NULL,
    quantity numeric NOT NULL,
    raw_quantity jsonb NOT NULL,
    note text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: order_fulfillment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_fulfillment (
    order_id character varying(255) NOT NULL,
    fulfillment_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: order_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_item (
    id text NOT NULL,
    order_id text NOT NULL,
    version integer NOT NULL,
    item_id text NOT NULL,
    quantity numeric NOT NULL,
    raw_quantity jsonb NOT NULL,
    fulfilled_quantity numeric NOT NULL,
    raw_fulfilled_quantity jsonb DEFAULT '{"value": "0", "precision": 20}'::jsonb NOT NULL,
    shipped_quantity numeric NOT NULL,
    raw_shipped_quantity jsonb DEFAULT '{"value": "0", "precision": 20}'::jsonb NOT NULL,
    return_requested_quantity numeric NOT NULL,
    raw_return_requested_quantity jsonb DEFAULT '{"value": "0", "precision": 20}'::jsonb NOT NULL,
    return_received_quantity numeric NOT NULL,
    raw_return_received_quantity jsonb DEFAULT '{"value": "0", "precision": 20}'::jsonb NOT NULL,
    return_dismissed_quantity numeric NOT NULL,
    raw_return_dismissed_quantity jsonb DEFAULT '{"value": "0", "precision": 20}'::jsonb NOT NULL,
    written_off_quantity numeric NOT NULL,
    raw_written_off_quantity jsonb DEFAULT '{"value": "0", "precision": 20}'::jsonb NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    delivered_quantity numeric DEFAULT 0 NOT NULL,
    raw_delivered_quantity jsonb DEFAULT '{"value": "0", "precision": 20}'::jsonb NOT NULL,
    unit_price numeric,
    raw_unit_price jsonb,
    compare_at_unit_price numeric,
    raw_compare_at_unit_price jsonb
);


--
-- Name: order_line_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_line_item (
    id text NOT NULL,
    totals_id text,
    title text NOT NULL,
    subtitle text,
    thumbnail text,
    variant_id text,
    product_id text,
    product_title text,
    product_description text,
    product_subtitle text,
    product_type text,
    product_collection text,
    product_handle text,
    variant_sku text,
    variant_barcode text,
    variant_title text,
    variant_option_values jsonb,
    requires_shipping boolean DEFAULT true NOT NULL,
    is_discountable boolean DEFAULT true NOT NULL,
    is_tax_inclusive boolean DEFAULT false NOT NULL,
    compare_at_unit_price numeric,
    raw_compare_at_unit_price jsonb,
    unit_price numeric NOT NULL,
    raw_unit_price jsonb NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    is_custom_price boolean DEFAULT false NOT NULL,
    product_type_id text,
    is_giftcard boolean DEFAULT false NOT NULL
);


--
-- Name: order_line_item_adjustment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_line_item_adjustment (
    id text NOT NULL,
    description text,
    promotion_id text,
    code text,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    provider_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    item_id text NOT NULL,
    deleted_at timestamp with time zone,
    is_tax_inclusive boolean DEFAULT false NOT NULL,
    version integer DEFAULT 1 NOT NULL
);


--
-- Name: order_line_item_tax_line; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_line_item_tax_line (
    id text NOT NULL,
    description text,
    tax_rate_id text,
    code text NOT NULL,
    rate numeric NOT NULL,
    raw_rate jsonb NOT NULL,
    provider_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    item_id text NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: order_payment_collection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_payment_collection (
    order_id character varying(255) NOT NULL,
    payment_collection_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: order_promotion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_promotion (
    order_id character varying(255) NOT NULL,
    promotion_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: order_shipping; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_shipping (
    id text NOT NULL,
    order_id text NOT NULL,
    version integer NOT NULL,
    shipping_method_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    return_id text,
    claim_id text,
    exchange_id text
);


--
-- Name: order_shipping_method; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_shipping_method (
    id text NOT NULL,
    name text NOT NULL,
    description jsonb,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    is_tax_inclusive boolean DEFAULT false NOT NULL,
    shipping_option_id text,
    data jsonb,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    is_custom_amount boolean DEFAULT false NOT NULL
);


--
-- Name: order_shipping_method_adjustment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_shipping_method_adjustment (
    id text NOT NULL,
    description text,
    promotion_id text,
    code text,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    provider_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    shipping_method_id text NOT NULL,
    deleted_at timestamp with time zone,
    version integer DEFAULT 1 NOT NULL
);


--
-- Name: order_shipping_method_tax_line; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_shipping_method_tax_line (
    id text NOT NULL,
    description text,
    tax_rate_id text,
    code text NOT NULL,
    rate numeric NOT NULL,
    raw_rate jsonb NOT NULL,
    provider_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    shipping_method_id text NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: order_summary; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_summary (
    id text NOT NULL,
    order_id text NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    totals jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: order_transaction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_transaction (
    id text NOT NULL,
    order_id text NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    currency_code text NOT NULL,
    reference text,
    reference_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    return_id text,
    claim_id text,
    exchange_id text
);


--
-- Name: payment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment (
    id text NOT NULL,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    currency_code text NOT NULL,
    provider_id text NOT NULL,
    data jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    captured_at timestamp with time zone,
    canceled_at timestamp with time zone,
    payment_collection_id text NOT NULL,
    payment_session_id text NOT NULL,
    metadata jsonb
);


--
-- Name: payment_collection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment_collection (
    id text NOT NULL,
    currency_code text NOT NULL,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    authorized_amount numeric,
    raw_authorized_amount jsonb,
    captured_amount numeric,
    raw_captured_amount jsonb,
    refunded_amount numeric,
    raw_refunded_amount jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    completed_at timestamp with time zone,
    status text DEFAULT 'not_paid'::text NOT NULL,
    metadata jsonb,
    CONSTRAINT payment_collection_status_check CHECK ((status = ANY (ARRAY['not_paid'::text, 'awaiting'::text, 'authorized'::text, 'partially_authorized'::text, 'canceled'::text, 'failed'::text, 'partially_captured'::text, 'completed'::text])))
);


--
-- Name: payment_collection_payment_providers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment_collection_payment_providers (
    payment_collection_id text NOT NULL,
    payment_provider_id text NOT NULL
);


--
-- Name: payment_provider; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment_provider (
    id text NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: payment_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment_session (
    id text NOT NULL,
    currency_code text NOT NULL,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    provider_id text NOT NULL,
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    context jsonb,
    status text DEFAULT 'pending'::text NOT NULL,
    authorized_at timestamp with time zone,
    payment_collection_id text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT payment_session_status_check CHECK ((status = ANY (ARRAY['authorized'::text, 'captured'::text, 'pending'::text, 'requires_more'::text, 'error'::text, 'canceled'::text])))
);


--
-- Name: price; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.price (
    id text NOT NULL,
    title text,
    price_set_id text NOT NULL,
    currency_code text NOT NULL,
    raw_amount jsonb NOT NULL,
    rules_count integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    price_list_id text,
    amount numeric NOT NULL,
    min_quantity numeric,
    max_quantity numeric,
    raw_min_quantity jsonb,
    raw_max_quantity jsonb
);


--
-- Name: price_list; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.price_list (
    id text NOT NULL,
    status text DEFAULT 'draft'::text NOT NULL,
    starts_at timestamp with time zone,
    ends_at timestamp with time zone,
    rules_count integer DEFAULT 0,
    title text NOT NULL,
    description text NOT NULL,
    type text DEFAULT 'sale'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    CONSTRAINT price_list_status_check CHECK ((status = ANY (ARRAY['active'::text, 'draft'::text]))),
    CONSTRAINT price_list_type_check CHECK ((type = ANY (ARRAY['sale'::text, 'override'::text])))
);


--
-- Name: price_list_rule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.price_list_rule (
    id text NOT NULL,
    price_list_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    value jsonb,
    attribute text DEFAULT ''::text NOT NULL
);


--
-- Name: price_preference; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.price_preference (
    id text NOT NULL,
    attribute text NOT NULL,
    value text,
    is_tax_inclusive boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: price_rule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.price_rule (
    id text NOT NULL,
    value text NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    price_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    attribute text DEFAULT ''::text NOT NULL,
    operator text DEFAULT 'eq'::text NOT NULL,
    CONSTRAINT price_rule_operator_check CHECK ((operator = ANY (ARRAY['gte'::text, 'lte'::text, 'gt'::text, 'lt'::text, 'eq'::text])))
);


--
-- Name: price_set; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.price_set (
    id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product (
    id text NOT NULL,
    title text NOT NULL,
    handle text NOT NULL,
    subtitle text,
    description text,
    is_giftcard boolean DEFAULT false NOT NULL,
    status text DEFAULT 'draft'::text NOT NULL,
    thumbnail text,
    weight real,
    length real,
    height real,
    width real,
    origin_country text,
    hs_code text,
    mid_code text,
    material text,
    collection_id text,
    type_id text,
    discountable boolean DEFAULT true NOT NULL,
    external_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    CONSTRAINT product_status_check CHECK ((status = ANY (ARRAY['draft'::text, 'proposed'::text, 'published'::text, 'rejected'::text])))
);


--
-- Name: product_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_category (
    id text NOT NULL,
    name text NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    handle text NOT NULL,
    mpath text NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    is_internal boolean DEFAULT false NOT NULL,
    rank integer DEFAULT 0 NOT NULL,
    parent_category_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    external_id text
);


--
-- Name: product_category_product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_category_product (
    product_id text NOT NULL,
    product_category_id text NOT NULL
);


--
-- Name: product_collection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_collection (
    id text NOT NULL,
    title text NOT NULL,
    handle text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    external_id text
);


--
-- Name: product_option; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_option (
    id text NOT NULL,
    title text NOT NULL,
    product_id text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: product_option_value; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_option_value (
    id text NOT NULL,
    value text NOT NULL,
    option_id text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: product_sales_channel; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_sales_channel (
    product_id character varying(255) NOT NULL,
    sales_channel_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: product_shipping_profile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_shipping_profile (
    product_id character varying(255) NOT NULL,
    shipping_profile_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: product_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_tag (
    id text NOT NULL,
    value text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    external_id text
);


--
-- Name: product_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_tags (
    product_id text NOT NULL,
    product_tag_id text NOT NULL
);


--
-- Name: product_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_type (
    id text NOT NULL,
    value text NOT NULL,
    metadata json,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    external_id text
);


--
-- Name: product_variant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_variant (
    id text NOT NULL,
    title text NOT NULL,
    sku text,
    barcode text,
    ean text,
    upc text,
    allow_backorder boolean DEFAULT false NOT NULL,
    manage_inventory boolean DEFAULT true NOT NULL,
    hs_code text,
    origin_country text,
    mid_code text,
    material text,
    weight real,
    length real,
    height real,
    width real,
    metadata jsonb,
    variant_rank integer DEFAULT 0,
    product_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    thumbnail text
);


--
-- Name: product_variant_inventory_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_variant_inventory_item (
    variant_id character varying(255) NOT NULL,
    inventory_item_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    required_quantity integer DEFAULT 1 NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: product_variant_option; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_variant_option (
    variant_id text NOT NULL,
    option_value_id text NOT NULL
);


--
-- Name: product_variant_price_set; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_variant_price_set (
    variant_id character varying(255) NOT NULL,
    price_set_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: product_variant_product_image; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_variant_product_image (
    id text NOT NULL,
    variant_id text NOT NULL,
    image_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: promotion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.promotion (
    id text NOT NULL,
    code text NOT NULL,
    campaign_id text,
    is_automatic boolean DEFAULT false NOT NULL,
    type text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    status text DEFAULT 'draft'::text NOT NULL,
    is_tax_inclusive boolean DEFAULT false NOT NULL,
    "limit" integer,
    used integer DEFAULT 0 NOT NULL,
    metadata jsonb,
    CONSTRAINT promotion_status_check CHECK ((status = ANY (ARRAY['draft'::text, 'active'::text, 'inactive'::text]))),
    CONSTRAINT promotion_type_check CHECK ((type = ANY (ARRAY['standard'::text, 'buyget'::text])))
);


--
-- Name: promotion_application_method; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.promotion_application_method (
    id text NOT NULL,
    value numeric,
    raw_value jsonb,
    max_quantity integer,
    apply_to_quantity integer,
    buy_rules_min_quantity integer,
    type text NOT NULL,
    target_type text NOT NULL,
    allocation text,
    promotion_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    currency_code text,
    CONSTRAINT promotion_application_method_allocation_check CHECK ((allocation = ANY (ARRAY['each'::text, 'across'::text, 'once'::text]))),
    CONSTRAINT promotion_application_method_target_type_check CHECK ((target_type = ANY (ARRAY['order'::text, 'shipping_methods'::text, 'items'::text]))),
    CONSTRAINT promotion_application_method_type_check CHECK ((type = ANY (ARRAY['fixed'::text, 'percentage'::text])))
);


--
-- Name: promotion_campaign; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.promotion_campaign (
    id text NOT NULL,
    name text NOT NULL,
    description text,
    campaign_identifier text NOT NULL,
    starts_at timestamp with time zone,
    ends_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: promotion_campaign_budget; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.promotion_campaign_budget (
    id text NOT NULL,
    type text NOT NULL,
    campaign_id text NOT NULL,
    "limit" numeric,
    raw_limit jsonb,
    used numeric DEFAULT 0 NOT NULL,
    raw_used jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    currency_code text,
    attribute text,
    CONSTRAINT promotion_campaign_budget_type_check CHECK ((type = ANY (ARRAY['spend'::text, 'usage'::text, 'use_by_attribute'::text, 'spend_by_attribute'::text])))
);


--
-- Name: promotion_campaign_budget_usage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.promotion_campaign_budget_usage (
    id text NOT NULL,
    attribute_value text NOT NULL,
    used numeric DEFAULT 0 NOT NULL,
    budget_id text NOT NULL,
    raw_used jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: promotion_promotion_rule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.promotion_promotion_rule (
    promotion_id text NOT NULL,
    promotion_rule_id text NOT NULL
);


--
-- Name: promotion_rule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.promotion_rule (
    id text NOT NULL,
    description text,
    attribute text NOT NULL,
    operator text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT promotion_rule_operator_check CHECK ((operator = ANY (ARRAY['gte'::text, 'lte'::text, 'gt'::text, 'lt'::text, 'eq'::text, 'ne'::text, 'in'::text])))
);


--
-- Name: promotion_rule_value; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.promotion_rule_value (
    id text NOT NULL,
    promotion_rule_id text NOT NULL,
    value text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: property_label; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.property_label (
    id text NOT NULL,
    entity text NOT NULL,
    property text NOT NULL,
    label text NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: provider_identity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.provider_identity (
    id text NOT NULL,
    entity_id text NOT NULL,
    provider text NOT NULL,
    auth_identity_id text NOT NULL,
    user_metadata jsonb,
    provider_metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: publishable_api_key_sales_channel; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.publishable_api_key_sales_channel (
    publishable_key_id character varying(255) NOT NULL,
    sales_channel_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: refund; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.refund (
    id text NOT NULL,
    amount numeric NOT NULL,
    raw_amount jsonb NOT NULL,
    payment_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    created_by text,
    metadata jsonb,
    refund_reason_id text,
    note text
);


--
-- Name: refund_reason; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.refund_reason (
    id text NOT NULL,
    label text NOT NULL,
    description text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    code text NOT NULL
);


--
-- Name: region; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.region (
    id text NOT NULL,
    name text NOT NULL,
    currency_code text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    automatic_taxes boolean DEFAULT true NOT NULL
);


--
-- Name: region_country; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.region_country (
    iso_2 text NOT NULL,
    iso_3 text NOT NULL,
    num_code text NOT NULL,
    name text NOT NULL,
    display_name text NOT NULL,
    region_id text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: region_payment_provider; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.region_payment_provider (
    region_id character varying(255) NOT NULL,
    payment_provider_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: reservation_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reservation_item (
    id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    line_item_id text,
    location_id text NOT NULL,
    quantity numeric NOT NULL,
    external_id text,
    description text,
    created_by text,
    metadata jsonb,
    inventory_item_id text NOT NULL,
    allow_backorder boolean DEFAULT false,
    raw_quantity jsonb
);


--
-- Name: return; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.return (
    id text NOT NULL,
    order_id text NOT NULL,
    claim_id text,
    exchange_id text,
    order_version integer NOT NULL,
    display_id integer NOT NULL,
    status public.return_status_enum DEFAULT 'open'::public.return_status_enum NOT NULL,
    no_notification boolean,
    refund_amount numeric,
    raw_refund_amount jsonb,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    received_at timestamp with time zone,
    canceled_at timestamp with time zone,
    location_id text,
    requested_at timestamp with time zone,
    created_by text
);


--
-- Name: return_display_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.return_display_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: return_display_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.return_display_id_seq OWNED BY public.return.display_id;


--
-- Name: return_fulfillment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.return_fulfillment (
    return_id character varying(255) NOT NULL,
    fulfillment_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: return_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.return_item (
    id text NOT NULL,
    return_id text NOT NULL,
    reason_id text,
    item_id text NOT NULL,
    quantity numeric NOT NULL,
    raw_quantity jsonb NOT NULL,
    received_quantity numeric DEFAULT 0 NOT NULL,
    raw_received_quantity jsonb DEFAULT '{"value": "0", "precision": 20}'::jsonb NOT NULL,
    note text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    damaged_quantity numeric DEFAULT 0 NOT NULL,
    raw_damaged_quantity jsonb DEFAULT '{"value": "0", "precision": 20}'::jsonb NOT NULL
);


--
-- Name: return_reason; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.return_reason (
    id character varying NOT NULL,
    value character varying NOT NULL,
    label character varying NOT NULL,
    description character varying,
    metadata jsonb,
    parent_return_reason_id character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: sales_channel; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_channel (
    id text NOT NULL,
    name text NOT NULL,
    description text,
    is_disabled boolean DEFAULT false NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: sales_channel_stock_location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sales_channel_stock_location (
    sales_channel_id character varying(255) NOT NULL,
    stock_location_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: script_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.script_migrations (
    id integer NOT NULL,
    script_name character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    finished_at timestamp with time zone
);


--
-- Name: script_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.script_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: script_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.script_migrations_id_seq OWNED BY public.script_migrations.id;


--
-- Name: service_zone; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service_zone (
    id text NOT NULL,
    name text NOT NULL,
    metadata jsonb,
    fulfillment_set_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: shipping_option; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shipping_option (
    id text NOT NULL,
    name text NOT NULL,
    price_type text DEFAULT 'flat'::text NOT NULL,
    service_zone_id text NOT NULL,
    shipping_profile_id text,
    provider_id text,
    data jsonb,
    metadata jsonb,
    shipping_option_type_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT shipping_option_price_type_check CHECK ((price_type = ANY (ARRAY['calculated'::text, 'flat'::text])))
);


--
-- Name: shipping_option_price_set; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shipping_option_price_set (
    shipping_option_id character varying(255) NOT NULL,
    price_set_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: shipping_option_rule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shipping_option_rule (
    id text NOT NULL,
    attribute text NOT NULL,
    operator text NOT NULL,
    value jsonb,
    shipping_option_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT shipping_option_rule_operator_check CHECK ((operator = ANY (ARRAY['in'::text, 'eq'::text, 'ne'::text, 'gt'::text, 'gte'::text, 'lt'::text, 'lte'::text, 'nin'::text])))
);


--
-- Name: shipping_option_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shipping_option_type (
    id text NOT NULL,
    label text NOT NULL,
    description text,
    code text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: shipping_profile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shipping_profile (
    id text NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: stock_location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stock_location (
    id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    name text NOT NULL,
    address_id text,
    metadata jsonb
);


--
-- Name: stock_location_address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stock_location_address (
    id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    address_1 text NOT NULL,
    address_2 text,
    company text,
    city text,
    country_code text NOT NULL,
    phone text,
    province text,
    postal_code text,
    metadata jsonb
);


--
-- Name: store; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.store (
    id text NOT NULL,
    name text DEFAULT 'Medusa Store'::text NOT NULL,
    default_sales_channel_id text,
    default_region_id text,
    default_location_id text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: store_currency; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.store_currency (
    id text NOT NULL,
    currency_code text NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    store_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: store_locale; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.store_locale (
    id text NOT NULL,
    locale_code text NOT NULL,
    store_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: tax_provider; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tax_provider (
    id text NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: tax_rate; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tax_rate (
    id text NOT NULL,
    rate real,
    code text NOT NULL,
    name text NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    is_combinable boolean DEFAULT false NOT NULL,
    tax_region_id text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by text,
    deleted_at timestamp with time zone
);


--
-- Name: tax_rate_rule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tax_rate_rule (
    id text NOT NULL,
    tax_rate_id text NOT NULL,
    reference_id text NOT NULL,
    reference text NOT NULL,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by text,
    deleted_at timestamp with time zone
);


--
-- Name: tax_region; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tax_region (
    id text NOT NULL,
    provider_id text,
    country_code text NOT NULL,
    province_code text,
    parent_id text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by text,
    deleted_at timestamp with time zone,
    CONSTRAINT "CK_tax_region_country_top_level" CHECK (((parent_id IS NULL) OR (province_code IS NOT NULL))),
    CONSTRAINT "CK_tax_region_provider_top_level" CHECK (((parent_id IS NULL) OR (provider_id IS NULL)))
);


--
-- Name: user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."user" (
    id text NOT NULL,
    first_name text,
    last_name text,
    email text NOT NULL,
    avatar_url text,
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: user_preference; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_preference (
    id text NOT NULL,
    user_id text NOT NULL,
    key text NOT NULL,
    value jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: user_rbac_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_rbac_role (
    user_id character varying(255) NOT NULL,
    rbac_role_id character varying(255) NOT NULL,
    id character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: view_configuration; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.view_configuration (
    id text NOT NULL,
    entity text NOT NULL,
    name text,
    user_id text,
    is_system_default boolean DEFAULT false NOT NULL,
    configuration jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: workflow_execution; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workflow_execution (
    id character varying NOT NULL,
    workflow_id character varying NOT NULL,
    transaction_id character varying NOT NULL,
    execution jsonb,
    context jsonb,
    state character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_at timestamp without time zone,
    retention_time integer,
    run_id text DEFAULT '01KTSXQ6Q9PD3YEQP86N1NB0CV'::text NOT NULL
);


--
-- Name: link_module_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.link_module_migrations ALTER COLUMN id SET DEFAULT nextval('public.link_module_migrations_id_seq'::regclass);


--
-- Name: mikro_orm_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mikro_orm_migrations ALTER COLUMN id SET DEFAULT nextval('public.mikro_orm_migrations_id_seq'::regclass);


--
-- Name: order display_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."order" ALTER COLUMN display_id SET DEFAULT nextval('public.order_display_id_seq'::regclass);


--
-- Name: order_change_action ordering; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_change_action ALTER COLUMN ordering SET DEFAULT nextval('public.order_change_action_ordering_seq'::regclass);


--
-- Name: order_claim display_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_claim ALTER COLUMN display_id SET DEFAULT nextval('public.order_claim_display_id_seq'::regclass);


--
-- Name: order_exchange display_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_exchange ALTER COLUMN display_id SET DEFAULT nextval('public.order_exchange_display_id_seq'::regclass);


--
-- Name: return display_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.return ALTER COLUMN display_id SET DEFAULT nextval('public.return_display_id_seq'::regclass);


--
-- Name: script_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.script_migrations ALTER COLUMN id SET DEFAULT nextval('public.script_migrations_id_seq'::regclass);


--
-- Data for Name: account_holder; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: api_key; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.api_key VALUES ('apk_01KTSXRAE1VZ78BAQ9JFC83RKC', 'pk_7587df1c043fb92eebc89c01e37c6e50ef92da4fdc68ab9a49a731594c3d7b0e', '', 'pk_758***b0e', 'Default Publishable API Key', 'publishable', NULL, '', '2026-06-11 02:26:50.818+03', NULL, NULL, '2026-06-11 02:26:50.818+03', NULL);
INSERT INTO public.api_key VALUES ('apk_01KVEJXTDHS2CTF648R4T2KDNF', '9c65826af03c12daf2e8a77775a588384fbc2c3557a69e9188d8bd40b04b3a0a47a930804d8c4eaccfee09a83de937defb8abffdf6c8fcaf177ec3773b840c9f', '7d356995cdebd1762995deaf3db77a27', 'sk_9a9***35e', 'Interline Kargo', 'secret', NULL, 'user_01KTSXZN8CW3B3N2HBTZN0S85S', '2026-06-19 03:01:39.761+03', NULL, NULL, '2026-06-19 03:01:39.761+03', NULL);


--
-- Data for Name: application_method_buy_rules; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: application_method_target_rules; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: auth_identity; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.auth_identity VALUES ('authid_01KTSXZNCRDSG3SQBB704R5VNQ', '{"user_id": "user_01KTSXZN8CW3B3N2HBTZN0S85S"}', '2026-06-11 02:30:51.416+03', '2026-06-11 02:30:51.429+03', NULL);
INSERT INTO public.auth_identity VALUES ('authid_01KVXXVB3M7DSD624APC1ZFYBN', '{"user_id": "user_01KVXXVAVYMTA9J9WQKCSDFF96"}', '2026-06-25 02:01:09.365+03', '2026-06-25 02:01:09.386+03', NULL);
INSERT INTO public.auth_identity VALUES ('authid_01KWA4859ZQ5CECYZ2B84V9635', '{"user_id": "user_01KWA4852WMYYY51EZPD19R9DD"}', '2026-06-29 19:43:54.047+03', '2026-06-29 19:43:54.072+03', NULL);
INSERT INTO public.auth_identity VALUES ('authid_01KWARA11QAW74X58Y8A9ND5Y8', '{"user_id": "user_01KWARA0TDRYCEY1HP09TE6PAM"}', '2026-06-30 01:34:26.744+03', '2026-06-30 01:34:26.775+03', NULL);


--
-- Data for Name: auth_mfa_factor; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: auth_mfa_recovery_code; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: auth_verification_token; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: capture; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cart VALUES ('cart_01KTWRCBYW1CG0HN35G75F5XJN', 'reg_01KTSXRAKEE634P20BK48VVW24', NULL, 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', NULL, 'eur', NULL, NULL, '{"savings": "398 TL", "full_name": "Test Alıcı", "selections": "1. SİYAH / S, 2. SİYAH / S, 3. SİYAH / M", "final_price": "1399 TL", "original_price": "1797 TL", "payment_method": "Kapıda Nakit", "package_selection": "3 Adet Kampanyası"}', '2026-06-12 04:50:39.585+03', '2026-06-12 04:50:39.585+03', NULL, NULL, NULL);
INSERT INTO public.cart VALUES ('cart_01KTWRD2VXAVN84CNSDQRZZJ4E', 'reg_01KTSXRAKEE634P20BK48VVW24', NULL, 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', NULL, 'eur', NULL, NULL, '{"savings": "398 TL", "full_name": "Test Alıcı", "selections": "1. SİYAH / S, 2. SİYAH / S, 3. SİYAH / M", "final_price": "1399 TL", "original_price": "1797 TL", "payment_method": "Kapıda Nakit", "package_selection": "3 Adet Kampanyası"}', '2026-06-12 04:51:03.038+03', '2026-06-12 04:51:03.038+03', NULL, NULL, NULL);
INSERT INTO public.cart VALUES ('cart_01KTWRHP9Y8VG1VTDFZCTHTD05', 'reg_tr', NULL, 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', NULL, 'try', NULL, NULL, '{"savings": "398 TL", "full_name": "Test Alıcı", "selections": "1. SİYAH / S, 2. SİYAH / S, 3. SİYAH / M", "final_price": "1399 TL", "original_price": "1797 TL", "payment_method": "Kapıda Nakit", "package_selection": "3 Adet Kampanyası"}', '2026-06-12 04:53:34.015+03', '2026-06-12 04:53:34.015+03', NULL, NULL, NULL);
INSERT INTO public.cart VALUES ('cart_01KTWRM39KQZAMD9G0H2R7F441', 'reg_tr', 'cus_01KTWRM4HPPAJXC284QJ0GBE6V', 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'test_alici@kapidaodeme.com', 'try', 'caaddr_01KTWRM4JW90T959K3FK1K0G69', 'caaddr_01KTWRM4JW1759PV97CEXRFWKJ', '{"savings": "398 TL", "full_name": "Test Alıcı", "selections": "1. SİYAH / S, 2. SİYAH / S, 3. SİYAH / M", "final_price": "1399 TL", "original_price": "1797 TL", "payment_method": "Kapıda Nakit", "package_selection": "3 Adet Kampanyası"}', '2026-06-12 04:54:52.854+03', '2026-06-12 04:54:54.173+03', NULL, NULL, NULL);
INSERT INTO public.cart VALUES ('cart_01KTWRNGDXW61NSCMS7CSPAHAP', 'reg_tr', 'cus_01KTWRM4HPPAJXC284QJ0GBE6V', 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'test_alici@kapidaodeme.com', 'try', 'caaddr_01KTWRNHHYJX97KEA6GMS0KE1V', 'caaddr_01KTWRNHHY4Y9N4GSAQC0PXMD8', '{"savings": "398 TL", "full_name": "Test Alıcı", "selections": "1. SİYAH / S, 2. SİYAH / S, 3. SİYAH / M", "final_price": "1399 TL", "original_price": "1797 TL", "payment_method": "Kapıda Nakit", "package_selection": "3 Adet Kampanyası"}', '2026-06-12 04:55:39.07+03', '2026-06-12 04:55:40.224+03', NULL, NULL, NULL);
INSERT INTO public.cart VALUES ('cart_01KTWRPY8A8DQ7H52WDJBV9RTM', 'reg_tr', 'cus_01KTWRM4HPPAJXC284QJ0GBE6V', 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'test_alici@kapidaodeme.com', 'try', 'caaddr_01KTWRPZKJ288YWC239JE5R2BN', 'caaddr_01KTWRPZKJ5MWQMSR6GAP29VQN', '{"savings": "398 TL", "full_name": "Test Alıcı", "selections": "1. SİYAH / S, 2. SİYAH / S, 3. SİYAH / M", "final_price": "1399 TL", "original_price": "1797 TL", "payment_method": "Kapıda Nakit", "package_selection": "3 Adet Kampanyası"}', '2026-06-12 04:56:25.995+03', '2026-06-12 04:56:27.379+03', NULL, NULL, NULL);
INSERT INTO public.cart VALUES ('cart_01KTWRRCV8BQZZC847V8B4S9AK', 'reg_tr', 'cus_01KTWRM4HPPAJXC284QJ0GBE6V', 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'test_alici@kapidaodeme.com', 'try', 'caaddr_01KTWRRE1X47P0RPG3QEGN3TXE', 'caaddr_01KTWRRE1WT1SD6GVW83FY6Q61', '{"savings": "398 TL", "full_name": "Test Alıcı", "selections": "1. SİYAH / S, 2. SİYAH / S, 3. SİYAH / M", "final_price": "1399 TL", "original_price": "1797 TL", "payment_method": "Kapıda Nakit", "package_selection": "3 Adet Kampanyası"}', '2026-06-12 04:57:13.707+03', '2026-06-12 04:57:17.141+03', NULL, '2026-06-12 04:57:17.086+03', NULL);
INSERT INTO public.cart VALUES ('cart_01KTY7M0FXMZZHZJ5NB1G6NS90', 'reg_tr', NULL, 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', NULL, 'try', 'caaddr_01KTY7M0GB84AJXX1R64JX6FHP', NULL, '{"savings": "199 TL", "full_name": "HAKKI ŞAHİN", "selections": "1. BEYAZ - M, 2. BEYAZ - M", "final_price": "999 TL", "original_price": "1198 TL", "payment_method": "Kapıda Nakit", "package_selection": "2 Adet Kampanyası"}', '2026-06-12 18:36:13.073+03', '2026-06-12 18:36:13.073+03', NULL, NULL, NULL);
INSERT INTO public.cart VALUES ('cart_01KTYACYN7ENSSXJ5J6KK9AC9D', 'reg_tr', NULL, 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', NULL, 'try', 'caaddr_01KTYACYN9NJS3ER2YK97QF0Z8', NULL, '{"savings": "0 TL", "full_name": "HAKKI ŞAHİN", "selections": "1. BEYAZ - M", "final_price": "599 TL", "original_price": "599 TL", "payment_method": "Kapıda Kredi Kartı", "package_selection": "1 Adet Kampanyası"}', '2026-06-12 19:24:47.53+03', '2026-06-12 19:24:47.53+03', NULL, NULL, NULL);
INSERT INTO public.cart VALUES ('cart_01KTYAMK286SD1ZFFZSSNQZ2W1', 'reg_tr', 'cus_01KTYAMMCJWGMMSZD09MY0T0Y9', 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', '5323370081@kapidaodeme.com', 'try', 'caaddr_01KTYAMMD8W6D18T4X73SW1PBM', 'caaddr_01KTYAMMD78GY62FZBVJC6P5CX', '{"savings": "398 TL", "full_name": "HAKKI ŞAHİN", "selections": "1. SİYAH - M, 2. BEYAZ - M, 3. KIRMIZI - M", "final_price": "1399 TL", "original_price": "1797 TL", "payment_method": "Kapıda Kredi Kartı", "package_selection": "3 Adet Kampanyası"}', '2026-06-12 19:28:57.802+03', '2026-06-12 19:29:01.072+03', NULL, '2026-06-12 19:29:01.035+03', NULL);
INSERT INTO public.cart VALUES ('cart_01KTYDC1TEHT6KCSFT6C85Z7E7', 'reg_tr', 'cus_01KTYAMMCJWGMMSZD09MY0T0Y9', 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', '5323370081@kapidaodeme.com', 'try', 'caaddr_01KTYDC2C8JA02BCSY3YZ8T5WJ', 'caaddr_01KTYDC2C7WW44H6AB0HSSSXT7', '{"savings": "199 TL", "full_name": "HAKKI ŞAHİN", "selections": "1.  - M, 2.  - L", "final_price": "999 TL", "original_price": "1198 TL", "payment_method": "Kapıda Nakit", "package_selection": "2 Adet Kampanyası"}', '2026-06-12 20:16:43.727+03', '2026-06-12 20:16:45.664+03', NULL, '2026-06-12 20:16:45.637+03', NULL);
INSERT INTO public.cart VALUES ('cart_01KV1SMERMGYCP3DYPTMKGN29N', 'reg_tr', 'cus_01KTYAMMCJWGMMSZD09MY0T0Y9', 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', '5323370081@kapidaodeme.com', 'try', 'caaddr_01KV1SMFYS7RC98Q42FVTJA01X', 'caaddr_01KV1SMFYSSDEZTPYG6AR8WS77', '{"savings": "199 TL", "full_name": "Cizgi Butik", "selections": "1. SİYAH - M, 2. BEYAZ - M", "final_price": "999 TL", "original_price": "1198 TL", "payment_method": "Kapıda Nakit", "package_selection": "2 Adet Kampanyası"}', '2026-06-14 03:48:45.342+03', '2026-06-14 03:48:47.945+03', NULL, '2026-06-14 03:48:47.922+03', NULL);
INSERT INTO public.cart VALUES ('cart_01KV484DG1GWYZQJ606HMVXGWD', 'reg_tr', 'cus_01KV484EN0DHHPCJKPD827CJPW', 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', '905323370081@kapidaodeme.com', 'try', 'caaddr_01KV484ENQ921XVSPW52A520EF', 'caaddr_01KV484ENQW2GXSFSZE0FCVYPD', '{"savings": "-802 TL", "full_name": "HAKKI ŞAHİN", "selections": "1. BEYAZ - L, 2. KIRMIZI - M", "final_price": "2000 TL", "original_price": "1198 TL", "payment_method": "Kapıda Nakit", "package_selection": "2 Adet Kampanyası"}', '2026-06-15 02:40:37.265+03', '2026-06-15 02:40:38.456+03', NULL, NULL, NULL);
INSERT INTO public.cart VALUES ('cart_01KV48DGYACWQRAW2EW42KM2SF', 'reg_tr', 'cus_01KV484EN0DHHPCJKPD827CJPW', 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', '905323370081@kapidaodeme.com', 'try', 'caaddr_01KV48DK5A887VGK2MYBNRVM94', 'caaddr_01KV48DK59V3C6NTYWE14C6634', '{"savings": "-802 TL", "full_name": "HAKKI ŞAHİN", "selections": "1. KIRMIZI - M, 2. BEYAZ - XL", "final_price": "2000 TL", "original_price": "1198 TL", "payment_method": "Kapıda Nakit", "package_selection": "2 Adet Kampanyası"}', '2026-06-15 02:45:35.701+03', '2026-06-15 02:45:40.86+03', NULL, '2026-06-15 02:45:40.818+03', NULL);
INSERT INTO public.cart VALUES ('cart_01KV5NCWPXWYV6A4HPEBJM23HD', 'reg_tr', 'cus_01KV484EN0DHHPCJKPD827CJPW', 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', '905323370081@kapidaodeme.com', 'try', 'caaddr_01KV5NCXS6QB010G3T5SAQMJQQ', 'caaddr_01KV5NCXS66ECYH56ZG5G93B5W', '{"savings": "-802 TL", "full_name": "HAKKI ŞAHİN", "selections": "1. BEYAZ - L, 2. KIRMIZI - M", "final_price": "2000 TL", "original_price": "1198 TL", "payment_method": "Kapıda Nakit", "package_selection": "2 Adet Kampanyası"}', '2026-06-15 15:51:40.915+03', '2026-06-15 15:51:43.813+03', NULL, '2026-06-15 15:51:43.788+03', NULL);
INSERT INTO public.cart VALUES ('cart_01KV8NAT32TWSS423S5D1G8PTD', 'reg_tr', 'cus_01KV484EN0DHHPCJKPD827CJPW', 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', '905323370081@kapidaodeme.com', 'try', 'caaddr_01KV8NAV1QHW6YYG4DP31T641Q', 'caaddr_01KV8NAV1PX7BJZJJQ5WSTXPR1', '{"savings": "-802 TL", "full_name": "HAKKI ŞAHİN", "selections": "1. BEYAZ - XXL, 2. BEYAZ - XL", "final_price": "2000 TL", "original_price": "1198 TL", "payment_method": "Kapıda Nakit", "package_selection": "2 Adet Kampanyası"}', '2026-06-16 19:48:15.973+03', '2026-06-16 19:48:18.397+03', NULL, '2026-06-16 19:48:18.36+03', NULL);


--
-- Data for Name: cart_address; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cart_address VALUES ('caaddr_01KTWRM39NZC16MR3THC5JYNX5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tr', NULL, NULL, NULL, NULL, '2026-06-12 04:54:52.854+03', '2026-06-12 04:54:52.854+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTWRM4JW1759PV97CEXRFWKJ', NULL, NULL, 'Test', 'Alıcı', 'Test Mahallesi, Deneme Sokak No: 123', NULL, 'İstanbul', 'tr', 'Kadıköy', NULL, '05555555555', NULL, '2026-06-12 04:54:54.173+03', '2026-06-12 04:54:54.173+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTWRM4JW90T959K3FK1K0G69', NULL, NULL, 'Test', 'Alıcı', 'Test Mahallesi, Deneme Sokak No: 123', NULL, 'İstanbul', 'tr', 'Kadıköy', NULL, '05555555555', NULL, '2026-06-12 04:54:54.173+03', '2026-06-12 04:54:54.173+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTWRNGDX24SNCNFC0XS2HP4A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tr', NULL, NULL, NULL, NULL, '2026-06-12 04:55:39.07+03', '2026-06-12 04:55:39.07+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTWRNHHY4Y9N4GSAQC0PXMD8', NULL, NULL, 'Test', 'Alıcı', 'Test Mahallesi, Deneme Sokak No: 123', NULL, 'İstanbul', 'tr', 'Kadıköy', NULL, '05555555555', NULL, '2026-06-12 04:55:40.223+03', '2026-06-12 04:55:40.223+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTWRNHHYJX97KEA6GMS0KE1V', NULL, NULL, 'Test', 'Alıcı', 'Test Mahallesi, Deneme Sokak No: 123', NULL, 'İstanbul', 'tr', 'Kadıköy', NULL, '05555555555', NULL, '2026-06-12 04:55:40.223+03', '2026-06-12 04:55:40.223+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTWRPY8AR46Y81GKBRGTB4QA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tr', NULL, NULL, NULL, NULL, '2026-06-12 04:56:25.995+03', '2026-06-12 04:56:25.995+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTWRPZKJ5MWQMSR6GAP29VQN', NULL, NULL, 'Test', 'Alıcı', 'Test Mahallesi, Deneme Sokak No: 123', NULL, 'İstanbul', 'tr', 'Kadıköy', NULL, '05555555555', NULL, '2026-06-12 04:56:27.379+03', '2026-06-12 04:56:27.379+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTWRPZKJ288YWC239JE5R2BN', NULL, NULL, 'Test', 'Alıcı', 'Test Mahallesi, Deneme Sokak No: 123', NULL, 'İstanbul', 'tr', 'Kadıköy', NULL, '05555555555', NULL, '2026-06-12 04:56:27.379+03', '2026-06-12 04:56:27.379+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTWRRCV966M7SX4CD9569V0Z', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tr', NULL, NULL, NULL, NULL, '2026-06-12 04:57:13.707+03', '2026-06-12 04:57:13.707+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTWRRE1WT1SD6GVW83FY6Q61', NULL, NULL, 'Test', 'Alıcı', 'Test Mahallesi, Deneme Sokak No: 123', NULL, 'İstanbul', 'tr', 'Kadıköy', NULL, '05555555555', NULL, '2026-06-12 04:57:14.941+03', '2026-06-12 04:57:14.941+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTWRRE1X47P0RPG3QEGN3TXE', NULL, NULL, 'Test', 'Alıcı', 'Test Mahallesi, Deneme Sokak No: 123', NULL, 'İstanbul', 'tr', 'Kadıköy', NULL, '05555555555', NULL, '2026-06-12 04:57:14.941+03', '2026-06-12 04:57:14.941+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTY7M0GB84AJXX1R64JX6FHP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tr', NULL, NULL, NULL, NULL, '2026-06-12 18:36:13.071+03', '2026-06-12 18:36:13.071+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTYACYN9NJS3ER2YK97QF0Z8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tr', NULL, NULL, NULL, NULL, '2026-06-12 19:24:47.53+03', '2026-06-12 19:24:47.53+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTYAMK2988VDGHJSZNVCKP2K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tr', NULL, NULL, NULL, NULL, '2026-06-12 19:28:57.801+03', '2026-06-12 19:28:57.801+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTYAMMD78GY62FZBVJC6P5CX', NULL, NULL, 'HAKKI', 'ŞAHİN', 'dsfsdfsdfsd fasf', NULL, 'İSTANBUL', 'tr', 'GÜNGÖREN', NULL, '(532) 337-0081', NULL, '2026-06-12 19:28:59.176+03', '2026-06-12 19:28:59.176+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTYAMMD8W6D18T4X73SW1PBM', NULL, NULL, 'HAKKI', 'ŞAHİN', 'dsfsdfsdfsd fasf', NULL, 'İSTANBUL', 'tr', 'GÜNGÖREN', NULL, '(532) 337-0081', NULL, '2026-06-12 19:28:59.176+03', '2026-06-12 19:28:59.176+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTYDC1TEGW2GNR1A2FK3MYHN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tr', NULL, NULL, NULL, NULL, '2026-06-12 20:16:43.727+03', '2026-06-12 20:16:43.727+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTYDC2C7WW44H6AB0HSSSXT7', NULL, NULL, 'HAKKI', 'ŞAHİN', 'jkjkjkjkhkhkjhkhkhkhjhk', NULL, 'İSTANBUL', 'tr', 'GÜNGÖREN', NULL, '(532) 337-0081', NULL, '2026-06-12 20:16:44.296+03', '2026-06-12 20:16:44.296+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KTYDC2C8JA02BCSY3YZ8T5WJ', NULL, NULL, 'HAKKI', 'ŞAHİN', 'jkjkjkjkhkhkjhkhkhkhjhk', NULL, 'İSTANBUL', 'tr', 'GÜNGÖREN', NULL, '(532) 337-0081', NULL, '2026-06-12 20:16:44.296+03', '2026-06-12 20:16:44.296+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KV1SMERT24PPEQ0M9XNKBQG7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tr', NULL, NULL, NULL, NULL, '2026-06-14 03:48:45.34+03', '2026-06-14 03:48:45.341+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KV1SMFYSSDEZTPYG6AR8WS77', NULL, NULL, 'Cizgi', 'Butik', 'SDSD<D<SDSZSDSD', NULL, 'İSTANBUL', 'tr', 'GÜNGÖREN', NULL, '(532) 337-0081', NULL, '2026-06-14 03:48:46.553+03', '2026-06-14 03:48:46.553+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KV1SMFYS7RC98Q42FVTJA01X', NULL, NULL, 'Cizgi', 'Butik', 'SDSD<D<SDSZSDSD', NULL, 'İSTANBUL', 'tr', 'GÜNGÖREN', NULL, '(532) 337-0081', NULL, '2026-06-14 03:48:46.553+03', '2026-06-14 03:48:46.553+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KV484DGBF9RYFTYWZMG99B53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tr', NULL, NULL, NULL, NULL, '2026-06-15 02:40:37.262+03', '2026-06-15 02:40:37.262+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KV484ENQW2GXSFSZE0FCVYPD', NULL, NULL, 'HAKKI', 'ŞAHİN', 'MERKEZ MAH ', NULL, 'İstanbul', 'tr', 'Güngören', NULL, '+905323370081', NULL, '2026-06-15 02:40:38.456+03', '2026-06-15 02:40:38.456+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KV484ENQ921XVSPW52A520EF', NULL, NULL, 'HAKKI', 'ŞAHİN', 'MERKEZ MAH ', NULL, 'İstanbul', 'tr', 'Güngören', NULL, '+905323370081', NULL, '2026-06-15 02:40:38.456+03', '2026-06-15 02:40:38.456+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KV48DGYJ7J4H299CF5N9QNRG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tr', NULL, NULL, NULL, NULL, '2026-06-15 02:45:35.7+03', '2026-06-15 02:45:35.7+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KV48DK59V3C6NTYWE14C6634', NULL, NULL, 'HAKKI', 'ŞAHİN', 'DADSADASDASD', NULL, 'Bayburt', 'tr', 'Merkez', NULL, '+905323370081', NULL, '2026-06-15 02:45:37.963+03', '2026-06-15 02:45:37.963+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KV48DK5A887VGK2MYBNRVM94', NULL, NULL, 'HAKKI', 'ŞAHİN', 'DADSADASDASD', NULL, 'Bayburt', 'tr', 'Merkez', NULL, '+905323370081', NULL, '2026-06-15 02:45:37.964+03', '2026-06-15 02:45:37.964+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KV5NCWQ9H62DZJ0W98QHGQ54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tr', NULL, NULL, NULL, NULL, '2026-06-15 15:51:40.912+03', '2026-06-15 15:51:40.912+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KV5NCXS66ECYH56ZG5G93B5W', NULL, NULL, 'HAKKI', 'ŞAHİN', 'czsczxvxcbxcvxcvxcvxcv', NULL, 'Aksaray', 'tr', 'Güzelyurt', NULL, '+905323370081', NULL, '2026-06-15 15:51:41.991+03', '2026-06-15 15:51:41.991+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KV5NCXS6QB010G3T5SAQMJQQ', NULL, NULL, 'HAKKI', 'ŞAHİN', 'czsczxvxcbxcvxcvxcvxcv', NULL, 'Aksaray', 'tr', 'Güzelyurt', NULL, '+905323370081', NULL, '2026-06-15 15:51:41.991+03', '2026-06-15 15:51:41.991+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KV8NAT346WCTRW8CD5KEKZH3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tr', NULL, NULL, NULL, NULL, '2026-06-16 19:48:15.972+03', '2026-06-16 19:48:15.972+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KV8NAV1PX7BJZJJQ5WSTXPR1', NULL, NULL, 'HAKKI', 'ŞAHİN', 'fdfdfdfdfddfdf', NULL, 'Amasya', 'tr', 'Merzifon', NULL, '+905323370081', NULL, '2026-06-16 19:48:16.951+03', '2026-06-16 19:48:16.951+03', NULL);
INSERT INTO public.cart_address VALUES ('caaddr_01KV8NAV1QHW6YYG4DP31T641Q', NULL, NULL, 'HAKKI', 'ŞAHİN', 'fdfdfdfdfddfdf', NULL, 'Amasya', 'tr', 'Merzifon', NULL, '+905323370081', NULL, '2026-06-16 19:48:16.951+03', '2026-06-16 19:48:16.951+03', NULL);


--
-- Data for Name: cart_line_item; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cart_line_item VALUES ('cali_01KTWRHPSDFD8XF7HZ1HWJC32F', 'cart_01KTWRHP9Y8VG1VTDFZCTHTD05', 'Türkiye Milli Takım Tshirt', 'SİYAH / S', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 2, 'variant_01KTWQBSF6QS6HG8VQPH1TH5PJ', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-SİYAH-S', NULL, 'SİYAH / S', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 04:53:34.51+03', '2026-06-12 04:53:34.511+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KTWRHQ9WZAZBVANYB14EHGB7', 'cart_01KTWRHP9Y8VG1VTDFZCTHTD05', 'Türkiye Milli Takım Tshirt', 'SİYAH / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 1, 'variant_01KTWQBSR3DTDCWMY5RC6PJZRR', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-SİYAH-M', NULL, 'SİYAH / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 04:53:35.036+03', '2026-06-12 04:53:35.036+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KTWRM3P87NJ5VA25GRQ1X562', 'cart_01KTWRM39KQZAMD9G0H2R7F441', 'Türkiye Milli Takım Tshirt', 'SİYAH / S', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 2, 'variant_01KTWQBSF6QS6HG8VQPH1TH5PJ', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-SİYAH-S', NULL, 'SİYAH / S', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 04:54:53.256+03', '2026-06-12 04:54:53.256+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KTWRM467J1J2DREQP3DQX2PX', 'cart_01KTWRM39KQZAMD9G0H2R7F441', 'Türkiye Milli Takım Tshirt', 'SİYAH / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 1, 'variant_01KTWQBSR3DTDCWMY5RC6PJZRR', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-SİYAH-M', NULL, 'SİYAH / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 04:54:53.768+03', '2026-06-12 04:54:53.768+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KTWRNGWF5CPCB4V3Z57CE33S', 'cart_01KTWRNGDXW61NSCMS7CSPAHAP', 'Türkiye Milli Takım Tshirt', 'SİYAH / S', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 2, 'variant_01KTWQBSF6QS6HG8VQPH1TH5PJ', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-SİYAH-S', NULL, 'SİYAH / S', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 04:55:39.535+03', '2026-06-12 04:55:39.535+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KTWRNH8TY0H0MSYJBVV8MY8X', 'cart_01KTWRNGDXW61NSCMS7CSPAHAP', 'Türkiye Milli Takım Tshirt', 'SİYAH / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 1, 'variant_01KTWQBSR3DTDCWMY5RC6PJZRR', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-SİYAH-M', NULL, 'SİYAH / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 04:55:39.93+03', '2026-06-12 04:55:39.93+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KTWRPYPBNR8S7XS6CS92JDT1', 'cart_01KTWRPY8A8DQ7H52WDJBV9RTM', 'Türkiye Milli Takım Tshirt', 'SİYAH / S', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 2, 'variant_01KTWQBSF6QS6HG8VQPH1TH5PJ', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-SİYAH-S', NULL, 'SİYAH / S', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 04:56:26.443+03', '2026-06-12 04:56:26.443+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KTWRPZ4ACQTFK0W40SRBXE52', 'cart_01KTWRPY8A8DQ7H52WDJBV9RTM', 'Türkiye Milli Takım Tshirt', 'SİYAH / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 1, 'variant_01KTWQBSR3DTDCWMY5RC6PJZRR', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-SİYAH-M', NULL, 'SİYAH / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 04:56:26.89+03', '2026-06-12 04:56:26.89+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KTWRRD9ZBKDRB7XCGMFQEWHG', 'cart_01KTWRRCV8BQZZC847V8B4S9AK', 'Türkiye Milli Takım Tshirt', 'SİYAH / S', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 2, 'variant_01KTWQBSF6QS6HG8VQPH1TH5PJ', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-SİYAH-S', NULL, 'SİYAH / S', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 04:57:14.175+03', '2026-06-12 04:57:14.175+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KTWRRDS680576J6AWE5KV2GK', 'cart_01KTWRRCV8BQZZC847V8B4S9AK', 'Türkiye Milli Takım Tshirt', 'SİYAH / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 1, 'variant_01KTWQBSR3DTDCWMY5RC6PJZRR', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-SİYAH-M', NULL, 'SİYAH / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 04:57:14.663+03', '2026-06-12 04:57:14.663+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KTY7M191MVPF66BSEHJY15EW', 'cart_01KTY7M0FXMZZHZJ5NB1G6NS90', 'Türkiye Milli Takım Tshirt', 'BEYAZ / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 2, 'variant_01KTWQBTSRFMQBWRJDQJM6FG94', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-BEYAZ-M', NULL, 'BEYAZ / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 18:36:13.858+03', '2026-06-12 18:36:13.858+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KTYACZ0G6TVD2B22VN82FW4Q', 'cart_01KTYACYN7ENSSXJ5J6KK9AC9D', 'Türkiye Milli Takım Tshirt', 'BEYAZ / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 1, 'variant_01KTWQBTSRFMQBWRJDQJM6FG94', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-BEYAZ-M', NULL, 'BEYAZ / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 19:24:47.888+03', '2026-06-12 19:24:47.888+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KTYAMKDVT2Z5DGN0Q3WES8XR', 'cart_01KTYAMK286SD1ZFFZSSNQZ2W1', 'Türkiye Milli Takım Tshirt', 'SİYAH / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 1, 'variant_01KTWQBSR3DTDCWMY5RC6PJZRR', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-SİYAH-M', NULL, 'SİYAH / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 19:28:58.171+03', '2026-06-12 19:28:58.171+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KTYAMKRANM2FDDM114JS1YQ4', 'cart_01KTYAMK286SD1ZFFZSSNQZ2W1', 'Türkiye Milli Takım Tshirt', 'BEYAZ / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 1, 'variant_01KTWQBTSRFMQBWRJDQJM6FG94', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-BEYAZ-M', NULL, 'BEYAZ / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 19:28:58.507+03', '2026-06-12 19:28:58.507+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KTYAMM60SATPVWEPVAR0AY3Q', 'cart_01KTYAMK286SD1ZFFZSSNQZ2W1', 'Türkiye Milli Takım Tshirt', 'KIRMIZI / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 1, 'variant_01KTWQBVZEX916PGDA851QTEZ6', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-KIRMIZI-M', NULL, 'KIRMIZI / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 19:28:58.944+03', '2026-06-12 19:28:58.944+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KTYDC25ERYTM0G1CWCEYK292', 'cart_01KTYDC1TEHT6KCSFT6C85Z7E7', 'Türkiye Milli Takım Tshirt', 'SİYAH / S', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 2, 'variant_01KTWQBSF6QS6HG8VQPH1TH5PJ', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-SİYAH-S', NULL, 'SİYAH / S', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 20:16:44.078+03', '2026-06-12 20:16:44.078+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KV1SMF7A8FFGXBR2MCP92SRY', 'cart_01KV1SMERMGYCP3DYPTMKGN29N', 'Türkiye Milli Takım Tshirt', 'SİYAH / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 1, 'variant_01KTWQBSR3DTDCWMY5RC6PJZRR', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-SİYAH-M', NULL, 'SİYAH / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-14 03:48:45.802+03', '2026-06-14 03:48:45.802+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KV1SMFQ4KPSGR0PJEDX7BSVQ', 'cart_01KV1SMERMGYCP3DYPTMKGN29N', 'Türkiye Milli Takım Tshirt', 'BEYAZ / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 1, 'variant_01KTWQBTSRFMQBWRJDQJM6FG94', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-BEYAZ-M', NULL, 'BEYAZ / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-14 03:48:46.309+03', '2026-06-14 03:48:46.309+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KV484E72N4BJEAAC9BJ10TTG', 'cart_01KV484DG1GWYZQJ606HMVXGWD', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', 'BEYAZ / L', 'http://localhost:8001/uploads/1781402593396-ChatGPTImage14Haz202604_27_05.png', 1, 'variant_01KV22EQBHPXC304YQGCZG3HNP', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', '', NULL, NULL, NULL, 'turkiye-milli-takim-bisiklet-yaka-tshirt', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-L', NULL, 'BEYAZ / L', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-15 02:40:37.986+03', '2026-06-15 02:40:37.986+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KV484EF1KTRMH5RPDVDWTJQ1', 'cart_01KV484DG1GWYZQJ606HMVXGWD', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', 'KIRMIZI / M', 'http://localhost:8001/uploads/1781402593396-ChatGPTImage14Haz202604_27_05.png', 1, 'variant_01KV22EPBJTYXS1HAY5BK2B2QP', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', '', NULL, NULL, NULL, 'turkiye-milli-takim-bisiklet-yaka-tshirt', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-M', NULL, 'KIRMIZI / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-15 02:40:38.242+03', '2026-06-15 02:40:38.242+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KV48DHVP9ETTBC05RSAN746N', 'cart_01KV48DGYACWQRAW2EW42KM2SF', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', 'KIRMIZI / M', 'http://localhost:8001/uploads/1781402593396-ChatGPTImage14Haz202604_27_05.png', 1, 'variant_01KV22EPBJTYXS1HAY5BK2B2QP', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', '', NULL, NULL, NULL, 'turkiye-milli-takim-bisiklet-yaka-tshirt', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-M', NULL, 'KIRMIZI / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-15 02:45:36.631+03', '2026-06-15 02:45:36.631+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KV48DJPD7R307S55WGCW5KMT', 'cart_01KV48DGYACWQRAW2EW42KM2SF', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', 'BEYAZ / XL', 'http://localhost:8001/uploads/1781402593396-ChatGPTImage14Haz202604_27_05.png', 1, 'variant_01KV22EQMTZJKSDN9YDK00S8S7', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', '', NULL, NULL, NULL, 'turkiye-milli-takim-bisiklet-yaka-tshirt', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-XL', NULL, 'BEYAZ / XL', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-15 02:45:37.486+03', '2026-06-15 02:45:37.486+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KV5NCX9EKG221B7SZD1HYSSB', 'cart_01KV5NCWPXWYV6A4HPEBJM23HD', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', 'BEYAZ / L', 'http://localhost:8001/uploads/1781402593396-ChatGPTImage14Haz202604_27_05.png', 1, 'variant_01KV22EQBHPXC304YQGCZG3HNP', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', '', NULL, NULL, NULL, 'turkiye-milli-takim-bisiklet-yaka-tshirt', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-L', NULL, 'BEYAZ / L', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-15 15:51:41.487+03', '2026-06-15 15:51:41.488+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KV5NCXK9RVZZBY44CVSK61ND', 'cart_01KV5NCWPXWYV6A4HPEBJM23HD', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', 'KIRMIZI / M', 'http://localhost:8001/uploads/1781402593396-ChatGPTImage14Haz202604_27_05.png', 1, 'variant_01KV22EPBJTYXS1HAY5BK2B2QP', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', '', NULL, NULL, NULL, 'turkiye-milli-takim-bisiklet-yaka-tshirt', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-M', NULL, 'KIRMIZI / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-15 15:51:41.801+03', '2026-06-15 15:51:41.801+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KV8NATHGBAP3M4TK561M1FXB', 'cart_01KV8NAT32TWSS423S5D1G8PTD', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', 'BEYAZ / XXL', 'http://localhost:8001/uploads/1781402593396-ChatGPTImage14Haz202604_27_05.png', 1, 'variant_01KV22EQVZTZDYQSZNDCXW3PWN', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', '', NULL, NULL, NULL, 'turkiye-milli-takim-bisiklet-yaka-tshirt', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-XXL', NULL, 'BEYAZ / XXL', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-16 19:48:16.432+03', '2026-06-16 19:48:16.432+03', NULL, NULL, false, false);
INSERT INTO public.cart_line_item VALUES ('cali_01KV8NATVE1VTAK1VVPD3EW79P', 'cart_01KV8NAT32TWSS423S5D1G8PTD', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', 'BEYAZ / XL', 'http://localhost:8001/uploads/1781402593396-ChatGPTImage14Haz202604_27_05.png', 1, 'variant_01KV22EQMTZJKSDN9YDK00S8S7', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', '', NULL, NULL, NULL, 'turkiye-milli-takim-bisiklet-yaka-tshirt', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-XL', NULL, 'BEYAZ / XL', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-16 19:48:16.75+03', '2026-06-16 19:48:16.75+03', NULL, NULL, false, false);


--
-- Data for Name: cart_line_item_adjustment; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cart_line_item_tax_line; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cart_payment_collection; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cart_payment_collection VALUES ('cart_01KTWRRCV8BQZZC847V8B4S9AK', 'pay_col_01KTWRRFH72RHHPVKB6J09K32X', 'capaycol_01KTWRRFJ3PS64QSDBT3YBZX5N', '2026-06-12 04:57:16.483195+03', '2026-06-12 04:57:16.483195+03', NULL);
INSERT INTO public.cart_payment_collection VALUES ('cart_01KTYAMK286SD1ZFFZSSNQZ2W1', 'pay_col_01KTYAMNRT2GAXAQR7BB8JCNZV', 'capaycol_01KTYAMNSJ2G7ZS85S7MR1XSAB', '2026-06-12 19:29:00.592415+03', '2026-06-12 19:29:00.592415+03', NULL);
INSERT INTO public.cart_payment_collection VALUES ('cart_01KTYDC1TEHT6KCSFT6C85Z7E7', 'pay_col_01KTYDC3D14J72950CRJ98RNQV', 'capaycol_01KTYDC3DB305666D0W0C8J5NS', '2026-06-12 20:16:45.354975+03', '2026-06-12 20:16:45.354975+03', NULL);
INSERT INTO public.cart_payment_collection VALUES ('cart_01KV1SMERMGYCP3DYPTMKGN29N', 'pay_col_01KV1SMH0B8R2JG2H4SV4S34ZK', 'capaycol_01KV1SMH0KTKW5X9AA4YQE0F8C', '2026-06-14 03:48:47.635469+03', '2026-06-14 03:48:47.635469+03', NULL);
INSERT INTO public.cart_payment_collection VALUES ('cart_01KV484DG1GWYZQJ606HMVXGWD', 'pay_col_01KV484FZDDX1RZX7Y2GZ369T5', 'capaycol_01KV484FZPTYCRKZMQ29K4GVVG', '2026-06-15 02:40:39.798052+03', '2026-06-15 02:40:39.798052+03', NULL);
INSERT INTO public.cart_payment_collection VALUES ('cart_01KV48DGYACWQRAW2EW42KM2SF', 'pay_col_01KV48DNCG5FCDE5WRA8QR9D8A', 'capaycol_01KV48DNCZ22AVK07VH7CFP8T3', '2026-06-15 02:45:40.254+03', '2026-06-15 02:45:40.254+03', NULL);
INSERT INTO public.cart_payment_collection VALUES ('cart_01KV5NCWPXWYV6A4HPEBJM23HD', 'pay_col_01KV5NCZ93Y88Q5330YMM5X1DB', 'capaycol_01KV5NCZ9DG4ER0Y4MRGF4J22T', '2026-06-15 15:51:43.533339+03', '2026-06-15 15:51:43.533339+03', NULL);
INSERT INTO public.cart_payment_collection VALUES ('cart_01KV8NAT32TWSS423S5D1G8PTD', 'pay_col_01KV8NAW2CM1TE9Q7X150RRGSE', 'capaycol_01KV8NAW2QX1QDPGGKB7N66V1R', '2026-06-16 19:48:18.006454+03', '2026-06-16 19:48:18.006454+03', NULL);


--
-- Data for Name: cart_promotion; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cart_shipping_method; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cart_shipping_method VALUES ('casm_01KTWRQ1038SSTPGSN8CY1KNWD', 'cart_01KTWRPY8A8DQ7H52WDJBV9RTM', 'Standard Shipping', NULL, 0, '{"value": "0", "precision": 20}', false, 'so_01KTSXRB0Q7VGVK082FMXJJ0PZ', '{}', NULL, '2026-06-12 04:56:28.804+03', '2026-06-12 04:56:28.804+03', NULL);
INSERT INTO public.cart_shipping_method VALUES ('casm_01KTWRRF1J02K8ETPMCVKA4TRM', 'cart_01KTWRRCV8BQZZC847V8B4S9AK', 'Standard Shipping', NULL, 0, '{"value": "0", "precision": 20}', false, 'so_01KTSXRB0Q7VGVK082FMXJJ0PZ', '{}', NULL, '2026-06-12 04:57:15.955+03', '2026-06-12 04:57:15.955+03', NULL);
INSERT INTO public.cart_shipping_method VALUES ('casm_01KTYAMN712GDP638G2E6PFK6M', 'cart_01KTYAMK286SD1ZFFZSSNQZ2W1', 'Standard Shipping', NULL, 0, '{"value": "0", "precision": 20}', false, 'so_01KTSXRB0Q7VGVK082FMXJJ0PZ', '{}', NULL, '2026-06-12 19:29:00.001+03', '2026-06-12 19:29:00.001+03', NULL);
INSERT INTO public.cart_shipping_method VALUES ('casm_01KTYDC306TRJW9F3KQ9N6E0PE', 'cart_01KTYDC1TEHT6KCSFT6C85Z7E7', 'Standard Shipping', NULL, 0, '{"value": "0", "precision": 20}', false, 'so_01KTSXRB0Q7VGVK082FMXJJ0PZ', '{}', NULL, '2026-06-12 20:16:44.934+03', '2026-06-12 20:16:44.934+03', NULL);
INSERT INTO public.cart_shipping_method VALUES ('casm_01KV1SMGNZXM2B41R14JDNMY16', 'cart_01KV1SMERMGYCP3DYPTMKGN29N', 'Standard Shipping', NULL, 0, '{"value": "0", "precision": 20}', false, 'so_01KTSXRB0Q7VGVK082FMXJJ0PZ', '{}', NULL, '2026-06-14 03:48:47.296+03', '2026-06-14 03:48:47.296+03', NULL);
INSERT INTO public.cart_shipping_method VALUES ('casm_01KV484FP28TVF6VPVZN2RQNMY', 'cart_01KV484DG1GWYZQJ606HMVXGWD', 'Standard Shipping', NULL, 0, '{"value": "0", "precision": 20}', false, 'so_01KTSXRB0Q7VGVK082FMXJJ0PZ', '{}', NULL, '2026-06-15 02:40:39.49+03', '2026-06-15 02:40:39.49+03', NULL);
INSERT INTO public.cart_shipping_method VALUES ('casm_01KV48DMVQ6YZF73V9RJPESJ29', 'cart_01KV48DGYACWQRAW2EW42KM2SF', 'Standard Shipping', NULL, 0, '{"value": "0", "precision": 20}', false, 'so_01KTSXRB0Q7VGVK082FMXJJ0PZ', '{}', NULL, '2026-06-15 02:45:39.703+03', '2026-06-15 02:45:39.703+03', NULL);
INSERT INTO public.cart_shipping_method VALUES ('casm_01KV5NCZ09JFAXHA5JP5THFBK4', 'cart_01KV5NCWPXWYV6A4HPEBJM23HD', 'Standard Shipping', NULL, 0, '{"value": "0", "precision": 20}', false, 'so_01KTSXRB0Q7VGVK082FMXJJ0PZ', '{}', NULL, '2026-06-15 15:51:43.241+03', '2026-06-15 15:51:43.241+03', NULL);
INSERT INTO public.cart_shipping_method VALUES ('casm_01KV8NAVSG67P6N4549KRVPJ5Z', 'cart_01KV8NAT32TWSS423S5D1G8PTD', 'Standard Shipping', NULL, 0, '{"value": "0", "precision": 20}', false, 'so_01KTSXRB0Q7VGVK082FMXJJ0PZ', '{}', NULL, '2026-06-16 19:48:17.712+03', '2026-06-16 19:48:17.712+03', NULL);


--
-- Data for Name: cart_shipping_method_adjustment; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cart_shipping_method_tax_line; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: credit_line; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.currency VALUES ('usd', '$', '$', 2, 0, '{"value": "0", "precision": 20}', 'US Dollar', '2026-06-11 02:26:37.973+03', '2026-06-11 02:26:37.974+03', NULL);
INSERT INTO public.currency VALUES ('cad', 'CA$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Canadian Dollar', '2026-06-11 02:26:37.976+03', '2026-06-11 02:26:37.976+03', NULL);
INSERT INTO public.currency VALUES ('eur', '€', '€', 2, 0, '{"value": "0", "precision": 20}', 'Euro', '2026-06-11 02:26:37.976+03', '2026-06-11 02:26:37.976+03', NULL);
INSERT INTO public.currency VALUES ('aed', 'AED', 'د.إ.‏', 2, 0, '{"value": "0", "precision": 20}', 'United Arab Emirates Dirham', '2026-06-11 02:26:37.976+03', '2026-06-11 02:26:37.976+03', NULL);
INSERT INTO public.currency VALUES ('afn', 'Af', '؋', 0, 0, '{"value": "0", "precision": 20}', 'Afghan Afghani', '2026-06-11 02:26:37.977+03', '2026-06-11 02:26:37.977+03', NULL);
INSERT INTO public.currency VALUES ('all', 'ALL', 'Lek', 0, 0, '{"value": "0", "precision": 20}', 'Albanian Lek', '2026-06-11 02:26:37.977+03', '2026-06-11 02:26:37.977+03', NULL);
INSERT INTO public.currency VALUES ('amd', 'AMD', 'դր.', 0, 0, '{"value": "0", "precision": 20}', 'Armenian Dram', '2026-06-11 02:26:37.977+03', '2026-06-11 02:26:37.977+03', NULL);
INSERT INTO public.currency VALUES ('ars', 'AR$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Argentine Peso', '2026-06-11 02:26:37.977+03', '2026-06-11 02:26:37.977+03', NULL);
INSERT INTO public.currency VALUES ('aud', 'AU$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Australian Dollar', '2026-06-11 02:26:37.977+03', '2026-06-11 02:26:37.977+03', NULL);
INSERT INTO public.currency VALUES ('azn', 'man.', 'ман.', 2, 0, '{"value": "0", "precision": 20}', 'Azerbaijani Manat', '2026-06-11 02:26:37.978+03', '2026-06-11 02:26:37.978+03', NULL);
INSERT INTO public.currency VALUES ('bam', 'KM', 'KM', 2, 0, '{"value": "0", "precision": 20}', 'Bosnia-Herzegovina Convertible Mark', '2026-06-11 02:26:37.978+03', '2026-06-11 02:26:37.978+03', NULL);
INSERT INTO public.currency VALUES ('bdt', 'Tk', '৳', 2, 0, '{"value": "0", "precision": 20}', 'Bangladeshi Taka', '2026-06-11 02:26:37.978+03', '2026-06-11 02:26:37.978+03', NULL);
INSERT INTO public.currency VALUES ('bgn', 'BGN', 'лв.', 2, 0, '{"value": "0", "precision": 20}', 'Bulgarian Lev', '2026-06-11 02:26:37.978+03', '2026-06-11 02:26:37.978+03', NULL);
INSERT INTO public.currency VALUES ('bhd', 'BD', 'د.ب.‏', 3, 0, '{"value": "0", "precision": 20}', 'Bahraini Dinar', '2026-06-11 02:26:37.978+03', '2026-06-11 02:26:37.978+03', NULL);
INSERT INTO public.currency VALUES ('bif', 'FBu', 'FBu', 0, 0, '{"value": "0", "precision": 20}', 'Burundian Franc', '2026-06-11 02:26:37.978+03', '2026-06-11 02:26:37.978+03', NULL);
INSERT INTO public.currency VALUES ('bnd', 'BN$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Brunei Dollar', '2026-06-11 02:26:37.979+03', '2026-06-11 02:26:37.979+03', NULL);
INSERT INTO public.currency VALUES ('bob', 'Bs', 'Bs', 2, 0, '{"value": "0", "precision": 20}', 'Bolivian Boliviano', '2026-06-11 02:26:37.979+03', '2026-06-11 02:26:37.979+03', NULL);
INSERT INTO public.currency VALUES ('brl', 'R$', 'R$', 2, 0, '{"value": "0", "precision": 20}', 'Brazilian Real', '2026-06-11 02:26:37.979+03', '2026-06-11 02:26:37.979+03', NULL);
INSERT INTO public.currency VALUES ('bwp', 'BWP', 'P', 2, 0, '{"value": "0", "precision": 20}', 'Botswanan Pula', '2026-06-11 02:26:37.979+03', '2026-06-11 02:26:37.979+03', NULL);
INSERT INTO public.currency VALUES ('byn', 'Br', 'руб.', 2, 0, '{"value": "0", "precision": 20}', 'Belarusian Ruble', '2026-06-11 02:26:37.979+03', '2026-06-11 02:26:37.979+03', NULL);
INSERT INTO public.currency VALUES ('bzd', 'BZ$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Belize Dollar', '2026-06-11 02:26:37.979+03', '2026-06-11 02:26:37.979+03', NULL);
INSERT INTO public.currency VALUES ('cdf', 'CDF', 'FrCD', 2, 0, '{"value": "0", "precision": 20}', 'Congolese Franc', '2026-06-11 02:26:37.98+03', '2026-06-11 02:26:37.98+03', NULL);
INSERT INTO public.currency VALUES ('chf', 'CHF', 'CHF', 2, 0.05, '{"value": "0.05", "precision": 20}', 'Swiss Franc', '2026-06-11 02:26:37.98+03', '2026-06-11 02:26:37.98+03', NULL);
INSERT INTO public.currency VALUES ('clp', 'CL$', '$', 0, 0, '{"value": "0", "precision": 20}', 'Chilean Peso', '2026-06-11 02:26:37.98+03', '2026-06-11 02:26:37.98+03', NULL);
INSERT INTO public.currency VALUES ('cny', 'CN¥', 'CN¥', 2, 0, '{"value": "0", "precision": 20}', 'Chinese Yuan', '2026-06-11 02:26:37.98+03', '2026-06-11 02:26:37.98+03', NULL);
INSERT INTO public.currency VALUES ('cop', 'CO$', '$', 0, 0, '{"value": "0", "precision": 20}', 'Colombian Peso', '2026-06-11 02:26:37.98+03', '2026-06-11 02:26:37.98+03', NULL);
INSERT INTO public.currency VALUES ('crc', '₡', '₡', 0, 0, '{"value": "0", "precision": 20}', 'Costa Rican Colón', '2026-06-11 02:26:37.98+03', '2026-06-11 02:26:37.98+03', NULL);
INSERT INTO public.currency VALUES ('cve', 'CV$', 'CV$', 2, 0, '{"value": "0", "precision": 20}', 'Cape Verdean Escudo', '2026-06-11 02:26:37.98+03', '2026-06-11 02:26:37.98+03', NULL);
INSERT INTO public.currency VALUES ('czk', 'Kč', 'Kč', 2, 0, '{"value": "0", "precision": 20}', 'Czech Republic Koruna', '2026-06-11 02:26:37.98+03', '2026-06-11 02:26:37.98+03', NULL);
INSERT INTO public.currency VALUES ('djf', 'Fdj', 'Fdj', 0, 0, '{"value": "0", "precision": 20}', 'Djiboutian Franc', '2026-06-11 02:26:37.98+03', '2026-06-11 02:26:37.98+03', NULL);
INSERT INTO public.currency VALUES ('dkk', 'Dkr', 'kr', 2, 0, '{"value": "0", "precision": 20}', 'Danish Krone', '2026-06-11 02:26:37.98+03', '2026-06-11 02:26:37.98+03', NULL);
INSERT INTO public.currency VALUES ('dop', 'RD$', 'RD$', 2, 0, '{"value": "0", "precision": 20}', 'Dominican Peso', '2026-06-11 02:26:37.98+03', '2026-06-11 02:26:37.98+03', NULL);
INSERT INTO public.currency VALUES ('dzd', 'DA', 'د.ج.‏', 2, 0, '{"value": "0", "precision": 20}', 'Algerian Dinar', '2026-06-11 02:26:37.981+03', '2026-06-11 02:26:37.981+03', NULL);
INSERT INTO public.currency VALUES ('eek', 'Ekr', 'kr', 2, 0, '{"value": "0", "precision": 20}', 'Estonian Kroon', '2026-06-11 02:26:37.981+03', '2026-06-11 02:26:37.981+03', NULL);
INSERT INTO public.currency VALUES ('egp', 'EGP', 'ج.م.‏', 2, 0, '{"value": "0", "precision": 20}', 'Egyptian Pound', '2026-06-11 02:26:37.981+03', '2026-06-11 02:26:37.981+03', NULL);
INSERT INTO public.currency VALUES ('ern', 'Nfk', 'Nfk', 2, 0, '{"value": "0", "precision": 20}', 'Eritrean Nakfa', '2026-06-11 02:26:37.981+03', '2026-06-11 02:26:37.981+03', NULL);
INSERT INTO public.currency VALUES ('etb', 'Br', 'Br', 2, 0, '{"value": "0", "precision": 20}', 'Ethiopian Birr', '2026-06-11 02:26:37.981+03', '2026-06-11 02:26:37.981+03', NULL);
INSERT INTO public.currency VALUES ('gbp', '£', '£', 2, 0, '{"value": "0", "precision": 20}', 'British Pound Sterling', '2026-06-11 02:26:37.981+03', '2026-06-11 02:26:37.981+03', NULL);
INSERT INTO public.currency VALUES ('gel', 'GEL', 'GEL', 2, 0, '{"value": "0", "precision": 20}', 'Georgian Lari', '2026-06-11 02:26:37.981+03', '2026-06-11 02:26:37.981+03', NULL);
INSERT INTO public.currency VALUES ('ghs', 'GH₵', 'GH₵', 2, 0, '{"value": "0", "precision": 20}', 'Ghanaian Cedi', '2026-06-11 02:26:37.981+03', '2026-06-11 02:26:37.981+03', NULL);
INSERT INTO public.currency VALUES ('gnf', 'FG', 'FG', 0, 0, '{"value": "0", "precision": 20}', 'Guinean Franc', '2026-06-11 02:26:37.981+03', '2026-06-11 02:26:37.981+03', NULL);
INSERT INTO public.currency VALUES ('gtq', 'GTQ', 'Q', 2, 0, '{"value": "0", "precision": 20}', 'Guatemalan Quetzal', '2026-06-11 02:26:37.982+03', '2026-06-11 02:26:37.982+03', NULL);
INSERT INTO public.currency VALUES ('hkd', 'HK$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Hong Kong Dollar', '2026-06-11 02:26:37.982+03', '2026-06-11 02:26:37.982+03', NULL);
INSERT INTO public.currency VALUES ('hnl', 'HNL', 'L', 2, 0, '{"value": "0", "precision": 20}', 'Honduran Lempira', '2026-06-11 02:26:37.982+03', '2026-06-11 02:26:37.982+03', NULL);
INSERT INTO public.currency VALUES ('hrk', 'kn', 'kn', 2, 0, '{"value": "0", "precision": 20}', 'Croatian Kuna', '2026-06-11 02:26:37.982+03', '2026-06-11 02:26:37.982+03', NULL);
INSERT INTO public.currency VALUES ('huf', 'Ft', 'Ft', 0, 0, '{"value": "0", "precision": 20}', 'Hungarian Forint', '2026-06-11 02:26:37.982+03', '2026-06-11 02:26:37.982+03', NULL);
INSERT INTO public.currency VALUES ('idr', 'Rp', 'Rp', 0, 0, '{"value": "0", "precision": 20}', 'Indonesian Rupiah', '2026-06-11 02:26:37.982+03', '2026-06-11 02:26:37.982+03', NULL);
INSERT INTO public.currency VALUES ('ils', '₪', '₪', 2, 0, '{"value": "0", "precision": 20}', 'Israeli New Sheqel', '2026-06-11 02:26:37.982+03', '2026-06-11 02:26:37.982+03', NULL);
INSERT INTO public.currency VALUES ('inr', 'Rs', '₹', 2, 0, '{"value": "0", "precision": 20}', 'Indian Rupee', '2026-06-11 02:26:37.982+03', '2026-06-11 02:26:37.982+03', NULL);
INSERT INTO public.currency VALUES ('iqd', 'IQD', 'د.ع.‏', 0, 0, '{"value": "0", "precision": 20}', 'Iraqi Dinar', '2026-06-11 02:26:37.982+03', '2026-06-11 02:26:37.982+03', NULL);
INSERT INTO public.currency VALUES ('irr', 'IRR', '﷼', 0, 0, '{"value": "0", "precision": 20}', 'Iranian Rial', '2026-06-11 02:26:37.982+03', '2026-06-11 02:26:37.982+03', NULL);
INSERT INTO public.currency VALUES ('isk', 'Ikr', 'kr', 0, 0, '{"value": "0", "precision": 20}', 'Icelandic Króna', '2026-06-11 02:26:37.983+03', '2026-06-11 02:26:37.983+03', NULL);
INSERT INTO public.currency VALUES ('jmd', 'J$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Jamaican Dollar', '2026-06-11 02:26:37.983+03', '2026-06-11 02:26:37.983+03', NULL);
INSERT INTO public.currency VALUES ('jod', 'JD', 'د.أ.‏', 3, 0, '{"value": "0", "precision": 20}', 'Jordanian Dinar', '2026-06-11 02:26:37.983+03', '2026-06-11 02:26:37.983+03', NULL);
INSERT INTO public.currency VALUES ('jpy', '¥', '￥', 0, 0, '{"value": "0", "precision": 20}', 'Japanese Yen', '2026-06-11 02:26:37.983+03', '2026-06-11 02:26:37.983+03', NULL);
INSERT INTO public.currency VALUES ('kes', 'Ksh', 'Ksh', 2, 0, '{"value": "0", "precision": 20}', 'Kenyan Shilling', '2026-06-11 02:26:37.983+03', '2026-06-11 02:26:37.983+03', NULL);
INSERT INTO public.currency VALUES ('khr', 'KHR', '៛', 2, 0, '{"value": "0", "precision": 20}', 'Cambodian Riel', '2026-06-11 02:26:37.983+03', '2026-06-11 02:26:37.983+03', NULL);
INSERT INTO public.currency VALUES ('kmf', 'CF', 'FC', 0, 0, '{"value": "0", "precision": 20}', 'Comorian Franc', '2026-06-11 02:26:37.983+03', '2026-06-11 02:26:37.983+03', NULL);
INSERT INTO public.currency VALUES ('krw', '₩', '₩', 0, 0, '{"value": "0", "precision": 20}', 'South Korean Won', '2026-06-11 02:26:37.983+03', '2026-06-11 02:26:37.983+03', NULL);
INSERT INTO public.currency VALUES ('kwd', 'KD', 'د.ك.‏', 3, 0, '{"value": "0", "precision": 20}', 'Kuwaiti Dinar', '2026-06-11 02:26:37.983+03', '2026-06-11 02:26:37.983+03', NULL);
INSERT INTO public.currency VALUES ('kzt', 'KZT', 'тңг.', 2, 0, '{"value": "0", "precision": 20}', 'Kazakhstani Tenge', '2026-06-11 02:26:37.983+03', '2026-06-11 02:26:37.983+03', NULL);
INSERT INTO public.currency VALUES ('lbp', 'LB£', 'ل.ل.‏', 0, 0, '{"value": "0", "precision": 20}', 'Lebanese Pound', '2026-06-11 02:26:37.984+03', '2026-06-11 02:26:37.984+03', NULL);
INSERT INTO public.currency VALUES ('lkr', 'SLRs', 'SL Re', 2, 0, '{"value": "0", "precision": 20}', 'Sri Lankan Rupee', '2026-06-11 02:26:37.984+03', '2026-06-11 02:26:37.984+03', NULL);
INSERT INTO public.currency VALUES ('ltl', 'Lt', 'Lt', 2, 0, '{"value": "0", "precision": 20}', 'Lithuanian Litas', '2026-06-11 02:26:37.984+03', '2026-06-11 02:26:37.984+03', NULL);
INSERT INTO public.currency VALUES ('lvl', 'Ls', 'Ls', 2, 0, '{"value": "0", "precision": 20}', 'Latvian Lats', '2026-06-11 02:26:37.984+03', '2026-06-11 02:26:37.984+03', NULL);
INSERT INTO public.currency VALUES ('lyd', 'LD', 'د.ل.‏', 3, 0, '{"value": "0", "precision": 20}', 'Libyan Dinar', '2026-06-11 02:26:37.984+03', '2026-06-11 02:26:37.984+03', NULL);
INSERT INTO public.currency VALUES ('mad', 'MAD', 'د.م.‏', 2, 0, '{"value": "0", "precision": 20}', 'Moroccan Dirham', '2026-06-11 02:26:37.984+03', '2026-06-11 02:26:37.984+03', NULL);
INSERT INTO public.currency VALUES ('mdl', 'MDL', 'MDL', 2, 0, '{"value": "0", "precision": 20}', 'Moldovan Leu', '2026-06-11 02:26:37.984+03', '2026-06-11 02:26:37.984+03', NULL);
INSERT INTO public.currency VALUES ('mga', 'MGA', 'MGA', 0, 0, '{"value": "0", "precision": 20}', 'Malagasy Ariary', '2026-06-11 02:26:37.984+03', '2026-06-11 02:26:37.984+03', NULL);
INSERT INTO public.currency VALUES ('mkd', 'MKD', 'MKD', 2, 0, '{"value": "0", "precision": 20}', 'Macedonian Denar', '2026-06-11 02:26:37.984+03', '2026-06-11 02:26:37.984+03', NULL);
INSERT INTO public.currency VALUES ('mmk', 'MMK', 'K', 0, 0, '{"value": "0", "precision": 20}', 'Myanma Kyat', '2026-06-11 02:26:37.985+03', '2026-06-11 02:26:37.985+03', NULL);
INSERT INTO public.currency VALUES ('mnt', 'MNT', '₮', 0, 0, '{"value": "0", "precision": 20}', 'Mongolian Tugrig', '2026-06-11 02:26:37.985+03', '2026-06-11 02:26:37.985+03', NULL);
INSERT INTO public.currency VALUES ('mop', 'MOP$', 'MOP$', 2, 0, '{"value": "0", "precision": 20}', 'Macanese Pataca', '2026-06-11 02:26:37.985+03', '2026-06-11 02:26:37.985+03', NULL);
INSERT INTO public.currency VALUES ('mur', 'MURs', 'MURs', 0, 0, '{"value": "0", "precision": 20}', 'Mauritian Rupee', '2026-06-11 02:26:37.985+03', '2026-06-11 02:26:37.985+03', NULL);
INSERT INTO public.currency VALUES ('mwk', 'K', 'K', 2, 0, '{"value": "0", "precision": 20}', 'Malawian Kwacha', '2026-06-11 02:26:37.985+03', '2026-06-11 02:26:37.985+03', NULL);
INSERT INTO public.currency VALUES ('mxn', 'MX$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Mexican Peso', '2026-06-11 02:26:37.985+03', '2026-06-11 02:26:37.985+03', NULL);
INSERT INTO public.currency VALUES ('myr', 'RM', 'RM', 2, 0, '{"value": "0", "precision": 20}', 'Malaysian Ringgit', '2026-06-11 02:26:37.985+03', '2026-06-11 02:26:37.985+03', NULL);
INSERT INTO public.currency VALUES ('mzn', 'MTn', 'MTn', 2, 0, '{"value": "0", "precision": 20}', 'Mozambican Metical', '2026-06-11 02:26:37.985+03', '2026-06-11 02:26:37.985+03', NULL);
INSERT INTO public.currency VALUES ('nad', 'N$', 'N$', 2, 0, '{"value": "0", "precision": 20}', 'Namibian Dollar', '2026-06-11 02:26:37.985+03', '2026-06-11 02:26:37.985+03', NULL);
INSERT INTO public.currency VALUES ('ngn', '₦', '₦', 2, 0, '{"value": "0", "precision": 20}', 'Nigerian Naira', '2026-06-11 02:26:37.986+03', '2026-06-11 02:26:37.986+03', NULL);
INSERT INTO public.currency VALUES ('nio', 'C$', 'C$', 2, 0, '{"value": "0", "precision": 20}', 'Nicaraguan Córdoba', '2026-06-11 02:26:37.986+03', '2026-06-11 02:26:37.986+03', NULL);
INSERT INTO public.currency VALUES ('nok', 'Nkr', 'kr', 2, 0, '{"value": "0", "precision": 20}', 'Norwegian Krone', '2026-06-11 02:26:37.986+03', '2026-06-11 02:26:37.986+03', NULL);
INSERT INTO public.currency VALUES ('npr', 'NPRs', 'नेरू', 2, 0, '{"value": "0", "precision": 20}', 'Nepalese Rupee', '2026-06-11 02:26:37.986+03', '2026-06-11 02:26:37.986+03', NULL);
INSERT INTO public.currency VALUES ('nzd', 'NZ$', '$', 2, 0, '{"value": "0", "precision": 20}', 'New Zealand Dollar', '2026-06-11 02:26:37.986+03', '2026-06-11 02:26:37.986+03', NULL);
INSERT INTO public.currency VALUES ('omr', 'OMR', 'ر.ع.‏', 3, 0, '{"value": "0", "precision": 20}', 'Omani Rial', '2026-06-11 02:26:37.986+03', '2026-06-11 02:26:37.986+03', NULL);
INSERT INTO public.currency VALUES ('pab', 'B/.', 'B/.', 2, 0, '{"value": "0", "precision": 20}', 'Panamanian Balboa', '2026-06-11 02:26:37.986+03', '2026-06-11 02:26:37.986+03', NULL);
INSERT INTO public.currency VALUES ('pen', 'S/.', 'S/.', 2, 0, '{"value": "0", "precision": 20}', 'Peruvian Nuevo Sol', '2026-06-11 02:26:37.986+03', '2026-06-11 02:26:37.986+03', NULL);
INSERT INTO public.currency VALUES ('php', '₱', '₱', 2, 0, '{"value": "0", "precision": 20}', 'Philippine Peso', '2026-06-11 02:26:37.986+03', '2026-06-11 02:26:37.986+03', NULL);
INSERT INTO public.currency VALUES ('pkr', 'PKRs', '₨', 0, 0, '{"value": "0", "precision": 20}', 'Pakistani Rupee', '2026-06-11 02:26:37.986+03', '2026-06-11 02:26:37.986+03', NULL);
INSERT INTO public.currency VALUES ('pln', 'zł', 'zł', 2, 0, '{"value": "0", "precision": 20}', 'Polish Zloty', '2026-06-11 02:26:37.987+03', '2026-06-11 02:26:37.987+03', NULL);
INSERT INTO public.currency VALUES ('pyg', '₲', '₲', 0, 0, '{"value": "0", "precision": 20}', 'Paraguayan Guarani', '2026-06-11 02:26:37.987+03', '2026-06-11 02:26:37.987+03', NULL);
INSERT INTO public.currency VALUES ('qar', 'QR', 'ر.ق.‏', 2, 0, '{"value": "0", "precision": 20}', 'Qatari Rial', '2026-06-11 02:26:37.987+03', '2026-06-11 02:26:37.987+03', NULL);
INSERT INTO public.currency VALUES ('ron', 'RON', 'RON', 2, 0, '{"value": "0", "precision": 20}', 'Romanian Leu', '2026-06-11 02:26:37.987+03', '2026-06-11 02:26:37.987+03', NULL);
INSERT INTO public.currency VALUES ('rsd', 'din.', 'дин.', 0, 0, '{"value": "0", "precision": 20}', 'Serbian Dinar', '2026-06-11 02:26:37.987+03', '2026-06-11 02:26:37.987+03', NULL);
INSERT INTO public.currency VALUES ('rub', 'RUB', '₽.', 2, 0, '{"value": "0", "precision": 20}', 'Russian Ruble', '2026-06-11 02:26:37.987+03', '2026-06-11 02:26:37.987+03', NULL);
INSERT INTO public.currency VALUES ('rwf', 'RWF', 'FR', 0, 0, '{"value": "0", "precision": 20}', 'Rwandan Franc', '2026-06-11 02:26:37.987+03', '2026-06-11 02:26:37.987+03', NULL);
INSERT INTO public.currency VALUES ('sar', 'SR', 'ر.س.‏', 2, 0, '{"value": "0", "precision": 20}', 'Saudi Riyal', '2026-06-11 02:26:37.987+03', '2026-06-11 02:26:37.987+03', NULL);
INSERT INTO public.currency VALUES ('sdg', 'SDG', 'SDG', 2, 0, '{"value": "0", "precision": 20}', 'Sudanese Pound', '2026-06-11 02:26:37.988+03', '2026-06-11 02:26:37.988+03', NULL);
INSERT INTO public.currency VALUES ('sek', 'Skr', 'kr', 2, 0, '{"value": "0", "precision": 20}', 'Swedish Krona', '2026-06-11 02:26:37.988+03', '2026-06-11 02:26:37.988+03', NULL);
INSERT INTO public.currency VALUES ('sgd', 'S$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Singapore Dollar', '2026-06-11 02:26:37.988+03', '2026-06-11 02:26:37.988+03', NULL);
INSERT INTO public.currency VALUES ('sos', 'Ssh', 'Ssh', 0, 0, '{"value": "0", "precision": 20}', 'Somali Shilling', '2026-06-11 02:26:37.988+03', '2026-06-11 02:26:37.988+03', NULL);
INSERT INTO public.currency VALUES ('syp', 'SY£', 'ل.س.‏', 0, 0, '{"value": "0", "precision": 20}', 'Syrian Pound', '2026-06-11 02:26:37.988+03', '2026-06-11 02:26:37.988+03', NULL);
INSERT INTO public.currency VALUES ('thb', '฿', '฿', 2, 0, '{"value": "0", "precision": 20}', 'Thai Baht', '2026-06-11 02:26:37.988+03', '2026-06-11 02:26:37.988+03', NULL);
INSERT INTO public.currency VALUES ('tnd', 'DT', 'د.ت.‏', 3, 0, '{"value": "0", "precision": 20}', 'Tunisian Dinar', '2026-06-11 02:26:37.988+03', '2026-06-11 02:26:37.988+03', NULL);
INSERT INTO public.currency VALUES ('top', 'T$', 'T$', 2, 0, '{"value": "0", "precision": 20}', 'Tongan Paʻanga', '2026-06-11 02:26:37.988+03', '2026-06-11 02:26:37.988+03', NULL);
INSERT INTO public.currency VALUES ('tjs', 'TJS', 'с.', 2, 0, '{"value": "0", "precision": 20}', 'Tajikistani Somoni', '2026-06-11 02:26:37.988+03', '2026-06-11 02:26:37.988+03', NULL);
INSERT INTO public.currency VALUES ('try', '₺', '₺', 2, 0, '{"value": "0", "precision": 20}', 'Turkish Lira', '2026-06-11 02:26:37.989+03', '2026-06-11 02:26:37.989+03', NULL);
INSERT INTO public.currency VALUES ('ttd', 'TT$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Trinidad and Tobago Dollar', '2026-06-11 02:26:37.989+03', '2026-06-11 02:26:37.989+03', NULL);
INSERT INTO public.currency VALUES ('twd', 'NT$', 'NT$', 2, 0, '{"value": "0", "precision": 20}', 'New Taiwan Dollar', '2026-06-11 02:26:37.989+03', '2026-06-11 02:26:37.989+03', NULL);
INSERT INTO public.currency VALUES ('tzs', 'TSh', 'TSh', 0, 0, '{"value": "0", "precision": 20}', 'Tanzanian Shilling', '2026-06-11 02:26:37.989+03', '2026-06-11 02:26:37.989+03', NULL);
INSERT INTO public.currency VALUES ('uah', '₴', '₴', 2, 0, '{"value": "0", "precision": 20}', 'Ukrainian Hryvnia', '2026-06-11 02:26:37.989+03', '2026-06-11 02:26:37.989+03', NULL);
INSERT INTO public.currency VALUES ('ugx', 'USh', 'USh', 0, 0, '{"value": "0", "precision": 20}', 'Ugandan Shilling', '2026-06-11 02:26:37.99+03', '2026-06-11 02:26:37.99+03', NULL);
INSERT INTO public.currency VALUES ('uyu', '$U', '$', 2, 0, '{"value": "0", "precision": 20}', 'Uruguayan Peso', '2026-06-11 02:26:37.99+03', '2026-06-11 02:26:37.99+03', NULL);
INSERT INTO public.currency VALUES ('uzs', 'UZS', 'UZS', 0, 0, '{"value": "0", "precision": 20}', 'Uzbekistan Som', '2026-06-11 02:26:37.99+03', '2026-06-11 02:26:37.99+03', NULL);
INSERT INTO public.currency VALUES ('vef', 'Bs.F.', 'Bs.F.', 2, 0, '{"value": "0", "precision": 20}', 'Venezuelan Bolívar', '2026-06-11 02:26:37.99+03', '2026-06-11 02:26:37.99+03', NULL);
INSERT INTO public.currency VALUES ('vnd', '₫', '₫', 0, 0, '{"value": "0", "precision": 20}', 'Vietnamese Dong', '2026-06-11 02:26:37.99+03', '2026-06-11 02:26:37.99+03', NULL);
INSERT INTO public.currency VALUES ('xaf', 'FCFA', 'FCFA', 0, 0, '{"value": "0", "precision": 20}', 'CFA Franc BEAC', '2026-06-11 02:26:37.99+03', '2026-06-11 02:26:37.99+03', NULL);
INSERT INTO public.currency VALUES ('xof', 'CFA', 'CFA', 0, 0, '{"value": "0", "precision": 20}', 'CFA Franc BCEAO', '2026-06-11 02:26:37.99+03', '2026-06-11 02:26:37.99+03', NULL);
INSERT INTO public.currency VALUES ('xpf', '₣', '₣', 0, 0, '{"value": "0", "precision": 20}', 'CFP Franc', '2026-06-11 02:26:37.99+03', '2026-06-11 02:26:37.99+03', NULL);
INSERT INTO public.currency VALUES ('yer', 'YR', 'ر.ي.‏', 0, 0, '{"value": "0", "precision": 20}', 'Yemeni Rial', '2026-06-11 02:26:37.991+03', '2026-06-11 02:26:37.991+03', NULL);
INSERT INTO public.currency VALUES ('zar', 'R', 'R', 2, 0, '{"value": "0", "precision": 20}', 'South African Rand', '2026-06-11 02:26:37.991+03', '2026-06-11 02:26:37.991+03', NULL);
INSERT INTO public.currency VALUES ('zmk', 'ZK', 'ZK', 0, 0, '{"value": "0", "precision": 20}', 'Zambian Kwacha', '2026-06-11 02:26:37.991+03', '2026-06-11 02:26:37.991+03', NULL);
INSERT INTO public.currency VALUES ('zwl', 'ZWL$', 'ZWL$', 0, 0, '{"value": "0", "precision": 20}', 'Zimbabwean Dollar', '2026-06-11 02:26:37.991+03', '2026-06-11 02:26:37.991+03', NULL);


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.customer VALUES ('cus_01KTWRM4HPPAJXC284QJ0GBE6V', NULL, NULL, NULL, 'test_alici@kapidaodeme.com', NULL, false, NULL, '2026-06-12 04:54:54.135+03', '2026-06-12 04:54:54.135+03', NULL, NULL);
INSERT INTO public.customer VALUES ('cus_01KTYAMMCJWGMMSZD09MY0T0Y9', NULL, NULL, NULL, '5323370081@kapidaodeme.com', NULL, false, NULL, '2026-06-12 19:28:59.155+03', '2026-06-12 19:28:59.155+03', NULL, NULL);
INSERT INTO public.customer VALUES ('cus_01KV484EN0DHHPCJKPD827CJPW', NULL, NULL, NULL, '905323370081@kapidaodeme.com', NULL, false, NULL, '2026-06-15 02:40:38.433+03', '2026-06-15 02:40:38.433+03', NULL, NULL);
INSERT INTO public.customer VALUES ('cus_01KVRJ6MGF8SR85ADEJYQ6ZP0P', NULL, NULL, NULL, 'cizgibutiks@gmail.com', NULL, false, NULL, '2026-06-23 00:01:24.367+03', '2026-06-23 00:01:24.367+03', NULL, NULL);
INSERT INTO public.customer VALUES ('cus_01KVRJ9TQVPVF50YXERRYV9FRX', NULL, NULL, NULL, 'ziyaretci@hizlisatis.com', NULL, false, NULL, '2026-06-23 00:03:09.052+03', '2026-06-23 00:03:09.052+03', NULL, NULL);


--
-- Data for Name: customer_account_holder; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: customer_address; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: customer_group; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: customer_group_customer; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: fulfillment; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: fulfillment_address; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: fulfillment_item; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: fulfillment_label; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: fulfillment_provider; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.fulfillment_provider VALUES ('manual_manual', true, '2026-06-11 02:26:38.09+03', '2026-06-11 02:26:38.09+03', NULL);


--
-- Data for Name: fulfillment_set; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.fulfillment_set VALUES ('fuset_01KTSXRAVK50TNK77ASNXJJKZN', 'European Warehouse delivery', 'shipping', NULL, '2026-06-11 02:26:51.252+03', '2026-06-11 02:26:51.252+03', NULL);


--
-- Data for Name: geo_zone; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.geo_zone VALUES ('fgz_01KTSXRAVEGS940ZRSATFEAZW5', 'country', 'gb', NULL, NULL, 'serzo_01KTSXRAVKR5QPZY1JDK9NZWTY', NULL, NULL, '2026-06-11 02:26:51.253+03', '2026-06-11 02:26:51.253+03', NULL);
INSERT INTO public.geo_zone VALUES ('fgz_01KTSXRAVFXF2F317ACKBSEVDM', 'country', 'de', NULL, NULL, 'serzo_01KTSXRAVKR5QPZY1JDK9NZWTY', NULL, NULL, '2026-06-11 02:26:51.254+03', '2026-06-11 02:26:51.254+03', NULL);
INSERT INTO public.geo_zone VALUES ('fgz_01KTSXRAVFWWXAFK6B0ECBE9X1', 'country', 'dk', NULL, NULL, 'serzo_01KTSXRAVKR5QPZY1JDK9NZWTY', NULL, NULL, '2026-06-11 02:26:51.254+03', '2026-06-11 02:26:51.254+03', NULL);
INSERT INTO public.geo_zone VALUES ('fgz_01KTSXRAVF8TS3YPBXAJQFBQGX', 'country', 'se', NULL, NULL, 'serzo_01KTSXRAVKR5QPZY1JDK9NZWTY', NULL, NULL, '2026-06-11 02:26:51.254+03', '2026-06-11 02:26:51.254+03', NULL);
INSERT INTO public.geo_zone VALUES ('fgz_01KTSXRAVF3EMTKPV3D2E64R3D', 'country', 'fr', NULL, NULL, 'serzo_01KTSXRAVKR5QPZY1JDK9NZWTY', NULL, NULL, '2026-06-11 02:26:51.254+03', '2026-06-11 02:26:51.254+03', NULL);
INSERT INTO public.geo_zone VALUES ('fgz_01KTSXRAVGA62WAD65HN2RC013', 'country', 'es', NULL, NULL, 'serzo_01KTSXRAVKR5QPZY1JDK9NZWTY', NULL, NULL, '2026-06-11 02:26:51.254+03', '2026-06-11 02:26:51.254+03', NULL);
INSERT INTO public.geo_zone VALUES ('fgz_01KTSXRAVGC8QAQWQRC09FVV0T', 'country', 'it', NULL, NULL, 'serzo_01KTSXRAVKR5QPZY1JDK9NZWTY', NULL, NULL, '2026-06-11 02:26:51.254+03', '2026-06-11 02:26:51.254+03', NULL);
INSERT INTO public.geo_zone VALUES ('fgz_tr', 'country', 'tr', NULL, NULL, 'serzo_01KTSXRAVKR5QPZY1JDK9NZWTY', NULL, NULL, '2026-06-12 04:55:31.584628+03', '2026-06-12 04:55:31.584628+03', NULL);


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.image VALUES ('img_01KTWQBMBX9K5RWCZ2E7TQ2EXW', 'http://firsatbox.com/static/1781225021759-PAGE-1.webp', NULL, '2026-06-12 04:32:46.852+03', '2026-06-12 04:32:46.852+03', NULL, 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ');
INSERT INTO public.image VALUES ('img_01KTWQBMBY4YNVVGRA7BQH31SE', 'http://firsatbox.com/static/1781225026517-PAGE-2.webp', NULL, '2026-06-12 04:32:46.853+03', '2026-06-12 04:32:46.853+03', NULL, 1, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ');
INSERT INTO public.image VALUES ('img_01KTWQBMBZ6HZ21K4TFZH05XKE', 'http://firsatbox.com/static/1781225030161-PAGE-3.webp', NULL, '2026-06-12 04:32:46.853+03', '2026-06-12 04:32:46.853+03', NULL, 2, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ');
INSERT INTO public.image VALUES ('img_01KTWQBMBZJ3836B55B01DNTA4', 'http://firsatbox.com/static/1781220889657-5938394158127057970.jpg', NULL, '2026-06-12 04:32:46.853+03', '2026-06-12 04:32:46.853+03', NULL, 3, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ');
INSERT INTO public.image VALUES ('img_01KTWQBMC0HPBHMC18V4RT5NQV', 'http://firsatbox.com/static/1781220915852-5938394158127057971.jpg', NULL, '2026-06-12 04:32:46.853+03', '2026-06-12 04:32:46.853+03', NULL, 4, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ');
INSERT INTO public.image VALUES ('img_01KTWQBMC0AYDXS6FBVM1G1A28', 'http://firsatbox.com/static/1781220936155-5938394158127057972.jpg', NULL, '2026-06-12 04:32:46.853+03', '2026-06-12 04:32:46.853+03', NULL, 5, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ');
INSERT INTO public.image VALUES ('img_01KV22EGX6DH9AASHM2PZ7E5B0', 'http://firsatbox.com/static/1781402593396-ChatGPTImage14Haz202604_27_05.png', NULL, '2026-06-14 06:22:48.103+03', '2026-06-14 06:22:48.103+03', NULL, 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4');
INSERT INTO public.image VALUES ('j9688e', 'http://localhost:9000/static/1781186113652-PAGE-1.webp', NULL, '2026-06-11 16:55:13.849+03', '2026-06-11 17:53:56.802+03', '2026-06-11 17:53:56.596+03', 0, 'prod_01KTSXRBDY379RRFRYTEVQMYKC');
INSERT INTO public.image VALUES ('9pcml', 'http://localhost:9000/static/1781186113659-PAGE-2.webp', NULL, '2026-06-11 16:55:13.85+03', '2026-06-11 17:53:56.802+03', '2026-06-11 17:53:56.596+03', 1, 'prod_01KTSXRBDY379RRFRYTEVQMYKC');
INSERT INTO public.image VALUES ('fp0clr', 'http://localhost:9000/static/1781186113665-PAGE-3.webp', NULL, '2026-06-11 16:55:13.85+03', '2026-06-11 17:53:56.802+03', '2026-06-11 17:53:56.596+03', 2, 'prod_01KTSXRBDY379RRFRYTEVQMYKC');
INSERT INTO public.image VALUES ('img_01KV22EGX6ECGDTEVS9CDARDCR', 'http://firsatbox.com/static/1781402601963-ChatGPTImage14Haz202604_33_08.png', NULL, '2026-06-14 06:22:48.103+03', '2026-06-14 06:22:48.103+03', NULL, 1, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4');
INSERT INTO public.image VALUES ('img_01KV22EGX77FCX3NZH7PJ08F4W', 'http://firsatbox.com/static/1781402605768-ChatGPTImage14Haz202604_39_54.png', NULL, '2026-06-14 06:22:48.103+03', '2026-06-14 06:22:48.103+03', NULL, 2, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4');
INSERT INTO public.image VALUES ('img_01KV22EGX7X3A1ZHDFNPX87FJ0', 'http://firsatbox.com/static/1781402540430-WhatsAppImage2026-06-12at192954.jpeg', NULL, '2026-06-14 06:22:48.103+03', '2026-06-14 06:22:48.103+03', NULL, 3, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4');
INSERT INTO public.image VALUES ('img_01KTSXRBEGKNE9RERPHGCPR7D7', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png', NULL, '2026-06-11 02:26:51.878+03', '2026-06-11 17:57:07.729+03', '2026-06-11 17:57:07.672+03', 0, 'prod_01KTSXRBDY8DGT5DT68AVKFT6D');
INSERT INTO public.image VALUES ('img_01KTSXRBEGF6TJNMSGG4HXWXM5', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-back.png', NULL, '2026-06-11 02:26:51.879+03', '2026-06-11 17:57:07.729+03', '2026-06-11 17:57:07.672+03', 1, 'prod_01KTSXRBDY8DGT5DT68AVKFT6D');
INSERT INTO public.image VALUES ('img_01KTSXRBEHJFR71MJTEV42CYJT', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-white-front.png', NULL, '2026-06-11 02:26:51.879+03', '2026-06-11 17:57:07.729+03', '2026-06-11 17:57:07.672+03', 2, 'prod_01KTSXRBDY8DGT5DT68AVKFT6D');
INSERT INTO public.image VALUES ('img_01KTSXRBEHKNDZ52RKQ5598YGK', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-white-back.png', NULL, '2026-06-11 02:26:51.879+03', '2026-06-11 17:57:07.729+03', '2026-06-11 17:57:07.672+03', 3, 'prod_01KTSXRBDY8DGT5DT68AVKFT6D');
INSERT INTO public.image VALUES ('img_01KTSXRBETJBQQNRP9Z4BPBENR', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-front.png', NULL, '2026-06-11 02:26:51.881+03', '2026-06-11 17:57:11.925+03', '2026-06-11 17:57:11.85+03', 0, 'prod_01KTSXRBDY727RPZ8951FP13SB');
INSERT INTO public.image VALUES ('img_01KTSXRBET81101EDHTPDBA0MG', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-back.png', NULL, '2026-06-11 02:26:51.881+03', '2026-06-11 17:57:11.926+03', '2026-06-11 17:57:11.85+03', 1, 'prod_01KTSXRBDY727RPZ8951FP13SB');
INSERT INTO public.image VALUES ('img_01KTSXRBEYWET8VP6N8RMA9ZJN', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/shorts-vintage-front.png', NULL, '2026-06-11 02:26:51.881+03', '2026-06-11 17:57:16.453+03', '2026-06-11 17:57:16.38+03', 0, 'prod_01KTSXRBDYQVEC06K0J41W351T');
INSERT INTO public.image VALUES ('img_01KTSXRBEYXN8J3NNG7PKQ1SRD', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/shorts-vintage-back.png', NULL, '2026-06-11 02:26:51.881+03', '2026-06-11 17:57:16.453+03', '2026-06-11 17:57:16.38+03', 1, 'prod_01KTSXRBDYQVEC06K0J41W351T');
INSERT INTO public.image VALUES ('img_01KV22EGX7BNR0ZF2XKR1V213Z', 'http://firsatbox.com/static/1781402560080-WhatsAppImage2026-06-12at1929541.jpeg', NULL, '2026-06-14 06:22:48.103+03', '2026-06-14 06:22:48.103+03', NULL, 4, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4');
INSERT INTO public.image VALUES ('img_01KV22EGX7PDW16RFS98DRS23H', 'http://firsatbox.com/static/1781402579617-WhatsAppImage2026-06-12at1929542.jpeg', NULL, '2026-06-14 06:22:48.103+03', '2026-06-14 06:22:48.103+03', NULL, 5, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4');


--
-- Data for Name: inventory_item; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBT1KJ0K4VSN48TV480C', '2026-06-11 02:26:52.232+03', '2026-06-11 17:53:56.41+03', '2026-06-11 17:53:56.403+03', 'SWEATSHIRT-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'L', 'L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBT0C7ZE00W2TV0NFW7Q', '2026-06-11 02:26:52.232+03', '2026-06-11 17:53:56.467+03', '2026-06-11 17:53:56.403+03', 'SWEATSHIRT-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'M', 'M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBT08JVZ0KNNXH0HDMYR', '2026-06-11 02:26:52.232+03', '2026-06-11 17:53:56.486+03', '2026-06-11 17:53:56.403+03', 'SWEATSHIRT-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'S', 'S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBT1PHDCC8RBWWVV3NHH', '2026-06-11 02:26:52.232+03', '2026-06-11 17:53:56.503+03', '2026-06-11 17:53:56.403+03', 'SWEATSHIRT-XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'XL', 'XL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBSYVT8W7MANN1YWW0X4', '2026-06-11 02:26:52.231+03', '2026-06-11 17:57:07.462+03', '2026-06-11 17:57:07.462+03', 'SHIRT-L-BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'L / Black', 'L / Black', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBSYNZD9J1AG6T6YXQ1V', '2026-06-11 02:26:52.231+03', '2026-06-11 17:57:07.484+03', '2026-06-11 17:57:07.462+03', 'SHIRT-L-WHITE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'L / White', 'L / White', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBSXDH3MHXQF4BXMPJ0F', '2026-06-11 02:26:52.231+03', '2026-06-11 17:57:07.5+03', '2026-06-11 17:57:07.462+03', 'SHIRT-M-BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'M / Black', 'M / Black', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBSY85VWEFW1Y1T78WMP', '2026-06-11 02:26:52.231+03', '2026-06-11 17:57:07.519+03', '2026-06-11 17:57:07.462+03', 'SHIRT-M-WHITE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'M / White', 'M / White', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBSWKYBX04CZK09JFE61', '2026-06-11 02:26:52.229+03', '2026-06-11 17:57:07.551+03', '2026-06-11 17:57:07.462+03', 'SHIRT-S-BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'S / Black', 'S / Black', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBSXH6EA0AHYMPZQC78P', '2026-06-11 02:26:52.231+03', '2026-06-11 17:57:07.57+03', '2026-06-11 17:57:07.462+03', 'SHIRT-S-WHITE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'S / White', 'S / White', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBSZ7JMAX6H10PBNPQFW', '2026-06-11 02:26:52.231+03', '2026-06-11 17:57:07.585+03', '2026-06-11 17:57:07.462+03', 'SHIRT-XL-BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'XL / Black', 'XL / Black', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBSZYT165TR2ZAQA0DPF', '2026-06-11 02:26:52.232+03', '2026-06-11 17:57:07.598+03', '2026-06-11 17:57:07.462+03', 'SHIRT-XL-WHITE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'XL / White', 'XL / White', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBT2BX3ZD953AKFZKST3', '2026-06-11 02:26:52.233+03', '2026-06-11 17:57:11.738+03', '2026-06-11 17:57:11.737+03', 'SWEATPANTS-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'L', 'L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBT2XN1TVK367KHM23VA', '2026-06-11 02:26:52.232+03', '2026-06-11 17:57:11.748+03', '2026-06-11 17:57:11.737+03', 'SWEATPANTS-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'M', 'M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBT1EW6Z76EGS7GPD3P0', '2026-06-11 02:26:52.232+03', '2026-06-11 17:57:11.76+03', '2026-06-11 17:57:11.737+03', 'SWEATPANTS-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'S', 'S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBT3EFZTGWYK1KJ3ANX2', '2026-06-11 02:26:52.233+03', '2026-06-11 17:57:11.772+03', '2026-06-11 17:57:11.737+03', 'SWEATPANTS-XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'XL', 'XL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBT42MBJ1D00Y075CRCD', '2026-06-11 02:26:52.233+03', '2026-06-11 17:57:16.118+03', '2026-06-11 17:57:16.117+03', 'SHORTS-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'L', 'L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBT36V9HDT3SFV5YJFYN', '2026-06-11 02:26:52.233+03', '2026-06-11 17:57:16.245+03', '2026-06-11 17:57:16.117+03', 'SHORTS-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'M', 'M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBT3ZGP5CN4SRCS2N68T', '2026-06-11 02:26:52.233+03', '2026-06-11 17:57:16.256+03', '2026-06-11 17:57:16.117+03', 'SHORTS-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'S', 'S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTSXRBT4K95CQBBB7F3PN043', '2026-06-11 02:26:52.233+03', '2026-06-11 17:57:16.277+03', '2026-06-11 17:57:16.117+03', 'SHORTS-XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'XL', 'XL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWF9Y7V9KYAY5R8HHMM590R', '2026-06-12 02:12:02.811+03', '2026-06-12 02:32:17.198+03', '2026-06-12 02:32:17.198+03', 'ORTLU-TAKM-MAVİ-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'MAVİ / S', 'MAVİ / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWF9YC2BKVT9A68J35TP8DC', '2026-06-12 02:12:02.946+03', '2026-06-12 02:32:18.493+03', '2026-06-12 02:32:18.493+03', 'ORTLU-TAKM-MAVİ-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'MAVİ / M', 'MAVİ / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWF9YJ23TDZ4QV0CYK9VDPR', '2026-06-12 02:12:03.138+03', '2026-06-12 02:32:19.416+03', '2026-06-12 02:32:19.416+03', 'ORTLU-TAKM-MAVİ-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'MAVİ / L', 'MAVİ / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWF9YXAJ7NTXNGFC288MT94', '2026-06-12 02:12:03.498+03', '2026-06-12 02:32:20.737+03', '2026-06-12 02:32:20.737+03', 'ORTLU-TAKM-MAVİ-XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'MAVİ / XL', 'MAVİ / XL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWF9Z89ZQQ0XVB135N7GEWK', '2026-06-12 02:12:03.849+03', '2026-06-12 02:32:21.515+03', '2026-06-12 02:32:21.515+03', 'ORTLU-TAKM-MAVİ-XXL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'MAVİ / XXL', 'MAVİ / XXL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWF9ZSSMRXG0M90923D7FBK', '2026-06-12 02:12:04.409+03', '2026-06-12 02:32:22.195+03', '2026-06-12 02:32:22.195+03', 'ORTLU-TAKM-SİYAH-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / S', 'SİYAH / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWFA07RRMX3AT10JKKSZNX6', '2026-06-12 02:12:04.856+03', '2026-06-12 02:32:22.79+03', '2026-06-12 02:32:22.79+03', 'ORTLU-TAKM-SİYAH-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / M', 'SİYAH / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWFA0PRA1ZRCEE2GNK24T7F', '2026-06-12 02:12:05.337+03', '2026-06-12 02:32:23.329+03', '2026-06-12 02:32:23.329+03', 'ORTLU-TAKM-SİYAH-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / L', 'SİYAH / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWFA19YRJEYAT7C2CK3WD31', '2026-06-12 02:12:05.95+03', '2026-06-12 02:32:23.792+03', '2026-06-12 02:32:23.792+03', 'ORTLU-TAKM-SİYAH-XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / XL', 'SİYAH / XL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWFA1XRQD5W19WHEVHNE9BP', '2026-06-12 02:12:06.584+03', '2026-06-12 02:32:24.214+03', '2026-06-12 02:32:24.214+03', 'ORTLU-TAKM-SİYAH-XXL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / XXL', 'SİYAH / XXL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWFA2TNE76AGAPFJ4ER1Q45', '2026-06-12 02:12:07.509+03', '2026-06-12 02:32:24.644+03', '2026-06-12 02:32:24.644+03', 'ORTLU-TAKM-KAHVE-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KAHVE / S', 'KAHVE / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWFA3FNPSDS6RA7P8N720YG', '2026-06-12 02:12:08.182+03', '2026-06-12 02:32:24.939+03', '2026-06-12 02:32:24.939+03', 'ORTLU-TAKM-KAHVE-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KAHVE / M', 'KAHVE / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWFA47243SEEMRC54NKVCSY', '2026-06-12 02:12:08.93+03', '2026-06-12 02:32:25.175+03', '2026-06-12 02:32:25.175+03', 'ORTLU-TAKM-KAHVE-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KAHVE / L', 'KAHVE / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWFA54JF62WRBT9W5M8NK1M', '2026-06-12 02:12:09.874+03', '2026-06-12 02:32:25.361+03', '2026-06-12 02:32:25.361+03', 'ORTLU-TAKM-KAHVE-XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KAHVE / XL', 'KAHVE / XL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWFA5ZCER42GS9QZ8AWF6HW', '2026-06-12 02:12:10.732+03', '2026-06-12 02:32:25.511+03', '2026-06-12 02:32:25.511+03', 'ORTLU-TAKM-KAHVE-XXL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KAHVE / XXL', 'KAHVE / XXL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGF8GHZBEM76EQHEN8SP0E', '2026-06-12 02:32:25.745+03', '2026-06-12 02:33:36.811+03', '2026-06-12 02:33:36.811+03', 'ORTLU-TAKM-SİYAH-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / S', 'SİYAH / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGF8MECZQGS918XC5M9GCX', '2026-06-12 02:32:25.87+03', '2026-06-12 02:33:37.124+03', '2026-06-12 02:33:37.124+03', 'ORTLU-TAKM-SİYAH-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / M', 'SİYAH / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGF8S9Z2DWGNPY7H4M6CF1', '2026-06-12 02:32:26.025+03', '2026-06-12 02:33:37.376+03', '2026-06-12 02:33:37.376+03', 'ORTLU-TAKM-SİYAH-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / L', 'SİYAH / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGF8YY3KPY2R9BB9TP2242', '2026-06-12 02:32:26.206+03', '2026-06-12 02:33:37.561+03', '2026-06-12 02:33:37.561+03', 'ORTLU-TAKM-KAHVE-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KAHVE / S', 'KAHVE / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGF95XN489GB3MBQPK9M2F', '2026-06-12 02:32:26.429+03', '2026-06-12 02:33:37.711+03', '2026-06-12 02:33:37.711+03', 'ORTLU-TAKM-KAHVE-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KAHVE / M', 'KAHVE / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGF9DVG6XJ32AY1RNR5CK9', '2026-06-12 02:32:26.683+03', '2026-06-12 02:33:37.82+03', '2026-06-12 02:33:37.82+03', 'ORTLU-TAKM-KAHVE-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KAHVE / L', 'KAHVE / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGHF3QZR9KPRXAXWV76G38', '2026-06-12 02:33:38.039+03', '2026-06-12 02:35:55.886+03', '2026-06-12 02:35:55.886+03', 'ORTLU-TAKM-SİYAH-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / S', 'SİYAH / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGHF7DWCS9BJZ6FT2V0A7J', '2026-06-12 02:33:38.157+03', '2026-06-12 02:35:56.443+03', '2026-06-12 02:35:56.443+03', 'ORTLU-TAKM-SİYAH-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / M', 'SİYAH / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGHFBWF710EGK9H18ND0MW', '2026-06-12 02:33:38.3+03', '2026-06-12 02:35:56.81+03', '2026-06-12 02:35:56.81+03', 'ORTLU-TAKM-SİYAH-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / L', 'SİYAH / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGHFHTE7H4MHFSJJZ3QPBF', '2026-06-12 02:33:38.49+03', '2026-06-12 02:35:57.099+03', '2026-06-12 02:35:57.098+03', 'ORTLU-TAKM-KAHVE-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KAHVE / S', 'KAHVE / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGHFRNN66R23H3759QHBMW', '2026-06-12 02:33:38.709+03', '2026-06-12 02:35:57.338+03', '2026-06-12 02:35:57.338+03', 'ORTLU-TAKM-KAHVE-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KAHVE / M', 'KAHVE / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGHG0YE8V44476TWV9JFDB', '2026-06-12 02:33:38.975+03', '2026-06-12 02:35:57.497+03', '2026-06-12 02:35:57.497+03', 'ORTLU-TAKM-KAHVE-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KAHVE / L', 'KAHVE / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGNQJG1E5YQ4BP1Q0DCA4M', '2026-06-12 02:35:57.777+03', '2026-06-12 03:36:46.368+03', '2026-06-12 03:36:46.368+03', 'ORTLU-TAKM-SİYAH-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / S', 'SİYAH / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGNQQTKCA2ZH9X0PZJHZ95', '2026-06-12 02:35:57.947+03', '2026-06-12 03:36:46.592+03', '2026-06-12 03:36:46.592+03', 'ORTLU-TAKM-SİYAH-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / M', 'SİYAH / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGNQYJHZ9G8T685KCZTM5T', '2026-06-12 02:35:58.162+03', '2026-06-12 03:36:46.806+03', '2026-06-12 03:36:46.805+03', 'ORTLU-TAKM-SİYAH-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / L', 'SİYAH / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGNR728N8S1Q4BKPRE25CE', '2026-06-12 02:35:58.434+03', '2026-06-12 03:36:46.969+03', '2026-06-12 03:36:46.969+03', 'ORTLU-TAKM-BEYAZ-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / S', 'BEYAZ / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGNRH42GMP4R3CB3XQM62V', '2026-06-12 02:35:58.757+03', '2026-06-12 03:36:47.1+03', '2026-06-12 03:36:47.1+03', 'ORTLU-TAKM-BEYAZ-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / M', 'BEYAZ / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGNRYHH4MS2W972C762SEE', '2026-06-12 02:35:59.185+03', '2026-06-12 03:36:47.252+03', '2026-06-12 03:36:47.252+03', 'ORTLU-TAKM-BEYAZ-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / L', 'BEYAZ / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGNSDQ9VJZKC7Y3JE3CWPX', '2026-06-12 02:35:59.671+03', '2026-06-12 03:36:47.381+03', '2026-06-12 03:36:47.381+03', 'ORTLU-TAKM-KIRMIZI-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / S', 'KIRMIZI / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGNSXE048ZX2K6Z7MMT9PN', '2026-06-12 02:36:00.174+03', '2026-06-12 03:36:47.485+03', '2026-06-12 03:36:47.485+03', 'ORTLU-TAKM-KIRMIZI-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / M', 'KIRMIZI / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWGNTPPWTJV1X75XSZAJ351', '2026-06-12 02:36:00.983+03', '2026-06-12 03:36:47.571+03', '2026-06-12 03:36:47.571+03', 'ORTLU-TAKM-KIRMIZI-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / L', 'KIRMIZI / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWMQ5Z1JPFXQ6VX26H6956Q', '2026-06-12 03:46:39.585+03', '2026-06-12 04:32:47.959+03', '2026-06-12 04:32:47.956+03', 'ORTLU-TAKM-SİYAH-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / S', 'SİYAH / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWMQ62RP5E43X3WM3SX0E29', '2026-06-12 03:46:39.704+03', '2026-06-12 04:32:48.744+03', '2026-06-12 04:32:48.744+03', 'ORTLU-TAKM-SİYAH-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / M', 'SİYAH / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWMQ66KX040WJG50K9MPNPD', '2026-06-12 03:46:39.827+03', '2026-06-12 04:32:49.41+03', '2026-06-12 04:32:49.41+03', 'ORTLU-TAKM-SİYAH-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / L', 'SİYAH / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWMQ6B4HS54FXMNFEB41MTY', '2026-06-12 03:46:39.972+03', '2026-06-12 04:32:49.75+03', '2026-06-12 04:32:49.749+03', 'ORTLU-TAKM-BEYAZ-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / S', 'BEYAZ / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWMQ6FAX4QASC1Z3Y3DDHCE', '2026-06-12 03:46:40.106+03', '2026-06-12 04:32:50.288+03', '2026-06-12 04:32:50.288+03', 'ORTLU-TAKM-BEYAZ-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / M', 'BEYAZ / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWMQ6KMMRMXCPZYMF2SF6C7', '2026-06-12 03:46:40.244+03', '2026-06-12 04:32:50.607+03', '2026-06-12 04:32:50.607+03', 'ORTLU-TAKM-BEYAZ-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / L', 'BEYAZ / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWMQ6RB89PNPBXBHSBV0YCD', '2026-06-12 03:46:40.395+03', '2026-06-12 04:32:50.965+03', '2026-06-12 04:32:50.964+03', 'ORTLU-TAKM-KIRMIZI-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / S', 'KIRMIZI / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWMQ6XD70Q1T33CWVV0KBMT', '2026-06-12 03:46:40.557+03', '2026-06-12 04:32:51.268+03', '2026-06-12 04:32:51.268+03', 'ORTLU-TAKM-KIRMIZI-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / M', 'KIRMIZI / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWMQ7498EJB0FCARGMA7S4E', '2026-06-12 03:46:40.777+03', '2026-06-12 04:32:51.459+03', '2026-06-12 04:32:51.458+03', 'ORTLU-TAKM-KIRMIZI-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / L', 'KIRMIZI / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWM54154FWN240PN3Y1S17R', '2026-06-12 03:36:47.782+03', '2026-06-12 03:46:37.927+03', '2026-06-12 03:46:37.927+03', 'ORTLU-TAKM-SİYAH-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / S', 'SİYAH / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWM544F61YMJR632RFZ3EXS', '2026-06-12 03:36:47.887+03', '2026-06-12 03:46:38.259+03', '2026-06-12 03:46:38.258+03', 'ORTLU-TAKM-SİYAH-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / M', 'SİYAH / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWM548HCNXMMV2PPG169EZ8', '2026-06-12 03:36:48.017+03', '2026-06-12 03:46:38.57+03', '2026-06-12 03:46:38.57+03', 'ORTLU-TAKM-SİYAH-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / L', 'SİYAH / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWM54BVRKTWHB2AGH8R3196', '2026-06-12 03:36:48.123+03', '2026-06-12 03:46:38.741+03', '2026-06-12 03:46:38.741+03', 'ORTLU-TAKM-BEYAZ-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / S', 'BEYAZ / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWM54FS3RNNJ00BW5WVSSS9', '2026-06-12 03:36:48.249+03', '2026-06-12 03:46:38.882+03', '2026-06-12 03:46:38.882+03', 'ORTLU-TAKM-BEYAZ-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / M', 'BEYAZ / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWM54KH47FTDP3V5HWAZC53', '2026-06-12 03:36:48.369+03', '2026-06-12 03:46:39.011+03', '2026-06-12 03:46:39.01+03', 'ORTLU-TAKM-BEYAZ-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / L', 'BEYAZ / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWM54R1G6ACRV3VMHVTPX8C', '2026-06-12 03:36:48.513+03', '2026-06-12 03:46:39.121+03', '2026-06-12 03:46:39.12+03', 'ORTLU-TAKM-KIRMIZI-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / S', 'KIRMIZI / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWM54WVZ1Z60047M3Q5AB0A', '2026-06-12 03:36:48.667+03', '2026-06-12 03:46:39.231+03', '2026-06-12 03:46:39.231+03', 'ORTLU-TAKM-KIRMIZI-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / M', 'KIRMIZI / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWM552PQYRJH5CWQNHR59HP', '2026-06-12 03:36:48.854+03', '2026-06-12 03:46:39.329+03', '2026-06-12 03:46:39.329+03', 'ORTLU-TAKM-KIRMIZI-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / L', 'KIRMIZI / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWQBSG6KP99T9SCYP3BYA29', '2026-06-12 04:32:52.102+03', '2026-06-12 04:32:52.102+03', NULL, 'ORTLU-TAKM-SİYAH-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / S', 'SİYAH / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWQBSRVN8G2YY7TJCVQ3MTF', '2026-06-12 04:32:52.379+03', '2026-06-12 04:32:52.379+03', NULL, 'ORTLU-TAKM-SİYAH-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / M', 'SİYAH / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWQBT33EANXY8TDJ0C4SVR9', '2026-06-12 04:32:52.708+03', '2026-06-12 04:32:52.708+03', NULL, 'ORTLU-TAKM-SİYAH-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / L', 'SİYAH / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWQBTDA6F7ARBTFX91ADYM0', '2026-06-12 04:32:53.035+03', '2026-06-12 04:32:53.035+03', NULL, 'ORTLU-TAKM-BEYAZ-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / S', 'BEYAZ / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWQBTTG4X48RQMBBPD9ACCX', '2026-06-12 04:32:53.456+03', '2026-06-12 04:32:53.456+03', NULL, 'ORTLU-TAKM-BEYAZ-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / M', 'BEYAZ / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWQBV55S53T8D2H0XZ7D0Q0', '2026-06-12 04:32:53.798+03', '2026-06-12 04:32:53.798+03', NULL, 'ORTLU-TAKM-BEYAZ-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / L', 'BEYAZ / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWQBVKJVEC5JCZFA8JTAWMN', '2026-06-12 04:32:54.259+03', '2026-06-12 04:32:54.259+03', NULL, 'ORTLU-TAKM-KIRMIZI-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / S', 'KIRMIZI / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWQBW03JQ730B4V609KT99P', '2026-06-12 04:32:54.66+03', '2026-06-12 04:32:54.66+03', NULL, 'ORTLU-TAKM-KIRMIZI-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / M', 'KIRMIZI / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KTWQBWEW8NPXVFTVVYQ9N24K', '2026-06-12 04:32:55.133+03', '2026-06-12 04:32:55.133+03', NULL, 'ORTLU-TAKM-KIRMIZI-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / L', 'KIRMIZI / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1XXB7WTBH02A2QH7HQ6TKF', '2026-06-14 05:03:30.943+03', '2026-06-14 05:16:49.035+03', '2026-06-14 05:16:49.035+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / S', 'KIRMIZI / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1XXB7WNKEZ1QR4JAZ15TH3', '2026-06-14 05:03:30.944+03', '2026-06-14 05:16:49.426+03', '2026-06-14 05:16:49.426+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / M', 'KIRMIZI / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1XXB7WFAQ094JZH08HGNPP', '2026-06-14 05:03:30.944+03', '2026-06-14 05:16:49.844+03', '2026-06-14 05:16:49.844+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / L', 'KIRMIZI / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1XXB7W631J64RJ4EPKMAEE', '2026-06-14 05:03:30.944+03', '2026-06-14 05:16:50.224+03', '2026-06-14 05:16:50.223+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / XL', 'KIRMIZI / XL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1XXB7W5WNPJNKP9M3VV42V', '2026-06-14 05:03:30.944+03', '2026-06-14 05:16:50.487+03', '2026-06-14 05:16:50.487+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-XXL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / XXL', 'KIRMIZI / XXL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1XXB7XWASVAVNYY13WQN7W', '2026-06-14 05:03:30.944+03', '2026-06-14 05:16:50.732+03', '2026-06-14 05:16:50.732+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / S', 'BEYAZ / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1XXB7X9Y6CEMA25ZFSYDF4', '2026-06-14 05:03:30.944+03', '2026-06-14 05:16:51.016+03', '2026-06-14 05:16:51.016+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / M', 'BEYAZ / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1XXB7X27QV1MJF58RC3FFX', '2026-06-14 05:03:30.944+03', '2026-06-14 05:16:51.271+03', '2026-06-14 05:16:51.271+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / L', 'BEYAZ / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1XXB7XZYG2B0MW5991DS3B', '2026-06-14 05:03:30.944+03', '2026-06-14 05:16:51.47+03', '2026-06-14 05:16:51.47+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / XL', 'BEYAZ / XL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1XXB7YZ3CZJZTQAEDDA34B', '2026-06-14 05:03:30.944+03', '2026-06-14 05:16:51.654+03', '2026-06-14 05:16:51.653+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-XXL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / XXL', 'BEYAZ / XXL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1XXB7Y5PH3BVGWZ5HYM9KM', '2026-06-14 05:03:30.944+03', '2026-06-14 05:16:51.811+03', '2026-06-14 05:16:51.811+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / S', 'SİYAH / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1XXB7YJSAJ3932BTQGJWSG', '2026-06-14 05:03:30.944+03', '2026-06-14 05:16:51.96+03', '2026-06-14 05:16:51.96+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / M', 'SİYAH / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1XXB7YHNQTB2A393PAD8MM', '2026-06-14 05:03:30.944+03', '2026-06-14 05:16:52.09+03', '2026-06-14 05:16:52.09+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / L', 'SİYAH / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1XXB7ZXT8K9DET11JHX3TP', '2026-06-14 05:03:30.944+03', '2026-06-14 05:16:52.201+03', '2026-06-14 05:16:52.201+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / XL', 'SİYAH / XL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1XXB7ZRJV666SJAW3RESTT', '2026-06-14 05:03:30.944+03', '2026-06-14 05:16:52.3+03', '2026-06-14 05:16:52.3+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-XXL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / XXL', 'SİYAH / XXL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1YNTBTDYEC9E3H071XW9BY', '2026-06-14 05:16:52.859+03', '2026-06-14 06:22:50.226+03', '2026-06-14 06:22:50.225+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / L', 'KIRMIZI / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1YNTGE0TDHENZCHGP8PXJ8', '2026-06-14 05:16:53.006+03', '2026-06-14 06:22:50.739+03', '2026-06-14 06:22:50.738+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / XL', 'KIRMIZI / XL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1YNTRVPCZB4X2FAVWMFF43', '2026-06-14 05:16:53.276+03', '2026-06-14 06:22:51.066+03', '2026-06-14 06:22:51.066+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-XXL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / XXL', 'KIRMIZI / XXL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1YNV2EGYJX6972JX490FK6', '2026-06-14 05:16:53.582+03', '2026-06-14 06:22:51.364+03', '2026-06-14 06:22:51.364+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / S', 'BEYAZ / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1YNV80CFFV2SSHEPNTM7AN', '2026-06-14 05:16:53.76+03', '2026-06-14 06:22:51.604+03', '2026-06-14 06:22:51.604+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / M', 'BEYAZ / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1YNVDZRYE6ZDNN3805ACJM', '2026-06-14 05:16:53.951+03', '2026-06-14 06:22:51.846+03', '2026-06-14 06:22:51.845+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / L', 'BEYAZ / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1YNVM73W648516WERNHD2S', '2026-06-14 05:16:54.151+03', '2026-06-14 06:22:52.118+03', '2026-06-14 06:22:52.117+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / XL', 'BEYAZ / XL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1YNT1MHN05YNDC35WQPRBY', '2026-06-14 05:16:52.533+03', '2026-06-14 06:22:49.13+03', '2026-06-14 06:22:49.13+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / S', 'KIRMIZI / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1YNT4YWPRXSHRVTRESS7W6', '2026-06-14 05:16:52.638+03', '2026-06-14 06:22:49.719+03', '2026-06-14 06:22:49.719+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / M', 'KIRMIZI / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1YNVTZ9XR27PZCH0NGSCPB', '2026-06-14 05:16:54.368+03', '2026-06-14 06:22:52.456+03', '2026-06-14 06:22:52.455+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-XXL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / XXL', 'BEYAZ / XXL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1YNW34SMKW78H0PVJ1BQTS', '2026-06-14 05:16:54.628+03', '2026-06-14 06:22:52.764+03', '2026-06-14 06:22:52.764+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / S', 'SİYAH / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1YNWB58QQQSY7VJZ5TCQGA', '2026-06-14 05:16:54.885+03', '2026-06-14 06:22:53.008+03', '2026-06-14 06:22:53.008+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / M', 'SİYAH / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1YNWMSR5ZSB2W9NAYJ1MDJ', '2026-06-14 05:16:55.194+03', '2026-06-14 06:22:53.151+03', '2026-06-14 06:22:53.151+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / L', 'SİYAH / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1YNX0HE9B10FZVMXGQ1ZY8', '2026-06-14 05:16:55.569+03', '2026-06-14 06:22:53.263+03', '2026-06-14 06:22:53.263+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / XL', 'SİYAH / XL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV1YNXA2XTCWXCDRP65A73QZ', '2026-06-14 05:16:55.874+03', '2026-06-14 06:22:53.353+03', '2026-06-14 06:22:53.353+03', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-XXL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / XXL', 'SİYAH / XXL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV22EP8C1XEWHQG0VT29XDKQ', '2026-06-14 06:22:53.58+03', '2026-06-14 06:22:53.58+03', NULL, 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / S', 'KIRMIZI / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV22EPBVQMTH29Y0PESPGCSZ', '2026-06-14 06:22:53.691+03', '2026-06-14 06:22:53.691+03', NULL, 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / M', 'KIRMIZI / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV22EPFEWFFPJS4R6E2YXPDH', '2026-06-14 06:22:53.807+03', '2026-06-14 06:22:53.807+03', NULL, 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / L', 'KIRMIZI / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV22EPK28NN95T9F3GFNYXKP', '2026-06-14 06:22:53.922+03', '2026-06-14 06:22:53.922+03', NULL, 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / XL', 'KIRMIZI / XL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV22EPQF3CPCQ44QRYJF6F2V', '2026-06-14 06:22:54.063+03', '2026-06-14 06:22:54.063+03', NULL, 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-XXL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'KIRMIZI / XXL', 'KIRMIZI / XXL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV22EPWB9XH3SEHM762KHRZC', '2026-06-14 06:22:54.219+03', '2026-06-14 06:22:54.219+03', NULL, 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / S', 'BEYAZ / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV22EQ3HH7NW81Z3FZ7KF1X4', '2026-06-14 06:22:54.449+03', '2026-06-14 06:22:54.449+03', NULL, 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / M', 'BEYAZ / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV22EQBYYNAA309397JC91Y9', '2026-06-14 06:22:54.718+03', '2026-06-14 06:22:54.718+03', NULL, 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / L', 'BEYAZ / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV22EQN434ZP7GP5AQQNVQ09', '2026-06-14 06:22:55.012+03', '2026-06-14 06:22:55.012+03', NULL, 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / XL', 'BEYAZ / XL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV22EQW96W6Q8GEFHMYS7TDQ', '2026-06-14 06:22:55.241+03', '2026-06-14 06:22:55.241+03', NULL, 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-XXL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'BEYAZ / XXL', 'BEYAZ / XXL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV22ER4WT0AP376NEZWF1VVS', '2026-06-14 06:22:55.516+03', '2026-06-14 06:22:55.516+03', NULL, 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / S', 'SİYAH / S', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV22ERKH4P3GANREA0ZPV8FW', '2026-06-14 06:22:55.985+03', '2026-06-14 06:22:55.985+03', NULL, 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / M', 'SİYAH / M', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV22ERZT42G7PP2J3K5EEKJD', '2026-06-14 06:22:56.378+03', '2026-06-14 06:22:56.378+03', NULL, 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / L', 'SİYAH / L', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV22ES8Y5PQG9VXCJNJ3FPMC', '2026-06-14 06:22:56.67+03', '2026-06-14 06:22:56.67+03', NULL, 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / XL', 'SİYAH / XL', NULL, NULL);
INSERT INTO public.inventory_item VALUES ('iitem_01KV22ESKMJQWK78MJW7R33YV8', '2026-06-14 06:22:57.013+03', '2026-06-14 06:22:57.013+03', NULL, 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-XXL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 'SİYAH / XXL', 'SİYAH / XXL', NULL, NULL);


--
-- Data for Name: inventory_level; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.inventory_level VALUES ('ilev_01KTWMQ7DDZ9KVAWN2R4T5PWQV', '2026-06-12 03:46:41.069+03', '2026-06-12 04:32:47.981+03', '2026-06-12 04:32:47.956+03', 'iitem_01KTWMQ5Z1JPFXQ6VX26H6956Q', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWQBXDAT72V83F6MRCFWEWD', '2026-06-12 04:32:56.106+03', '2026-06-12 04:32:56.106+03', NULL, 'iitem_01KTWQBTDA6F7ARBTFX91ADYM0', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWQBXMNX90222YFANX9P2G6', '2026-06-12 04:32:56.342+03', '2026-06-12 04:32:56.342+03', NULL, 'iitem_01KTWQBVKJVEC5JCZFA8JTAWMN', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWQBXF94V7NQW6WE4RMN1X2', '2026-06-12 04:32:56.169+03', '2026-06-14 03:48:47.948+03', NULL, 'iitem_01KTWQBTTG4X48RQMBBPD9ACCX', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 2, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "2", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWQBX8XXP7CW858A7ZM036D', '2026-06-12 04:32:55.965+03', '2026-06-14 03:48:47.948+03', NULL, 'iitem_01KTWQBSRVN8G2YY7TJCVQ3MTF', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 3, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "3", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1XXC1WABT93ND5NNAE4CV6', '2026-06-14 05:03:31.772+03', '2026-06-14 05:16:51.023+03', '2026-06-14 05:16:51.016+03', 'iitem_01KV1XXB7X9Y6CEMA25ZFSYDF4', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC74YSP2ED7G19Z7ZYJY', '2026-06-11 02:26:52.649+03', '2026-06-11 17:53:56.467+03', '2026-06-11 17:53:56.403+03', 'iitem_01KTSXRBT1KJ0K4VSN48TV480C', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC73T02ZFJ98JNZ1GKRQ', '2026-06-11 02:26:52.649+03', '2026-06-11 17:53:56.485+03', '2026-06-11 17:53:56.403+03', 'iitem_01KTSXRBT0C7ZE00W2TV0NFW7Q', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC72XJC6ST0T5P0MFSNT', '2026-06-11 02:26:52.648+03', '2026-06-11 17:53:56.503+03', '2026-06-11 17:53:56.403+03', 'iitem_01KTSXRBT08JVZ0KNNXH0HDMYR', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC74SSFB1TBPNEY5NDTF', '2026-06-11 02:26:52.649+03', '2026-06-11 17:53:56.518+03', '2026-06-11 17:53:56.403+03', 'iitem_01KTSXRBT1PHDCC8RBWWVV3NHH', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC71JS5KVNXXXDQW6MR8', '2026-06-11 02:26:52.648+03', '2026-06-11 17:57:07.483+03', '2026-06-11 17:57:07.462+03', 'iitem_01KTSXRBSYVT8W7MANN1YWW0X4', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC71V46P1SY170G8HQC1', '2026-06-11 02:26:52.648+03', '2026-06-11 17:57:07.499+03', '2026-06-11 17:57:07.462+03', 'iitem_01KTSXRBSYNZD9J1AG6T6YXQ1V', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC70YYVKJK8C103EPCST', '2026-06-11 02:26:52.648+03', '2026-06-11 17:57:07.519+03', '2026-06-11 17:57:07.462+03', 'iitem_01KTSXRBSXDH3MHXQF4BXMPJ0F', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC71JJTRBVJYFYR7V3DB', '2026-06-11 02:26:52.648+03', '2026-06-11 17:57:07.55+03', '2026-06-11 17:57:07.462+03', 'iitem_01KTSXRBSY85VWEFW1Y1T78WMP', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC6ZNQVY95A6SJ9J09P3', '2026-06-11 02:26:52.647+03', '2026-06-11 17:57:07.569+03', '2026-06-11 17:57:07.462+03', 'iitem_01KTSXRBSWKYBX04CZK09JFE61', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC70YHVS44ENRF0P26RX', '2026-06-11 02:26:52.648+03', '2026-06-11 17:57:07.583+03', '2026-06-11 17:57:07.462+03', 'iitem_01KTSXRBSXH6EA0AHYMPZQC78P', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC74ZN58AYAMP1SMXYKK', '2026-06-11 02:26:52.649+03', '2026-06-11 17:57:11.748+03', '2026-06-11 17:57:11.737+03', 'iitem_01KTSXRBT2BX3ZD953AKFZKST3', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC759QDYM373K69KAYXC', '2026-06-11 02:26:52.65+03', '2026-06-11 17:57:11.76+03', '2026-06-11 17:57:11.737+03', 'iitem_01KTSXRBT2XN1TVK367KHM23VA', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC73ZVK1RDC453BRPACB', '2026-06-11 02:26:52.649+03', '2026-06-11 17:57:11.772+03', '2026-06-11 17:57:11.737+03', 'iitem_01KTSXRBT1EW6Z76EGS7GPD3P0', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC75WJ2DQERGEDWABWFV', '2026-06-11 02:26:52.65+03', '2026-06-11 17:57:11.784+03', '2026-06-11 17:57:11.737+03', 'iitem_01KTSXRBT3EFZTGWYK1KJ3ANX2', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC76SE50H9NFDS6Z2DQ4', '2026-06-11 02:26:52.65+03', '2026-06-11 17:57:16.245+03', '2026-06-11 17:57:16.117+03', 'iitem_01KTSXRBT42MBJ1D00Y075CRCD', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC757MM7D014ZS0FGV7Y', '2026-06-11 02:26:52.65+03', '2026-06-11 17:57:16.255+03', '2026-06-11 17:57:16.117+03', 'iitem_01KTSXRBT36V9HDT3SFV5YJFYN', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC768TGDJBVH6YACXT52', '2026-06-11 02:26:52.65+03', '2026-06-11 17:57:16.276+03', '2026-06-11 17:57:16.117+03', 'iitem_01KTSXRBT3ZGP5CN4SRCS2N68T', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC76DJREAYP1EJ25NHAQ', '2026-06-11 02:26:52.65+03', '2026-06-11 17:57:16.303+03', '2026-06-11 17:57:16.117+03', 'iitem_01KTSXRBT4K95CQBBB7F3PN043', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC72Y26K4159C1EZGE0E', '2026-06-11 02:26:52.648+03', '2026-06-11 17:57:07.597+03', '2026-06-11 17:57:07.462+03', 'iitem_01KTSXRBSZ7JMAX6H10PBNPQFW', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTSXRC72SHR4DH290E88X0DT', '2026-06-11 02:26:52.648+03', '2026-06-11 17:57:07.615+03', '2026-06-11 17:57:07.462+03', 'iitem_01KTSXRBSZYT165TR2ZAQA0DPF', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWFA6YHKQ4SDM7CHZDCKR32', '2026-06-12 02:12:11.73+03', '2026-06-12 02:32:17.208+03', '2026-06-12 02:32:17.198+03', 'iitem_01KTWF9Y7V9KYAY5R8HHMM590R', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWFA6ZP6WHJT37ZQN8HBMY4', '2026-06-12 02:12:11.767+03', '2026-06-12 02:32:18.497+03', '2026-06-12 02:32:18.493+03', 'iitem_01KTWF9YC2BKVT9A68J35TP8DC', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWFA70HV59KBVTEMAWB2173', '2026-06-12 02:12:11.794+03', '2026-06-12 02:32:19.42+03', '2026-06-12 02:32:19.416+03', 'iitem_01KTWF9YJ23TDZ4QV0CYK9VDPR', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWFA71CQT5NS6QFZCSCF2RB', '2026-06-12 02:12:11.82+03', '2026-06-12 02:32:20.742+03', '2026-06-12 02:32:20.737+03', 'iitem_01KTWF9YXAJ7NTXNGFC288MT94', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWFA727T232814ZE64R7YJ3', '2026-06-12 02:12:11.847+03', '2026-06-12 02:32:21.519+03', '2026-06-12 02:32:21.515+03', 'iitem_01KTWF9Z89ZQQ0XVB135N7GEWK', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWFA7394REMN7JYWVJV1DYQ', '2026-06-12 02:12:11.881+03', '2026-06-12 02:32:22.197+03', '2026-06-12 02:32:22.195+03', 'iitem_01KTWF9ZSSMRXG0M90923D7FBK', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWFA749BQNE9GCF68TV4B2H', '2026-06-12 02:12:11.913+03', '2026-06-12 02:32:22.793+03', '2026-06-12 02:32:22.79+03', 'iitem_01KTWFA07RRMX3AT10JKKSZNX6', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWFA756SJBAZ4RAS13F55VE', '2026-06-12 02:12:11.942+03', '2026-06-12 02:32:23.332+03', '2026-06-12 02:32:23.329+03', 'iitem_01KTWFA0PRA1ZRCEE2GNK24T7F', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWFA765X7N9EK71Y5F0GZTX', '2026-06-12 02:12:11.974+03', '2026-06-12 02:32:23.794+03', '2026-06-12 02:32:23.792+03', 'iitem_01KTWFA19YRJEYAT7C2CK3WD31', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWFA7752KYRKV92Q1A76BQS', '2026-06-12 02:12:12.005+03', '2026-06-12 02:32:24.22+03', '2026-06-12 02:32:24.214+03', 'iitem_01KTWFA1XRQD5W19WHEVHNE9BP', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWFA783K34TMWMZZE9N2NB7', '2026-06-12 02:12:12.035+03', '2026-06-12 02:32:24.646+03', '2026-06-12 02:32:24.644+03', 'iitem_01KTWFA2TNE76AGAPFJ4ER1Q45', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWFA791C0A0X6GP2GCMQ2V8', '2026-06-12 02:12:12.065+03', '2026-06-12 02:32:24.941+03', '2026-06-12 02:32:24.939+03', 'iitem_01KTWFA3FNPSDS6RA7P8N720YG', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWFA79XG2X3Z2BBKV0E0E6A', '2026-06-12 02:12:12.094+03', '2026-06-12 02:32:25.177+03', '2026-06-12 02:32:25.175+03', 'iitem_01KTWFA47243SEEMRC54NKVCSY', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWFA7AX8NK9Y2CNJPEH42VB', '2026-06-12 02:12:12.125+03', '2026-06-12 02:32:25.365+03', '2026-06-12 02:32:25.361+03', 'iitem_01KTWFA54JF62WRBT9W5M8NK1M', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWFA7BZNSM618K39SZ956MJ', '2026-06-12 02:12:12.159+03', '2026-06-12 02:32:25.513+03', '2026-06-12 02:32:25.511+03', 'iitem_01KTWFA5ZCER42GS9QZ8AWF6HW', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGF9R04XRDCVSZZ1MFM1YC', '2026-06-12 02:32:27.009+03', '2026-06-12 02:33:36.818+03', '2026-06-12 02:33:36.811+03', 'iitem_01KTWGF8GHZBEM76EQHEN8SP0E', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGF9S0W82TXXPVJQYKH1QN', '2026-06-12 02:32:27.04+03', '2026-06-12 02:33:37.131+03', '2026-06-12 02:33:37.124+03', 'iitem_01KTWGF8MECZQGS918XC5M9GCX', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGF9SW8AM1GXPASK9QNRY3', '2026-06-12 02:32:27.068+03', '2026-06-12 02:33:37.38+03', '2026-06-12 02:33:37.376+03', 'iitem_01KTWGF8S9Z2DWGNPY7H4M6CF1', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGF9TPJQ0NHTJWFYF30JE0', '2026-06-12 02:32:27.094+03', '2026-06-12 02:33:37.564+03', '2026-06-12 02:33:37.561+03', 'iitem_01KTWGF8YY3KPY2R9BB9TP2242', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGF9VJF0QDQ0BGS7Z6ZC2X', '2026-06-12 02:32:27.122+03', '2026-06-12 02:33:37.713+03', '2026-06-12 02:33:37.711+03', 'iitem_01KTWGF95XN489GB3MBQPK9M2F', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGF9WC5RATTNHWQNDH1KW1', '2026-06-12 02:32:27.148+03', '2026-06-12 02:33:37.822+03', '2026-06-12 02:33:37.82+03', 'iitem_01KTWGF9DVG6XJ32AY1RNR5CK9', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGHGBWKX4N171QXMA4BSHG', '2026-06-12 02:33:39.324+03', '2026-06-12 02:35:56.446+03', '2026-06-12 02:35:56.443+03', 'iitem_01KTWGHF7DWCS9BJZ6FT2V0A7J', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGHGCP42Y5RKVDZAT1DHQA', '2026-06-12 02:33:39.35+03', '2026-06-12 02:35:56.814+03', '2026-06-12 02:35:56.81+03', 'iitem_01KTWGHFBWF710EGK9H18ND0MW', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWMQ7EMM7PFS8QVAEB8771F', '2026-06-12 03:46:41.108+03', '2026-06-12 04:32:48.75+03', '2026-06-12 04:32:48.744+03', 'iitem_01KTWMQ62RP5E43X3WM3SX0E29', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWMQ7FREM6BET53AB0HGFWY', '2026-06-12 03:46:41.144+03', '2026-06-12 04:32:49.42+03', '2026-06-12 04:32:49.41+03', 'iitem_01KTWMQ66KX040WJG50K9MPNPD', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWMQ7GZ5VADMGVP7A2H03H6', '2026-06-12 03:46:41.184+03', '2026-06-12 04:32:49.759+03', '2026-06-12 04:32:49.749+03', 'iitem_01KTWMQ6B4HS54FXMNFEB41MTY', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGHGB1GQ294APD34GYWTPH', '2026-06-12 02:33:39.297+03', '2026-06-12 02:35:55.896+03', '2026-06-12 02:35:55.886+03', 'iitem_01KTWGHF3QZR9KPRXAXWV76G38', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGHGDH7XDKAH1N3JBBG8Z1', '2026-06-12 02:33:39.377+03', '2026-06-12 02:35:57.118+03', '2026-06-12 02:35:57.098+03', 'iitem_01KTWGHFHTE7H4MHFSJJZ3QPBF', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGHGEETNHQRK7ZAYNX0MNZ', '2026-06-12 02:33:39.406+03', '2026-06-12 02:35:57.343+03', '2026-06-12 02:35:57.338+03', 'iitem_01KTWGHFRNN66R23H3759QHBMW', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGHGFA1462FEZBWBZ94DN4', '2026-06-12 02:33:39.434+03', '2026-06-12 02:35:57.501+03', '2026-06-12 02:35:57.497+03', 'iitem_01KTWGHG0YE8V44476TWV9JFDB', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGNVBWJWG2FNBZH5G5DXGP', '2026-06-12 02:36:01.66+03', '2026-06-12 03:36:46.374+03', '2026-06-12 03:36:46.368+03', 'iitem_01KTWGNQJG1E5YQ4BP1Q0DCA4M', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGNVCXW1KKCN2X2NV5QJ67', '2026-06-12 02:36:01.693+03', '2026-06-12 03:36:46.598+03', '2026-06-12 03:36:46.592+03', 'iitem_01KTWGNQQTKCA2ZH9X0PZJHZ95', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGNVDVVNJBYN47Q82MBN98', '2026-06-12 02:36:01.724+03', '2026-06-12 03:36:46.808+03', '2026-06-12 03:36:46.805+03', 'iitem_01KTWGNQYJHZ9G8T685KCZTM5T', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGNVEVA3KRC1Y708QM4X5K', '2026-06-12 02:36:01.755+03', '2026-06-12 03:36:46.972+03', '2026-06-12 03:36:46.969+03', 'iitem_01KTWGNR728N8S1Q4BKPRE25CE', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGNVFQJTNVX5ESQDKR5AM6', '2026-06-12 02:36:01.784+03', '2026-06-12 03:36:47.103+03', '2026-06-12 03:36:47.1+03', 'iitem_01KTWGNRH42GMP4R3CB3XQM62V', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGNVGMDZ33P4R5JHB6BFYW', '2026-06-12 02:36:01.812+03', '2026-06-12 03:36:47.255+03', '2026-06-12 03:36:47.252+03', 'iitem_01KTWGNRYHH4MS2W972C762SEE', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGNVHJYSKHSERYA0RAG2AT', '2026-06-12 02:36:01.842+03', '2026-06-12 03:36:47.384+03', '2026-06-12 03:36:47.381+03', 'iitem_01KTWGNSDQ9VJZKC7Y3JE3CWPX', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGNVJHZYR0SGR0SA7QQKQK', '2026-06-12 02:36:01.873+03', '2026-06-12 03:36:47.49+03', '2026-06-12 03:36:47.485+03', 'iitem_01KTWGNSXE048ZX2K6Z7MMT9PN', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWGNVKJS1DD3WABYA8WB58N', '2026-06-12 02:36:01.906+03', '2026-06-12 03:36:47.573+03', '2026-06-12 03:36:47.571+03', 'iitem_01KTWGNTPPWTJV1X75XSZAJ351', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWM55B5MHZVBMKB79KMZWN9', '2026-06-12 03:36:49.125+03', '2026-06-12 03:46:37.932+03', '2026-06-12 03:46:37.927+03', 'iitem_01KTWM54154FWN240PN3Y1S17R', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWM55C7E50KKGF9RQEDGN27', '2026-06-12 03:36:49.159+03', '2026-06-12 03:46:38.294+03', '2026-06-12 03:46:38.258+03', 'iitem_01KTWM544F61YMJR632RFZ3EXS', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWM55D5RVFZCB5Q05WVPCFH', '2026-06-12 03:36:49.189+03', '2026-06-12 03:46:38.574+03', '2026-06-12 03:46:38.57+03', 'iitem_01KTWM548HCNXMMV2PPG169EZ8', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWM55DZR6WPJR7C4RY11C5D', '2026-06-12 03:36:49.215+03', '2026-06-12 03:46:38.745+03', '2026-06-12 03:46:38.741+03', 'iitem_01KTWM54BVRKTWHB2AGH8R3196', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWM55ESXFECGMVSB1V1C0J9', '2026-06-12 03:36:49.241+03', '2026-06-12 03:46:38.885+03', '2026-06-12 03:46:38.882+03', 'iitem_01KTWM54FS3RNNJ00BW5WVSSS9', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWM55FJKW7TS3NECYD0H553', '2026-06-12 03:36:49.267+03', '2026-06-12 03:46:39.014+03', '2026-06-12 03:46:39.01+03', 'iitem_01KTWM54KH47FTDP3V5HWAZC53', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWM55G9X1Q1CJTTBS5QCBCX', '2026-06-12 03:36:49.29+03', '2026-06-12 03:46:39.124+03', '2026-06-12 03:46:39.12+03', 'iitem_01KTWM54R1G6ACRV3VMHVTPX8C', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWM55H322T6ERBK2NBK2EDR', '2026-06-12 03:36:49.316+03', '2026-06-12 03:46:39.234+03', '2026-06-12 03:46:39.231+03', 'iitem_01KTWM54WVZ1Z60047M3Q5AB0A', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWM55HYAAD20NMX1NXZZNAV', '2026-06-12 03:36:49.342+03', '2026-06-12 03:46:39.332+03', '2026-06-12 03:46:39.329+03', 'iitem_01KTWM552PQYRJH5CWQNHR59HP', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWMQ7J762TTEES48HJ9YW77', '2026-06-12 03:46:41.224+03', '2026-06-12 04:32:50.295+03', '2026-06-12 04:32:50.288+03', 'iitem_01KTWMQ6FAX4QASC1Z3Y3DDHCE', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWMQ7KCN77D87KWYB81QR6N', '2026-06-12 03:46:41.26+03', '2026-06-12 04:32:50.62+03', '2026-06-12 04:32:50.607+03', 'iitem_01KTWMQ6KMMRMXCPZYMF2SF6C7', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWMQ7NRFGP03EQ0Q0NW5YKD', '2026-06-12 03:46:41.336+03', '2026-06-12 04:32:51.275+03', '2026-06-12 04:32:51.268+03', 'iitem_01KTWMQ6XD70Q1T33CWVV0KBMT', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWQBXB43GGAC6ZEJ5EVJ29P', '2026-06-12 04:32:56.037+03', '2026-06-12 04:32:56.037+03', NULL, 'iitem_01KTWQBT33EANXY8TDJ0C4SVR9', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWQBXT4JHZYXPFENT5K7YJT', '2026-06-12 04:32:56.517+03', '2026-06-12 04:32:56.517+03', NULL, 'iitem_01KTWQBWEW8NPXVFTVVYQ9N24K', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWQBXQDWYP5HBAJ6AMB7VPT', '2026-06-12 04:32:56.43+03', '2026-06-12 19:29:01.075+03', NULL, 'iitem_01KTWQBW03JQ730B4V609KT99P', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 1, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "1", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1XXBWZT6T6DZ5ARRVF46TR', '2026-06-14 05:03:31.615+03', '2026-06-14 05:16:49.435+03', '2026-06-14 05:16:49.426+03', 'iitem_01KV1XXB7WNKEZ1QR4JAZ15TH3', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1XXBZ0VBQ6TSN5SHGCQHWF', '2026-06-14 05:03:31.68+03', '2026-06-14 05:16:50.228+03', '2026-06-14 05:16:50.223+03', 'iitem_01KV1XXB7W631J64RJ4EPKMAEE', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1XXC2WNDWTGJ9ZDQ23PBDB', '2026-06-14 05:03:31.804+03', '2026-06-14 05:16:51.273+03', '2026-06-14 05:16:51.271+03', 'iitem_01KV1XXB7X27QV1MJF58RC3FFX', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1XXC3RCMP3C98RWFX8QDZG', '2026-06-14 05:03:31.833+03', '2026-06-14 05:16:51.473+03', '2026-06-14 05:16:51.47+03', 'iitem_01KV1XXB7XZYG2B0MW5991DS3B', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1XXC4SYJPMDDR45WD7AV2A', '2026-06-14 05:03:31.865+03', '2026-06-14 05:16:51.657+03', '2026-06-14 05:16:51.653+03', 'iitem_01KV1XXB7YZ3CZJZTQAEDDA34B', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1YNXPDAER3CK6K92E3VKAH', '2026-06-14 05:16:56.269+03', '2026-06-14 06:22:49.727+03', '2026-06-14 06:22:49.719+03', 'iitem_01KV1YNT4YWPRXSHRVTRESS7W6', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1YNXQ86BADJPM5858PBGD1', '2026-06-14 05:16:56.296+03', '2026-06-14 06:22:50.23+03', '2026-06-14 06:22:50.225+03', 'iitem_01KV1YNTBTDYEC9E3H071XW9BY', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1YNXR15JFB3BMPFX91K0FR', '2026-06-14 05:16:56.321+03', '2026-06-14 06:22:50.744+03', '2026-06-14 06:22:50.738+03', 'iitem_01KV1YNTGE0TDHENZCHGP8PXJ8', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1YNXRVHJPKBDQRD3VQBEZP', '2026-06-14 05:16:56.348+03', '2026-06-14 06:22:51.072+03', '2026-06-14 06:22:51.066+03', 'iitem_01KV1YNTRVPCZB4X2FAVWMFF43', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1YNXTPRXKT6F9F7JN6G5PE', '2026-06-14 05:16:56.406+03', '2026-06-14 06:22:51.609+03', '2026-06-14 06:22:51.604+03', 'iitem_01KV1YNV80CFFV2SSHEPNTM7AN', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1YNXVHGVK0593PSRZGYA9Z', '2026-06-14 05:16:56.433+03', '2026-06-14 06:22:51.85+03', '2026-06-14 06:22:51.845+03', 'iitem_01KV1YNVDZRYE6ZDNN3805ACJM', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1YNXWB3RFFG4Y4F1H5E8Y3', '2026-06-14 05:16:56.459+03', '2026-06-14 06:22:52.128+03', '2026-06-14 06:22:52.117+03', 'iitem_01KV1YNVM73W648516WERNHD2S', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1YNXX38ZRPE38F5SCR27K4', '2026-06-14 05:16:56.484+03', '2026-06-14 06:22:52.462+03', '2026-06-14 06:22:52.455+03', 'iitem_01KV1YNVTZ9XR27PZCH0NGSCPB', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1YNXY2Z1QHVD77EG8A63Q8', '2026-06-14 05:16:56.514+03', '2026-06-14 06:22:52.772+03', '2026-06-14 06:22:52.764+03', 'iitem_01KV1YNW34SMKW78H0PVJ1BQTS', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV22ESYTJ50F0E7KPDTGGQ81', '2026-06-14 06:22:57.371+03', '2026-06-14 06:22:57.371+03', NULL, 'iitem_01KV22EP8C1XEWHQG0VT29XDKQ', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV22ET79RHMWD0J9R0XH2XZT', '2026-06-14 06:22:57.641+03', '2026-06-14 06:22:57.641+03', NULL, 'iitem_01KV22ER4WT0AP376NEZWF1VVS', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV22ET8304MPC03D6AT7W1AW', '2026-06-14 06:22:57.668+03', '2026-06-14 06:22:57.668+03', NULL, 'iitem_01KV22ERKH4P3GANREA0ZPV8FW', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV22ET8ZDQPKSQENKS1SQMM6', '2026-06-14 06:22:57.695+03', '2026-06-14 06:22:57.695+03', NULL, 'iitem_01KV22ERZT42G7PP2J3K5EEKJD', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWQBXHTPDY538KCRSPF1FJZ', '2026-06-12 04:32:56.251+03', '2026-06-23 00:14:01.193+03', NULL, 'iitem_01KTWQBV55S53T8D2H0XZ7D0Q0', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 1, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "1", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWMQ7MKJ20ZF8YY33Z5QF1D', '2026-06-12 03:46:41.299+03', '2026-06-12 04:32:50.977+03', '2026-06-12 04:32:50.964+03', 'iitem_01KTWMQ6RB89PNPBXBHSBV0YCD', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWMQ7PXHV4FZ6JE8NKA4QGN', '2026-06-12 03:46:41.374+03', '2026-06-12 04:32:51.466+03', '2026-06-12 04:32:51.458+03', 'iitem_01KTWMQ7498EJB0FCARGMA7S4E', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KTWQBX6M2YB4J9JC5ZK0KJ06', '2026-06-12 04:32:55.892+03', '2026-06-12 20:16:45.661+03', NULL, 'iitem_01KTWQBSG6KP99T9SCYP3BYA29', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 4, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "4", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1XXBVW28F37547ZXJV2EXX', '2026-06-14 05:03:31.581+03', '2026-06-14 05:16:49.045+03', '2026-06-14 05:16:49.035+03', 'iitem_01KV1XXB7WTBH02A2QH7HQ6TKF', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1XXBY10QB99YPK8K3BK441', '2026-06-14 05:03:31.649+03', '2026-06-14 05:16:49.85+03', '2026-06-14 05:16:49.844+03', 'iitem_01KV1XXB7WFAQ094JZH08HGNPP', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1XXBZYDBDCGGVQ7M76GDNC', '2026-06-14 05:03:31.711+03', '2026-06-14 05:16:50.49+03', '2026-06-14 05:16:50.487+03', 'iitem_01KV1XXB7W5WNPJNKP9M3VV42V', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1XXC0X56XZN0WFCCBEFHNA', '2026-06-14 05:03:31.741+03', '2026-06-14 05:16:50.735+03', '2026-06-14 05:16:50.732+03', 'iitem_01KV1XXB7XWASVAVNYY13WQN7W', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1XXC5QPH8Y3MR8RK740ETE', '2026-06-14 05:03:31.895+03', '2026-06-14 05:16:51.816+03', '2026-06-14 05:16:51.811+03', 'iitem_01KV1XXB7Y5PH3BVGWZ5HYM9KM', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1XXC6QTMCGHYS5R608N3GJ', '2026-06-14 05:03:31.927+03', '2026-06-14 05:16:51.964+03', '2026-06-14 05:16:51.96+03', 'iitem_01KV1XXB7YJSAJ3932BTQGJWSG', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1XXC7NBEJX7BY2CV2ASJG5', '2026-06-14 05:03:31.957+03', '2026-06-14 05:16:52.093+03', '2026-06-14 05:16:52.09+03', 'iitem_01KV1XXB7YHNQTB2A393PAD8MM', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1XXC8V0DQCDP8WREQRKP14', '2026-06-14 05:03:31.995+03', '2026-06-14 05:16:52.203+03', '2026-06-14 05:16:52.201+03', 'iitem_01KV1XXB7ZXT8K9DET11JHX3TP', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1XXC9WK6CCYK1HP76JRCPF', '2026-06-14 05:03:32.028+03', '2026-06-14 05:16:52.303+03', '2026-06-14 05:16:52.3+03', 'iitem_01KV1XXB7ZRJV666SJAW3RESTT', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1YNXN6ED8Y5824ABZJTKNM', '2026-06-14 05:16:56.23+03', '2026-06-14 06:22:49.15+03', '2026-06-14 06:22:49.13+03', 'iitem_01KV1YNT1MHN05YNDC35WQPRBY', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1YNXSR7FASVD0F9K01C71C', '2026-06-14 05:16:56.376+03', '2026-06-14 06:22:51.367+03', '2026-06-14 06:22:51.364+03', 'iitem_01KV1YNV2EGYJX6972JX490FK6', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1YNXZ0N0H71KC53NFDE2NF', '2026-06-14 05:16:56.545+03', '2026-06-14 06:22:53.012+03', '2026-06-14 06:22:53.008+03', 'iitem_01KV1YNWB58QQQSY7VJZ5TCQGA', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1YNXZYHGRW1A85N0AHTSXP', '2026-06-14 05:16:56.574+03', '2026-06-14 06:22:53.154+03', '2026-06-14 06:22:53.151+03', 'iitem_01KV1YNWMSR5ZSB2W9NAYJ1MDJ', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1YNY0SB981DYTC7C3DRP6P', '2026-06-14 05:16:56.601+03', '2026-06-14 06:22:53.266+03', '2026-06-14 06:22:53.263+03', 'iitem_01KV1YNX0HE9B10FZVMXGQ1ZY8', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV1YNY1NN8F1E8GG272JB9YZ', '2026-06-14 05:16:56.63+03', '2026-06-14 06:22:53.357+03', '2026-06-14 06:22:53.353+03', 'iitem_01KV1YNXA2XTCWXCDRP65A73QZ', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV22ET0MENMWR28QW5JMM0C9', '2026-06-14 06:22:57.428+03', '2026-06-14 06:22:57.428+03', NULL, 'iitem_01KV22EPFEWFFPJS4R6E2YXPDH', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV22ET1F3TVT94Z3K5Q8XX65', '2026-06-14 06:22:57.455+03', '2026-06-14 06:22:57.455+03', NULL, 'iitem_01KV22EPK28NN95T9F3GFNYXKP', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV22ET28292WT4GJZ8QGZ6CW', '2026-06-14 06:22:57.48+03', '2026-06-14 06:22:57.48+03', NULL, 'iitem_01KV22EPQF3CPCQ44QRYJF6F2V', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV22ET3140V5HGFPQJ76KATC', '2026-06-14 06:22:57.506+03', '2026-06-14 06:22:57.506+03', NULL, 'iitem_01KV22EPWB9XH3SEHM762KHRZC', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV22ET3Y5FFTZ9PY3G654NMD', '2026-06-14 06:22:57.534+03', '2026-06-14 06:22:57.534+03', NULL, 'iitem_01KV22EQ3HH7NW81Z3FZ7KF1X4', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV22ET4TT9WFTKZNPY8XH17H', '2026-06-14 06:22:57.562+03', '2026-06-15 15:51:43.811+03', NULL, 'iitem_01KV22EQBYYNAA309397JC91Y9', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 1, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "1", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV22ET9TJ74R7PAJ9CV85WP4', '2026-06-14 06:22:57.722+03', '2026-06-14 06:22:57.722+03', NULL, 'iitem_01KV22ES8Y5PQG9VXCJNJ3FPMC', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV22ETAM4V1YTB565KHY1G6K', '2026-06-14 06:22:57.748+03', '2026-06-14 06:22:57.748+03', NULL, 'iitem_01KV22ESKMJQWK78MJW7R33YV8', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 0, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV22ESZRDTB0E350P68XN8C3', '2026-06-14 06:22:57.4+03', '2026-06-15 15:51:43.811+03', NULL, 'iitem_01KV22EPBVQMTH29Y0PESPGCSZ', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 2, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "2", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV22ET6E6FJ00RC2XQS4X65H', '2026-06-14 06:22:57.615+03', '2026-06-16 19:48:18.394+03', NULL, 'iitem_01KV22EQW96W6Q8GEFHMYS7TDQ', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 1, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "1", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO public.inventory_level VALUES ('ilev_01KV22ET5MATCX7X2MJKR23K8Y', '2026-06-14 06:22:57.588+03', '2026-06-16 19:48:18.394+03', NULL, 'iitem_01KV22EQN434ZP7GP5AQQNVQ09', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 100, 2, 0, NULL, '{"value": "100", "precision": 20}', '{"value": "2", "precision": 20}', '{"value": "0", "precision": 20}');


--
-- Data for Name: invite; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: invite_rbac_role; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: link_module_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.link_module_migrations VALUES (1, 'cart_payment_collection', '{"toModel": "payment_collection", "toModule": "payment", "fromModel": "cart", "fromModule": "cart"}', '2026-06-11 02:26:18.512366');
INSERT INTO public.link_module_migrations VALUES (2, 'cart_promotion', '{"toModel": "promotions", "toModule": "promotion", "fromModel": "cart", "fromModule": "cart"}', '2026-06-11 02:26:18.583988');
INSERT INTO public.link_module_migrations VALUES (3, 'customer_account_holder', '{"toModel": "account_holder", "toModule": "payment", "fromModel": "customer", "fromModule": "customer"}', '2026-06-11 02:26:18.63117');
INSERT INTO public.link_module_migrations VALUES (4, 'location_fulfillment_provider', '{"toModel": "fulfillment_provider", "toModule": "fulfillment", "fromModel": "location", "fromModule": "stock_location"}', '2026-06-11 02:26:18.687103');
INSERT INTO public.link_module_migrations VALUES (5, 'location_fulfillment_set', '{"toModel": "fulfillment_set", "toModule": "fulfillment", "fromModel": "location", "fromModule": "stock_location"}', '2026-06-11 02:26:18.767928');
INSERT INTO public.link_module_migrations VALUES (6, 'invite_rbac_role', '{"toModel": "rbac_role", "toModule": "rbac", "fromModel": "invite", "fromModule": "user"}', '2026-06-11 02:26:18.829785');
INSERT INTO public.link_module_migrations VALUES (7, 'order_cart', '{"toModel": "cart", "toModule": "cart", "fromModel": "order", "fromModule": "order"}', '2026-06-11 02:26:18.875334');
INSERT INTO public.link_module_migrations VALUES (8, 'order_fulfillment', '{"toModel": "fulfillments", "toModule": "fulfillment", "fromModel": "order", "fromModule": "order"}', '2026-06-11 02:26:18.930057');
INSERT INTO public.link_module_migrations VALUES (9, 'order_payment_collection', '{"toModel": "payment_collection", "toModule": "payment", "fromModel": "order", "fromModule": "order"}', '2026-06-11 02:26:18.987529');
INSERT INTO public.link_module_migrations VALUES (10, 'order_promotion', '{"toModel": "promotions", "toModule": "promotion", "fromModel": "order", "fromModule": "order"}', '2026-06-11 02:26:19.051666');
INSERT INTO public.link_module_migrations VALUES (11, 'return_fulfillment', '{"toModel": "fulfillments", "toModule": "fulfillment", "fromModel": "return", "fromModule": "order"}', '2026-06-11 02:26:19.150904');
INSERT INTO public.link_module_migrations VALUES (12, 'product_sales_channel', '{"toModel": "sales_channel", "toModule": "sales_channel", "fromModel": "product", "fromModule": "product"}', '2026-06-11 02:26:19.209341');
INSERT INTO public.link_module_migrations VALUES (13, 'product_shipping_profile', '{"toModel": "shipping_profile", "toModule": "fulfillment", "fromModel": "product", "fromModule": "product"}', '2026-06-11 02:26:19.272465');
INSERT INTO public.link_module_migrations VALUES (14, 'product_variant_inventory_item', '{"toModel": "inventory", "toModule": "inventory", "fromModel": "variant", "fromModule": "product"}', '2026-06-11 02:26:19.312344');
INSERT INTO public.link_module_migrations VALUES (15, 'product_variant_price_set', '{"toModel": "price_set", "toModule": "pricing", "fromModel": "variant", "fromModule": "product"}', '2026-06-11 02:26:19.354085');
INSERT INTO public.link_module_migrations VALUES (16, 'publishable_api_key_sales_channel', '{"toModel": "sales_channel", "toModule": "sales_channel", "fromModel": "api_key", "fromModule": "api_key"}', '2026-06-11 02:26:19.392393');
INSERT INTO public.link_module_migrations VALUES (17, 'region_payment_provider', '{"toModel": "payment_provider", "toModule": "payment", "fromModel": "region", "fromModule": "region"}', '2026-06-11 02:26:19.428828');
INSERT INTO public.link_module_migrations VALUES (18, 'sales_channel_stock_location', '{"toModel": "location", "toModule": "stock_location", "fromModel": "sales_channel", "fromModule": "sales_channel"}', '2026-06-11 02:26:19.46492');
INSERT INTO public.link_module_migrations VALUES (19, 'shipping_option_price_set', '{"toModel": "price_set", "toModule": "pricing", "fromModel": "shipping_option", "fromModule": "fulfillment"}', '2026-06-11 02:26:19.505267');
INSERT INTO public.link_module_migrations VALUES (20, 'user_rbac_role', '{"toModel": "rbac_role", "toModule": "rbac", "fromModel": "user", "fromModule": "user"}', '2026-06-11 02:26:19.542112');


--
-- Data for Name: location_fulfillment_provider; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.location_fulfillment_provider VALUES ('sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 'manual_manual', 'locfp_01KTSXRATBQNV922PVKK0ZWRCX', '2026-06-11 02:26:51.21123+03', '2026-06-11 02:26:51.21123+03', NULL);


--
-- Data for Name: location_fulfillment_set; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.location_fulfillment_set VALUES ('sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 'fuset_01KTSXRAVK50TNK77ASNXJJKZN', 'locfs_01KTSXRAX6EM75SH2X16004KHK', '2026-06-11 02:26:51.302281+03', '2026-06-11 02:26:51.302281+03', NULL);


--
-- Data for Name: mikro_orm_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mikro_orm_migrations VALUES (1, 'Migration20240307161216', '2026-06-11 02:25:50.080063+03');
INSERT INTO public.mikro_orm_migrations VALUES (2, 'Migration20241210073813', '2026-06-11 02:25:50.080063+03');
INSERT INTO public.mikro_orm_migrations VALUES (3, 'Migration20250106142624', '2026-06-11 02:25:50.080063+03');
INSERT INTO public.mikro_orm_migrations VALUES (4, 'Migration20250120110820', '2026-06-11 02:25:50.080063+03');
INSERT INTO public.mikro_orm_migrations VALUES (5, 'Migration20240307132720', '2026-06-11 02:25:50.466454+03');
INSERT INTO public.mikro_orm_migrations VALUES (6, 'Migration20240719123015', '2026-06-11 02:25:50.466454+03');
INSERT INTO public.mikro_orm_migrations VALUES (7, 'Migration20241213063611', '2026-06-11 02:25:50.466454+03');
INSERT INTO public.mikro_orm_migrations VALUES (8, 'Migration20251010131115', '2026-06-11 02:25:50.466454+03');
INSERT INTO public.mikro_orm_migrations VALUES (9, 'InitialSetup20240401153642', '2026-06-11 02:25:51.017296+03');
INSERT INTO public.mikro_orm_migrations VALUES (10, 'Migration20240601111544', '2026-06-11 02:25:51.017296+03');
INSERT INTO public.mikro_orm_migrations VALUES (11, 'Migration202408271511', '2026-06-11 02:25:51.017296+03');
INSERT INTO public.mikro_orm_migrations VALUES (12, 'Migration20241122120331', '2026-06-11 02:25:51.017296+03');
INSERT INTO public.mikro_orm_migrations VALUES (13, 'Migration20241125090957', '2026-06-11 02:25:51.017296+03');
INSERT INTO public.mikro_orm_migrations VALUES (14, 'Migration20250411073236', '2026-06-11 02:25:51.017296+03');
INSERT INTO public.mikro_orm_migrations VALUES (15, 'Migration20250516081326', '2026-06-11 02:25:51.017296+03');
INSERT INTO public.mikro_orm_migrations VALUES (16, 'Migration20250910154539', '2026-06-11 02:25:51.017296+03');
INSERT INTO public.mikro_orm_migrations VALUES (17, 'Migration20250911092221', '2026-06-11 02:25:51.017296+03');
INSERT INTO public.mikro_orm_migrations VALUES (18, 'Migration20250929204438', '2026-06-11 02:25:51.017296+03');
INSERT INTO public.mikro_orm_migrations VALUES (19, 'Migration20251008132218', '2026-06-11 02:25:51.017296+03');
INSERT INTO public.mikro_orm_migrations VALUES (20, 'Migration20251011090511', '2026-06-11 02:25:51.017296+03');
INSERT INTO public.mikro_orm_migrations VALUES (21, 'Migration20260224120000', '2026-06-11 02:25:51.017296+03');
INSERT INTO public.mikro_orm_migrations VALUES (22, 'Migration20260301002050', '2026-06-11 02:25:51.017296+03');
INSERT INTO public.mikro_orm_migrations VALUES (23, 'Migration20260306120000', '2026-06-11 02:25:51.017296+03');
INSERT INTO public.mikro_orm_migrations VALUES (24, 'Migration20230929122253', '2026-06-11 02:25:52.690348+03');
INSERT INTO public.mikro_orm_migrations VALUES (25, 'Migration20240322094407', '2026-06-11 02:25:52.690348+03');
INSERT INTO public.mikro_orm_migrations VALUES (26, 'Migration20240322113359', '2026-06-11 02:25:52.690348+03');
INSERT INTO public.mikro_orm_migrations VALUES (27, 'Migration20240322120125', '2026-06-11 02:25:52.690348+03');
INSERT INTO public.mikro_orm_migrations VALUES (28, 'Migration20240626133555', '2026-06-11 02:25:52.690348+03');
INSERT INTO public.mikro_orm_migrations VALUES (29, 'Migration20240704094505', '2026-06-11 02:25:52.690348+03');
INSERT INTO public.mikro_orm_migrations VALUES (30, 'Migration20241127114534', '2026-06-11 02:25:52.690348+03');
INSERT INTO public.mikro_orm_migrations VALUES (31, 'Migration20241127223829', '2026-06-11 02:25:52.690348+03');
INSERT INTO public.mikro_orm_migrations VALUES (32, 'Migration20241128055359', '2026-06-11 02:25:52.690348+03');
INSERT INTO public.mikro_orm_migrations VALUES (33, 'Migration20241212190401', '2026-06-11 02:25:52.690348+03');
INSERT INTO public.mikro_orm_migrations VALUES (34, 'Migration20250408145122', '2026-06-11 02:25:52.690348+03');
INSERT INTO public.mikro_orm_migrations VALUES (35, 'Migration20250409122219', '2026-06-11 02:25:52.690348+03');
INSERT INTO public.mikro_orm_migrations VALUES (36, 'Migration20251009110625', '2026-06-11 02:25:52.690348+03');
INSERT INTO public.mikro_orm_migrations VALUES (37, 'Migration20251112192723', '2026-06-11 02:25:52.690348+03');
INSERT INTO public.mikro_orm_migrations VALUES (38, 'Migration20260429163502', '2026-06-11 02:25:52.690348+03');
INSERT INTO public.mikro_orm_migrations VALUES (39, 'Migration20240227120221', '2026-06-11 02:25:54.128211+03');
INSERT INTO public.mikro_orm_migrations VALUES (40, 'Migration20240617102917', '2026-06-11 02:25:54.128211+03');
INSERT INTO public.mikro_orm_migrations VALUES (41, 'Migration20240624153824', '2026-06-11 02:25:54.128211+03');
INSERT INTO public.mikro_orm_migrations VALUES (42, 'Migration20241211061114', '2026-06-11 02:25:54.128211+03');
INSERT INTO public.mikro_orm_migrations VALUES (43, 'Migration20250113094144', '2026-06-11 02:25:54.128211+03');
INSERT INTO public.mikro_orm_migrations VALUES (44, 'Migration20250120110700', '2026-06-11 02:25:54.128211+03');
INSERT INTO public.mikro_orm_migrations VALUES (45, 'Migration20250226130616', '2026-06-11 02:25:54.128211+03');
INSERT INTO public.mikro_orm_migrations VALUES (46, 'Migration20250508081510', '2026-06-11 02:25:54.128211+03');
INSERT INTO public.mikro_orm_migrations VALUES (47, 'Migration20250828075407', '2026-06-11 02:25:54.128211+03');
INSERT INTO public.mikro_orm_migrations VALUES (48, 'Migration20250909083125', '2026-06-11 02:25:54.128211+03');
INSERT INTO public.mikro_orm_migrations VALUES (49, 'Migration20250916120552', '2026-06-11 02:25:54.128211+03');
INSERT INTO public.mikro_orm_migrations VALUES (50, 'Migration20250917143818', '2026-06-11 02:25:54.128211+03');
INSERT INTO public.mikro_orm_migrations VALUES (51, 'Migration20250919122137', '2026-06-11 02:25:54.128211+03');
INSERT INTO public.mikro_orm_migrations VALUES (52, 'Migration20251006000000', '2026-06-11 02:25:54.128211+03');
INSERT INTO public.mikro_orm_migrations VALUES (53, 'Migration20251015113934', '2026-06-11 02:25:54.128211+03');
INSERT INTO public.mikro_orm_migrations VALUES (54, 'Migration20251107050148', '2026-06-11 02:25:54.128211+03');
INSERT INTO public.mikro_orm_migrations VALUES (55, 'Migration20240124154000', '2026-06-11 02:25:55.276418+03');
INSERT INTO public.mikro_orm_migrations VALUES (56, 'Migration20240524123112', '2026-06-11 02:25:55.276418+03');
INSERT INTO public.mikro_orm_migrations VALUES (57, 'Migration20240602110946', '2026-06-11 02:25:55.276418+03');
INSERT INTO public.mikro_orm_migrations VALUES (58, 'Migration20241211074630', '2026-06-11 02:25:55.276418+03');
INSERT INTO public.mikro_orm_migrations VALUES (59, 'Migration20251010130829', '2026-06-11 02:25:55.276418+03');
INSERT INTO public.mikro_orm_migrations VALUES (60, 'Migration20240115152146', '2026-06-11 02:25:55.850564+03');
INSERT INTO public.mikro_orm_migrations VALUES (61, 'Migration20240222170223', '2026-06-11 02:25:56.199615+03');
INSERT INTO public.mikro_orm_migrations VALUES (62, 'Migration20240831125857', '2026-06-11 02:25:56.199615+03');
INSERT INTO public.mikro_orm_migrations VALUES (63, 'Migration20241106085918', '2026-06-11 02:25:56.199615+03');
INSERT INTO public.mikro_orm_migrations VALUES (64, 'Migration20241205095237', '2026-06-11 02:25:56.199615+03');
INSERT INTO public.mikro_orm_migrations VALUES (65, 'Migration20241216183049', '2026-06-11 02:25:56.199615+03');
INSERT INTO public.mikro_orm_migrations VALUES (66, 'Migration20241218091938', '2026-06-11 02:25:56.199615+03');
INSERT INTO public.mikro_orm_migrations VALUES (67, 'Migration20250120115059', '2026-06-11 02:25:56.199615+03');
INSERT INTO public.mikro_orm_migrations VALUES (68, 'Migration20250212131240', '2026-06-11 02:25:56.199615+03');
INSERT INTO public.mikro_orm_migrations VALUES (69, 'Migration20250326151602', '2026-06-11 02:25:56.199615+03');
INSERT INTO public.mikro_orm_migrations VALUES (70, 'Migration20250508081553', '2026-06-11 02:25:56.199615+03');
INSERT INTO public.mikro_orm_migrations VALUES (71, 'Migration20251017153909', '2026-06-11 02:25:56.199615+03');
INSERT INTO public.mikro_orm_migrations VALUES (72, 'Migration20251208130704', '2026-06-11 02:25:56.199615+03');
INSERT INTO public.mikro_orm_migrations VALUES (73, 'Migration20240205173216', '2026-06-11 02:25:57.166704+03');
INSERT INTO public.mikro_orm_migrations VALUES (74, 'Migration20240624200006', '2026-06-11 02:25:57.166704+03');
INSERT INTO public.mikro_orm_migrations VALUES (75, 'Migration20250120110744', '2026-06-11 02:25:57.166704+03');
INSERT INTO public.mikro_orm_migrations VALUES (76, 'InitialSetup20240221144943', '2026-06-11 02:25:59.873702+03');
INSERT INTO public.mikro_orm_migrations VALUES (77, 'Migration20240604080145', '2026-06-11 02:25:59.873702+03');
INSERT INTO public.mikro_orm_migrations VALUES (78, 'Migration20241205122700', '2026-06-11 02:25:59.873702+03');
INSERT INTO public.mikro_orm_migrations VALUES (79, 'Migration20251015123842', '2026-06-11 02:25:59.873702+03');
INSERT INTO public.mikro_orm_migrations VALUES (80, 'InitialSetup20240227075933', '2026-06-11 02:26:00.438191+03');
INSERT INTO public.mikro_orm_migrations VALUES (81, 'Migration20240621145944', '2026-06-11 02:26:00.438191+03');
INSERT INTO public.mikro_orm_migrations VALUES (82, 'Migration20241206083313', '2026-06-11 02:26:00.438191+03');
INSERT INTO public.mikro_orm_migrations VALUES (83, 'Migration20251202184737', '2026-06-11 02:26:00.438191+03');
INSERT INTO public.mikro_orm_migrations VALUES (84, 'Migration20251212161429', '2026-06-11 02:26:00.438191+03');
INSERT INTO public.mikro_orm_migrations VALUES (85, 'Migration20240227090331', '2026-06-11 02:26:01.158334+03');
INSERT INTO public.mikro_orm_migrations VALUES (86, 'Migration20240710135844', '2026-06-11 02:26:01.158334+03');
INSERT INTO public.mikro_orm_migrations VALUES (87, 'Migration20240924114005', '2026-06-11 02:26:01.158334+03');
INSERT INTO public.mikro_orm_migrations VALUES (88, 'Migration20241212052837', '2026-06-11 02:26:01.158334+03');
INSERT INTO public.mikro_orm_migrations VALUES (89, 'InitialSetup20240228133303', '2026-06-11 02:26:01.956984+03');
INSERT INTO public.mikro_orm_migrations VALUES (90, 'Migration20240624082354', '2026-06-11 02:26:01.956984+03');
INSERT INTO public.mikro_orm_migrations VALUES (91, 'Migration20240225134525', '2026-06-11 02:26:04.419888+03');
INSERT INTO public.mikro_orm_migrations VALUES (92, 'Migration20240806072619', '2026-06-11 02:26:04.419888+03');
INSERT INTO public.mikro_orm_migrations VALUES (93, 'Migration20241211151053', '2026-06-11 02:26:04.419888+03');
INSERT INTO public.mikro_orm_migrations VALUES (94, 'Migration20250115160517', '2026-06-11 02:26:04.419888+03');
INSERT INTO public.mikro_orm_migrations VALUES (95, 'Migration20250120110552', '2026-06-11 02:26:04.419888+03');
INSERT INTO public.mikro_orm_migrations VALUES (96, 'Migration20250123122334', '2026-06-11 02:26:04.419888+03');
INSERT INTO public.mikro_orm_migrations VALUES (97, 'Migration20250206105639', '2026-06-11 02:26:04.419888+03');
INSERT INTO public.mikro_orm_migrations VALUES (98, 'Migration20250207132723', '2026-06-11 02:26:04.419888+03');
INSERT INTO public.mikro_orm_migrations VALUES (99, 'Migration20250625084134', '2026-06-11 02:26:04.419888+03');
INSERT INTO public.mikro_orm_migrations VALUES (100, 'Migration20250924135437', '2026-06-11 02:26:04.419888+03');
INSERT INTO public.mikro_orm_migrations VALUES (101, 'Migration20250929124701', '2026-06-11 02:26:04.419888+03');
INSERT INTO public.mikro_orm_migrations VALUES (102, 'Migration20240219102530', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (103, 'Migration20240604100512', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (104, 'Migration20240715102100', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (105, 'Migration20240715174100', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (106, 'Migration20240716081800', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (107, 'Migration20240801085921', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (108, 'Migration20240821164505', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (109, 'Migration20240821170920', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (110, 'Migration20240827133639', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (111, 'Migration20240902195921', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (112, 'Migration20240913092514', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (113, 'Migration20240930122627', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (114, 'Migration20241014142943', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (115, 'Migration20241106085223', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (116, 'Migration20241129124827', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (117, 'Migration20241217162224', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (118, 'Migration20250326151554', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (119, 'Migration20250522181137', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (120, 'Migration20250702095353', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (121, 'Migration20250704120229', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (122, 'Migration20250910130000', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (123, 'Migration20251016160403', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (124, 'Migration20251016182939', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (125, 'Migration20251017155709', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (126, 'Migration20251114100559', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (127, 'Migration20251125164002', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (128, 'Migration20251210112909', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (129, 'Migration20251210112924', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (130, 'Migration20251225120947', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (131, 'Migration20260106185528', '2026-06-11 02:26:05.867129+03');
INSERT INTO public.mikro_orm_migrations VALUES (132, 'Migration20250717162007', '2026-06-11 02:26:08.660692+03');
INSERT INTO public.mikro_orm_migrations VALUES (133, 'Migration20260127081758', '2026-06-11 02:26:08.660692+03');
INSERT INTO public.mikro_orm_migrations VALUES (134, 'Migration20240205025928', '2026-06-11 02:26:09.447815+03');
INSERT INTO public.mikro_orm_migrations VALUES (135, 'Migration20240529080336', '2026-06-11 02:26:09.447815+03');
INSERT INTO public.mikro_orm_migrations VALUES (136, 'Migration20241202100304', '2026-06-11 02:26:09.447815+03');
INSERT INTO public.mikro_orm_migrations VALUES (137, 'Migration20260514083900', '2026-06-11 02:26:09.447815+03');
INSERT INTO public.mikro_orm_migrations VALUES (138, 'Migration20260525090000', '2026-06-11 02:26:09.447815+03');
INSERT INTO public.mikro_orm_migrations VALUES (139, 'Migration20240214033943', '2026-06-11 02:26:10.489699+03');
INSERT INTO public.mikro_orm_migrations VALUES (140, 'Migration20240703095850', '2026-06-11 02:26:10.489699+03');
INSERT INTO public.mikro_orm_migrations VALUES (141, 'Migration20241202103352', '2026-06-11 02:26:10.489699+03');
INSERT INTO public.mikro_orm_migrations VALUES (142, 'Migration20240311145700_InitialSetupMigration', '2026-06-11 02:26:10.991805+03');
INSERT INTO public.mikro_orm_migrations VALUES (143, 'Migration20240821170957', '2026-06-11 02:26:10.991805+03');
INSERT INTO public.mikro_orm_migrations VALUES (144, 'Migration20240917161003', '2026-06-11 02:26:10.991805+03');
INSERT INTO public.mikro_orm_migrations VALUES (145, 'Migration20241217110416', '2026-06-11 02:26:10.991805+03');
INSERT INTO public.mikro_orm_migrations VALUES (146, 'Migration20250113122235', '2026-06-11 02:26:10.991805+03');
INSERT INTO public.mikro_orm_migrations VALUES (147, 'Migration20250120115002', '2026-06-11 02:26:10.991805+03');
INSERT INTO public.mikro_orm_migrations VALUES (148, 'Migration20250822130931', '2026-06-11 02:26:10.991805+03');
INSERT INTO public.mikro_orm_migrations VALUES (149, 'Migration20250825132614', '2026-06-11 02:26:10.991805+03');
INSERT INTO public.mikro_orm_migrations VALUES (150, 'Migration20251114133146', '2026-06-11 02:26:10.991805+03');
INSERT INTO public.mikro_orm_migrations VALUES (151, 'Migration20240509083918_InitialSetupMigration', '2026-06-11 02:26:12.50167+03');
INSERT INTO public.mikro_orm_migrations VALUES (152, 'Migration20240628075401', '2026-06-11 02:26:12.50167+03');
INSERT INTO public.mikro_orm_migrations VALUES (153, 'Migration20240830094712', '2026-06-11 02:26:12.50167+03');
INSERT INTO public.mikro_orm_migrations VALUES (154, 'Migration20250120110514', '2026-06-11 02:26:12.50167+03');
INSERT INTO public.mikro_orm_migrations VALUES (155, 'Migration20251028172715', '2026-06-11 02:26:12.50167+03');
INSERT INTO public.mikro_orm_migrations VALUES (156, 'Migration20251121123942', '2026-06-11 02:26:12.50167+03');
INSERT INTO public.mikro_orm_migrations VALUES (157, 'Migration20251121150408', '2026-06-11 02:26:12.50167+03');
INSERT INTO public.mikro_orm_migrations VALUES (158, 'Migration20231228143900', '2026-06-11 02:26:13.982008+03');
INSERT INTO public.mikro_orm_migrations VALUES (159, 'Migration20241206101446', '2026-06-11 02:26:13.982008+03');
INSERT INTO public.mikro_orm_migrations VALUES (160, 'Migration20250128174331', '2026-06-11 02:26:13.982008+03');
INSERT INTO public.mikro_orm_migrations VALUES (161, 'Migration20250505092459', '2026-06-11 02:26:13.982008+03');
INSERT INTO public.mikro_orm_migrations VALUES (162, 'Migration20250819104213', '2026-06-11 02:26:13.982008+03');
INSERT INTO public.mikro_orm_migrations VALUES (163, 'Migration20250819110924', '2026-06-11 02:26:13.982008+03');
INSERT INTO public.mikro_orm_migrations VALUES (164, 'Migration20250908080305', '2026-06-11 02:26:13.982008+03');


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: notification_provider; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.notification_provider VALUES ('local', 'local', 'local', true, '{feed}', '2026-06-11 02:26:38.13+03', '2026-06-11 02:26:38.13+03', NULL);


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."order" VALUES ('order_01KTYAMP2XVQCV2G5JV9SC7S7K', 'reg_tr', 2, 'cus_01KTYAMMCJWGMMSZD09MY0T0Y9', 1, 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'pending', false, '5323370081@kapidaodeme.com', 'try', 'ordaddr_01KTYAMP2KTAJASP3GM5J02GY5', 'ordaddr_01KTYAMP2K712VF6VYSFQ8SH0N', false, '{"savings": "398 TL", "full_name": "HAKKI ŞAHİN", "selections": "1. SİYAH - M, 2. BEYAZ - M, 3. KIRMIZI - M", "final_price": "1399 TL", "original_price": "1797 TL", "payment_method": "Kapıda Kredi Kartı", "package_selection": "3 Adet Kampanyası"}', '2026-06-12 19:29:00.905+03', '2026-06-12 19:29:00.905+03', NULL, NULL, NULL, NULL);
INSERT INTO public."order" VALUES ('order_01KTYDC3KW9C1B3ZF632H18A8G', 'reg_tr', 3, 'cus_01KTYAMMCJWGMMSZD09MY0T0Y9', 1, 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'pending', false, '5323370081@kapidaodeme.com', 'try', 'ordaddr_01KTYDC3KT9XXGT3ETP69PYYW0', 'ordaddr_01KTYDC3KTCQ2EVRB2MSR87B46', false, '{"savings": "199 TL", "full_name": "HAKKI ŞAHİN", "selections": "1.  - M, 2.  - L", "final_price": "999 TL", "original_price": "1198 TL", "payment_method": "Kapıda Nakit", "package_selection": "2 Adet Kampanyası"}', '2026-06-12 20:16:45.566+03', '2026-06-12 20:16:45.566+03', NULL, NULL, NULL, NULL);
INSERT INTO public."order" VALUES ('order_01KV1SMH6PB5WWXXBQY11GTFD5', 'reg_tr', 4, 'cus_01KTYAMMCJWGMMSZD09MY0T0Y9', 1, 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'pending', false, '5323370081@kapidaodeme.com', 'try', 'ordaddr_01KV1SMH6MDF75DFYNFKX48WR4', 'ordaddr_01KV1SMH6MJHNJYB6YBBE9GZZM', false, '{"savings": "199 TL", "full_name": "Cizgi Butik", "selections": "1. SİYAH - M, 2. BEYAZ - M", "final_price": "999 TL", "original_price": "1198 TL", "payment_method": "Kapıda Nakit", "package_selection": "2 Adet Kampanyası"}', '2026-06-14 03:48:47.834+03', '2026-06-14 03:48:47.834+03', NULL, NULL, NULL, NULL);
INSERT INTO public."order" VALUES ('order_01KV48DNR0THTHF88NF6ETVKY8', 'reg_tr', 5, 'cus_01KV484EN0DHHPCJKPD827CJPW', 1, 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'pending', false, '905323370081@kapidaodeme.com', 'try', 'ordaddr_01KV48DNQQAYN3NRWG1JHR4M31', 'ordaddr_01KV48DNQPSEVX9PTRGVN06E7D', false, '{"savings": "-802 TL", "full_name": "HAKKI ŞAHİN", "selections": "1. KIRMIZI - M, 2. BEYAZ - XL", "final_price": "2000 TL", "original_price": "1198 TL", "payment_method": "Kapıda Nakit", "package_selection": "2 Adet Kampanyası"}', '2026-06-15 02:45:40.615+03', '2026-06-15 02:45:40.615+03', NULL, NULL, NULL, NULL);
INSERT INTO public."order" VALUES ('order_01KV5NCZF3KHVPNJNAQ6BNV04T', 'reg_tr', 6, 'cus_01KV484EN0DHHPCJKPD827CJPW', 1, 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'pending', false, '905323370081@kapidaodeme.com', 'try', 'ordaddr_01KV5NCZF1764JQANTH44BDJ9K', 'ordaddr_01KV5NCZF1YEJMYZW4T8DX4CDN', false, '{"savings": "-802 TL", "full_name": "HAKKI ŞAHİN", "selections": "1. BEYAZ - L, 2. KIRMIZI - M", "final_price": "2000 TL", "original_price": "1198 TL", "payment_method": "Kapıda Nakit", "package_selection": "2 Adet Kampanyası"}', '2026-06-15 15:51:43.716+03', '2026-06-15 15:51:43.716+03', NULL, NULL, NULL, NULL);
INSERT INTO public."order" VALUES ('order_01KV8NAWADZ1CGMBTM50JF2XAF', 'reg_tr', 7, 'cus_01KV484EN0DHHPCJKPD827CJPW', 1, 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'pending', false, '905323370081@kapidaodeme.com', 'try', 'ordaddr_01KV8NAWA5EJCBR06MN9XA5FZH', 'ordaddr_01KV8NAWA5545GJ4CG063MWSAT', false, '{"savings": "-802 TL", "full_name": "HAKKI ŞAHİN", "selections": "1. BEYAZ - XXL, 2. BEYAZ - XL", "final_price": "2000 TL", "original_price": "1198 TL", "payment_method": "Kapıda Nakit", "package_selection": "2 Adet Kampanyası"}', '2026-06-16 19:48:18.26+03', '2026-06-16 19:48:18.26+03', NULL, NULL, NULL, NULL);
INSERT INTO public."order" VALUES ('order_01KVRJ6MNHJFFVX9EKES3WFQCB', 'reg_01KTSXRAKEE634P20BK48VVW24', 8, 'cus_01KVRJ6MGF8SR85ADEJYQ6ZP0P', 1, 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'draft', true, 'cizgibutiks@gmail.com', 'eur', 'ordaddr_01KVRJ6MNEPZNM50Z1F1MVS5TZ', 'ordaddr_01KVRJ6MNENE6AZGJZW54C7FY1', false, NULL, '2026-06-23 00:01:24.533+03', '2026-06-23 00:01:24.533+03', NULL, NULL, NULL, NULL);
INSERT INTO public."order" VALUES ('order_01KVRJ9TT9018E0VX1EP7FMBD3', 'reg_01KTSXRAKEE634P20BK48VVW24', 9, 'cus_01KVRJ9TQVPVF50YXERRYV9FRX', 1, 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'draft', true, 'ziyaretci@hizlisatis.com', 'eur', 'ordaddr_01KVRJ9TT9Y08DB982NPNVKP7Q', 'ordaddr_01KVRJ9TT8JKH8ENPMF20YD20M', false, NULL, '2026-06-23 00:03:09.13+03', '2026-06-23 00:03:09.13+03', NULL, NULL, NULL, NULL);
INSERT INTO public."order" VALUES ('order_01KVRJXQBC0MEBC79MBYANA1ZK', 'reg_01KTSXRAKEE634P20BK48VVW24', 10, 'cus_01KVRJ6MGF8SR85ADEJYQ6ZP0P', 1, 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'pending', false, 'cizgibutiks@gmail.com', 'eur', 'ordaddr_01KVRJXQBBQZ8XYBAV883ET6TB', 'ordaddr_01KVRJXQBB6WWQVY5JG96S6RX9', false, '{"admin_notes": "2. Siparişi"}', '2026-06-23 00:14:00.941+03', '2026-06-23 00:14:01.259+03', NULL, NULL, NULL, NULL);
INSERT INTO public."order" VALUES ('order_01KTWRRFX38M722VR5B94BFDG5', 'reg_tr', 1, 'cus_01KTWRM4HPPAJXC284QJ0GBE6V', 1, 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'pending', false, 'test_alici@kapidaodeme.com', 'try', 'ordaddr_01KTWRRFWTF2B760WGQWCVQEHV', 'ordaddr_01KTWRRFWT8ZVBS6PS0M7ZCCWK', false, '{"savings": "398 TL", "full_name": "Test Alıcı", "selections": "1. SİYAH / S, 2. SİYAH / S, 3. SİYAH / M", "final_price": "1399 TL", "original_price": "1797 TL", "payment_method": "Kapıda Nakit", "delivery_status": "kargolanan", "package_selection": "3 Adet Kampanyası"}', '2026-06-12 04:57:16.843+03', '2026-06-23 00:15:04.693+03', NULL, NULL, NULL, NULL);


--
-- Data for Name: order_address; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.order_address VALUES ('ordaddr_01KTWRRFWT8ZVBS6PS0M7ZCCWK', NULL, NULL, 'Test', 'Alıcı', 'Test Mahallesi, Deneme Sokak No: 123', NULL, 'İstanbul', 'tr', 'Kadıköy', NULL, '05555555555', NULL, '2026-06-12 04:57:14.941+03', '2026-06-12 04:57:14.941+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KTWRRFWTF2B760WGQWCVQEHV', NULL, NULL, 'Test', 'Alıcı', 'Test Mahallesi, Deneme Sokak No: 123', NULL, 'İstanbul', 'tr', 'Kadıköy', NULL, '05555555555', NULL, '2026-06-12 04:57:14.941+03', '2026-06-12 04:57:14.941+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KTYAMP2K712VF6VYSFQ8SH0N', NULL, NULL, 'HAKKI', 'ŞAHİN', 'dsfsdfsdfsd fasf', NULL, 'İSTANBUL', 'tr', 'GÜNGÖREN', NULL, '(532) 337-0081', NULL, '2026-06-12 19:28:59.176+03', '2026-06-12 19:28:59.176+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KTYAMP2KTAJASP3GM5J02GY5', NULL, NULL, 'HAKKI', 'ŞAHİN', 'dsfsdfsdfsd fasf', NULL, 'İSTANBUL', 'tr', 'GÜNGÖREN', NULL, '(532) 337-0081', NULL, '2026-06-12 19:28:59.176+03', '2026-06-12 19:28:59.176+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KTYDC3KTCQ2EVRB2MSR87B46', NULL, NULL, 'HAKKI', 'ŞAHİN', 'jkjkjkjkhkhkjhkhkhkhjhk', NULL, 'İSTANBUL', 'tr', 'GÜNGÖREN', NULL, '(532) 337-0081', NULL, '2026-06-12 20:16:44.296+03', '2026-06-12 20:16:44.296+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KTYDC3KT9XXGT3ETP69PYYW0', NULL, NULL, 'HAKKI', 'ŞAHİN', 'jkjkjkjkhkhkjhkhkhkhjhk', NULL, 'İSTANBUL', 'tr', 'GÜNGÖREN', NULL, '(532) 337-0081', NULL, '2026-06-12 20:16:44.296+03', '2026-06-12 20:16:44.296+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KV1SMH6MJHNJYB6YBBE9GZZM', NULL, NULL, 'Cizgi', 'Butik', 'SDSD<D<SDSZSDSD', NULL, 'İSTANBUL', 'tr', 'GÜNGÖREN', NULL, '(532) 337-0081', NULL, '2026-06-14 03:48:46.553+03', '2026-06-14 03:48:46.553+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KV1SMH6MDF75DFYNFKX48WR4', NULL, NULL, 'Cizgi', 'Butik', 'SDSD<D<SDSZSDSD', NULL, 'İSTANBUL', 'tr', 'GÜNGÖREN', NULL, '(532) 337-0081', NULL, '2026-06-14 03:48:46.553+03', '2026-06-14 03:48:46.553+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KV48DNQPSEVX9PTRGVN06E7D', NULL, NULL, 'HAKKI', 'ŞAHİN', 'DADSADASDASD', NULL, 'Bayburt', 'tr', 'Merkez', NULL, '+905323370081', NULL, '2026-06-15 02:45:37.963+03', '2026-06-15 02:45:37.963+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KV48DNQQAYN3NRWG1JHR4M31', NULL, NULL, 'HAKKI', 'ŞAHİN', 'DADSADASDASD', NULL, 'Bayburt', 'tr', 'Merkez', NULL, '+905323370081', NULL, '2026-06-15 02:45:37.964+03', '2026-06-15 02:45:37.964+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KV5NCZF1YEJMYZW4T8DX4CDN', NULL, NULL, 'HAKKI', 'ŞAHİN', 'czsczxvxcbxcvxcvxcvxcv', NULL, 'Aksaray', 'tr', 'Güzelyurt', NULL, '+905323370081', NULL, '2026-06-15 15:51:41.991+03', '2026-06-15 15:51:41.991+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KV5NCZF1764JQANTH44BDJ9K', NULL, NULL, 'HAKKI', 'ŞAHİN', 'czsczxvxcbxcvxcvxcvxcv', NULL, 'Aksaray', 'tr', 'Güzelyurt', NULL, '+905323370081', NULL, '2026-06-15 15:51:41.991+03', '2026-06-15 15:51:41.991+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KV8NAWA5545GJ4CG063MWSAT', NULL, NULL, 'HAKKI', 'ŞAHİN', 'fdfdfdfdfddfdf', NULL, 'Amasya', 'tr', 'Merzifon', NULL, '+905323370081', NULL, '2026-06-16 19:48:16.951+03', '2026-06-16 19:48:16.951+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KV8NAWA5EJCBR06MN9XA5FZH', NULL, NULL, 'HAKKI', 'ŞAHİN', 'fdfdfdfdfddfdf', NULL, 'Amasya', 'tr', 'Merzifon', NULL, '+905323370081', NULL, '2026-06-16 19:48:16.951+03', '2026-06-16 19:48:16.951+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KVRJ6MNENE6AZGJZW54C7FY1', NULL, NULL, 'Cizgi Butik', '.', 'lkklklklsaklklsax salksalksalkaslk', NULL, 'BOLU', 'tr', 'GÖYNÜK', NULL, '76676767676', NULL, '2026-06-23 00:01:24.533+03', '2026-06-23 00:01:24.533+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KVRJ6MNEPZNM50Z1F1MVS5TZ', NULL, NULL, 'Cizgi Butik', '.', 'lkklklklsaklklsax salksalksalkaslk', NULL, 'BOLU', 'tr', 'GÖYNÜK', NULL, '76676767676', NULL, '2026-06-23 00:01:24.533+03', '2026-06-23 00:01:24.533+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KVRJ9TT8JKH8ENPMF20YD20M', NULL, NULL, 'HAKKI ŞAHİN', '.', 'DSDLKSDFSDKF DSFKDSFKLDSFLKDSLKKSDLFKSDLF', NULL, 'BOLU', 'tr', 'KIBRISCIK', NULL, '5323370018', NULL, '2026-06-23 00:03:09.13+03', '2026-06-23 00:03:09.13+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KVRJ9TT9Y08DB982NPNVKP7Q', NULL, NULL, 'HAKKI ŞAHİN', '.', 'DSDLKSDFSDKF DSFKDSFKLDSFLKDSLKKSDLFKSDLF', NULL, 'BOLU', 'tr', 'KIBRISCIK', NULL, '5323370018', NULL, '2026-06-23 00:03:09.13+03', '2026-06-23 00:03:09.13+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KVRJXQBB6WWQVY5JG96S6RX9', NULL, NULL, 'Cizgi Butik', '.', 'ESFSDFSDSDFD', NULL, 'ÇANAKKALE', 'tr', 'BAYRAMIÇ', NULL, '45345345435', NULL, '2026-06-23 00:14:00.941+03', '2026-06-23 00:14:00.941+03', NULL);
INSERT INTO public.order_address VALUES ('ordaddr_01KVRJXQBBQZ8XYBAV883ET6TB', NULL, NULL, 'Cizgi Butik', '.', 'ESFSDFSDSDFD', NULL, 'ÇANAKKALE', 'tr', 'BAYRAMIÇ', NULL, '45345345435', NULL, '2026-06-23 00:14:00.941+03', '2026-06-23 00:14:00.941+03', NULL);


--
-- Data for Name: order_cart; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.order_cart VALUES ('order_01KTWRRFX38M722VR5B94BFDG5', 'cart_01KTWRRCV8BQZZC847V8B4S9AK', 'ordercart_01KTWRRG694X13J56C0T5NSA30', '2026-06-12 04:57:17.129063+03', '2026-06-12 04:57:17.129063+03', NULL);
INSERT INTO public.order_cart VALUES ('order_01KTYAMP2XVQCV2G5JV9SC7S7K', 'cart_01KTYAMK286SD1ZFFZSSNQZ2W1', 'ordercart_01KTYAMP828QSZ3MG32CYTTFCP', '2026-06-12 19:29:01.058268+03', '2026-06-12 19:29:01.058268+03', NULL);
INSERT INTO public.order_cart VALUES ('order_01KTYDC3KW9C1B3ZF632H18A8G', 'cart_01KTYDC1TEHT6KCSFT6C85Z7E7', 'ordercart_01KTYDC3PRW5A7CKNPTHRA85EJ', '2026-06-12 20:16:45.655974+03', '2026-06-12 20:16:45.655974+03', NULL);
INSERT INTO public.order_cart VALUES ('order_01KV1SMH6PB5WWXXBQY11GTFD5', 'cart_01KV1SMERMGYCP3DYPTMKGN29N', 'ordercart_01KV1SMHA2SNWR21JJG7C95HFH', '2026-06-14 03:48:47.938162+03', '2026-06-14 03:48:47.938162+03', NULL);
INSERT INTO public.order_cart VALUES ('order_01KV48DNR0THTHF88NF6ETVKY8', 'cart_01KV48DGYACWQRAW2EW42KM2SF', 'ordercart_01KV48DNZQR80RRF1KD63B0MMZ', '2026-06-15 02:45:40.848292+03', '2026-06-15 02:45:40.848292+03', NULL);
INSERT INTO public.order_cart VALUES ('order_01KV5NCZF3KHVPNJNAQ6BNV04T', 'cart_01KV5NCWPXWYV6A4HPEBJM23HD', 'ordercart_01KV5NCZHTR1W6JN527Y19W5M1', '2026-06-15 15:51:43.802737+03', '2026-06-15 15:51:43.802737+03', NULL);
INSERT INTO public.order_cart VALUES ('order_01KV8NAWADZ1CGMBTM50JF2XAF', 'cart_01KV8NAT32TWSS423S5D1G8PTD', 'ordercart_01KV8NAWE984Y3W5EYYBQWKDXA', '2026-06-16 19:48:18.377723+03', '2026-06-16 19:48:18.377723+03', NULL);


--
-- Data for Name: order_change; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.order_change VALUES ('ordch_01KVRJ5QSATWA1M6Y0427VMZBH', 'order_01KTWRRFX38M722VR5B94BFDG5', 1, NULL, 'confirmed', NULL, 'user_01KTSXZN8CW3B3N2HBTZN0S85S', NULL, NULL, 'user_01KTSXZN8CW3B3N2HBTZN0S85S', '2026-06-23 00:00:54.951+03', NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-23 00:00:54.954+03', '2026-06-23 00:00:54.954+03', 'update_order', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.order_change VALUES ('ordch_01KVRJZNM5BN05Q0V2266AZAGE', 'order_01KTWRRFX38M722VR5B94BFDG5', 1, NULL, 'confirmed', NULL, 'user_01KTSXZN8CW3B3N2HBTZN0S85S', NULL, NULL, 'user_01KTSXZN8CW3B3N2HBTZN0S85S', '2026-06-23 00:15:04.708+03', NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-23 00:15:04.71+03', '2026-06-23 00:15:04.71+03', 'update_order', NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: order_change_action; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.order_change_action VALUES ('ordchact_01KVRJ5QSA30C2RV2KFN4H49ZE', 'order_01KTWRRFX38M722VR5B94BFDG5', 1, 1, 'ordch_01KVRJ5QSATWA1M6Y0427VMZBH', NULL, NULL, 'UPDATE_ORDER_PROPERTIES', '{"new": {"delivery_status": "hazirlanan"}, "old": {"savings": "398 TL", "full_name": "Test Alıcı", "selections": "1. SİYAH / S, 2. SİYAH / S, 3. SİYAH / M", "final_price": "1399 TL", "original_price": "1797 TL", "payment_method": "Kapıda Nakit", "package_selection": "3 Adet Kampanyası"}, "type": "metadata"}', NULL, NULL, NULL, true, '2026-06-23 00:00:54.955+03', '2026-06-23 00:00:54.955+03', NULL, NULL, NULL, NULL);
INSERT INTO public.order_change_action VALUES ('ordchact_01KVRJZNM5CJPWE6QQDFC524DP', 'order_01KTWRRFX38M722VR5B94BFDG5', 1, 2, 'ordch_01KVRJZNM5BN05Q0V2266AZAGE', NULL, NULL, 'UPDATE_ORDER_PROPERTIES', '{"new": {"delivery_status": "kargolanan"}, "old": {"savings": "398 TL", "full_name": "Test Alıcı", "selections": "1. SİYAH / S, 2. SİYAH / S, 3. SİYAH / M", "final_price": "1399 TL", "original_price": "1797 TL", "payment_method": "Kapıda Nakit", "delivery_status": "hazirlanan", "package_selection": "3 Adet Kampanyası"}, "type": "metadata"}', NULL, NULL, NULL, true, '2026-06-23 00:15:04.71+03', '2026-06-23 00:15:04.71+03', NULL, NULL, NULL, NULL);


--
-- Data for Name: order_claim; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: order_claim_item; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: order_claim_item_image; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: order_credit_line; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: order_exchange; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: order_exchange_item; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: order_fulfillment; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.order_item VALUES ('orditem_01KTWRRFX8AVAY6X31NC008EGC', 'order_01KTWRRFX38M722VR5B94BFDG5', 1, 'ordli_01KTWRRFX6YW92GQQA1Z24TVAY', 2, '{"value": "2", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '{}', '2026-06-12 04:57:16.844+03', '2026-06-12 04:57:16.844+03', NULL, 0, '{"value": "0", "precision": 20}', NULL, NULL, NULL, NULL);
INSERT INTO public.order_item VALUES ('orditem_01KTWRRFX9N9HDEHN1T8F4F74V', 'order_01KTWRRFX38M722VR5B94BFDG5', 1, 'ordli_01KTWRRFX6FTGWCSNZ7Z6AJF3W', 1, '{"value": "1", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '{}', '2026-06-12 04:57:16.846+03', '2026-06-12 04:57:16.846+03', NULL, 0, '{"value": "0", "precision": 20}', NULL, NULL, NULL, NULL);
INSERT INTO public.order_item VALUES ('orditem_01KTYAMP36Q4NDP1BCRVSEY7F6', 'order_01KTYAMP2XVQCV2G5JV9SC7S7K', 1, 'ordli_01KTYAMP32QBB522C2XKHGE692', 1, '{"value": "1", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '{}', '2026-06-12 19:29:00.906+03', '2026-06-12 19:29:00.906+03', NULL, 0, '{"value": "0", "precision": 20}', NULL, NULL, NULL, NULL);
INSERT INTO public.order_item VALUES ('orditem_01KTYAMP37MPSBHFAPPD6CJKT0', 'order_01KTYAMP2XVQCV2G5JV9SC7S7K', 1, 'ordli_01KTYAMP33RPR9V9AFK6NR93DS', 1, '{"value": "1", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '{}', '2026-06-12 19:29:00.907+03', '2026-06-12 19:29:00.907+03', NULL, 0, '{"value": "0", "precision": 20}', NULL, NULL, NULL, NULL);
INSERT INTO public.order_item VALUES ('orditem_01KTYAMP37PRHKVPCXS4P3YFPN', 'order_01KTYAMP2XVQCV2G5JV9SC7S7K', 1, 'ordli_01KTYAMP333XY9HCQR651P0W3A', 1, '{"value": "1", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '{}', '2026-06-12 19:29:00.907+03', '2026-06-12 19:29:00.907+03', NULL, 0, '{"value": "0", "precision": 20}', NULL, NULL, NULL, NULL);
INSERT INTO public.order_item VALUES ('orditem_01KTYDC3KYB01QCJ30RSPVH478', 'order_01KTYDC3KW9C1B3ZF632H18A8G', 1, 'ordli_01KTYDC3KXF5BGNZNXZG4FJN00', 2, '{"value": "2", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '{}', '2026-06-12 20:16:45.567+03', '2026-06-12 20:16:45.567+03', NULL, 0, '{"value": "0", "precision": 20}', NULL, NULL, NULL, NULL);
INSERT INTO public.order_item VALUES ('orditem_01KV1SMH6SYFA7W5EQRW76JWBH', 'order_01KV1SMH6PB5WWXXBQY11GTFD5', 1, 'ordli_01KV1SMH6QMV8J8Z0J43R5EM26', 1, '{"value": "1", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '{}', '2026-06-14 03:48:47.834+03', '2026-06-14 03:48:47.834+03', NULL, 0, '{"value": "0", "precision": 20}', NULL, NULL, NULL, NULL);
INSERT INTO public.order_item VALUES ('orditem_01KV1SMH6SDEXETBRMTS72M6B3', 'order_01KV1SMH6PB5WWXXBQY11GTFD5', 1, 'ordli_01KV1SMH6RNDXXCEK1EK0YJY05', 1, '{"value": "1", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '{}', '2026-06-14 03:48:47.834+03', '2026-06-14 03:48:47.834+03', NULL, 0, '{"value": "0", "precision": 20}', NULL, NULL, NULL, NULL);
INSERT INTO public.order_item VALUES ('orditem_01KV48DNR5B7Y0TE6QGWF7JNKM', 'order_01KV48DNR0THTHF88NF6ETVKY8', 1, 'ordli_01KV48DNR38XZTXHX1J6FV50ME', 1, '{"value": "1", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '{}', '2026-06-15 02:45:40.616+03', '2026-06-15 02:45:40.616+03', NULL, 0, '{"value": "0", "precision": 20}', NULL, NULL, NULL, NULL);
INSERT INTO public.order_item VALUES ('orditem_01KV48DNR6WHK3MX41K34VDXZD', 'order_01KV48DNR0THTHF88NF6ETVKY8', 1, 'ordli_01KV48DNR3NR7SRB0M8KP5WT6F', 1, '{"value": "1", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '{}', '2026-06-15 02:45:40.616+03', '2026-06-15 02:45:40.616+03', NULL, 0, '{"value": "0", "precision": 20}', NULL, NULL, NULL, NULL);
INSERT INTO public.order_item VALUES ('orditem_01KV5NCZF3GPCNVTW8SSSKF7X6', 'order_01KV5NCZF3KHVPNJNAQ6BNV04T', 1, 'ordli_01KV5NCZF3ZC5SBKSAEMJXHB6J', 1, '{"value": "1", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '{}', '2026-06-15 15:51:43.716+03', '2026-06-15 15:51:43.716+03', NULL, 0, '{"value": "0", "precision": 20}', NULL, NULL, NULL, NULL);
INSERT INTO public.order_item VALUES ('orditem_01KV5NCZF496NY1EP2SN31WGKM', 'order_01KV5NCZF3KHVPNJNAQ6BNV04T', 1, 'ordli_01KV5NCZF376QWFN8Z0JDBGVH0', 1, '{"value": "1", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '{}', '2026-06-15 15:51:43.716+03', '2026-06-15 15:51:43.716+03', NULL, 0, '{"value": "0", "precision": 20}', NULL, NULL, NULL, NULL);
INSERT INTO public.order_item VALUES ('orditem_01KV8NAWAJS6D8QJN8FV28DA4Y', 'order_01KV8NAWADZ1CGMBTM50JF2XAF', 1, 'ordli_01KV8NAWAFC3MHXEG9STT3KJMZ', 1, '{"value": "1", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '{}', '2026-06-16 19:48:18.261+03', '2026-06-16 19:48:18.261+03', NULL, 0, '{"value": "0", "precision": 20}', NULL, NULL, NULL, NULL);
INSERT INTO public.order_item VALUES ('orditem_01KV8NAWAK91HE923XH5F26F4S', 'order_01KV8NAWADZ1CGMBTM50JF2XAF', 1, 'ordli_01KV8NAWAGHXTPF2B366BX8E8N', 1, '{"value": "1", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '{}', '2026-06-16 19:48:18.262+03', '2026-06-16 19:48:18.262+03', NULL, 0, '{"value": "0", "precision": 20}', NULL, NULL, NULL, NULL);
INSERT INTO public.order_item VALUES ('orditem_01KVRJ6MNM2BARN8WFCVST71FB', 'order_01KVRJ6MNHJFFVX9EKES3WFQCB', 1, 'ordli_01KVRJ6MNJ1T40CTRHC1AE8JCB', 1, '{"value": "1", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '{}', '2026-06-23 00:01:24.533+03', '2026-06-23 00:01:24.533+03', NULL, 0, '{"value": "0", "precision": 20}', NULL, NULL, NULL, NULL);
INSERT INTO public.order_item VALUES ('orditem_01KVRJ9TTASEW515TRH5C8F45R', 'order_01KVRJ9TT9018E0VX1EP7FMBD3', 1, 'ordli_01KVRJ9TTA1X8KHREFFZE5BCFR', 1, '{"value": "1", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '{}', '2026-06-23 00:03:09.131+03', '2026-06-23 00:03:09.131+03', NULL, 0, '{"value": "0", "precision": 20}', NULL, NULL, NULL, NULL);
INSERT INTO public.order_item VALUES ('orditem_01KVRJXQBDJB382Z5MWYN1HNQH', 'order_01KVRJXQBC0MEBC79MBYANA1ZK', 1, 'ordli_01KVRJXQBDBXGTRD2TN51FQXA3', 1, '{"value": "1", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '{}', '2026-06-23 00:14:00.941+03', '2026-06-23 00:14:00.941+03', NULL, 0, '{"value": "0", "precision": 20}', NULL, NULL, NULL, NULL);


--
-- Data for Name: order_line_item; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.order_line_item VALUES ('ordli_01KTWRRFX6YW92GQQA1Z24TVAY', NULL, 'Türkiye Milli Takım Tshirt', 'SİYAH / S', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 'variant_01KTWQBSF6QS6HG8VQPH1TH5PJ', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-SİYAH-S', NULL, 'SİYAH / S', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 04:57:16.844+03', '2026-06-12 04:57:16.844+03', NULL, false, NULL, false);
INSERT INTO public.order_line_item VALUES ('ordli_01KTWRRFX6FTGWCSNZ7Z6AJF3W', NULL, 'Türkiye Milli Takım Tshirt', 'SİYAH / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 'variant_01KTWQBSR3DTDCWMY5RC6PJZRR', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-SİYAH-M', NULL, 'SİYAH / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 04:57:16.844+03', '2026-06-12 04:57:16.844+03', NULL, false, NULL, false);
INSERT INTO public.order_line_item VALUES ('ordli_01KTYAMP32QBB522C2XKHGE692', NULL, 'Türkiye Milli Takım Tshirt', 'SİYAH / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 'variant_01KTWQBSR3DTDCWMY5RC6PJZRR', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-SİYAH-M', NULL, 'SİYAH / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 19:29:00.906+03', '2026-06-12 19:29:00.906+03', NULL, false, NULL, false);
INSERT INTO public.order_line_item VALUES ('ordli_01KTYAMP33RPR9V9AFK6NR93DS', NULL, 'Türkiye Milli Takım Tshirt', 'BEYAZ / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 'variant_01KTWQBTSRFMQBWRJDQJM6FG94', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-BEYAZ-M', NULL, 'BEYAZ / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 19:29:00.906+03', '2026-06-12 19:29:00.906+03', NULL, false, NULL, false);
INSERT INTO public.order_line_item VALUES ('ordli_01KTYAMP333XY9HCQR651P0W3A', NULL, 'Türkiye Milli Takım Tshirt', 'KIRMIZI / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 'variant_01KTWQBVZEX916PGDA851QTEZ6', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-KIRMIZI-M', NULL, 'KIRMIZI / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 19:29:00.906+03', '2026-06-12 19:29:00.906+03', NULL, false, NULL, false);
INSERT INTO public.order_line_item VALUES ('ordli_01KTYDC3KXF5BGNZNXZG4FJN00', NULL, 'Türkiye Milli Takım Tshirt', 'SİYAH / S', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 'variant_01KTWQBSF6QS6HG8VQPH1TH5PJ', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-SİYAH-S', NULL, 'SİYAH / S', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-12 20:16:45.567+03', '2026-06-12 20:16:45.567+03', NULL, false, NULL, false);
INSERT INTO public.order_line_item VALUES ('ordli_01KV1SMH6QMV8J8Z0J43R5EM26', NULL, 'Türkiye Milli Takım Tshirt', 'SİYAH / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 'variant_01KTWQBSR3DTDCWMY5RC6PJZRR', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-SİYAH-M', NULL, 'SİYAH / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-14 03:48:47.834+03', '2026-06-14 03:48:47.834+03', NULL, false, NULL, false);
INSERT INTO public.order_line_item VALUES ('ordli_01KV1SMH6RNDXXCEK1EK0YJY05', NULL, 'Türkiye Milli Takım Tshirt', 'BEYAZ / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 'variant_01KTWQBTSRFMQBWRJDQJM6FG94', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-BEYAZ-M', NULL, 'BEYAZ / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-14 03:48:47.834+03', '2026-06-14 03:48:47.834+03', NULL, false, NULL, false);
INSERT INTO public.order_line_item VALUES ('ordli_01KV48DNR38XZTXHX1J6FV50ME', NULL, 'Türkiye Milli Takım Bisiklet Yaka Tshirt', 'KIRMIZI / M', 'http://localhost:8001/uploads/1781402593396-ChatGPTImage14Haz202604_27_05.png', 'variant_01KV22EPBJTYXS1HAY5BK2B2QP', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', '', NULL, NULL, NULL, 'turkiye-milli-takim-bisiklet-yaka-tshirt', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-M', NULL, 'KIRMIZI / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-15 02:45:40.615+03', '2026-06-15 02:45:40.615+03', NULL, false, NULL, false);
INSERT INTO public.order_line_item VALUES ('ordli_01KV48DNR3NR7SRB0M8KP5WT6F', NULL, 'Türkiye Milli Takım Bisiklet Yaka Tshirt', 'BEYAZ / XL', 'http://localhost:8001/uploads/1781402593396-ChatGPTImage14Haz202604_27_05.png', 'variant_01KV22EQMTZJKSDN9YDK00S8S7', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', '', NULL, NULL, NULL, 'turkiye-milli-takim-bisiklet-yaka-tshirt', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-XL', NULL, 'BEYAZ / XL', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-15 02:45:40.615+03', '2026-06-15 02:45:40.615+03', NULL, false, NULL, false);
INSERT INTO public.order_line_item VALUES ('ordli_01KV5NCZF3ZC5SBKSAEMJXHB6J', NULL, 'Türkiye Milli Takım Bisiklet Yaka Tshirt', 'BEYAZ / L', 'http://localhost:8001/uploads/1781402593396-ChatGPTImage14Haz202604_27_05.png', 'variant_01KV22EQBHPXC304YQGCZG3HNP', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', '', NULL, NULL, NULL, 'turkiye-milli-takim-bisiklet-yaka-tshirt', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-L', NULL, 'BEYAZ / L', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-15 15:51:43.716+03', '2026-06-15 15:51:43.716+03', NULL, false, NULL, false);
INSERT INTO public.order_line_item VALUES ('ordli_01KV5NCZF376QWFN8Z0JDBGVH0', NULL, 'Türkiye Milli Takım Bisiklet Yaka Tshirt', 'KIRMIZI / M', 'http://localhost:8001/uploads/1781402593396-ChatGPTImage14Haz202604_27_05.png', 'variant_01KV22EPBJTYXS1HAY5BK2B2QP', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', '', NULL, NULL, NULL, 'turkiye-milli-takim-bisiklet-yaka-tshirt', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-M', NULL, 'KIRMIZI / M', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-15 15:51:43.716+03', '2026-06-15 15:51:43.716+03', NULL, false, NULL, false);
INSERT INTO public.order_line_item VALUES ('ordli_01KV8NAWAFC3MHXEG9STT3KJMZ', NULL, 'Türkiye Milli Takım Bisiklet Yaka Tshirt', 'BEYAZ / XXL', 'http://localhost:8001/uploads/1781402593396-ChatGPTImage14Haz202604_27_05.png', 'variant_01KV22EQVZTZDYQSZNDCXW3PWN', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', '', NULL, NULL, NULL, 'turkiye-milli-takim-bisiklet-yaka-tshirt', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-XXL', NULL, 'BEYAZ / XXL', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-16 19:48:18.26+03', '2026-06-16 19:48:18.26+03', NULL, false, NULL, false);
INSERT INTO public.order_line_item VALUES ('ordli_01KV8NAWAGHXTPF2B366BX8E8N', NULL, 'Türkiye Milli Takım Bisiklet Yaka Tshirt', 'BEYAZ / XL', 'http://localhost:8001/uploads/1781402593396-ChatGPTImage14Haz202604_27_05.png', 'variant_01KV22EQMTZJKSDN9YDK00S8S7', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', '', NULL, NULL, NULL, 'turkiye-milli-takim-bisiklet-yaka-tshirt', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-XL', NULL, 'BEYAZ / XL', NULL, true, true, false, 220000, '{"value": "220000", "precision": 20}', 120000, '{"value": "120000", "precision": 20}', '{}', '2026-06-16 19:48:18.261+03', '2026-06-16 19:48:18.261+03', NULL, false, NULL, false);
INSERT INTO public.order_line_item VALUES ('ordli_01KVRJ6MNJ1T40CTRHC1AE8JCB', NULL, 'Türkiye Milli Takım Tshirt', 'BEYAZ / M', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 'variant_01KTWQBTSRFMQBWRJDQJM6FG94', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-BEYAZ-M', NULL, 'BEYAZ / M', NULL, true, true, false, NULL, NULL, 220000, '{"value": "220000", "precision": 20}', '{}', '2026-06-23 00:01:24.533+03', '2026-06-23 00:01:24.533+03', NULL, true, NULL, false);
INSERT INTO public.order_line_item VALUES ('ordli_01KVRJ9TTA1X8KHREFFZE5BCFR', NULL, 'Türkiye Milli Takım Bisiklet Yaka Tshirt', 'BEYAZ / L', 'http://localhost:8001/uploads/1781402593396-ChatGPTImage14Haz202604_27_05.png', 'variant_01KV22EQBHPXC304YQGCZG3HNP', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', '', NULL, NULL, NULL, 'turkiye-milli-takim-bisiklet-yaka-tshirt', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-L', NULL, 'BEYAZ / L', NULL, true, true, false, NULL, NULL, 220000, '{"value": "220000", "precision": 20}', '{}', '2026-06-23 00:03:09.13+03', '2026-06-23 00:03:09.13+03', NULL, true, NULL, false);
INSERT INTO public.order_line_item VALUES ('ordli_01KVRJXQBDBXGTRD2TN51FQXA3', NULL, 'Türkiye Milli Takım Tshirt', 'BEYAZ / L', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', 'variant_01KTWQBV4ANMXQKEJS4KR26CYW', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'Şortlu Takım', 'Ferah ve Rhat', NULL, NULL, 'turkiye-milli-takim-tshirt', 'ORTLU-TAKM-BEYAZ-L', NULL, 'BEYAZ / L', NULL, true, true, false, NULL, NULL, 220000, '{"value": "220000", "precision": 20}', '{}', '2026-06-23 00:14:00.941+03', '2026-06-23 00:14:00.941+03', NULL, true, NULL, false);


--
-- Data for Name: order_line_item_adjustment; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: order_line_item_tax_line; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: order_payment_collection; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.order_payment_collection VALUES ('order_01KTWRRFX38M722VR5B94BFDG5', 'pay_col_01KTWRRFH72RHHPVKB6J09K32X', 'ordpay_01KTWRRG6RYW3DAJ0RXA28V1DY', '2026-06-12 04:57:17.129201+03', '2026-06-12 04:57:17.129201+03', NULL);
INSERT INTO public.order_payment_collection VALUES ('order_01KTYAMP2XVQCV2G5JV9SC7S7K', 'pay_col_01KTYAMNRT2GAXAQR7BB8JCNZV', 'ordpay_01KTYAMP84J6YYBYJARZ4Z7GXZ', '2026-06-12 19:29:01.058366+03', '2026-06-12 19:29:01.058366+03', NULL);
INSERT INTO public.order_payment_collection VALUES ('order_01KTYDC3KW9C1B3ZF632H18A8G', 'pay_col_01KTYDC3D14J72950CRJ98RNQV', 'ordpay_01KTYDC3PVJZ1R95VZXND6DMXW', '2026-06-12 20:16:45.65606+03', '2026-06-12 20:16:45.65606+03', NULL);
INSERT INTO public.order_payment_collection VALUES ('order_01KV1SMH6PB5WWXXBQY11GTFD5', 'pay_col_01KV1SMH0B8R2JG2H4SV4S34ZK', 'ordpay_01KV1SMHA45TMN1C3G01RG01EA', '2026-06-14 03:48:47.938264+03', '2026-06-14 03:48:47.938264+03', NULL);
INSERT INTO public.order_payment_collection VALUES ('order_01KV48DNR0THTHF88NF6ETVKY8', 'pay_col_01KV48DNCG5FCDE5WRA8QR9D8A', 'ordpay_01KV48DNZZ5XD8MJAFNRJ9WT8B', '2026-06-15 02:45:40.848424+03', '2026-06-15 02:45:40.848424+03', NULL);
INSERT INTO public.order_payment_collection VALUES ('order_01KV5NCZF3KHVPNJNAQ6BNV04T', 'pay_col_01KV5NCZ93Y88Q5330YMM5X1DB', 'ordpay_01KV5NCZHZYXZG08ZB7AC9GF4Y', '2026-06-15 15:51:43.8028+03', '2026-06-15 15:51:43.8028+03', NULL);
INSERT INTO public.order_payment_collection VALUES ('order_01KV8NAWADZ1CGMBTM50JF2XAF', 'pay_col_01KV8NAW2CM1TE9Q7X150RRGSE', 'ordpay_01KV8NAWEHBPH872M274PRKJDJ', '2026-06-16 19:48:18.377828+03', '2026-06-16 19:48:18.377828+03', NULL);


--
-- Data for Name: order_promotion; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: order_shipping; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.order_shipping VALUES ('ordspmv_01KTWRRFX2DQFJF38PHY10ND04', 'order_01KTWRRFX38M722VR5B94BFDG5', 1, 'ordsm_01KTWRRFX2NHJMWJMDRZR6QR7E', '2026-06-12 04:57:16.847+03', '2026-06-12 04:57:16.847+03', NULL, NULL, NULL, NULL);
INSERT INTO public.order_shipping VALUES ('ordspmv_01KTYAMP2XA9VDKB4S9F2TPAEX', 'order_01KTYAMP2XVQCV2G5JV9SC7S7K', 1, 'ordsm_01KTYAMP2XE2QJEYAFV7NDMHYB', '2026-06-12 19:29:00.908+03', '2026-06-12 19:29:00.908+03', NULL, NULL, NULL, NULL);
INSERT INTO public.order_shipping VALUES ('ordspmv_01KTYDC3KVQGS2G3T641HV9T9G', 'order_01KTYDC3KW9C1B3ZF632H18A8G', 1, 'ordsm_01KTYDC3KVDESFETQMDYC5TWZP', '2026-06-12 20:16:45.567+03', '2026-06-12 20:16:45.567+03', NULL, NULL, NULL, NULL);
INSERT INTO public.order_shipping VALUES ('ordspmv_01KV1SMH6PAQMNZ0E2FXQCPHJ4', 'order_01KV1SMH6PB5WWXXBQY11GTFD5', 1, 'ordsm_01KV1SMH6PEH0K8KF4ZV5WC3SG', '2026-06-14 03:48:47.835+03', '2026-06-14 03:48:47.835+03', NULL, NULL, NULL, NULL);
INSERT INTO public.order_shipping VALUES ('ordspmv_01KV48DNQZ0P5G2ZCET3JRY9JE', 'order_01KV48DNR0THTHF88NF6ETVKY8', 1, 'ordsm_01KV48DNQZBERT36NY5A68G6SJ', '2026-06-15 02:45:40.617+03', '2026-06-15 02:45:40.617+03', NULL, NULL, NULL, NULL);
INSERT INTO public.order_shipping VALUES ('ordspmv_01KV5NCZF2W562B58KHRCJ5HXT', 'order_01KV5NCZF3KHVPNJNAQ6BNV04T', 1, 'ordsm_01KV5NCZF2D7EBRQHRTP97VSPY', '2026-06-15 15:51:43.716+03', '2026-06-15 15:51:43.716+03', NULL, NULL, NULL, NULL);
INSERT INTO public.order_shipping VALUES ('ordspmv_01KV8NAWACYTFS6C2XF3X4F8M5', 'order_01KV8NAWADZ1CGMBTM50JF2XAF', 1, 'ordsm_01KV8NAWACYAHMVR0NETC23JGN', '2026-06-16 19:48:18.262+03', '2026-06-16 19:48:18.262+03', NULL, NULL, NULL, NULL);


--
-- Data for Name: order_shipping_method; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.order_shipping_method VALUES ('ordsm_01KTWRRFX2NHJMWJMDRZR6QR7E', 'Standard Shipping', NULL, 0, '{"value": "0", "precision": 20}', false, 'so_01KTSXRB0Q7VGVK082FMXJJ0PZ', '{}', NULL, '2026-06-12 04:57:16.847+03', '2026-06-12 04:57:16.847+03', NULL, false);
INSERT INTO public.order_shipping_method VALUES ('ordsm_01KTYAMP2XE2QJEYAFV7NDMHYB', 'Standard Shipping', NULL, 0, '{"value": "0", "precision": 20}', false, 'so_01KTSXRB0Q7VGVK082FMXJJ0PZ', '{}', NULL, '2026-06-12 19:29:00.907+03', '2026-06-12 19:29:00.908+03', NULL, false);
INSERT INTO public.order_shipping_method VALUES ('ordsm_01KTYDC3KVDESFETQMDYC5TWZP', 'Standard Shipping', NULL, 0, '{"value": "0", "precision": 20}', false, 'so_01KTSXRB0Q7VGVK082FMXJJ0PZ', '{}', NULL, '2026-06-12 20:16:45.567+03', '2026-06-12 20:16:45.567+03', NULL, false);
INSERT INTO public.order_shipping_method VALUES ('ordsm_01KV1SMH6PEH0K8KF4ZV5WC3SG', 'Standard Shipping', NULL, 0, '{"value": "0", "precision": 20}', false, 'so_01KTSXRB0Q7VGVK082FMXJJ0PZ', '{}', NULL, '2026-06-14 03:48:47.835+03', '2026-06-14 03:48:47.835+03', NULL, false);
INSERT INTO public.order_shipping_method VALUES ('ordsm_01KV48DNQZBERT36NY5A68G6SJ', 'Standard Shipping', NULL, 0, '{"value": "0", "precision": 20}', false, 'so_01KTSXRB0Q7VGVK082FMXJJ0PZ', '{}', NULL, '2026-06-15 02:45:40.617+03', '2026-06-15 02:45:40.617+03', NULL, false);
INSERT INTO public.order_shipping_method VALUES ('ordsm_01KV5NCZF2D7EBRQHRTP97VSPY', 'Standard Shipping', NULL, 0, '{"value": "0", "precision": 20}', false, 'so_01KTSXRB0Q7VGVK082FMXJJ0PZ', '{}', NULL, '2026-06-15 15:51:43.716+03', '2026-06-15 15:51:43.716+03', NULL, false);
INSERT INTO public.order_shipping_method VALUES ('ordsm_01KV8NAWACYAHMVR0NETC23JGN', 'Standard Shipping', NULL, 0, '{"value": "0", "precision": 20}', false, 'so_01KTSXRB0Q7VGVK082FMXJJ0PZ', '{}', NULL, '2026-06-16 19:48:18.262+03', '2026-06-16 19:48:18.262+03', NULL, false);


--
-- Data for Name: order_shipping_method_adjustment; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: order_shipping_method_tax_line; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: order_summary; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.order_summary VALUES ('ordsum_01KTWRRFX03B01RWED61MKTPE3', 'order_01KTWRRFX38M722VR5B94BFDG5', 1, '{"paid_total": 0, "raw_paid_total": {"value": "0", "precision": 20}, "refunded_total": 0, "accounting_total": 360000, "credit_line_total": 0, "transaction_total": 0, "pending_difference": 360000, "raw_refunded_total": {"value": "0", "precision": 20}, "current_order_total": 360000, "original_order_total": 360000, "raw_accounting_total": {"value": "360000", "precision": 20}, "raw_credit_line_total": {"value": "0", "precision": 20}, "raw_transaction_total": {"value": "0", "precision": 20}, "raw_pending_difference": {"value": "360000", "precision": 20}, "raw_current_order_total": {"value": "360000", "precision": 20}, "raw_original_order_total": {"value": "360000", "precision": 20}}', '2026-06-12 04:57:16.846+03', '2026-06-12 04:57:16.846+03', NULL);
INSERT INTO public.order_summary VALUES ('ordsum_01KTYAMP2TM0AE0VTY5DVZ6GA5', 'order_01KTYAMP2XVQCV2G5JV9SC7S7K', 1, '{"paid_total": 0, "raw_paid_total": {"value": "0", "precision": 20}, "refunded_total": 0, "accounting_total": 360000, "credit_line_total": 0, "transaction_total": 0, "pending_difference": 360000, "raw_refunded_total": {"value": "0", "precision": 20}, "current_order_total": 360000, "original_order_total": 360000, "raw_accounting_total": {"value": "360000", "precision": 20}, "raw_credit_line_total": {"value": "0", "precision": 20}, "raw_transaction_total": {"value": "0", "precision": 20}, "raw_pending_difference": {"value": "360000", "precision": 20}, "raw_current_order_total": {"value": "360000", "precision": 20}, "raw_original_order_total": {"value": "360000", "precision": 20}}', '2026-06-12 19:29:00.907+03', '2026-06-12 19:29:00.907+03', NULL);
INSERT INTO public.order_summary VALUES ('ordsum_01KTYDC3KV25861SPXK52BQFH1', 'order_01KTYDC3KW9C1B3ZF632H18A8G', 1, '{"paid_total": 0, "raw_paid_total": {"value": "0", "precision": 20}, "refunded_total": 0, "accounting_total": 240000, "credit_line_total": 0, "transaction_total": 0, "pending_difference": 240000, "raw_refunded_total": {"value": "0", "precision": 20}, "current_order_total": 240000, "original_order_total": 240000, "raw_accounting_total": {"value": "240000", "precision": 20}, "raw_credit_line_total": {"value": "0", "precision": 20}, "raw_transaction_total": {"value": "0", "precision": 20}, "raw_pending_difference": {"value": "240000", "precision": 20}, "raw_current_order_total": {"value": "240000", "precision": 20}, "raw_original_order_total": {"value": "240000", "precision": 20}}', '2026-06-12 20:16:45.567+03', '2026-06-12 20:16:45.567+03', NULL);
INSERT INTO public.order_summary VALUES ('ordsum_01KV1SMH6N1D8KSWXB3SBR4464', 'order_01KV1SMH6PB5WWXXBQY11GTFD5', 1, '{"paid_total": 0, "raw_paid_total": {"value": "0", "precision": 20}, "refunded_total": 0, "accounting_total": 240000, "credit_line_total": 0, "transaction_total": 0, "pending_difference": 240000, "raw_refunded_total": {"value": "0", "precision": 20}, "current_order_total": 240000, "original_order_total": 240000, "raw_accounting_total": {"value": "240000", "precision": 20}, "raw_credit_line_total": {"value": "0", "precision": 20}, "raw_transaction_total": {"value": "0", "precision": 20}, "raw_pending_difference": {"value": "240000", "precision": 20}, "raw_current_order_total": {"value": "240000", "precision": 20}, "raw_original_order_total": {"value": "240000", "precision": 20}}', '2026-06-14 03:48:47.835+03', '2026-06-14 03:48:47.835+03', NULL);
INSERT INTO public.order_summary VALUES ('ordsum_01KV48DNQWP4BNWJK507AGPBF8', 'order_01KV48DNR0THTHF88NF6ETVKY8', 1, '{"paid_total": 0, "raw_paid_total": {"value": "0", "precision": 20}, "refunded_total": 0, "accounting_total": 240000, "credit_line_total": 0, "transaction_total": 0, "pending_difference": 240000, "raw_refunded_total": {"value": "0", "precision": 20}, "current_order_total": 240000, "original_order_total": 240000, "raw_accounting_total": {"value": "240000", "precision": 20}, "raw_credit_line_total": {"value": "0", "precision": 20}, "raw_transaction_total": {"value": "0", "precision": 20}, "raw_pending_difference": {"value": "240000", "precision": 20}, "raw_current_order_total": {"value": "240000", "precision": 20}, "raw_original_order_total": {"value": "240000", "precision": 20}}', '2026-06-15 02:45:40.616+03', '2026-06-15 02:45:40.616+03', NULL);
INSERT INTO public.order_summary VALUES ('ordsum_01KV5NCZF2T4VFGC4557CFM6SY', 'order_01KV5NCZF3KHVPNJNAQ6BNV04T', 1, '{"paid_total": 0, "raw_paid_total": {"value": "0", "precision": 20}, "refunded_total": 0, "accounting_total": 240000, "credit_line_total": 0, "transaction_total": 0, "pending_difference": 240000, "raw_refunded_total": {"value": "0", "precision": 20}, "current_order_total": 240000, "original_order_total": 240000, "raw_accounting_total": {"value": "240000", "precision": 20}, "raw_credit_line_total": {"value": "0", "precision": 20}, "raw_transaction_total": {"value": "0", "precision": 20}, "raw_pending_difference": {"value": "240000", "precision": 20}, "raw_current_order_total": {"value": "240000", "precision": 20}, "raw_original_order_total": {"value": "240000", "precision": 20}}', '2026-06-15 15:51:43.716+03', '2026-06-15 15:51:43.716+03', NULL);
INSERT INTO public.order_summary VALUES ('ordsum_01KV8NAWAAB218MF9XM34PDW4C', 'order_01KV8NAWADZ1CGMBTM50JF2XAF', 1, '{"paid_total": 0, "raw_paid_total": {"value": "0", "precision": 20}, "refunded_total": 0, "accounting_total": 240000, "credit_line_total": 0, "transaction_total": 0, "pending_difference": 240000, "raw_refunded_total": {"value": "0", "precision": 20}, "current_order_total": 240000, "original_order_total": 240000, "raw_accounting_total": {"value": "240000", "precision": 20}, "raw_credit_line_total": {"value": "0", "precision": 20}, "raw_transaction_total": {"value": "0", "precision": 20}, "raw_pending_difference": {"value": "240000", "precision": 20}, "raw_current_order_total": {"value": "240000", "precision": 20}, "raw_original_order_total": {"value": "240000", "precision": 20}}', '2026-06-16 19:48:18.262+03', '2026-06-16 19:48:18.262+03', NULL);
INSERT INTO public.order_summary VALUES ('ordsum_01KVRJ6MNHAZ297ZSS33PK9CSS', 'order_01KVRJ6MNHJFFVX9EKES3WFQCB', 1, '{"paid_total": 0, "raw_paid_total": {"value": "0", "precision": 20}, "refunded_total": 0, "accounting_total": 220000, "credit_line_total": 0, "transaction_total": 0, "pending_difference": 220000, "raw_refunded_total": {"value": "0", "precision": 20}, "current_order_total": 220000, "original_order_total": 220000, "raw_accounting_total": {"value": "220000", "precision": 20}, "raw_credit_line_total": {"value": "0", "precision": 20}, "raw_transaction_total": {"value": "0", "precision": 20}, "raw_pending_difference": {"value": "220000", "precision": 20}, "raw_current_order_total": {"value": "220000", "precision": 20}, "raw_original_order_total": {"value": "220000", "precision": 20}}', '2026-06-23 00:01:24.534+03', '2026-06-23 00:01:24.534+03', NULL);
INSERT INTO public.order_summary VALUES ('ordsum_01KVRJ9TT9EPZV2PSQHCJ6QMGF', 'order_01KVRJ9TT9018E0VX1EP7FMBD3', 1, '{"paid_total": 0, "raw_paid_total": {"value": "0", "precision": 20}, "refunded_total": 0, "accounting_total": 220000, "credit_line_total": 0, "transaction_total": 0, "pending_difference": 220000, "raw_refunded_total": {"value": "0", "precision": 20}, "current_order_total": 220000, "original_order_total": 220000, "raw_accounting_total": {"value": "220000", "precision": 20}, "raw_credit_line_total": {"value": "0", "precision": 20}, "raw_transaction_total": {"value": "0", "precision": 20}, "raw_pending_difference": {"value": "220000", "precision": 20}, "raw_current_order_total": {"value": "220000", "precision": 20}, "raw_original_order_total": {"value": "220000", "precision": 20}}', '2026-06-23 00:03:09.131+03', '2026-06-23 00:03:09.131+03', NULL);
INSERT INTO public.order_summary VALUES ('ordsum_01KVRJXQBC3ZH74NFZ2FTCY94A', 'order_01KVRJXQBC0MEBC79MBYANA1ZK', 1, '{"paid_total": 0, "raw_paid_total": {"value": "0", "precision": 20}, "refunded_total": 0, "accounting_total": 220000, "credit_line_total": 0, "transaction_total": 0, "pending_difference": 220000, "raw_refunded_total": {"value": "0", "precision": 20}, "current_order_total": 220000, "original_order_total": 220000, "raw_accounting_total": {"value": "220000", "precision": 20}, "raw_credit_line_total": {"value": "0", "precision": 20}, "raw_transaction_total": {"value": "0", "precision": 20}, "raw_pending_difference": {"value": "220000", "precision": 20}, "raw_current_order_total": {"value": "220000", "precision": 20}, "raw_original_order_total": {"value": "220000", "precision": 20}}', '2026-06-23 00:14:00.942+03', '2026-06-23 00:14:00.942+03', NULL);


--
-- Data for Name: order_transaction; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.payment VALUES ('pay_01KTWRRG8YQVHM57VK6FSVTN3B', 360000, '{"value": "360000", "precision": 20}', 'try', 'pp_system_default', '{}', '2026-06-12 04:57:17.214+03', '2026-06-12 04:57:17.214+03', NULL, NULL, NULL, 'pay_col_01KTWRRFH72RHHPVKB6J09K32X', 'payses_01KTWRRFMBZG43VXAMRCY578JF', NULL);
INSERT INTO public.payment VALUES ('pay_01KTYAMP9DAH82GB7P0GXMSZ50', 360000, '{"value": "360000", "precision": 20}', 'try', 'pp_system_default', '{}', '2026-06-12 19:29:01.101+03', '2026-06-12 19:29:01.101+03', NULL, NULL, NULL, 'pay_col_01KTYAMNRT2GAXAQR7BB8JCNZV', 'payses_01KTYAMNVYQ9JCF1VNKW6WJPGH', NULL);
INSERT INTO public.payment VALUES ('pay_01KTYDC3QKWX2DKKR617NVX0A9', 240000, '{"value": "240000", "precision": 20}', 'try', 'pp_system_default', '{}', '2026-06-12 20:16:45.683+03', '2026-06-12 20:16:45.683+03', NULL, NULL, NULL, 'pay_col_01KTYDC3D14J72950CRJ98RNQV', 'payses_01KTYDC3EJFGB3H29BB95X5PY5', NULL);
INSERT INTO public.payment VALUES ('pay_01KV1SMHBDK70H4E87AJ83A995', 240000, '{"value": "240000", "precision": 20}', 'try', 'pp_system_default', '{}', '2026-06-14 03:48:47.981+03', '2026-06-14 03:48:47.981+03', NULL, NULL, NULL, 'pay_col_01KV1SMH0B8R2JG2H4SV4S34ZK', 'payses_01KV1SMH1QSB56J15ZNKGDMXRC', NULL);
INSERT INTO public.payment VALUES ('pay_01KV48DP2FW4W7KW68BAE8D939', 240000, '{"value": "240000", "precision": 20}', 'try', 'pp_system_default', '{}', '2026-06-15 02:45:40.944+03', '2026-06-15 02:45:40.944+03', NULL, NULL, NULL, 'pay_col_01KV48DNCG5FCDE5WRA8QR9D8A', 'payses_01KV48DNFAVC6J9NKPKT1D8D7H', NULL);
INSERT INTO public.payment VALUES ('pay_01KV5NCZJSEAPFH2SS4JEW0AK1', 240000, '{"value": "240000", "precision": 20}', 'try', 'pp_system_default', '{}', '2026-06-15 15:51:43.833+03', '2026-06-15 15:51:43.833+03', NULL, NULL, NULL, 'pay_col_01KV5NCZ93Y88Q5330YMM5X1DB', 'payses_01KV5NCZAKEH5RXJE5JG0WNWYG', NULL);
INSERT INTO public.payment VALUES ('pay_01KV8NAWG6SDDXECAGS14CX2MC', 240000, '{"value": "240000", "precision": 20}', 'try', 'pp_system_default', '{}', '2026-06-16 19:48:18.439+03', '2026-06-16 19:48:18.439+03', NULL, NULL, NULL, 'pay_col_01KV8NAW2CM1TE9Q7X150RRGSE', 'payses_01KV8NAW47CEBGWXVG59B0GTAN', NULL);


--
-- Data for Name: payment_collection; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.payment_collection VALUES ('pay_col_01KTWRRFH72RHHPVKB6J09K32X', 'try', 360000, '{"value": "360000", "precision": 20}', 360000, '{"value": "360000", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '2026-06-12 04:57:16.455+03', '2026-06-12 04:57:17.301+03', NULL, NULL, 'authorized', NULL);
INSERT INTO public.payment_collection VALUES ('pay_col_01KTYAMNRT2GAXAQR7BB8JCNZV', 'try', 360000, '{"value": "360000", "precision": 20}', 360000, '{"value": "360000", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '2026-06-12 19:29:00.57+03', '2026-06-12 19:29:01.137+03', NULL, NULL, 'authorized', NULL);
INSERT INTO public.payment_collection VALUES ('pay_col_01KTYDC3D14J72950CRJ98RNQV', 'try', 240000, '{"value": "240000", "precision": 20}', 240000, '{"value": "240000", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '2026-06-12 20:16:45.346+03', '2026-06-12 20:16:45.698+03', NULL, NULL, 'authorized', NULL);
INSERT INTO public.payment_collection VALUES ('pay_col_01KV1SMH0B8R2JG2H4SV4S34ZK', 'try', 240000, '{"value": "240000", "precision": 20}', 240000, '{"value": "240000", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '2026-06-14 03:48:47.628+03', '2026-06-14 03:48:48.003+03', NULL, NULL, 'authorized', NULL);
INSERT INTO public.payment_collection VALUES ('pay_col_01KV484FZDDX1RZX7Y2GZ369T5', 'try', 240000, '{"value": "240000", "precision": 20}', NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-15 02:40:39.789+03', '2026-06-15 02:40:39.789+03', NULL, NULL, 'not_paid', NULL);
INSERT INTO public.payment_collection VALUES ('pay_col_01KV48DNCG5FCDE5WRA8QR9D8A', 'try', 240000, '{"value": "240000", "precision": 20}', 240000, '{"value": "240000", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '2026-06-15 02:45:40.24+03', '2026-06-15 02:45:41.001+03', NULL, NULL, 'authorized', NULL);
INSERT INTO public.payment_collection VALUES ('pay_col_01KV5NCZ93Y88Q5330YMM5X1DB', 'try', 240000, '{"value": "240000", "precision": 20}', 240000, '{"value": "240000", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '2026-06-15 15:51:43.523+03', '2026-06-15 15:51:43.848+03', NULL, NULL, 'authorized', NULL);
INSERT INTO public.payment_collection VALUES ('pay_col_01KV8NAW2CM1TE9Q7X150RRGSE', 'try', 240000, '{"value": "240000", "precision": 20}', 240000, '{"value": "240000", "precision": 20}', 0, '{"value": "0", "precision": 20}', 0, '{"value": "0", "precision": 20}', '2026-06-16 19:48:17.996+03', '2026-06-16 19:48:18.479+03', NULL, NULL, 'authorized', NULL);


--
-- Data for Name: payment_collection_payment_providers; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: payment_provider; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.payment_provider VALUES ('pp_system_default', true, '2026-06-11 02:26:38.123+03', '2026-06-11 02:26:38.123+03', NULL);


--
-- Data for Name: payment_session; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.payment_session VALUES ('payses_01KTWRRFMBZG43VXAMRCY578JF', 'try', 360000, '{"value": "360000", "precision": 20}', 'pp_system_default', '{}', '{}', 'authorized', '2026-06-12 04:57:17.206+03', 'pay_col_01KTWRRFH72RHHPVKB6J09K32X', '{}', '2026-06-12 04:57:16.555+03', '2026-06-12 04:57:17.215+03', NULL);
INSERT INTO public.payment_session VALUES ('payses_01KTYAMNVYQ9JCF1VNKW6WJPGH', 'try', 360000, '{"value": "360000", "precision": 20}', 'pp_system_default', '{}', '{}', 'authorized', '2026-06-12 19:29:01.097+03', 'pay_col_01KTYAMNRT2GAXAQR7BB8JCNZV', '{}', '2026-06-12 19:29:00.67+03', '2026-06-12 19:29:01.101+03', NULL);
INSERT INTO public.payment_session VALUES ('payses_01KTYDC3EJFGB3H29BB95X5PY5', 'try', 240000, '{"value": "240000", "precision": 20}', 'pp_system_default', '{}', '{}', 'authorized', '2026-06-12 20:16:45.679+03', 'pay_col_01KTYDC3D14J72950CRJ98RNQV', '{}', '2026-06-12 20:16:45.395+03', '2026-06-12 20:16:45.683+03', NULL);
INSERT INTO public.payment_session VALUES ('payses_01KV1SMH1QSB56J15ZNKGDMXRC', 'try', 240000, '{"value": "240000", "precision": 20}', 'pp_system_default', '{}', '{}', 'authorized', '2026-06-14 03:48:47.978+03', 'pay_col_01KV1SMH0B8R2JG2H4SV4S34ZK', '{}', '2026-06-14 03:48:47.671+03', '2026-06-14 03:48:47.981+03', NULL);
INSERT INTO public.payment_session VALUES ('payses_01KV484G14V5YB052E5PG99WKK', 'try', 240000, '{"value": "240000", "precision": 20}', 'pp_system_default', '{}', '{}', 'pending', NULL, 'pay_col_01KV484FZDDX1RZX7Y2GZ369T5', '{}', '2026-06-15 02:40:39.845+03', '2026-06-15 02:40:39.845+03', NULL);
INSERT INTO public.payment_session VALUES ('payses_01KV48DNFAVC6J9NKPKT1D8D7H', 'try', 240000, '{"value": "240000", "precision": 20}', 'pp_system_default', '{}', '{}', 'authorized', '2026-06-15 02:45:40.937+03', 'pay_col_01KV48DNCG5FCDE5WRA8QR9D8A', '{}', '2026-06-15 02:45:40.331+03', '2026-06-15 02:45:40.945+03', NULL);
INSERT INTO public.payment_session VALUES ('payses_01KV5NCZAKEH5RXJE5JG0WNWYG', 'try', 240000, '{"value": "240000", "precision": 20}', 'pp_system_default', '{}', '{}', 'authorized', '2026-06-15 15:51:43.831+03', 'pay_col_01KV5NCZ93Y88Q5330YMM5X1DB', '{}', '2026-06-15 15:51:43.572+03', '2026-06-15 15:51:43.833+03', NULL);
INSERT INTO public.payment_session VALUES ('payses_01KV8NAW47CEBGWXVG59B0GTAN', 'try', 240000, '{"value": "240000", "precision": 20}', 'pp_system_default', '{}', '{}', 'authorized', '2026-06-16 19:48:18.434+03', 'pay_col_01KV8NAW2CM1TE9Q7X150RRGSE', '{}', '2026-06-16 19:48:18.055+03', '2026-06-16 19:48:18.44+03', NULL);


--
-- Data for Name: price; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.price VALUES ('price_01KTSXRB2A15NQBZNEX3XWGBPD', NULL, 'pset_01KTSXRB2DFTFH69FT3KSKE8T6', 'usd', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:51.473+03', '2026-06-11 02:26:51.473+03', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRB2ATTNF8A2X3SP7N1CQ', NULL, 'pset_01KTSXRB2DFTFH69FT3KSKE8T6', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:51.474+03', '2026-06-11 02:26:51.475+03', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRB2DSFD60RPTTJ221GWH', NULL, 'pset_01KTSXRB2DFTFH69FT3KSKE8T6', 'eur', '{"value": "10", "precision": 20}', 1, '2026-06-11 02:26:51.475+03', '2026-06-11 02:26:51.475+03', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRB2E9C3M3RHHYMHY29N4', NULL, 'pset_01KTSXRB2G7ARK37GDXS2FWQNN', 'usd', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:51.476+03', '2026-06-11 02:26:51.476+03', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRB2E5SM4GNPP0545N7VG', NULL, 'pset_01KTSXRB2G7ARK37GDXS2FWQNN', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:51.476+03', '2026-06-11 02:26:51.476+03', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRB2FZRA99846SBDJX2CH', NULL, 'pset_01KTSXRB2G7ARK37GDXS2FWQNN', 'eur', '{"value": "10", "precision": 20}', 1, '2026-06-11 02:26:51.476+03', '2026-06-11 02:26:51.476+03', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNT2228BC0CZMJEPVJ4TD', NULL, 'pset_01KV1YNT22GKNG4M967A8GCG21', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:16:52.546+03', '2026-06-14 06:22:49.067+03', '2026-06-14 06:22:49.061+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGHF429CNYEJE3C9JPFTJ4', NULL, 'pset_01KTWGHF420T88D85BKQF8E5XH', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:33:38.05+03', '2026-06-12 02:35:55.834+03', '2026-06-12 02:35:55.827+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGHFC8GHDX5CEDZJV38HGG', NULL, 'pset_01KTWGHFC8TS4D4P6FPWSB0KWJ', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:33:38.313+03', '2026-06-12 02:35:56.793+03', '2026-06-12 02:35:56.788+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGHFJ4Z0MHNVRF301JT01T', NULL, 'pset_01KTWGHFJ5ES5XYEDE3KFDBVKJ', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:33:38.501+03', '2026-06-12 02:35:57.075+03', '2026-06-12 02:35:57.07+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGHFRXKMDY7TEBGXY9VMQV', NULL, 'pset_01KTWGHFRX2MMD0VNJ7N6H1075', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:33:38.718+03', '2026-06-12 02:35:57.325+03', '2026-06-12 02:35:57.321+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGHGHZ1XY9Z83KWENPCKJD', NULL, 'pset_01KTWGHFRX2MMD0VNJ7N6H1075', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:33:39.518486+03', '2026-06-12 02:35:57.325+03', '2026-06-12 02:35:57.321+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGHGJ0HAWQ9R8N089BFXAY', NULL, 'pset_01KTWGHG18DQ6BRWF7JXD4FZHN', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:33:39.518486+03', '2026-06-12 02:35:57.484+03', '2026-06-12 02:35:57.478+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGNQK14DJPHWKDETNAKC9M', NULL, 'pset_01KTWGNQK15ZBE79Q6H6D2356J', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:35:57.793+03', '2026-06-12 03:36:46.34+03', '2026-06-12 03:36:46.336+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGNR7HS59A52D721TZK3WX', NULL, 'pset_01KTWGNR7JWABP7SBCMA3WH3R5', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:35:58.45+03', '2026-06-12 03:36:46.954+03', '2026-06-12 03:36:46.95+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGNRZHP9ZCKMRH37PH5G0F', NULL, 'pset_01KTWGNRZHCVTG3FXBFG1GNEGW', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:35:59.218+03', '2026-06-12 03:36:47.237+03', '2026-06-12 03:36:47.232+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGNTQ095VZ20A0TWVNRMYB', NULL, 'pset_01KTWGNTQ1QT0HTHCWANG7AH4A', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:36:00.993+03', '2026-06-12 03:36:47.557+03', '2026-06-12 03:36:47.553+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWM548YMTFHWWWJH29EVZ08', NULL, 'pset_01KTWM548Y61Z3NFDM1EJFX26N', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 03:36:48.03+03', '2026-06-12 03:46:38.558+03', '2026-06-12 03:46:38.555+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWM54G1AVVBN4C7ND2WPTPV', NULL, 'pset_01KTWM54G19J34A9C8VV5GWF18', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 03:36:48.257+03', '2026-06-12 03:46:38.868+03', '2026-06-12 03:46:38.864+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWM54REFEKS2FN2FANZQ22A', NULL, 'pset_01KTWM54REMBFDJ6EH844VWKD9', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 03:36:48.526+03', '2026-06-12 03:46:39.109+03', '2026-06-12 03:46:39.105+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBXRQA6KEBW40BA6K3GY', NULL, 'pset_01KTSXRBXS5XG7ZT3E7G6YBA88', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.37+03', '2026-06-11 17:57:07.774+03', '2026-06-11 17:57:07.749+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBXSG84WFYA793M9GXHF', NULL, 'pset_01KTSXRBXS5XG7ZT3E7G6YBA88', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.37+03', '2026-06-11 17:57:07.774+03', '2026-06-11 17:57:07.749+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBXS3CPC3K3VDHFJXE42', NULL, 'pset_01KTSXRBXTWE4VA4FK4PW7NWCK', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.37+03', '2026-06-11 17:57:07.806+03', '2026-06-11 17:57:07.749+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBXT5RGARB7TWFJTF5NZ', NULL, 'pset_01KTSXRBXTWE4VA4FK4PW7NWCK', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.37+03', '2026-06-11 17:57:07.807+03', '2026-06-11 17:57:07.749+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBXV7KWVRZ5S1YX54709', NULL, 'pset_01KTSXRBXVFTCMHG4G6BVW4KG1', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.37+03', '2026-06-11 17:57:07.83+03', '2026-06-11 17:57:07.749+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBXVH89X2WTX83MBB981', NULL, 'pset_01KTSXRBXVFTCMHG4G6BVW4KG1', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.37+03', '2026-06-11 17:57:07.83+03', '2026-06-11 17:57:07.749+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBXWG40YKRV5D859H0KE', NULL, 'pset_01KTSXRBXXFJX977TXEHFCPD8A', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.37+03', '2026-06-11 17:57:07.847+03', '2026-06-11 17:57:07.749+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBY63WESY8H250DN2AD9', NULL, 'pset_01KTSXRBY70DRD8VMX8A1CMW94', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.373+03', '2026-06-11 17:57:11.958+03', '2026-06-11 17:57:11.941+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBY7C7WG0YZ2ZJTY4M4K', NULL, 'pset_01KTSXRBY70DRD8VMX8A1CMW94', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.373+03', '2026-06-11 17:57:11.958+03', '2026-06-11 17:57:11.941+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBY8YW5MPP3WVB2FSE1M', NULL, 'pset_01KTSXRBY8HSJWQHT50GJV7ANH', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.373+03', '2026-06-11 17:57:11.978+03', '2026-06-11 17:57:11.941+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBY8066TVZHFNNJ23Q2K', NULL, 'pset_01KTSXRBY8HSJWQHT50GJV7ANH', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.373+03', '2026-06-11 17:57:11.978+03', '2026-06-11 17:57:11.941+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBY9M12PF2SQEEYRPBMV', NULL, 'pset_01KTSXRBY92YKAVKD7NQ5Z5Z0G', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.373+03', '2026-06-11 17:57:12.018+03', '2026-06-11 17:57:11.941+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBY90N41DPSWTZWZ17KD', NULL, 'pset_01KTSXRBY92YKAVKD7NQ5Z5Z0G', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.373+03', '2026-06-11 17:57:12.018+03', '2026-06-11 17:57:11.941+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBYAEQN28ZGA7N47NP91', NULL, 'pset_01KTSXRBYAKNWSAH7VXHMSXQZB', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.374+03', '2026-06-11 17:57:12.047+03', '2026-06-11 17:57:11.941+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBYA7T54KYQQT2E26TRY', NULL, 'pset_01KTSXRBYAKNWSAH7VXHMSXQZB', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.374+03', '2026-06-11 17:57:12.047+03', '2026-06-11 17:57:11.941+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBYA5EVK78W1JZHFQDYF', NULL, 'pset_01KTSXRBYBKQ8MCVZAKFNZRHG6', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.374+03', '2026-06-11 17:57:16.476+03', '2026-06-11 17:57:16.439+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBYBP3MPNCGB1K7FD4MX', NULL, 'pset_01KTSXRBYBKQ8MCVZAKFNZRHG6', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.374+03', '2026-06-11 17:57:16.476+03', '2026-06-11 17:57:16.439+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBYCBF2GVQGR0DSX3R6G', NULL, 'pset_01KTSXRBYC4KGKCTVJAYP4AZGM', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.374+03', '2026-06-11 17:57:16.521+03', '2026-06-11 17:57:16.439+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBYCWFZ5K160N19W70CV', NULL, 'pset_01KTSXRBYC4KGKCTVJAYP4AZGM', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.374+03', '2026-06-11 17:57:16.522+03', '2026-06-11 17:57:16.439+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBYDMGF91DJ778ERPAVK', NULL, 'pset_01KTSXRBYDABPA8XETG854MB12', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.374+03', '2026-06-11 17:57:16.542+03', '2026-06-11 17:57:16.439+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBYDRP78TGA6S6MG9X22', NULL, 'pset_01KTSXRBYDABPA8XETG854MB12', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.374+03', '2026-06-11 17:57:16.542+03', '2026-06-11 17:57:16.439+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBYDVNYHK1XRP8S1K3T9', NULL, 'pset_01KTSXRBYEMDGTPF0YKHTHBE2T', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.374+03', '2026-06-11 17:57:16.561+03', '2026-06-11 17:57:16.439+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22EP8RRHJ7YJTVSCY81NFZ', NULL, 'pset_01KV22EP8RWV8WAZGYYN8YAFQ3', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 06:22:53.592+03', '2026-06-14 06:22:53.592+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBY12T6VHYJ5GXX1QN4E', NULL, 'pset_01KTSXRBY2R0W9QH9H1JXBP730', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.372+03', '2026-06-11 17:53:57.184+03', '2026-06-11 17:53:56.993+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBY2RNPWHHP12G7BNHH8', NULL, 'pset_01KTSXRBY2R0W9QH9H1JXBP730', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.372+03', '2026-06-11 17:53:57.192+03', '2026-06-11 17:53:56.993+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBY3B07HQ8VDSR8CP38K', NULL, 'pset_01KTSXRBY4A1ZVQFAE79T2JTEH', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.372+03', '2026-06-11 17:53:57.351+03', '2026-06-11 17:53:56.993+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBY3ACFKMVS4QNDFBGF0', NULL, 'pset_01KTSXRBY4A1ZVQFAE79T2JTEH', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.373+03', '2026-06-11 17:53:57.351+03', '2026-06-11 17:53:56.993+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBY4S8F7CNXZMTTG0MTE', NULL, 'pset_01KTSXRBY5XW53P1YSPW8HFH4P', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.373+03', '2026-06-11 17:53:57.375+03', '2026-06-11 17:53:56.993+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBY44B59ZPMDHWE75SQY', NULL, 'pset_01KTSXRBY5XW53P1YSPW8HFH4P', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.373+03', '2026-06-11 17:53:57.375+03', '2026-06-11 17:53:56.993+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBY50PSQJF21J5VD0VWK', NULL, 'pset_01KTSXRBY6QRXZ6SRG8MS8NNEP', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.373+03', '2026-06-11 17:53:57.402+03', '2026-06-11 17:53:56.993+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBY6EN7GPT198ZRG1EFS', NULL, 'pset_01KTSXRBY6QRXZ6SRG8MS8NNEP', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.373+03', '2026-06-11 17:53:57.402+03', '2026-06-11 17:53:56.993+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBXWG47QSQ7J0QSJ9RS2', NULL, 'pset_01KTSXRBXXFJX977TXEHFCPD8A', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.371+03', '2026-06-11 17:57:07.847+03', '2026-06-11 17:57:07.749+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBXXEPDPVD2NF2WA15EB', NULL, 'pset_01KTSXRBXYTHPS5F140TF75QPS', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.371+03', '2026-06-11 17:57:07.866+03', '2026-06-11 17:57:07.749+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBXXYGZ8STK00ZX2K7MX', NULL, 'pset_01KTSXRBXYTHPS5F140TF75QPS', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.371+03', '2026-06-11 17:57:07.866+03', '2026-06-11 17:57:07.749+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBXYMPWBCYW652WH1MHH', NULL, 'pset_01KTSXRBXZAXKKBD94R97Z6739', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.372+03', '2026-06-11 17:57:07.885+03', '2026-06-11 17:57:07.749+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBXY3VM22FV11K7HSZ19', NULL, 'pset_01KTSXRBXZAXKKBD94R97Z6739', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.372+03', '2026-06-11 17:57:07.885+03', '2026-06-11 17:57:07.749+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBXZT62N421RPS0C1AMB', NULL, 'pset_01KTSXRBY0PGP72A6MJCT31JXX', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.372+03', '2026-06-11 17:57:07.904+03', '2026-06-11 17:57:07.749+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBXZATX8YY001GKW2G8V', NULL, 'pset_01KTSXRBY0PGP72A6MJCT31JXX', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.372+03', '2026-06-11 17:57:07.904+03', '2026-06-11 17:57:07.749+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBY01ZZE1P6X3YY6P8R0', NULL, 'pset_01KTSXRBY14T0KJHTZ07SVA6QV', 'eur', '{"value": "10", "precision": 20}', 0, '2026-06-11 02:26:52.372+03', '2026-06-11 17:57:07.926+03', '2026-06-11 17:57:07.749+03', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBY1FBX17KX8VWHZT0QG', NULL, 'pset_01KTSXRBY14T0KJHTZ07SVA6QV', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.372+03', '2026-06-11 17:57:07.926+03', '2026-06-11 17:57:07.749+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTSXRBYEKKQ1T0FDVMSX46W3', NULL, 'pset_01KTSXRBYEMDGTPF0YKHTHBE2T', 'usd', '{"value": "15", "precision": 20}', 0, '2026-06-11 02:26:52.374+03', '2026-06-11 17:57:16.561+03', '2026-06-11 17:57:16.439+03', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22EPC9R83GCC1MACJWTS82', NULL, 'pset_01KV22EPC9DWEZQH8265AM53MH', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 06:22:53.705+03', '2026-06-14 06:22:53.705+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9KMBR9D9ESA905H9GZ52', NULL, 'pset_01KTWF9KMBNJY9VJVCFMXQXYJG', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:11:51.951+03', '2026-06-12 02:11:53.228+03', '2026-06-12 02:11:53.223+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9KMC4P4ST8P7WWV74GYJ', NULL, 'pset_01KTWF9KMCHNDEPMW5XY0N6F6W', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:11:51.952+03', '2026-06-12 02:11:54.1+03', '2026-06-12 02:11:54.097+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9KMCX234T29YWM7KTB9N', NULL, 'pset_01KTWF9KMCRQDHB0TTY7YGJZMR', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:11:51.952+03', '2026-06-12 02:11:55.095+03', '2026-06-12 02:11:55.091+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9KMC0YSBCX7CB442Z0BH', NULL, 'pset_01KTWF9KMCZ9S0JNRP1BYFB5CV', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:11:51.952+03', '2026-06-12 02:11:56.279+03', '2026-06-12 02:11:56.275+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9KMC1K99C97CJWE9KK1M', NULL, 'pset_01KTWF9KMCFNT3VTTZXP3J3C42', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:11:51.952+03', '2026-06-12 02:11:57.268+03', '2026-06-12 02:11:57.263+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9KMCVZC1HVQJM9JHJMQP', NULL, 'pset_01KTWF9KMCRA47ANFBRE38S0YV', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:11:51.952+03', '2026-06-12 02:11:58.137+03', '2026-06-12 02:11:58.132+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9KMD8S91ZXAGP5SV9N00', NULL, 'pset_01KTWF9KMDYFTNGTGFZFDFP5T0', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:11:51.952+03', '2026-06-12 02:11:58.88+03', '2026-06-12 02:11:58.875+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9KMEFZWE1VEBG8G9PNWX', NULL, 'pset_01KTWF9KME6DDHP141S0XX15JA', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:11:51.952+03', '2026-06-12 02:11:59.536+03', '2026-06-12 02:11:59.533+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9KMDSWTH0AAFM4FEAQHJ', NULL, 'pset_01KTWF9KMD1RE28A1M0VZXW0Q0', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:11:51.952+03', '2026-06-12 02:12:00.225+03', '2026-06-12 02:12:00.221+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9KMDD6991YACW0AYN3F4', NULL, 'pset_01KTWF9KMD9WZQ3NRG01GVNB0S', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:11:51.952+03', '2026-06-12 02:12:00.771+03', '2026-06-12 02:12:00.765+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9KMDXK1NHK4V00ZPB4Z6', NULL, 'pset_01KTWF9KMD3NS2K4SWP7B3NK1Y', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:11:51.952+03', '2026-06-12 02:12:01.252+03', '2026-06-12 02:12:01.247+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9KMEV58QQAQGE5NGAV7J', NULL, 'pset_01KTWF9KME7ET8J7R78V72CAJK', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:11:51.952+03', '2026-06-12 02:12:01.735+03', '2026-06-12 02:12:01.731+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9KMEHBKMHK8CM7P9YKJ3', NULL, 'pset_01KTWF9KME5W7PJEVT4RA35DAE', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:11:51.952+03', '2026-06-12 02:12:02.045+03', '2026-06-12 02:12:02.041+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9KME67GJFBZS0WG0B48H', NULL, 'pset_01KTWF9KMEW947JM0G4EAQBH5C', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:11:51.952+03', '2026-06-12 02:12:02.397+03', '2026-06-12 02:12:02.392+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9KMEZMG004QK4Q91X738', NULL, 'pset_01KTWF9KMEHG5V3ZH5HX0F8W8R', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:11:51.952+03', '2026-06-12 02:12:02.521+03', '2026-06-12 02:12:02.516+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9YCE8WNGV22PQP11ZPJ8', NULL, 'pset_01KTWF9YCFSBG30M6TG6D70DTQ', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:12:02.959+03', '2026-06-12 02:32:18.478+03', '2026-06-12 02:32:18.475+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9YJH9DSEV6XR1GR6RQD8', NULL, 'pset_01KTWF9YJJ79DRTDS7PS08KHRZ', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:12:03.154+03', '2026-06-12 02:32:19.405+03', '2026-06-12 02:32:19.399+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9YXXM8P6N32R8FRXBJ0Q', NULL, 'pset_01KTWF9YXXJJ24HPDE8D51T9MQ', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:12:03.518+03', '2026-06-12 02:32:20.716+03', '2026-06-12 02:32:20.712+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9Z8M140Q4RVA23EGXPW2', NULL, 'pset_01KTWF9Z8M54SVV4GG9E8V81MS', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:12:03.861+03', '2026-06-12 02:32:21.504+03', '2026-06-12 02:32:21.502+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9ZT9C7TYV8MQ78M7B5Z1', NULL, 'pset_01KTWF9ZT94B4XYBQCJATY05V9', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:12:04.425+03', '2026-06-12 02:32:22.185+03', '2026-06-12 02:32:22.181+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA086SMY0M1M8HXY0H43F', NULL, 'pset_01KTWFA086VZ9JG6CQ8KEV62BR', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:12:04.87+03', '2026-06-12 02:32:22.777+03', '2026-06-12 02:32:22.774+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA0Q5G0KDDGDA30RVQT7P', NULL, 'pset_01KTWFA0Q59GNP7K8T34BHSAN4', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:12:05.35+03', '2026-06-12 02:32:23.319+03', '2026-06-12 02:32:23.316+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22EPFTKN54M5DJ5ZBBES68', NULL, 'pset_01KV22EPFTSK2SN9W0JP27R0RR', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 06:22:53.818+03', '2026-06-14 06:22:53.818+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGHF7RGSXWRWYT13VHCZ16', NULL, 'pset_01KTWGHF7R16GFKXN00TM81ARP', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:33:38.168+03', '2026-06-12 02:35:56.421+03', '2026-06-12 02:35:56.418+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGHG18D50WTASSBGKEYY3P', NULL, 'pset_01KTWGHG18DQ6BRWF7JXD4FZHN', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:33:38.984+03', '2026-06-12 02:35:57.484+03', '2026-06-12 02:35:57.478+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA1Y9FK2EAS7SNPXWKRYQ', NULL, 'pset_01KTWFA1Y9Q4F5QAHFBZKBNJ6F', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:12:06.601+03', '2026-06-12 02:32:24.2+03', '2026-06-12 02:32:24.195+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA2V0S4PFS9M92DBB32N1', NULL, 'pset_01KTWFA2V0J5CFVBPBF5WVB9D2', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:12:07.52+03', '2026-06-12 02:32:24.634+03', '2026-06-12 02:32:24.631+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA47NRRGMBYZA7894VW1F', NULL, 'pset_01KTWFA47N58QN02RT8MB4RGA6', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:12:08.949+03', '2026-06-12 02:32:25.164+03', '2026-06-12 02:32:25.16+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA5ZRJP1WEAAB8NW33QFP', NULL, 'pset_01KTWFA5ZR19YRD8TTS409W8DD', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:12:10.744+03', '2026-06-12 02:32:25.5+03', '2026-06-12 02:32:25.495+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGNVPB4M76X0AN2WP7RWD6', NULL, 'pset_01KTWGNQK15ZBE79Q6H6D2356J', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:36:01.994714+03', '2026-06-12 03:36:46.34+03', '2026-06-12 03:36:46.336+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGNQR78NJN1GGJVCBEXNJ0', NULL, 'pset_01KTWGNQR7F3BSEH0MKG1DAHYY', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:35:57.96+03', '2026-06-12 03:36:46.571+03', '2026-06-12 03:36:46.565+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGNVPBPDJ9NG225F3V1J8J', NULL, 'pset_01KTWGNQR7F3BSEH0MKG1DAHYY', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:36:01.994714+03', '2026-06-12 03:36:46.571+03', '2026-06-12 03:36:46.565+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGNQZ2CE1Z1TYBQSHG0HJC', NULL, 'pset_01KTWGNQZ2EJBZCMSP72VZ82H5', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:35:58.179+03', '2026-06-12 03:36:46.795+03', '2026-06-12 03:36:46.791+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGNVPCFRTBK73JPTDFEJE0', NULL, 'pset_01KTWGNQZ2EJBZCMSP72VZ82H5', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:36:01.994714+03', '2026-06-12 03:36:46.795+03', '2026-06-12 03:36:46.791+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGNVPD2SZ00PPGMY1QZAR7', NULL, 'pset_01KTWGNR7JWABP7SBCMA3WH3R5', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:36:01.994714+03', '2026-06-12 03:36:46.954+03', '2026-06-12 03:36:46.95+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGNRHJPMQQTMYDEYN04DNN', NULL, 'pset_01KTWGNRHJ61809N5RKNHVSM2J', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:35:58.77+03', '2026-06-12 03:36:47.084+03', '2026-06-12 03:36:47.08+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGNVPDK54V8SG9N2XFNP0C', NULL, 'pset_01KTWGNRHJ61809N5RKNHVSM2J', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:36:01.994714+03', '2026-06-12 03:36:47.084+03', '2026-06-12 03:36:47.08+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGNVPD4EWH2XHQSF4KTYPB', NULL, 'pset_01KTWGNRZHCVTG3FXBFG1GNEGW', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:36:01.994714+03', '2026-06-12 03:36:47.237+03', '2026-06-12 03:36:47.232+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGNSE4NF2Y34KFM1M0VVNV', NULL, 'pset_01KTWGNSE4RJE379KMQW70J5EJ', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:35:59.684+03', '2026-06-12 03:36:47.369+03', '2026-06-12 03:36:47.366+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGNVPEXGWWZMNXBNN24R00', NULL, 'pset_01KTWGNSE4RJE379KMQW70J5EJ', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:36:01.994714+03', '2026-06-12 03:36:47.369+03', '2026-06-12 03:36:47.366+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGNSXZ4C7D3F41J5MZ9NXP', NULL, 'pset_01KTWGNSY0YPJR3578PDHXPHD0', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:36:00.192+03', '2026-06-12 03:36:47.467+03', '2026-06-12 03:36:47.463+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGNVPE71SBP44NMD22MDCR', NULL, 'pset_01KTWGNSY0YPJR3578PDHXPHD0', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:36:01.994714+03', '2026-06-12 03:36:47.467+03', '2026-06-12 03:36:47.463+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGNVPEF0HWJS4RYKW3Q9RM', NULL, 'pset_01KTWGNTQ1QT0HTHCWANG7AH4A', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:36:01.994714+03', '2026-06-12 03:36:47.557+03', '2026-06-12 03:36:47.553+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWM541N0N1510DPY4WSZJAV', NULL, 'pset_01KTWM541NH9N2CWECE42K5V9F', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 03:36:47.797+03', '2026-06-12 03:46:37.898+03', '2026-06-12 03:46:37.883+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWM55MQ5XWPJZ8N3PPYMBPY', NULL, 'pset_01KTWM541NH9N2CWECE42K5V9F', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 03:36:49.430632+03', '2026-06-12 03:46:37.898+03', '2026-06-12 03:46:37.883+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWM5455RJ06JQQECAQVS74X', NULL, 'pset_01KTWM54556GWH716AMJFXRM60', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 03:36:47.909+03', '2026-06-12 03:46:38.186+03', '2026-06-12 03:46:38.162+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWM55MQ3EFJ1V8EV6TY50TF', NULL, 'pset_01KTWM54556GWH716AMJFXRM60', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 03:36:49.430632+03', '2026-06-12 03:46:38.186+03', '2026-06-12 03:46:38.162+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWM55MREF67K6XAGMYNW85K', NULL, 'pset_01KTWM548Y61Z3NFDM1EJFX26N', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 03:36:49.430632+03', '2026-06-12 03:46:38.558+03', '2026-06-12 03:46:38.555+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWM54C684VZ3PJEEY9CRZ1D', NULL, 'pset_01KTWM54C6CH2FC6PQ7SNAZMK8', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 03:36:48.134+03', '2026-06-12 03:46:38.726+03', '2026-06-12 03:46:38.724+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWM55MR75R46V6A53BA1RV7', NULL, 'pset_01KTWM54C6CH2FC6PQ7SNAZMK8', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 03:36:49.430632+03', '2026-06-12 03:46:38.726+03', '2026-06-12 03:46:38.724+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWM55MRP2V6BEPM31SGDQ0S', NULL, 'pset_01KTWM54G19J34A9C8VV5GWF18', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 03:36:49.430632+03', '2026-06-12 03:46:38.868+03', '2026-06-12 03:46:38.864+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWM54KYDVWXTW2N2F0SD235', NULL, 'pset_01KTWM54KY0PSDKSKDJ11N2T64', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 03:36:48.382+03', '2026-06-12 03:46:38.992+03', '2026-06-12 03:46:38.986+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWM55MR19CDWSD0WW327G61', NULL, 'pset_01KTWM54KY0PSDKSKDJ11N2T64', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 03:36:49.430632+03', '2026-06-12 03:46:38.992+03', '2026-06-12 03:46:38.986+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWM55MRKBJ2T5HKM8D85XMP', NULL, 'pset_01KTWM54REMBFDJ6EH844VWKD9', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 03:36:49.430632+03', '2026-06-12 03:46:39.109+03', '2026-06-12 03:46:39.105+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWM54X6R835KEWSA6Q71PBX', NULL, 'pset_01KTWM54X6CWPRTCBARR6ZTQAK', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 03:36:48.678+03', '2026-06-12 03:46:39.218+03', '2026-06-12 03:46:39.214+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWM55MRE2MRWZX5FZE1B8X3', NULL, 'pset_01KTWM54X6CWPRTCBARR6ZTQAK', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 03:36:49.430632+03', '2026-06-12 03:46:39.218+03', '2026-06-12 03:46:39.214+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWM5536GCNZ3R7D1E001PYH', NULL, 'pset_01KTWM5536MPKYEC6R4KT4VM60', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 03:36:48.87+03', '2026-06-12 03:46:39.316+03', '2026-06-12 03:46:39.313+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWM55MSRKZNJGCNTRMSC3EG', NULL, 'pset_01KTWM5536MPKYEC6R4KT4VM60', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 03:36:49.430632+03', '2026-06-12 03:46:39.317+03', '2026-06-12 03:46:39.313+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWMQ639DK1FD6MPVK97BEAH', NULL, 'pset_01KTWMQ639Y207FVX308K5ZV11', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 03:46:39.721+03', '2026-06-12 04:32:48.715+03', '2026-06-12 04:32:48.708+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWMQ671GYK3PZN4XMQ0JTCB', NULL, 'pset_01KTWMQ671K39YE08TBA41TXH2', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 03:46:39.841+03', '2026-06-12 04:32:49.382+03', '2026-06-12 04:32:49.372+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGF8H43J83NTVVQPD215XR', NULL, 'pset_01KTWGF8H5D4CKDG0WTCYXQ3XV', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:32:25.765+03', '2026-06-12 02:33:36.773+03', '2026-06-12 02:33:36.765+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGF9YWKJY2HVXGG98ZSYVD', NULL, 'pset_01KTWGF8H5D4CKDG0WTCYXQ3XV', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:32:27.226171+03', '2026-06-12 02:33:36.773+03', '2026-06-12 02:33:36.765+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGF8MX3Q07XP98NWYA24QH', NULL, 'pset_01KTWGF8MX2XJR0ATNVE61ZA2C', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:32:25.885+03', '2026-06-12 02:33:37.104+03', '2026-06-12 02:33:37.098+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGF9YW2EBCP35T21DB3D9F', NULL, 'pset_01KTWGF8MX2XJR0ATNVE61ZA2C', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:32:27.226171+03', '2026-06-12 02:33:37.104+03', '2026-06-12 02:33:37.098+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGF8SKC3VHVQ6V6GMGGZJD', NULL, 'pset_01KTWGF8SK7H2737PZK49Q3CYG', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:32:26.036+03', '2026-06-12 02:33:37.366+03', '2026-06-12 02:33:37.363+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGF9YXGH17RB9JTSEE7E09', NULL, 'pset_01KTWGF8SK7H2737PZK49Q3CYG', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:32:27.226171+03', '2026-06-12 02:33:37.366+03', '2026-06-12 02:33:37.363+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGF8ZAMEC972T819EC9QKG', NULL, 'pset_01KTWGF8ZA7GPFB99XEPCAKDJW', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:32:26.218+03', '2026-06-12 02:33:37.547+03', '2026-06-12 02:33:37.542+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGF9YXW4W5KK4Y8Y5GV1TF', NULL, 'pset_01KTWGF8ZA7GPFB99XEPCAKDJW', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:32:27.226171+03', '2026-06-12 02:33:37.547+03', '2026-06-12 02:33:37.542+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGF96601WX9TKAS80ZAFSK', NULL, 'pset_01KTWGF9679VKZHZRAKJ4Z24KH', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:32:26.439+03', '2026-06-12 02:33:37.698+03', '2026-06-12 02:33:37.696+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGF9YXF354GW8KD94V8ESJ', NULL, 'pset_01KTWGF9679VKZHZRAKJ4Z24KH', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:32:27.226171+03', '2026-06-12 02:33:37.698+03', '2026-06-12 02:33:37.696+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGF9E4Z7TXERNW7TE4RF82', NULL, 'pset_01KTWGF9E4DP7Y7G4NSXWFNBT9', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:32:26.692+03', '2026-06-12 02:33:37.809+03', '2026-06-12 02:33:37.805+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGF9YY7RRDSCEJ66C88VSB', NULL, 'pset_01KTWGF9E4DP7Y7G4NSXWFNBT9', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:32:27.226171+03', '2026-06-12 02:33:37.809+03', '2026-06-12 02:33:37.805+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22EPKFGHY5V0QVRCGRG27W', NULL, 'pset_01KV22EPKF3CEKW75MPR3ZXYF9', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 06:22:53.935+03', '2026-06-14 06:22:53.935+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22EPQWR69DRB4Q2S6B1QB0', NULL, 'pset_01KV22EPQWH9ZK18WXKYX9YJH8', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 06:22:54.076+03', '2026-06-14 06:22:54.076+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGHGHZE1ZJM6N7NR5TMTZY', NULL, 'pset_01KTWGHF420T88D85BKQF8E5XH', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:33:39.518486+03', '2026-06-12 02:35:55.834+03', '2026-06-12 02:35:55.827+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWF9Y8A6WFE455A5FGBDYAT', NULL, 'pset_01KTWF9Y8BY1SFAY96KD96SK7N', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:12:02.827+03', '2026-06-12 02:32:17.156+03', '2026-06-12 02:32:17.147+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA7CY79KW85XRXTNTNPW4', NULL, 'pset_01KTWF9Y8BY1SFAY96KD96SK7N', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:12:12.213+03', '2026-06-12 02:32:17.156+03', '2026-06-12 02:32:17.147+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA7CY7J5SKVVACRRGBAAW', NULL, 'pset_01KTWF9YCFSBG30M6TG6D70DTQ', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:12:12.214+03', '2026-06-12 02:32:18.478+03', '2026-06-12 02:32:18.475+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA7CZE4KVT0Q2SR1YCGAH', NULL, 'pset_01KTWF9YJJ79DRTDS7PS08KHRZ', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:12:12.214+03', '2026-06-12 02:32:19.405+03', '2026-06-12 02:32:19.399+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA7CZWAYRHZ87HF5P56SV', NULL, 'pset_01KTWF9YXXJJ24HPDE8D51T9MQ', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:12:12.214+03', '2026-06-12 02:32:20.716+03', '2026-06-12 02:32:20.712+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA7D0F8CVQX3PMJWS45TE', NULL, 'pset_01KTWF9Z8M54SVV4GG9E8V81MS', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:12:12.215+03', '2026-06-12 02:32:21.504+03', '2026-06-12 02:32:21.502+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA7D0SBGMT5YX2MJSXKGS', NULL, 'pset_01KTWF9ZT94B4XYBQCJATY05V9', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:12:12.215+03', '2026-06-12 02:32:22.185+03', '2026-06-12 02:32:22.181+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA7D1MC33EMKB71YBABP6', NULL, 'pset_01KTWFA086VZ9JG6CQ8KEV62BR', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:12:12.215+03', '2026-06-12 02:32:22.777+03', '2026-06-12 02:32:22.774+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA7D2DRN2SM8ZPB798143', NULL, 'pset_01KTWFA0Q59GNP7K8T34BHSAN4', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:12:12.215+03', '2026-06-12 02:32:23.319+03', '2026-06-12 02:32:23.316+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA1A94JB03GYPYMPWW3TB', NULL, 'pset_01KTWFA1A9A43EW69342A3WRKA', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:12:05.962+03', '2026-06-12 02:32:23.78+03', '2026-06-12 02:32:23.777+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA7D3YW0C7PWVG74JBGXV', NULL, 'pset_01KTWFA1A9A43EW69342A3WRKA', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:12:12.216+03', '2026-06-12 02:32:23.78+03', '2026-06-12 02:32:23.777+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA7D4MJWPV9PXQ7CXZMKX', NULL, 'pset_01KTWFA1Y9Q4F5QAHFBZKBNJ6F', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:12:12.216+03', '2026-06-12 02:32:24.2+03', '2026-06-12 02:32:24.195+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA7D6PPP8T7A7P1CWEKXH', NULL, 'pset_01KTWFA2V0J5CFVBPBF5WVB9D2', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:12:12.216+03', '2026-06-12 02:32:24.634+03', '2026-06-12 02:32:24.631+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA3FZC14GZRC42N13ZADZ', NULL, 'pset_01KTWFA3FZZG7HKECS2QR45C08', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:12:08.191+03', '2026-06-12 02:32:24.928+03', '2026-06-12 02:32:24.926+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA7D7XATJ99J9P8WV5PT7', NULL, 'pset_01KTWFA3FZZG7HKECS2QR45C08', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:12:12.216+03', '2026-06-12 02:32:24.928+03', '2026-06-12 02:32:24.926+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA7D8X04374Z8RY8W1PE8', NULL, 'pset_01KTWFA47N58QN02RT8MB4RGA6', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:12:12.216+03', '2026-06-12 02:32:25.164+03', '2026-06-12 02:32:25.16+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA54X9FSQB46TH57AMG4P', NULL, 'pset_01KTWFA54XPMSWSXQTS3SJ032F', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 02:12:09.886+03', '2026-06-12 02:32:25.347+03', '2026-06-12 02:32:25.344+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA7DAP3GM2FGVVP52GPCH', NULL, 'pset_01KTWFA54XPMSWSXQTS3SJ032F', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:12:12.217+03', '2026-06-12 02:32:25.347+03', '2026-06-12 02:32:25.344+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWFA7DB4AGK4MGEKZMSCV5V', NULL, 'pset_01KTWFA5ZR19YRD8TTS409W8DD', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:12:12.217+03', '2026-06-12 02:32:25.5+03', '2026-06-12 02:32:25.495+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGHGHZPH3PMPPX6B0GSPS9', NULL, 'pset_01KTWGHF7R16GFKXN00TM81ARP', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:33:39.518486+03', '2026-06-12 02:35:56.422+03', '2026-06-12 02:35:56.418+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGHGHZX5H2ZGNH7ME7HT3X', NULL, 'pset_01KTWGHFC8TS4D4P6FPWSB0KWJ', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:33:39.518486+03', '2026-06-12 02:35:56.793+03', '2026-06-12 02:35:56.788+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWGHGHZQ1BH2DNX7V01AJSZ', NULL, 'pset_01KTWGHFJ5ES5XYEDE3KFDBVKJ', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 02:33:39.518486+03', '2026-06-12 02:35:57.075+03', '2026-06-12 02:35:57.07+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22EPWS1CYASH0HA0XM9TND', NULL, 'pset_01KV22EPWS7KAXREX5SQKDEZ07', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 06:22:54.233+03', '2026-06-14 06:22:54.233+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22EQ3ZM3CH4CYFEB46M3MA', NULL, 'pset_01KV22EQ403N3G05YPSHVE3TT2', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 06:22:54.464+03', '2026-06-14 06:22:54.464+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22EQCB2V5NJRPM4R5Z28CA', NULL, 'pset_01KV22EQCB5TK9AK28BPNZYVDY', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 06:22:54.731+03', '2026-06-14 06:22:54.731+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22EQNHBW94QZGAV2AM4EHP', NULL, 'pset_01KV22EQNHX33J79XTAM1JVWQF', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 06:22:55.025+03', '2026-06-14 06:22:55.025+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWMQ6BEGZZ2HB660V8J2F48', NULL, 'pset_01KTWMQ6BEKEM8JCK4RGE0N2NF', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 03:46:39.982+03', '2026-06-12 04:32:49.719+03', '2026-06-12 04:32:49.712+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWMQ6M0YPE1WCWRQZHN5SXB', NULL, 'pset_01KTWMQ6M0H5DSSXSVY63M4B66', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 03:46:40.257+03', '2026-06-12 04:32:50.576+03', '2026-06-12 04:32:50.569+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWMQ6XSJJ4X1QZRDY83WPNR', NULL, 'pset_01KTWMQ6XSF434KPHSWH224BXE', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 03:46:40.569+03', '2026-06-12 04:32:51.236+03', '2026-06-12 04:32:51.229+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWMQ74WY7CMAK082PNTPR32', NULL, 'pset_01KTWMQ74X79HCHZDJM5H8NJWT', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 03:46:40.797+03', '2026-06-12 04:32:51.428+03', '2026-06-12 04:32:51.42+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22EQWM43E9ET0PM5P6C6YS', NULL, 'pset_01KV22EQWNC9BTPKNBSVWQFFHC', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 06:22:55.253+03', '2026-06-14 06:22:55.253+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ER5AHERSE59HH9KNHD5K', NULL, 'pset_01KV22ER5A2YT2D2H59AQJX2CY', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 06:22:55.53+03', '2026-06-14 06:22:55.53+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ERM72SEFSSKQFFEHN3T2', NULL, 'pset_01KV22ERM7418HM043CPJMJ428', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 06:22:56.008+03', '2026-06-14 06:22:56.008+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ES06ZDFS4NMB2WXMQE1E', NULL, 'pset_01KV22ES06KXZ9J8896CSF6VQ3', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 06:22:56.39+03', '2026-06-14 06:22:56.39+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ES9BENANXSGN968SSDWF', NULL, 'pset_01KV22ES9BB74VH7DC9C21S0WE', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 06:22:56.684+03', '2026-06-14 06:22:56.684+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ESM1ZPQD64X3YN2EXAZ3', NULL, 'pset_01KV22ESM1SYT2NDYPBBSYQFE4', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 06:22:57.026+03', '2026-06-14 06:22:57.026+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ETDM06134W9H105HWGYN', NULL, 'pset_01KV22EP8RWV8WAZGYYN8YAFQ3', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 06:22:57.843509+03', '2026-06-14 06:22:57.843509+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ETDMYVAQYDHN3ZR80E1Z', NULL, 'pset_01KV22EPC9DWEZQH8265AM53MH', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 06:22:57.843509+03', '2026-06-14 06:22:57.843509+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ETDM4YMG9XG59F02EP8S', NULL, 'pset_01KV22EPFTSK2SN9W0JP27R0RR', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 06:22:57.843509+03', '2026-06-14 06:22:57.843509+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ETDN5R1ZZEH5SQYA7N7P', NULL, 'pset_01KV22EPKF3CEKW75MPR3ZXYF9', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 06:22:57.843509+03', '2026-06-14 06:22:57.843509+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ETDN3SMDM9NB2KKR4SGF', NULL, 'pset_01KV22EPQWH9ZK18WXKYX9YJH8', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 06:22:57.843509+03', '2026-06-14 06:22:57.843509+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ETDNNAX2FXMNVV8SNAYT', NULL, 'pset_01KV22EPWS7KAXREX5SQKDEZ07', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 06:22:57.843509+03', '2026-06-14 06:22:57.843509+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ETDNN0THAAJ6YHV9CTCE', NULL, 'pset_01KV22EQ403N3G05YPSHVE3TT2', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 06:22:57.843509+03', '2026-06-14 06:22:57.843509+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ETDNAW1EZBT0BGDJ5DZM', NULL, 'pset_01KV22EQCB5TK9AK28BPNZYVDY', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 06:22:57.843509+03', '2026-06-14 06:22:57.843509+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ETDPJ4SF6GWMDW967E36', NULL, 'pset_01KV22EQNHX33J79XTAM1JVWQF', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 06:22:57.843509+03', '2026-06-14 06:22:57.843509+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ETDPEM4NF812AZAGSGYA', NULL, 'pset_01KV22EQWNC9BTPKNBSVWQFFHC', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 06:22:57.843509+03', '2026-06-14 06:22:57.843509+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ETDP22R4BRHJBPB1EY90', NULL, 'pset_01KV22ER5A2YT2D2H59AQJX2CY', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 06:22:57.843509+03', '2026-06-14 06:22:57.843509+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWMQ5ZJPZ0HPG71Z1RQCCJE', NULL, 'pset_01KTWMQ5ZJAPQM2RC25WK8X138', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 03:46:39.603+03', '2026-06-12 04:32:47.901+03', '2026-06-12 04:32:47.886+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWMQ7TVM50QCFYYGQ5W0TM9', NULL, 'pset_01KTWMQ5ZJAPQM2RC25WK8X138', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 03:46:41.497785+03', '2026-06-12 04:32:47.901+03', '2026-06-12 04:32:47.886+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWMQ7TW18A04GM49M60PVHM', NULL, 'pset_01KTWMQ639Y207FVX308K5ZV11', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 03:46:41.497785+03', '2026-06-12 04:32:48.715+03', '2026-06-12 04:32:48.708+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWMQ7TWGCE70NWP44V453PY', NULL, 'pset_01KTWMQ671K39YE08TBA41TXH2', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 03:46:41.497785+03', '2026-06-12 04:32:49.383+03', '2026-06-12 04:32:49.372+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWMQ7TWQXFSJ6DJQYBAEKJ0', NULL, 'pset_01KTWMQ6BEKEM8JCK4RGE0N2NF', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 03:46:41.497785+03', '2026-06-12 04:32:49.719+03', '2026-06-12 04:32:49.712+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWMQ6FNVFEEJ5S82437VZEW', NULL, 'pset_01KTWMQ6FPF4V47SVGNBE5ZS3F', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 03:46:40.118+03', '2026-06-12 04:32:50.243+03', '2026-06-12 04:32:50.229+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWMQ7TWH015HH1Q35PGW0SE', NULL, 'pset_01KTWMQ6FPF4V47SVGNBE5ZS3F', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 03:46:41.497785+03', '2026-06-12 04:32:50.243+03', '2026-06-12 04:32:50.229+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWMQ7TWP2MKX8QN64ZF4YFN', NULL, 'pset_01KTWMQ6M0H5DSSXSVY63M4B66', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 03:46:41.497785+03', '2026-06-12 04:32:50.576+03', '2026-06-12 04:32:50.569+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWMQ6RRT7E4N51TC2Z807NN', NULL, 'pset_01KTWMQ6RRE6V80JH26TJN5G3F', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 03:46:40.408+03', '2026-06-12 04:32:50.917+03', '2026-06-12 04:32:50.905+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWMQ7TWW6V93XK3VZKZVRZ6', NULL, 'pset_01KTWMQ6RRE6V80JH26TJN5G3F', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 03:46:41.497785+03', '2026-06-12 04:32:50.918+03', '2026-06-12 04:32:50.905+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWMQ7TXKH04RZWRCPHBKDZA', NULL, 'pset_01KTWMQ6XSF434KPHSWH224BXE', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 03:46:41.497785+03', '2026-06-12 04:32:51.237+03', '2026-06-12 04:32:51.229+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWMQ7TXYCA92QA16BFYXHEF', NULL, 'pset_01KTWMQ74X79HCHZDJM5H8NJWT', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 03:46:41.497785+03', '2026-06-12 04:32:51.428+03', '2026-06-12 04:32:51.42+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWQBSHHGS8WDZWWRY93HERC', NULL, 'pset_01KTWQBSHHA1QE07HA12TWR0N7', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 04:32:52.146+03', '2026-06-12 04:32:52.146+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWQBSSW4284THKN11460QVH', NULL, 'pset_01KTWQBSSWZPJ1Z5YMVQ471RH6', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 04:32:52.413+03', '2026-06-12 04:32:52.413+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWQBT4WYHKTR74SFG7ZSBTT', NULL, 'pset_01KTWQBT4WFYAZ37JNSS17RZFK', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 04:32:52.765+03', '2026-06-12 04:32:52.765+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWQBTE6G3B3DK0EA2B0FMEN', NULL, 'pset_01KTWQBTE6Y1HEF028Z0J9M9BB', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 04:32:53.063+03', '2026-06-12 04:32:53.063+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWQBTVCNA4H6B97613N9CQS', NULL, 'pset_01KTWQBTVC52RJ72DYGQWKBWFQ', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 04:32:53.485+03', '2026-06-12 04:32:53.485+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWQBV68Q92NK596W5JD0JD5', NULL, 'pset_01KTWQBV685P42NCX2V332MCKJ', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 04:32:53.833+03', '2026-06-12 04:32:53.833+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWQBVMHZ6W9RNT9FSP7S496', NULL, 'pset_01KTWQBVMH6TZGGS0SZ9J1FSZX', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 04:32:54.29+03', '2026-06-12 04:32:54.29+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWQBW0ZD3EDYNSE48AB9665', NULL, 'pset_01KTWQBW10TQK6W5XTS6F7BH01', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 04:32:54.688+03', '2026-06-12 04:32:54.688+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWQBWFYHT3VR7BJT0ZC5TXH', NULL, 'pset_01KTWQBWFZCY41HZAQW5BY3832', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-12 04:32:55.167+03', '2026-06-12 04:32:55.167+03', NULL, NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWQBXZ88KH3B1P60F9K9ZYY', NULL, 'pset_01KTWQBSHHA1QE07HA12TWR0N7', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 04:32:56.677613+03', '2026-06-12 04:32:56.677613+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWQBXZ9JSMCCK8316J4HQRW', NULL, 'pset_01KTWQBSSWZPJ1Z5YMVQ471RH6', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 04:32:56.677613+03', '2026-06-12 04:32:56.677613+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWQBXZ91ZJGGPJNKRXHSXCC', NULL, 'pset_01KTWQBT4WFYAZ37JNSS17RZFK', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 04:32:56.677613+03', '2026-06-12 04:32:56.677613+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWQBXZAECNT47GQ32AR8ESZ', NULL, 'pset_01KTWQBTE6Y1HEF028Z0J9M9BB', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 04:32:56.677613+03', '2026-06-12 04:32:56.677613+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWQBXZBEDZFH7E8PRQX7815', NULL, 'pset_01KTWQBTVC52RJ72DYGQWKBWFQ', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 04:32:56.677613+03', '2026-06-12 04:32:56.677613+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWQBXZBVW1SH3GMYHXSWQ8F', NULL, 'pset_01KTWQBV685P42NCX2V332MCKJ', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 04:32:56.677613+03', '2026-06-12 04:32:56.677613+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWQBXZC3B5DQHF5J7XEKTPG', NULL, 'pset_01KTWQBVMH6TZGGS0SZ9J1FSZX', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 04:32:56.677613+03', '2026-06-12 04:32:56.677613+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWQBXZCRWJXF955CKCC3EQS', NULL, 'pset_01KTWQBW10TQK6W5XTS6F7BH01', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 04:32:56.677613+03', '2026-06-12 04:32:56.677613+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KTWQBXZDZHQ4JYN5MZJWGT9J', NULL, 'pset_01KTWQBWFZCY41HZAQW5BY3832', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-12 04:32:56.677613+03', '2026-06-12 04:32:56.677613+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_so_std_try', NULL, 'pset_01KTSXRB2DFTFH69FT3KSKE8T6', 'try', '{"value": "0", "precision": 20}', 0, '2026-06-12 04:56:18.128535+03', '2026-06-12 04:56:18.128535+03', NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_so_exp_try', NULL, 'pset_01KTSXRB2G7ARK37GDXS2FWQNN', 'try', '{"value": "0", "precision": 20}', 0, '2026-06-12 04:56:18.183368+03', '2026-06-12 04:56:18.183368+03', NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNT5SZ0J7HA2S8GHW329N', NULL, 'pset_01KV1YNT5SN4NKSEREZ8EW5KPK', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:16:52.665+03', '2026-06-14 06:22:49.696+03', '2026-06-14 06:22:49.693+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNTC9DTB149E2CHRBP5ZT', NULL, 'pset_01KV1YNTCADKFHYC9VW55V4HDR', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:16:52.874+03', '2026-06-14 06:22:50.208+03', '2026-06-14 06:22:50.202+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXB9FVE8HCVYPC25QVCPW', NULL, 'pset_01KV1XXB9FMPTBZAF7942DP59T', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:48.993+03', '2026-06-14 05:16:48.987+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXCCCH84D0DP4E4K6P5CH', NULL, 'pset_01KV1XXB9FMPTBZAF7942DP59T', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:03:32.106886+03', '2026-06-14 05:16:48.993+03', '2026-06-14 05:16:48.987+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXB9F0VBJ6WPH8TEH3RF9', NULL, 'pset_01KV1XXB9FRXYQ4ZQKQ4S5N7Y8', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:49.408+03', '2026-06-14 05:16:49.403+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXCCDJBD068XRVJQAFQA7', NULL, 'pset_01KV1XXB9FRXYQ4ZQKQ4S5N7Y8', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:03:32.106886+03', '2026-06-14 05:16:49.408+03', '2026-06-14 05:16:49.403+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXB9FHZGRJP7YHZVGXQT5', NULL, 'pset_01KV1XXB9F4KW4KP7AW2PH6WA5', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:49.821+03', '2026-06-14 05:16:49.815+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXCCE16VE065MEA1NRT0T', NULL, 'pset_01KV1XXB9F4KW4KP7AW2PH6WA5', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:03:32.106886+03', '2026-06-14 05:16:49.821+03', '2026-06-14 05:16:49.815+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXB9G4CV6WK440QPV39Y2', NULL, 'pset_01KV1XXB9G10YC207VS87FQW1R', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:50.209+03', '2026-06-14 05:16:50.204+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXCCEN5RNPAQR4AQG9PBX', NULL, 'pset_01KV1XXB9G10YC207VS87FQW1R', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:03:32.106886+03', '2026-06-14 05:16:50.209+03', '2026-06-14 05:16:50.204+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXB9G4MESD47VBXRJVVDX', NULL, 'pset_01KV1XXB9GVFVAPK8DGZDSME7J', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:50.469+03', '2026-06-14 05:16:50.465+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXCCE7GVV00QP0BSYZ0MV', NULL, 'pset_01KV1XXB9GVFVAPK8DGZDSME7J', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:03:32.106886+03', '2026-06-14 05:16:50.469+03', '2026-06-14 05:16:50.465+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXB9GA5S4JNHF2G806QZS', NULL, 'pset_01KV1XXB9G1ZY2DZEYM15VMGCR', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:50.719+03', '2026-06-14 05:16:50.715+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXCCF5QA26VB9GQXSJRWB', NULL, 'pset_01KV1XXB9G1ZY2DZEYM15VMGCR', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:03:32.106886+03', '2026-06-14 05:16:50.719+03', '2026-06-14 05:16:50.715+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXB9GJX9YNWJT93TYSYK8', NULL, 'pset_01KV1XXB9G2DW36VTGNEQWXA6K', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:50.993+03', '2026-06-14 05:16:50.987+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXCCF3CT7K5MBQEQT8GC2', NULL, 'pset_01KV1XXB9G2DW36VTGNEQWXA6K', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:03:32.106886+03', '2026-06-14 05:16:50.993+03', '2026-06-14 05:16:50.987+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXB9GKG0315GW05DQB4P3', NULL, 'pset_01KV1XXB9GCXSB96DCPB8PN76B', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:51.256+03', '2026-06-14 05:16:51.253+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXCCFWNJFTJ43KXMR0S6J', NULL, 'pset_01KV1XXB9GCXSB96DCPB8PN76B', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:03:32.106886+03', '2026-06-14 05:16:51.257+03', '2026-06-14 05:16:51.253+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXB9G1CFH89C34K5TRP32', NULL, 'pset_01KV1XXB9H09PNZK9W1W99FHC4', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:51.457+03', '2026-06-14 05:16:51.453+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXCCGNCV9SHY3BGSGV7JN', NULL, 'pset_01KV1XXB9H09PNZK9W1W99FHC4', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:03:32.106886+03', '2026-06-14 05:16:51.457+03', '2026-06-14 05:16:51.453+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXB9HX4M9RZGFE2J7P31X', NULL, 'pset_01KV1XXB9HZ9WPV7BN30R12964', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:51.634+03', '2026-06-14 05:16:51.628+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXCCGGY81WEG5EG6XHT8V', NULL, 'pset_01KV1XXB9HZ9WPV7BN30R12964', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:03:32.106886+03', '2026-06-14 05:16:51.634+03', '2026-06-14 05:16:51.628+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXB9HXC1355H9QG6CM25B', NULL, 'pset_01KV1XXB9HJ6HGK01T3KS4ARXJ', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:51.798+03', '2026-06-14 05:16:51.793+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXCCG1NJ4CCQGX5M0JYGM', NULL, 'pset_01KV1XXB9HJ6HGK01T3KS4ARXJ', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:03:32.106886+03', '2026-06-14 05:16:51.798+03', '2026-06-14 05:16:51.793+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXB9J8C4MRM13M3XNCQDH', NULL, 'pset_01KV1XXB9J07VSRNG8SQ79VHXF', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:51.947+03', '2026-06-14 05:16:51.942+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXCCGYC58DKJ2VEHGJ797', NULL, 'pset_01KV1XXB9J07VSRNG8SQ79VHXF', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:03:32.106886+03', '2026-06-14 05:16:51.947+03', '2026-06-14 05:16:51.942+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXB9JKRWMS51C7EYNFMAK', NULL, 'pset_01KV1XXB9JC8XA6FER63X1ZC3E', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:52.073+03', '2026-06-14 05:16:52.069+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXCCHFHB7N846FKTZW187', NULL, 'pset_01KV1XXB9JC8XA6FER63X1ZC3E', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:03:32.106886+03', '2026-06-14 05:16:52.073+03', '2026-06-14 05:16:52.069+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXB9JTGE33WQ2HR5P8Q8J', NULL, 'pset_01KV1XXB9J4S1C6G9C2AYXGJYJ', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:52.188+03', '2026-06-14 05:16:52.185+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXCCHB9ZQ3ER6FGE15D10', NULL, 'pset_01KV1XXB9J4S1C6G9C2AYXGJYJ', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:03:32.106886+03', '2026-06-14 05:16:52.188+03', '2026-06-14 05:16:52.185+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXB9J42G46JA0NHJ0DY8X', NULL, 'pset_01KV1XXB9JB8CMYDCYWT984XSR', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:52.288+03', '2026-06-14 05:16:52.282+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1XXCCH4MDN4XP2JVHTHY6P', NULL, 'pset_01KV1XXB9JB8CMYDCYWT984XSR', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:03:32.106886+03', '2026-06-14 05:16:52.288+03', '2026-06-14 05:16:52.282+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNY4CWSBSS9PSWBPQ67T2', NULL, 'pset_01KV1YNT22GKNG4M967A8GCG21', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:16:56.716217+03', '2026-06-14 06:22:49.067+03', '2026-06-14 06:22:49.061+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNY4CGC5H8BHP366WCJQF', NULL, 'pset_01KV1YNT5SN4NKSEREZ8EW5KPK', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:16:56.716217+03', '2026-06-14 06:22:49.696+03', '2026-06-14 06:22:49.693+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNY4DH3FRNVWMMVPKWWRT', NULL, 'pset_01KV1YNTCADKFHYC9VW55V4HDR', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:16:56.716217+03', '2026-06-14 06:22:50.208+03', '2026-06-14 06:22:50.202+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNTGTGZ14F1X4JHCV9N4Z', NULL, 'pset_01KV1YNTGTJTHKJYQNSS1J0M0R', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:16:53.018+03', '2026-06-14 06:22:50.725+03', '2026-06-14 06:22:50.72+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNY4D3ZEPYQCJTA6XPVQY', NULL, 'pset_01KV1YNTGTJTHKJYQNSS1J0M0R', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:16:56.716217+03', '2026-06-14 06:22:50.725+03', '2026-06-14 06:22:50.72+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNTSG68H18GKMFW5GB52F', NULL, 'pset_01KV1YNTSGZM0XBDA8V1P4N7X5', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:16:53.297+03', '2026-06-14 06:22:51.046+03', '2026-06-14 06:22:51.041+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNY4DCQR87Y37XVVR7E6Z', NULL, 'pset_01KV1YNTSGZM0XBDA8V1P4N7X5', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:16:56.716217+03', '2026-06-14 06:22:51.046+03', '2026-06-14 06:22:51.041+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNV2TZR72ACXCY3QX0FR1', NULL, 'pset_01KV1YNV2T1J0YAJ1V465BT3Y7', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:16:53.595+03', '2026-06-14 06:22:51.351+03', '2026-06-14 06:22:51.348+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNY4DJASC0WN0V8MDSAYX', NULL, 'pset_01KV1YNV2T1J0YAJ1V465BT3Y7', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:16:56.716217+03', '2026-06-14 06:22:51.351+03', '2026-06-14 06:22:51.348+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNV8CR9G9EQHG4Z3Z52XM', NULL, 'pset_01KV1YNV8C2X0H7E9TCV9ES836', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:16:53.772+03', '2026-06-14 06:22:51.591+03', '2026-06-14 06:22:51.586+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNY4ECBC79G9NTBZ40XYK', NULL, 'pset_01KV1YNV8C2X0H7E9TCV9ES836', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:16:56.716217+03', '2026-06-14 06:22:51.591+03', '2026-06-14 06:22:51.586+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNVEB9KESCMAX62DH47BR', NULL, 'pset_01KV1YNVEBAZK6GG9JAMGQRDY1', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:16:53.963+03', '2026-06-14 06:22:51.823+03', '2026-06-14 06:22:51.818+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNY4EP8DQ6E96W9FNSNAP', NULL, 'pset_01KV1YNVEBAZK6GG9JAMGQRDY1', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:16:56.716217+03', '2026-06-14 06:22:51.823+03', '2026-06-14 06:22:51.818+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNVMJ1BK2H7TWHN4WE7YZ', NULL, 'pset_01KV1YNVMK2BXMKRGZA5SW45G9', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:16:54.163+03', '2026-06-14 06:22:52.067+03', '2026-06-14 06:22:52.059+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNY4EM3Y9JEMP2KG0R1RF', NULL, 'pset_01KV1YNVMK2BXMKRGZA5SW45G9', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:16:56.716217+03', '2026-06-14 06:22:52.067+03', '2026-06-14 06:22:52.059+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNVVC1R6K5QKNP61N7TR0', NULL, 'pset_01KV1YNVVDMDHVG3641R0H4H2A', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:16:54.381+03', '2026-06-14 06:22:52.434+03', '2026-06-14 06:22:52.429+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNY4EV5A1BXZXXKT5QK6J', NULL, 'pset_01KV1YNVVDMDHVG3641R0H4H2A', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:16:56.716217+03', '2026-06-14 06:22:52.434+03', '2026-06-14 06:22:52.429+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNW3EV6HX229PNSJ84EBQ', NULL, 'pset_01KV1YNW3EEC8S52KYY3P18N06', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:16:54.638+03', '2026-06-14 06:22:52.735+03', '2026-06-14 06:22:52.728+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNY4EQA2BYG3WGMW6KD67', NULL, 'pset_01KV1YNW3EEC8S52KYY3P18N06', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:16:56.716217+03', '2026-06-14 06:22:52.735+03', '2026-06-14 06:22:52.728+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNWBGH2E6MKANREB71KKT', NULL, 'pset_01KV1YNWBGDRZGA9G1KCH6K5TY', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:16:54.896+03', '2026-06-14 06:22:52.989+03', '2026-06-14 06:22:52.984+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNY4F4YAVWPA85J9QXEYR', NULL, 'pset_01KV1YNWBGDRZGA9G1KCH6K5TY', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:16:56.716217+03', '2026-06-14 06:22:52.989+03', '2026-06-14 06:22:52.984+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNWNBVDK7XFEQKCFJ3PGV', NULL, 'pset_01KV1YNWNCWEXDRK4G8MHDHTNR', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:16:55.212+03', '2026-06-14 06:22:53.135+03', '2026-06-14 06:22:53.132+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNY4F340TQVEMNH3Q7Z47', NULL, 'pset_01KV1YNWNCWEXDRK4G8MHDHTNR', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:16:56.716217+03', '2026-06-14 06:22:53.136+03', '2026-06-14 06:22:53.132+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNX0YD218NT0QWJBP7T2W', NULL, 'pset_01KV1YNX0YN95MEJGQR8NQPQSQ', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:16:55.582+03', '2026-06-14 06:22:53.25+03', '2026-06-14 06:22:53.247+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNY4FFQWNEHDDRE511HQ3', NULL, 'pset_01KV1YNX0YN95MEJGQR8NQPQSQ', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:16:56.716217+03', '2026-06-14 06:22:53.25+03', '2026-06-14 06:22:53.247+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNXADA1J0XQ67VC0JKJZV', NULL, 'pset_01KV1YNXAE9Y3E3XJEMXE78BFE', 'try', '{"value": "220000", "precision": 20}', 0, '2026-06-14 05:16:55.886+03', '2026-06-14 06:22:53.341+03', '2026-06-14 06:22:53.337+03', NULL, 220000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV1YNY4FPDPGTQA0CV3ZMP7D', NULL, 'pset_01KV1YNXAE9Y3E3XJEMXE78BFE', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 05:16:56.716217+03', '2026-06-14 06:22:53.341+03', '2026-06-14 06:22:53.337+03', 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ETDPZB3KBX6847P4M96J', NULL, 'pset_01KV22ERM7418HM043CPJMJ428', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 06:22:57.843509+03', '2026-06-14 06:22:57.843509+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ETDPCWQDC3AB4FEMKJ01', NULL, 'pset_01KV22ES06KXZ9J8896CSF6VQ3', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 06:22:57.843509+03', '2026-06-14 06:22:57.843509+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ETDQ8R82SBQQ3RTGXSZK', NULL, 'pset_01KV22ES9BB74VH7DC9C21S0WE', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 06:22:57.843509+03', '2026-06-14 06:22:57.843509+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);
INSERT INTO public.price VALUES ('price_01KV22ETDQ4VZ1E6F4ZB3438SW', NULL, 'pset_01KV22ESM1SYT2NDYPBBSYQFE4', 'try', '{"value": "120000", "precision": 20}', 0, '2026-06-14 06:22:57.843509+03', '2026-06-14 06:22:57.843509+03', NULL, 'plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 120000, NULL, NULL, NULL, NULL);


--
-- Data for Name: price_list; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.price_list VALUES ('plist_01KTWFA7DDH6KPDKAHCTQWMSSX', 'active', NULL, NULL, 0, 'Ürün İndirim Listesi', 'Ürün Yönetimi arayüzü tarafından otomatik oluşturulmuştur.', 'sale', '2026-06-12 02:12:12.209+03', '2026-06-12 02:12:12.209+03', NULL, NULL);


--
-- Data for Name: price_list_rule; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: price_preference; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.price_preference VALUES ('prpref_01KTSXRAJT1GR5TQ0V5M2E6GT2', 'currency_code', 'eur', false, '2026-06-11 02:26:50.971+03', '2026-06-11 02:26:50.971+03', NULL);
INSERT INTO public.price_preference VALUES ('prpref_01KTSXRAJV17XJ9EQK6M6CFWDZ', 'currency_code', 'usd', false, '2026-06-11 02:26:50.972+03', '2026-06-11 02:26:50.972+03', NULL);
INSERT INTO public.price_preference VALUES ('prpref_01KTSXRAQ8XGFD6F7H5R7KDCA6', 'region_id', 'reg_01KTSXRAKEE634P20BK48VVW24', false, '2026-06-11 02:26:51.112+03', '2026-06-11 02:26:51.112+03', NULL);


--
-- Data for Name: price_rule; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.price_rule VALUES ('prule_01KTSXRB2CPA909JMNKVHPSK7G', 'reg_01KTSXRAKEE634P20BK48VVW24', 0, 'price_01KTSXRB2DSFD60RPTTJ221GWH', '2026-06-11 02:26:51.475+03', '2026-06-11 02:26:51.475+03', NULL, 'region_id', 'eq');
INSERT INTO public.price_rule VALUES ('prule_01KTSXRB2F9PAF6CE980TD746Y', 'reg_01KTSXRAKEE634P20BK48VVW24', 0, 'price_01KTSXRB2FZRA99846SBDJX2CH', '2026-06-11 02:26:51.476+03', '2026-06-11 02:26:51.476+03', NULL, 'region_id', 'eq');


--
-- Data for Name: price_set; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.price_set VALUES ('pset_01KTSXRB2DFTFH69FT3KSKE8T6', '2026-06-11 02:26:51.473+03', '2026-06-11 02:26:51.473+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KTSXRB2G7ARK37GDXS2FWQNN', '2026-06-11 02:26:51.473+03', '2026-06-11 02:26:51.473+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KTWGF8H5D4CKDG0WTCYXQ3XV', '2026-06-12 02:32:25.765+03', '2026-06-12 02:33:36.765+03', '2026-06-12 02:33:36.765+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGF8MX2XJR0ATNVE61ZA2C', '2026-06-12 02:32:25.885+03', '2026-06-12 02:33:37.098+03', '2026-06-12 02:33:37.098+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGF8SK7H2737PZK49Q3CYG', '2026-06-12 02:32:26.036+03', '2026-06-12 02:33:37.363+03', '2026-06-12 02:33:37.363+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGF8ZA7GPFB99XEPCAKDJW', '2026-06-12 02:32:26.218+03', '2026-06-12 02:33:37.542+03', '2026-06-12 02:33:37.542+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGF9679VKZHZRAKJ4Z24KH', '2026-06-12 02:32:26.439+03', '2026-06-12 02:33:37.696+03', '2026-06-12 02:33:37.696+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGF9E4DP7Y7G4NSXWFNBT9', '2026-06-12 02:32:26.692+03', '2026-06-12 02:33:37.805+03', '2026-06-12 02:33:37.805+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGHF420T88D85BKQF8E5XH', '2026-06-12 02:33:38.05+03', '2026-06-12 02:35:55.827+03', '2026-06-12 02:35:55.827+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGHF7R16GFKXN00TM81ARP', '2026-06-12 02:33:38.168+03', '2026-06-12 02:35:56.418+03', '2026-06-12 02:35:56.418+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGHFC8TS4D4P6FPWSB0KWJ', '2026-06-12 02:33:38.313+03', '2026-06-12 02:35:56.789+03', '2026-06-12 02:35:56.788+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGHFJ5ES5XYEDE3KFDBVKJ', '2026-06-12 02:33:38.501+03', '2026-06-12 02:35:57.07+03', '2026-06-12 02:35:57.07+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGHFRX2MMD0VNJ7N6H1075', '2026-06-12 02:33:38.717+03', '2026-06-12 02:35:57.321+03', '2026-06-12 02:35:57.321+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGHG18DQ6BRWF7JXD4FZHN', '2026-06-12 02:33:38.984+03', '2026-06-12 02:35:57.478+03', '2026-06-12 02:35:57.478+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBY2R0W9QH9H1JXBP730', '2026-06-11 02:26:52.369+03', '2026-06-11 17:53:57.004+03', '2026-06-11 17:53:56.993+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBY4A1ZVQFAE79T2JTEH', '2026-06-11 02:26:52.369+03', '2026-06-11 17:53:57.333+03', '2026-06-11 17:53:56.993+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBY5XW53P1YSPW8HFH4P', '2026-06-11 02:26:52.369+03', '2026-06-11 17:53:57.364+03', '2026-06-11 17:53:56.993+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBY6QRXZ6SRG8MS8NNEP', '2026-06-11 02:26:52.369+03', '2026-06-11 17:53:57.392+03', '2026-06-11 17:53:56.993+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGNQK15ZBE79Q6H6D2356J', '2026-06-12 02:35:57.793+03', '2026-06-12 03:36:46.336+03', '2026-06-12 03:36:46.336+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGNQR7F3BSEH0MKG1DAHYY', '2026-06-12 02:35:57.96+03', '2026-06-12 03:36:46.566+03', '2026-06-12 03:36:46.565+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGNQZ2EJBZCMSP72VZ82H5', '2026-06-12 02:35:58.179+03', '2026-06-12 03:36:46.791+03', '2026-06-12 03:36:46.791+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGNR7JWABP7SBCMA3WH3R5', '2026-06-12 02:35:58.45+03', '2026-06-12 03:36:46.95+03', '2026-06-12 03:36:46.95+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGNRHJ61809N5RKNHVSM2J', '2026-06-12 02:35:58.77+03', '2026-06-12 03:36:47.081+03', '2026-06-12 03:36:47.08+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGNRZHCVTG3FXBFG1GNEGW', '2026-06-12 02:35:59.217+03', '2026-06-12 03:36:47.232+03', '2026-06-12 03:36:47.232+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGNSE4RJE379KMQW70J5EJ', '2026-06-12 02:35:59.684+03', '2026-06-12 03:36:47.366+03', '2026-06-12 03:36:47.366+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGNSY0YPJR3578PDHXPHD0', '2026-06-12 02:36:00.192+03', '2026-06-12 03:36:47.464+03', '2026-06-12 03:36:47.463+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBXS5XG7ZT3E7G6YBA88', '2026-06-11 02:26:52.369+03', '2026-06-11 17:57:07.75+03', '2026-06-11 17:57:07.749+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBXTWE4VA4FK4PW7NWCK', '2026-06-11 02:26:52.369+03', '2026-06-11 17:57:07.798+03', '2026-06-11 17:57:07.749+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBXVFTCMHG4G6BVW4KG1', '2026-06-11 02:26:52.369+03', '2026-06-11 17:57:07.819+03', '2026-06-11 17:57:07.749+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBXXFJX977TXEHFCPD8A', '2026-06-11 02:26:52.369+03', '2026-06-11 17:57:07.838+03', '2026-06-11 17:57:07.749+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBXYTHPS5F140TF75QPS', '2026-06-11 02:26:52.369+03', '2026-06-11 17:57:07.857+03', '2026-06-11 17:57:07.749+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBXZAXKKBD94R97Z6739', '2026-06-11 02:26:52.369+03', '2026-06-11 17:57:07.878+03', '2026-06-11 17:57:07.749+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBY0PGP72A6MJCT31JXX', '2026-06-11 02:26:52.369+03', '2026-06-11 17:57:07.897+03', '2026-06-11 17:57:07.749+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBY14T0KJHTZ07SVA6QV', '2026-06-11 02:26:52.369+03', '2026-06-11 17:57:07.916+03', '2026-06-11 17:57:07.749+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBY70DRD8VMX8A1CMW94', '2026-06-11 02:26:52.369+03', '2026-06-11 17:57:11.942+03', '2026-06-11 17:57:11.941+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBY8HSJWQHT50GJV7ANH', '2026-06-11 02:26:52.369+03', '2026-06-11 17:57:11.969+03', '2026-06-11 17:57:11.941+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBY92YKAVKD7NQ5Z5Z0G', '2026-06-11 02:26:52.37+03', '2026-06-11 17:57:12+03', '2026-06-11 17:57:11.941+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBYAKNWSAH7VXHMSXQZB', '2026-06-11 02:26:52.37+03', '2026-06-11 17:57:12.035+03', '2026-06-11 17:57:11.941+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBYBKQ8MCVZAKFNZRHG6', '2026-06-11 02:26:52.37+03', '2026-06-11 17:57:16.439+03', '2026-06-11 17:57:16.439+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBYC4KGKCTVJAYP4AZGM', '2026-06-11 02:26:52.37+03', '2026-06-11 17:57:16.514+03', '2026-06-11 17:57:16.439+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBYDABPA8XETG854MB12', '2026-06-11 02:26:52.37+03', '2026-06-11 17:57:16.535+03', '2026-06-11 17:57:16.439+03');
INSERT INTO public.price_set VALUES ('pset_01KTSXRBYEMDGTPF0YKHTHBE2T', '2026-06-11 02:26:52.37+03', '2026-06-11 17:57:16.553+03', '2026-06-11 17:57:16.439+03');
INSERT INTO public.price_set VALUES ('pset_01KTVJYPJTG7BEG9AVQV2PQSAZ', '2026-06-11 17:56:34.414+03', '2026-06-12 02:11:51.885+03', '2026-06-12 02:11:51.884+03');
INSERT INTO public.price_set VALUES ('pset_01KTVJYPJVQ1NAEK0RS2J5JCXH', '2026-06-11 17:56:34.414+03', '2026-06-12 02:11:51.891+03', '2026-06-12 02:11:51.884+03');
INSERT INTO public.price_set VALUES ('pset_01KTVJYPJX155C53YRW0C1J5KC', '2026-06-11 17:56:34.414+03', '2026-06-12 02:11:51.894+03', '2026-06-12 02:11:51.884+03');
INSERT INTO public.price_set VALUES ('pset_01KTVJYPJYM90C9G070PTPC9DP', '2026-06-11 17:56:34.414+03', '2026-06-12 02:11:51.897+03', '2026-06-12 02:11:51.884+03');
INSERT INTO public.price_set VALUES ('pset_01KTVJYPJZ663TPZ5BAPK73G98', '2026-06-11 17:56:34.414+03', '2026-06-12 02:11:51.899+03', '2026-06-12 02:11:51.884+03');
INSERT INTO public.price_set VALUES ('pset_01KTVJYPJZFHT4J4KRRRRHY27F', '2026-06-11 17:56:34.414+03', '2026-06-12 02:11:51.902+03', '2026-06-12 02:11:51.884+03');
INSERT INTO public.price_set VALUES ('pset_01KTVJYPK077WXT9AQJMJQRQ04', '2026-06-11 17:56:34.414+03', '2026-06-12 02:11:51.905+03', '2026-06-12 02:11:51.884+03');
INSERT INTO public.price_set VALUES ('pset_01KTVJYPK0X5823D07JSJP3N56', '2026-06-11 17:56:34.414+03', '2026-06-12 02:11:51.909+03', '2026-06-12 02:11:51.884+03');
INSERT INTO public.price_set VALUES ('pset_01KTVJYPK1S6077PRCE4VAWJAX', '2026-06-11 17:56:34.414+03', '2026-06-12 02:11:51.912+03', '2026-06-12 02:11:51.884+03');
INSERT INTO public.price_set VALUES ('pset_01KTVJYPK24ADHD9D1S19ZHFDP', '2026-06-11 17:56:34.415+03', '2026-06-12 02:11:51.914+03', '2026-06-12 02:11:51.884+03');
INSERT INTO public.price_set VALUES ('pset_01KTVJYPK2R3VC7TRRXSMXBR4Y', '2026-06-11 17:56:34.415+03', '2026-06-12 02:11:51.916+03', '2026-06-12 02:11:51.884+03');
INSERT INTO public.price_set VALUES ('pset_01KTVJYPK3NDJFYHESVC38HHC4', '2026-06-11 17:56:34.415+03', '2026-06-12 02:11:51.918+03', '2026-06-12 02:11:51.884+03');
INSERT INTO public.price_set VALUES ('pset_01KTVJYPK3P4Q61AKQE1ZHE7J7', '2026-06-11 17:56:34.415+03', '2026-06-12 02:11:51.92+03', '2026-06-12 02:11:51.884+03');
INSERT INTO public.price_set VALUES ('pset_01KTVJYPK4GAK6W0B976130YF9', '2026-06-11 17:56:34.415+03', '2026-06-12 02:11:51.925+03', '2026-06-12 02:11:51.884+03');
INSERT INTO public.price_set VALUES ('pset_01KTVJYPK42PW38XQP7QRBZP02', '2026-06-11 17:56:34.415+03', '2026-06-12 02:11:51.927+03', '2026-06-12 02:11:51.884+03');
INSERT INTO public.price_set VALUES ('pset_01KTWGNTQ1QT0HTHCWANG7AH4A', '2026-06-12 02:36:00.993+03', '2026-06-12 03:36:47.553+03', '2026-06-12 03:36:47.553+03');
INSERT INTO public.price_set VALUES ('pset_01KTWM54556GWH716AMJFXRM60', '2026-06-12 03:36:47.909+03', '2026-06-12 03:46:38.163+03', '2026-06-12 03:46:38.162+03');
INSERT INTO public.price_set VALUES ('pset_01KTWM54C6CH2FC6PQ7SNAZMK8', '2026-06-12 03:36:48.134+03', '2026-06-12 03:46:38.724+03', '2026-06-12 03:46:38.724+03');
INSERT INTO public.price_set VALUES ('pset_01KTWM54G19J34A9C8VV5GWF18', '2026-06-12 03:36:48.257+03', '2026-06-12 03:46:38.864+03', '2026-06-12 03:46:38.864+03');
INSERT INTO public.price_set VALUES ('pset_01KTWM54KY0PSDKSKDJ11N2T64', '2026-06-12 03:36:48.382+03', '2026-06-12 03:46:38.987+03', '2026-06-12 03:46:38.986+03');
INSERT INTO public.price_set VALUES ('pset_01KTWM54REMBFDJ6EH844VWKD9', '2026-06-12 03:36:48.526+03', '2026-06-12 03:46:39.105+03', '2026-06-12 03:46:39.105+03');
INSERT INTO public.price_set VALUES ('pset_01KTWM54X6CWPRTCBARR6ZTQAK', '2026-06-12 03:36:48.678+03', '2026-06-12 03:46:39.214+03', '2026-06-12 03:46:39.214+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9KMBNJY9VJVCFMXQXYJG', '2026-06-12 02:11:51.951+03', '2026-06-12 02:11:53.224+03', '2026-06-12 02:11:53.223+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9KMCHNDEPMW5XY0N6F6W', '2026-06-12 02:11:51.951+03', '2026-06-12 02:11:54.097+03', '2026-06-12 02:11:54.097+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9KMCRQDHB0TTY7YGJZMR', '2026-06-12 02:11:51.951+03', '2026-06-12 02:11:55.092+03', '2026-06-12 02:11:55.091+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9KMCZ9S0JNRP1BYFB5CV', '2026-06-12 02:11:51.951+03', '2026-06-12 02:11:56.275+03', '2026-06-12 02:11:56.275+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9KMCFNT3VTTZXP3J3C42', '2026-06-12 02:11:51.951+03', '2026-06-12 02:11:57.263+03', '2026-06-12 02:11:57.263+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9KMCRA47ANFBRE38S0YV', '2026-06-12 02:11:51.951+03', '2026-06-12 02:11:58.132+03', '2026-06-12 02:11:58.132+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9KMDYFTNGTGFZFDFP5T0', '2026-06-12 02:11:51.951+03', '2026-06-12 02:11:58.875+03', '2026-06-12 02:11:58.875+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9KME6DDHP141S0XX15JA', '2026-06-12 02:11:51.951+03', '2026-06-12 02:11:59.533+03', '2026-06-12 02:11:59.533+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9KMD1RE28A1M0VZXW0Q0', '2026-06-12 02:11:51.951+03', '2026-06-12 02:12:00.221+03', '2026-06-12 02:12:00.221+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9KMD9WZQ3NRG01GVNB0S', '2026-06-12 02:11:51.951+03', '2026-06-12 02:12:00.765+03', '2026-06-12 02:12:00.765+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9KMD3NS2K4SWP7B3NK1Y', '2026-06-12 02:11:51.951+03', '2026-06-12 02:12:01.248+03', '2026-06-12 02:12:01.247+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9KME7ET8J7R78V72CAJK', '2026-06-12 02:11:51.951+03', '2026-06-12 02:12:01.731+03', '2026-06-12 02:12:01.731+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9KME5W7PJEVT4RA35DAE', '2026-06-12 02:11:51.951+03', '2026-06-12 02:12:02.041+03', '2026-06-12 02:12:02.041+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9KMEW947JM0G4EAQBH5C', '2026-06-12 02:11:51.951+03', '2026-06-12 02:12:02.392+03', '2026-06-12 02:12:02.392+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9KMEHG5V3ZH5HX0F8W8R', '2026-06-12 02:11:51.951+03', '2026-06-12 02:12:02.516+03', '2026-06-12 02:12:02.516+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9Y8BY1SFAY96KD96SK7N', '2026-06-12 02:12:02.827+03', '2026-06-12 02:32:17.147+03', '2026-06-12 02:32:17.147+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9YCFSBG30M6TG6D70DTQ', '2026-06-12 02:12:02.959+03', '2026-06-12 02:32:18.475+03', '2026-06-12 02:32:18.475+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9YJJ79DRTDS7PS08KHRZ', '2026-06-12 02:12:03.154+03', '2026-06-12 02:32:19.4+03', '2026-06-12 02:32:19.399+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9YXXJJ24HPDE8D51T9MQ', '2026-06-12 02:12:03.517+03', '2026-06-12 02:32:20.712+03', '2026-06-12 02:32:20.712+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9Z8M54SVV4GG9E8V81MS', '2026-06-12 02:12:03.861+03', '2026-06-12 02:32:21.502+03', '2026-06-12 02:32:21.502+03');
INSERT INTO public.price_set VALUES ('pset_01KTWF9ZT94B4XYBQCJATY05V9', '2026-06-12 02:12:04.425+03', '2026-06-12 02:32:22.181+03', '2026-06-12 02:32:22.181+03');
INSERT INTO public.price_set VALUES ('pset_01KTWFA086VZ9JG6CQ8KEV62BR', '2026-06-12 02:12:04.87+03', '2026-06-12 02:32:22.774+03', '2026-06-12 02:32:22.774+03');
INSERT INTO public.price_set VALUES ('pset_01KTWFA0Q59GNP7K8T34BHSAN4', '2026-06-12 02:12:05.35+03', '2026-06-12 02:32:23.316+03', '2026-06-12 02:32:23.316+03');
INSERT INTO public.price_set VALUES ('pset_01KTWFA1A9A43EW69342A3WRKA', '2026-06-12 02:12:05.961+03', '2026-06-12 02:32:23.777+03', '2026-06-12 02:32:23.777+03');
INSERT INTO public.price_set VALUES ('pset_01KTWFA1Y9Q4F5QAHFBZKBNJ6F', '2026-06-12 02:12:06.601+03', '2026-06-12 02:32:24.195+03', '2026-06-12 02:32:24.195+03');
INSERT INTO public.price_set VALUES ('pset_01KTWFA2V0J5CFVBPBF5WVB9D2', '2026-06-12 02:12:07.52+03', '2026-06-12 02:32:24.631+03', '2026-06-12 02:32:24.631+03');
INSERT INTO public.price_set VALUES ('pset_01KTWFA3FZZG7HKECS2QR45C08', '2026-06-12 02:12:08.191+03', '2026-06-12 02:32:24.926+03', '2026-06-12 02:32:24.926+03');
INSERT INTO public.price_set VALUES ('pset_01KTWFA47N58QN02RT8MB4RGA6', '2026-06-12 02:12:08.949+03', '2026-06-12 02:32:25.16+03', '2026-06-12 02:32:25.16+03');
INSERT INTO public.price_set VALUES ('pset_01KTWFA54XPMSWSXQTS3SJ032F', '2026-06-12 02:12:09.885+03', '2026-06-12 02:32:25.344+03', '2026-06-12 02:32:25.344+03');
INSERT INTO public.price_set VALUES ('pset_01KTWFA5ZR19YRD8TTS409W8DD', '2026-06-12 02:12:10.744+03', '2026-06-12 02:32:25.495+03', '2026-06-12 02:32:25.495+03');
INSERT INTO public.price_set VALUES ('pset_01KTWM541NH9N2CWECE42K5V9F', '2026-06-12 03:36:47.797+03', '2026-06-12 03:46:37.883+03', '2026-06-12 03:46:37.883+03');
INSERT INTO public.price_set VALUES ('pset_01KTWM548Y61Z3NFDM1EJFX26N', '2026-06-12 03:36:48.03+03', '2026-06-12 03:46:38.555+03', '2026-06-12 03:46:38.555+03');
INSERT INTO public.price_set VALUES ('pset_01KTWM5536MPKYEC6R4KT4VM60', '2026-06-12 03:36:48.87+03', '2026-06-12 03:46:39.313+03', '2026-06-12 03:46:39.313+03');
INSERT INTO public.price_set VALUES ('pset_01KTWMQ5ZJAPQM2RC25WK8X138', '2026-06-12 03:46:39.603+03', '2026-06-12 04:32:47.887+03', '2026-06-12 04:32:47.886+03');
INSERT INTO public.price_set VALUES ('pset_01KTWMQ639Y207FVX308K5ZV11', '2026-06-12 03:46:39.721+03', '2026-06-12 04:32:48.708+03', '2026-06-12 04:32:48.708+03');
INSERT INTO public.price_set VALUES ('pset_01KTWMQ671K39YE08TBA41TXH2', '2026-06-12 03:46:39.841+03', '2026-06-12 04:32:49.373+03', '2026-06-12 04:32:49.372+03');
INSERT INTO public.price_set VALUES ('pset_01KTWMQ6BEKEM8JCK4RGE0N2NF', '2026-06-12 03:46:39.982+03', '2026-06-12 04:32:49.712+03', '2026-06-12 04:32:49.712+03');
INSERT INTO public.price_set VALUES ('pset_01KTWMQ6FPF4V47SVGNBE5ZS3F', '2026-06-12 03:46:40.118+03', '2026-06-12 04:32:50.229+03', '2026-06-12 04:32:50.229+03');
INSERT INTO public.price_set VALUES ('pset_01KTWMQ6M0H5DSSXSVY63M4B66', '2026-06-12 03:46:40.256+03', '2026-06-12 04:32:50.569+03', '2026-06-12 04:32:50.569+03');
INSERT INTO public.price_set VALUES ('pset_01KTWMQ6RRE6V80JH26TJN5G3F', '2026-06-12 03:46:40.408+03', '2026-06-12 04:32:50.906+03', '2026-06-12 04:32:50.905+03');
INSERT INTO public.price_set VALUES ('pset_01KTWMQ6XSF434KPHSWH224BXE', '2026-06-12 03:46:40.569+03', '2026-06-12 04:32:51.229+03', '2026-06-12 04:32:51.229+03');
INSERT INTO public.price_set VALUES ('pset_01KTWMQ74X79HCHZDJM5H8NJWT', '2026-06-12 03:46:40.797+03', '2026-06-12 04:32:51.42+03', '2026-06-12 04:32:51.42+03');
INSERT INTO public.price_set VALUES ('pset_01KTWQBSHHA1QE07HA12TWR0N7', '2026-06-12 04:32:52.146+03', '2026-06-12 04:32:52.146+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KTWQBSSWZPJ1Z5YMVQ471RH6', '2026-06-12 04:32:52.413+03', '2026-06-12 04:32:52.413+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KTWQBT4WFYAZ37JNSS17RZFK', '2026-06-12 04:32:52.765+03', '2026-06-12 04:32:52.765+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KTWQBTE6Y1HEF028Z0J9M9BB', '2026-06-12 04:32:53.063+03', '2026-06-12 04:32:53.063+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KTWQBTVC52RJ72DYGQWKBWFQ', '2026-06-12 04:32:53.485+03', '2026-06-12 04:32:53.485+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KTWQBV685P42NCX2V332MCKJ', '2026-06-12 04:32:53.833+03', '2026-06-12 04:32:53.833+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KTWQBVMH6TZGGS0SZ9J1FSZX', '2026-06-12 04:32:54.29+03', '2026-06-12 04:32:54.29+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KTWQBW10TQK6W5XTS6F7BH01', '2026-06-12 04:32:54.688+03', '2026-06-12 04:32:54.688+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KTWQBWFZCY41HZAQW5BY3832', '2026-06-12 04:32:55.167+03', '2026-06-12 04:32:55.167+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KV1XXB9FMPTBZAF7942DP59T', '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:48.988+03', '2026-06-14 05:16:48.987+03');
INSERT INTO public.price_set VALUES ('pset_01KV1XXB9FRXYQ4ZQKQ4S5N7Y8', '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:49.404+03', '2026-06-14 05:16:49.403+03');
INSERT INTO public.price_set VALUES ('pset_01KV1XXB9F4KW4KP7AW2PH6WA5', '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:49.815+03', '2026-06-14 05:16:49.815+03');
INSERT INTO public.price_set VALUES ('pset_01KV1XXB9G10YC207VS87FQW1R', '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:50.205+03', '2026-06-14 05:16:50.204+03');
INSERT INTO public.price_set VALUES ('pset_01KV1XXB9GVFVAPK8DGZDSME7J', '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:50.466+03', '2026-06-14 05:16:50.465+03');
INSERT INTO public.price_set VALUES ('pset_01KV1XXB9G1ZY2DZEYM15VMGCR', '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:50.715+03', '2026-06-14 05:16:50.715+03');
INSERT INTO public.price_set VALUES ('pset_01KV1XXB9G2DW36VTGNEQWXA6K', '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:50.987+03', '2026-06-14 05:16:50.987+03');
INSERT INTO public.price_set VALUES ('pset_01KV1XXB9GCXSB96DCPB8PN76B', '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:51.253+03', '2026-06-14 05:16:51.253+03');
INSERT INTO public.price_set VALUES ('pset_01KV1XXB9H09PNZK9W1W99FHC4', '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:51.453+03', '2026-06-14 05:16:51.453+03');
INSERT INTO public.price_set VALUES ('pset_01KV1XXB9HZ9WPV7BN30R12964', '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:51.629+03', '2026-06-14 05:16:51.628+03');
INSERT INTO public.price_set VALUES ('pset_01KV1XXB9HJ6HGK01T3KS4ARXJ', '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:51.793+03', '2026-06-14 05:16:51.793+03');
INSERT INTO public.price_set VALUES ('pset_01KV1XXB9J07VSRNG8SQ79VHXF', '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:51.943+03', '2026-06-14 05:16:51.942+03');
INSERT INTO public.price_set VALUES ('pset_01KV1XXB9JC8XA6FER63X1ZC3E', '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:52.069+03', '2026-06-14 05:16:52.069+03');
INSERT INTO public.price_set VALUES ('pset_01KV1XXB9J4S1C6G9C2AYXGJYJ', '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:52.185+03', '2026-06-14 05:16:52.185+03');
INSERT INTO public.price_set VALUES ('pset_01KV1XXB9JB8CMYDCYWT984XSR', '2026-06-14 05:03:30.995+03', '2026-06-14 05:16:52.282+03', '2026-06-14 05:16:52.282+03');
INSERT INTO public.price_set VALUES ('pset_01KV1YNT22GKNG4M967A8GCG21', '2026-06-14 05:16:52.546+03', '2026-06-14 06:22:49.061+03', '2026-06-14 06:22:49.061+03');
INSERT INTO public.price_set VALUES ('pset_01KV1YNT5SN4NKSEREZ8EW5KPK', '2026-06-14 05:16:52.665+03', '2026-06-14 06:22:49.693+03', '2026-06-14 06:22:49.693+03');
INSERT INTO public.price_set VALUES ('pset_01KV1YNTCADKFHYC9VW55V4HDR', '2026-06-14 05:16:52.874+03', '2026-06-14 06:22:50.202+03', '2026-06-14 06:22:50.202+03');
INSERT INTO public.price_set VALUES ('pset_01KV1YNTGTJTHKJYQNSS1J0M0R', '2026-06-14 05:16:53.018+03', '2026-06-14 06:22:50.721+03', '2026-06-14 06:22:50.72+03');
INSERT INTO public.price_set VALUES ('pset_01KV1YNTSGZM0XBDA8V1P4N7X5', '2026-06-14 05:16:53.296+03', '2026-06-14 06:22:51.041+03', '2026-06-14 06:22:51.041+03');
INSERT INTO public.price_set VALUES ('pset_01KV1YNV2T1J0YAJ1V465BT3Y7', '2026-06-14 05:16:53.594+03', '2026-06-14 06:22:51.348+03', '2026-06-14 06:22:51.348+03');
INSERT INTO public.price_set VALUES ('pset_01KV1YNV8C2X0H7E9TCV9ES836', '2026-06-14 05:16:53.772+03', '2026-06-14 06:22:51.586+03', '2026-06-14 06:22:51.586+03');
INSERT INTO public.price_set VALUES ('pset_01KV1YNVEBAZK6GG9JAMGQRDY1', '2026-06-14 05:16:53.963+03', '2026-06-14 06:22:51.818+03', '2026-06-14 06:22:51.818+03');
INSERT INTO public.price_set VALUES ('pset_01KV1YNVMK2BXMKRGZA5SW45G9', '2026-06-14 05:16:54.163+03', '2026-06-14 06:22:52.059+03', '2026-06-14 06:22:52.059+03');
INSERT INTO public.price_set VALUES ('pset_01KV1YNVVDMDHVG3641R0H4H2A', '2026-06-14 05:16:54.381+03', '2026-06-14 06:22:52.429+03', '2026-06-14 06:22:52.429+03');
INSERT INTO public.price_set VALUES ('pset_01KV1YNW3EEC8S52KYY3P18N06', '2026-06-14 05:16:54.638+03', '2026-06-14 06:22:52.728+03', '2026-06-14 06:22:52.728+03');
INSERT INTO public.price_set VALUES ('pset_01KV1YNWBGDRZGA9G1KCH6K5TY', '2026-06-14 05:16:54.896+03', '2026-06-14 06:22:52.984+03', '2026-06-14 06:22:52.984+03');
INSERT INTO public.price_set VALUES ('pset_01KV1YNWNCWEXDRK4G8MHDHTNR', '2026-06-14 05:16:55.212+03', '2026-06-14 06:22:53.132+03', '2026-06-14 06:22:53.132+03');
INSERT INTO public.price_set VALUES ('pset_01KV1YNX0YN95MEJGQR8NQPQSQ', '2026-06-14 05:16:55.582+03', '2026-06-14 06:22:53.248+03', '2026-06-14 06:22:53.247+03');
INSERT INTO public.price_set VALUES ('pset_01KV1YNXAE9Y3E3XJEMXE78BFE', '2026-06-14 05:16:55.886+03', '2026-06-14 06:22:53.337+03', '2026-06-14 06:22:53.337+03');
INSERT INTO public.price_set VALUES ('pset_01KV22EP8RWV8WAZGYYN8YAFQ3', '2026-06-14 06:22:53.592+03', '2026-06-14 06:22:53.592+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KV22EPC9DWEZQH8265AM53MH', '2026-06-14 06:22:53.705+03', '2026-06-14 06:22:53.705+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KV22EPFTSK2SN9W0JP27R0RR', '2026-06-14 06:22:53.818+03', '2026-06-14 06:22:53.818+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KV22EPKF3CEKW75MPR3ZXYF9', '2026-06-14 06:22:53.935+03', '2026-06-14 06:22:53.935+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KV22EPQWH9ZK18WXKYX9YJH8', '2026-06-14 06:22:54.076+03', '2026-06-14 06:22:54.076+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KV22EPWS7KAXREX5SQKDEZ07', '2026-06-14 06:22:54.233+03', '2026-06-14 06:22:54.233+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KV22EQ403N3G05YPSHVE3TT2', '2026-06-14 06:22:54.464+03', '2026-06-14 06:22:54.464+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KV22EQCB5TK9AK28BPNZYVDY', '2026-06-14 06:22:54.731+03', '2026-06-14 06:22:54.731+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KV22EQNHX33J79XTAM1JVWQF', '2026-06-14 06:22:55.025+03', '2026-06-14 06:22:55.025+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KV22EQWNC9BTPKNBSVWQFFHC', '2026-06-14 06:22:55.253+03', '2026-06-14 06:22:55.253+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KV22ER5A2YT2D2H59AQJX2CY', '2026-06-14 06:22:55.53+03', '2026-06-14 06:22:55.53+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KV22ERM7418HM043CPJMJ428', '2026-06-14 06:22:56.007+03', '2026-06-14 06:22:56.007+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KV22ES06KXZ9J8896CSF6VQ3', '2026-06-14 06:22:56.39+03', '2026-06-14 06:22:56.39+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KV22ES9BB74VH7DC9C21S0WE', '2026-06-14 06:22:56.684+03', '2026-06-14 06:22:56.684+03', NULL);
INSERT INTO public.price_set VALUES ('pset_01KV22ESM1SYT2NDYPBBSYQFE4', '2026-06-14 06:22:57.026+03', '2026-06-14 06:22:57.026+03', NULL);


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product VALUES ('prod_01KV1XXB3JP1V8SCP05G7ZPPD4', 'Türkiye Milli Takım Bisiklet Yaka Tshirt', 'turkiye-milli-takim-bisiklet-yaka-tshirt', NULL, '', false, 'published', 'http://localhost:8001/uploads/1781402593396-ChatGPTImage14Haz202604_27_05.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, '2026-06-14 05:03:30.811+03', '2026-06-14 06:22:48.104+03', NULL, '{"reviews": [], "package_prices": [1200, 2000, 2700], "carousel_images": ["http://firsatbox.com/static/1781402593396-ChatGPTImage14Haz202604_27_05.png", "http://firsatbox.com/static/1781402601963-ChatGPTImage14Haz202604_33_08.png", "http://firsatbox.com/static/1781402605768-ChatGPTImage14Haz202604_39_54.png"], "package_price_1": "1200", "package_price_2": "2000", "package_price_3": "2700", "package_price_4": "3200"}');
INSERT INTO public.product VALUES ('prod_01KTSXRBDY379RRFRYTEVQMYKC', 'Medusa Sweatshirt', 'sweatshirt', NULL, 'Reimagine the feeling of a classic sweatshirt. With our cotton sweatshirt, everyday essentials no longer have to be ordinary.', false, 'published', NULL, 400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, '2026-06-11 02:26:51.875+03', '2026-06-11 17:53:56.597+03', '2026-06-11 17:53:56.596+03', NULL);
INSERT INTO public.product VALUES ('prod_01KTSXRBDY8DGT5DT68AVKFT6D', 'Medusa T-Shirt', 't-shirt', NULL, 'Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.', false, 'published', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png', 400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, '2026-06-11 02:26:51.874+03', '2026-06-11 17:57:07.672+03', '2026-06-11 17:57:07.672+03', NULL);
INSERT INTO public.product VALUES ('prod_01KTSXRBDY727RPZ8951FP13SB', 'Medusa Sweatpants', 'sweatpants', NULL, 'Reimagine the feeling of classic sweatpants. With our cotton sweatpants, everyday essentials no longer have to be ordinary.', false, 'published', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-front.png', 400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, '2026-06-11 02:26:51.876+03', '2026-06-11 17:57:11.855+03', '2026-06-11 17:57:11.85+03', NULL);
INSERT INTO public.product VALUES ('prod_01KTSXRBDYQVEC06K0J41W351T', 'Medusa Shorts', 'shorts', NULL, 'Reimagine the feeling of classic shorts. With our cotton shorts, everyday essentials no longer have to be ordinary.', false, 'published', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/shorts-vintage-front.png', 400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, '2026-06-11 02:26:51.876+03', '2026-06-11 17:57:16.381+03', '2026-06-11 17:57:16.38+03', NULL);
INSERT INTO public.product VALUES ('prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'Türkiye Milli Takım Tshirt', 'turkiye-milli-takim-tshirt', 'Ferah ve Rhat', 'Şortlu Takım', false, 'published', 'http://localhost:8001/uploads/1781225021759-PAGE-1.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, '2026-06-11 17:56:33.615+03', '2026-06-12 04:41:08.69+03', NULL, '{"reviews": [{"id": "rev_1781227929663", "name": "hakan ", "color": "SİYAH", "image": "http://firsatbox.com/static/1781227923177-6048791636726189790.jpg", "rating": 4, "comment": "kalıbı rahat tam oldu L beden sipariş verdim  geniş kalıp kendi bedeniniz alabilirsiniz ARAS kargo sıkıntısı haricinde iyiydi 1 puanıda kargo için kestim kargoyu geç getirdiler 2 gün boşuna şubede beklettiler ", "is_active": true, "created_at": "2026-06-12T01:32:09.663Z", "media_type": "image"}, {"id": "rev_1781228468662", "name": "Test User", "color": "Kırmızı", "image": "", "rating": 5, "comment": "Harika kalıp ve renk, çok beğendim!", "is_active": false, "created_at": "2026-06-12T01:41:08.662Z", "media_type": "image"}], "carousel_images": ["http://firsatbox.com/static/1781225021759-PAGE-1.webp", "http://firsatbox.com/static/1781225026517-PAGE-2.webp", "http://firsatbox.com/static/1781225030161-PAGE-3.webp"]}');


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product_category VALUES ('pcat_01KTSXRBC2XRR0272H7HPF0YZ8', 'Shirts', '', 'shirts', 'pcat_01KTSXRBC2XRR0272H7HPF0YZ8', true, false, 0, NULL, '2026-06-11 02:26:51.786+03', '2026-06-11 02:26:51.786+03', NULL, NULL, NULL);
INSERT INTO public.product_category VALUES ('pcat_01KTSXRBC5093AZ51X2CCBJFP6', 'Sweatshirts', '', 'sweatshirts', 'pcat_01KTSXRBC5093AZ51X2CCBJFP6', true, false, 1, NULL, '2026-06-11 02:26:51.787+03', '2026-06-11 02:26:51.787+03', NULL, NULL, NULL);
INSERT INTO public.product_category VALUES ('pcat_01KTSXRBC7615NSBN5D7CZNHAP', 'Pants', '', 'pants', 'pcat_01KTSXRBC7615NSBN5D7CZNHAP', true, false, 2, NULL, '2026-06-11 02:26:51.787+03', '2026-06-11 02:26:51.787+03', NULL, NULL, NULL);
INSERT INTO public.product_category VALUES ('pcat_01KTSXRBC9HA2RBZGVKPF4XNT0', 'Merch', '', 'merch', 'pcat_01KTSXRBC9HA2RBZGVKPF4XNT0', true, false, 3, NULL, '2026-06-11 02:26:51.787+03', '2026-06-11 02:26:51.788+03', NULL, NULL, NULL);


--
-- Data for Name: product_category_product; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product_category_product VALUES ('prod_01KTSXRBDY8DGT5DT68AVKFT6D', 'pcat_01KTSXRBC2XRR0272H7HPF0YZ8');
INSERT INTO public.product_category_product VALUES ('prod_01KTSXRBDY379RRFRYTEVQMYKC', 'pcat_01KTSXRBC5093AZ51X2CCBJFP6');
INSERT INTO public.product_category_product VALUES ('prod_01KTSXRBDY727RPZ8951FP13SB', 'pcat_01KTSXRBC7615NSBN5D7CZNHAP');
INSERT INTO public.product_category_product VALUES ('prod_01KTSXRBDYQVEC06K0J41W351T', 'pcat_01KTSXRBC9HA2RBZGVKPF4XNT0');
INSERT INTO public.product_category_product VALUES ('prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'pcat_01KTSXRBC2XRR0272H7HPF0YZ8');
INSERT INTO public.product_category_product VALUES ('prod_01KV1XXB3JP1V8SCP05G7ZPPD4', 'pcat_01KTSXRBC2XRR0272H7HPF0YZ8');


--
-- Data for Name: product_collection; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: product_option; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product_option VALUES ('opt_01KTSXRBEPRN6HZQ9YPYFK6QA1', 'Size', 'prod_01KTSXRBDY379RRFRYTEVQMYKC', NULL, '2026-06-11 02:26:51.879+03', '2026-06-11 17:53:56.803+03', '2026-06-11 17:53:56.596+03');
INSERT INTO public.product_option VALUES ('opt_01KTSXRBEBCBH7GGX6R87YC2X2', 'Size', 'prod_01KTSXRBDY8DGT5DT68AVKFT6D', NULL, '2026-06-11 02:26:51.876+03', '2026-06-11 17:57:07.73+03', '2026-06-11 17:57:07.672+03');
INSERT INTO public.product_option VALUES ('opt_01KTSXRBEC1YV1YKWWFKMZ45CM', 'Color', 'prod_01KTSXRBDY8DGT5DT68AVKFT6D', NULL, '2026-06-11 02:26:51.878+03', '2026-06-11 17:57:07.73+03', '2026-06-11 17:57:07.672+03');
INSERT INTO public.product_option VALUES ('opt_01KTSXRBESYPXNXVTZK88YJV5P', 'Size', 'prod_01KTSXRBDY727RPZ8951FP13SB', NULL, '2026-06-11 02:26:51.88+03', '2026-06-11 17:57:11.926+03', '2026-06-11 17:57:11.85+03');
INSERT INTO public.product_option VALUES ('opt_01KTSXRBEXFMEZ72JJX8RHKAE1', 'Size', 'prod_01KTSXRBDYQVEC06K0J41W351T', NULL, '2026-06-11 02:26:51.881+03', '2026-06-11 17:57:16.453+03', '2026-06-11 17:57:16.38+03');
INSERT INTO public.product_option VALUES ('opt_01KTWF9KEJJQH9BJZ10KGHB262', 'Beden', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', NULL, '2026-06-12 02:11:51.771+03', '2026-06-12 02:12:02.586+03', '2026-06-12 02:12:02.586+03');
INSERT INTO public.product_option VALUES ('opt_01KTWF9KEJCVX58PTHPT145XQ3', 'Renk', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', NULL, '2026-06-12 02:11:51.771+03', '2026-06-12 02:12:02.635+03', '2026-06-12 02:12:02.635+03');
INSERT INTO public.product_option VALUES ('opt_01KTWF9Y4Y5V4NQRJ6GQ2RNXW4', 'Beden', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', NULL, '2026-06-12 02:12:02.718+03', '2026-06-12 02:32:25.562+03', '2026-06-12 02:32:25.562+03');
INSERT INTO public.product_option VALUES ('opt_01KTWF9Y3J2P8S3YGJMSJJJPZ9', 'Renk', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', NULL, '2026-06-12 02:12:02.674+03', '2026-06-12 02:32:25.602+03', '2026-06-12 02:32:25.602+03');
INSERT INTO public.product_option VALUES ('opt_01KTWGF8ED1HVQ9RH47AEF1KB9', 'Beden', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', NULL, '2026-06-12 02:32:25.677+03', '2026-06-12 02:33:37.871+03', '2026-06-12 02:33:37.871+03');
INSERT INTO public.product_option VALUES ('opt_01KTWGF8D852VES8S413TAFKW8', 'Renk', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', NULL, '2026-06-12 02:32:25.641+03', '2026-06-12 02:33:37.912+03', '2026-06-12 02:33:37.912+03');
INSERT INTO public.product_option VALUES ('opt_01KTWGHF1XR8MC98Y3HCX3RQTC', 'Beden', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', NULL, '2026-06-12 02:33:37.981+03', '2026-06-12 02:35:57.559+03', '2026-06-12 02:35:57.559+03');
INSERT INTO public.product_option VALUES ('opt_01KTWGHF0V4X85PN474BJ6SAM9', 'Renk', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', NULL, '2026-06-12 02:33:37.947+03', '2026-06-12 02:35:57.61+03', '2026-06-12 02:35:57.61+03');
INSERT INTO public.product_option VALUES ('opt_01KTWGNQG3X4RJ7MXYZQX5QYDH', 'Beden', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', NULL, '2026-06-12 02:35:57.699+03', '2026-06-12 03:36:47.616+03', '2026-06-12 03:36:47.616+03');
INSERT INTO public.product_option VALUES ('opt_01KTWGNQENTB0S1CT2QJ8RQ82K', 'Renk', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', NULL, '2026-06-12 02:35:57.653+03', '2026-06-12 03:36:47.653+03', '2026-06-12 03:36:47.653+03');
INSERT INTO public.product_option VALUES ('opt_01KTWM53Z57WJ53HS4JGV1MV11', 'Beden', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', NULL, '2026-06-12 03:36:47.717+03', '2026-06-12 03:46:39.372+03', '2026-06-12 03:46:39.372+03');
INSERT INTO public.product_option VALUES ('opt_01KTWM53Y3ESMRRCD2B2XQGSX7', 'Renk', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', NULL, '2026-06-12 03:36:47.684+03', '2026-06-12 03:46:39.411+03', '2026-06-12 03:46:39.411+03');
INSERT INTO public.product_option VALUES ('opt_01KTWMQ5W8CKR9F7G5R9E4HT37', 'Beden', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', NULL, '2026-06-12 03:46:39.496+03', '2026-06-12 04:32:51.55+03', '2026-06-12 04:32:51.549+03');
INSERT INTO public.product_option VALUES ('opt_01KTWMQ5TTMGE1859SYQZXT7DZ', 'Renk', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', NULL, '2026-06-12 03:46:39.45+03', '2026-06-12 04:32:51.685+03', '2026-06-12 04:32:51.685+03');
INSERT INTO public.product_option VALUES ('opt_01KTWQBS6ZGPSB23QFJN5RGRWT', 'Renk', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', NULL, '2026-06-12 04:32:51.808+03', '2026-06-12 04:32:51.808+03', NULL);
INSERT INTO public.product_option VALUES ('opt_01KTWQBSAX7D9JB16FPC49M1V5', 'Beden', 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', NULL, '2026-06-12 04:32:51.934+03', '2026-06-12 04:32:51.934+03', NULL);
INSERT INTO public.product_option VALUES ('opt_01KV1XXB3RQ3G8XSN9BXFBRKMZ', 'Beden', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', NULL, '2026-06-14 05:03:30.812+03', '2026-06-14 05:16:52.353+03', '2026-06-14 05:16:52.353+03');
INSERT INTO public.product_option VALUES ('opt_01KV1XXB3QR8S7SEEPW9YGM681', 'Renk', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', NULL, '2026-06-14 05:03:30.812+03', '2026-06-14 05:16:52.395+03', '2026-06-14 05:16:52.395+03');
INSERT INTO public.product_option VALUES ('opt_01KV1YNSZP6AWR6MFJAQ9K61BQ', 'Beden', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', NULL, '2026-06-14 05:16:52.47+03', '2026-06-14 06:22:53.395+03', '2026-06-14 06:22:53.395+03');
INSERT INTO public.product_option VALUES ('opt_01KV1YNSYGT0X615T6P17ZH5E1', 'Renk', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', NULL, '2026-06-14 05:16:52.433+03', '2026-06-14 06:22:53.436+03', '2026-06-14 06:22:53.436+03');
INSERT INTO public.product_option VALUES ('opt_01KV22EP4YRG1F91JYEKCR6VZT', 'Renk', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', NULL, '2026-06-14 06:22:53.471+03', '2026-06-14 06:22:53.471+03', NULL);
INSERT INTO public.product_option VALUES ('opt_01KV22EP5ZWW1G9W3ZMCXQPD4V', 'Beden', 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', NULL, '2026-06-14 06:22:53.504+03', '2026-06-14 06:22:53.504+03', NULL);


--
-- Data for Name: product_option_value; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product_option_value VALUES ('optval_01KTWM53Z5BQFPE6YMKM5FJSBZ', 'S', 'opt_01KTWM53Z57WJ53HS4JGV1MV11', NULL, '2026-06-12 03:36:47.717+03', '2026-06-12 03:46:39.377+03', '2026-06-12 03:46:39.372+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWM53Z55ZA6VDSPW8AF5KNB', 'M', 'opt_01KTWM53Z57WJ53HS4JGV1MV11', NULL, '2026-06-12 03:36:47.717+03', '2026-06-12 03:46:39.377+03', '2026-06-12 03:46:39.372+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWM53Z59VZJXSNJJNWVXKF4', 'L', 'opt_01KTWM53Z57WJ53HS4JGV1MV11', NULL, '2026-06-12 03:36:47.717+03', '2026-06-12 03:46:39.377+03', '2026-06-12 03:46:39.372+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWM53Y3D4YH9PCA7AKB1M9C', 'SİYAH', 'opt_01KTWM53Y3ESMRRCD2B2XQGSX7', NULL, '2026-06-12 03:36:47.684+03', '2026-06-12 03:46:39.414+03', '2026-06-12 03:46:39.411+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWM53Y3AP4R4JTR7SHH85KX', 'BEYAZ', 'opt_01KTWM53Y3ESMRRCD2B2XQGSX7', NULL, '2026-06-12 03:36:47.684+03', '2026-06-12 03:46:39.415+03', '2026-06-12 03:46:39.411+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWM53Y34R4X9RAGNP49HRF0', 'KIRMIZI', 'opt_01KTWM53Y3ESMRRCD2B2XQGSX7', NULL, '2026-06-12 03:36:47.684+03', '2026-06-12 03:46:39.415+03', '2026-06-12 03:46:39.411+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWMQ5W75SHYPH2DDCPZH02R', 'S', 'opt_01KTWMQ5W8CKR9F7G5R9E4HT37', NULL, '2026-06-12 03:46:39.496+03', '2026-06-12 04:32:51.558+03', '2026-06-12 04:32:51.549+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWMQ5W8HBQ82CXGZHQFT513', 'M', 'opt_01KTWMQ5W8CKR9F7G5R9E4HT37', NULL, '2026-06-12 03:46:39.496+03', '2026-06-12 04:32:51.559+03', '2026-06-12 04:32:51.549+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWMQ5TSW7PPPT0JT83K1ANT', 'SİYAH', 'opt_01KTWMQ5TTMGE1859SYQZXT7DZ', NULL, '2026-06-12 03:46:39.45+03', '2026-06-12 04:32:51.703+03', '2026-06-12 04:32:51.685+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWMQ5TS01702X3ZM61YJBTK', 'BEYAZ', 'opt_01KTWMQ5TTMGE1859SYQZXT7DZ', NULL, '2026-06-12 03:46:39.45+03', '2026-06-12 04:32:51.704+03', '2026-06-12 04:32:51.685+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWMQ5TSTWJYP3HDYFBP12FT', 'KIRMIZI', 'opt_01KTWMQ5TTMGE1859SYQZXT7DZ', NULL, '2026-06-12 03:46:39.45+03', '2026-06-12 04:32:51.704+03', '2026-06-12 04:32:51.685+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTSXRBEMS2BPYE6VBFXK0HES', 'S', 'opt_01KTSXRBEPRN6HZQ9YPYFK6QA1', NULL, '2026-06-11 02:26:51.88+03', '2026-06-11 17:53:57.06+03', '2026-06-11 17:53:56.596+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTSXRBENFWX91T1YD673H2A7', 'M', 'opt_01KTSXRBEPRN6HZQ9YPYFK6QA1', NULL, '2026-06-11 02:26:51.88+03', '2026-06-11 17:53:57.061+03', '2026-06-11 17:53:56.596+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTSXRBEN8WQQC75W8J0Q6QBX', 'L', 'opt_01KTSXRBEPRN6HZQ9YPYFK6QA1', NULL, '2026-06-11 02:26:51.88+03', '2026-06-11 17:53:57.067+03', '2026-06-11 17:53:56.596+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTSXRBENCJD0RRRVG2SK9PRS', 'XL', 'opt_01KTSXRBEPRN6HZQ9YPYFK6QA1', NULL, '2026-06-11 02:26:51.88+03', '2026-06-11 17:53:57.067+03', '2026-06-11 17:53:56.596+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTSXRBE9EWN2J8QYQQRE8Z78', 'S', 'opt_01KTSXRBEBCBH7GGX6R87YC2X2', NULL, '2026-06-11 02:26:51.877+03', '2026-06-11 17:57:07.768+03', '2026-06-11 17:57:07.672+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTSXRBE9WJSE3CNBZV2X06G3', 'M', 'opt_01KTSXRBEBCBH7GGX6R87YC2X2', NULL, '2026-06-11 02:26:51.878+03', '2026-06-11 17:57:07.768+03', '2026-06-11 17:57:07.672+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTSXRBE9JS5FHHDHH3EXRYNP', 'L', 'opt_01KTSXRBEBCBH7GGX6R87YC2X2', NULL, '2026-06-11 02:26:51.878+03', '2026-06-11 17:57:07.768+03', '2026-06-11 17:57:07.672+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTSXRBEAGBKRCG1TH77ZP0Y3', 'XL', 'opt_01KTSXRBEBCBH7GGX6R87YC2X2', NULL, '2026-06-11 02:26:51.878+03', '2026-06-11 17:57:07.768+03', '2026-06-11 17:57:07.672+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTSXRBEBN7H74KA686CXJ3BC', 'Black', 'opt_01KTSXRBEC1YV1YKWWFKMZ45CM', NULL, '2026-06-11 02:26:51.878+03', '2026-06-11 17:57:07.767+03', '2026-06-11 17:57:07.672+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTSXRBEC5EAG7YRV51JGKFTJ', 'White', 'opt_01KTSXRBEC1YV1YKWWFKMZ45CM', NULL, '2026-06-11 02:26:51.878+03', '2026-06-11 17:57:07.768+03', '2026-06-11 17:57:07.672+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTSXRBER9C4SG5DN598W0YYM', 'S', 'opt_01KTSXRBESYPXNXVTZK88YJV5P', NULL, '2026-06-11 02:26:51.88+03', '2026-06-11 17:57:11.948+03', '2026-06-11 17:57:11.85+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTSXRBERH2N3C4ZASE0S34TZ', 'M', 'opt_01KTSXRBESYPXNXVTZK88YJV5P', NULL, '2026-06-11 02:26:51.88+03', '2026-06-11 17:57:11.948+03', '2026-06-11 17:57:11.85+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTSXRBES7TJ0QZDKQTRNXSTT', 'L', 'opt_01KTSXRBESYPXNXVTZK88YJV5P', NULL, '2026-06-11 02:26:51.88+03', '2026-06-11 17:57:11.948+03', '2026-06-11 17:57:11.85+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTSXRBESVTCCPCQSJTBX4RME', 'XL', 'opt_01KTSXRBESYPXNXVTZK88YJV5P', NULL, '2026-06-11 02:26:51.88+03', '2026-06-11 17:57:11.948+03', '2026-06-11 17:57:11.85+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTSXRBEWVWQ8JG0XJ71BXVCY', 'S', 'opt_01KTSXRBEXFMEZ72JJX8RHKAE1', NULL, '2026-06-11 02:26:51.881+03', '2026-06-11 17:57:16.498+03', '2026-06-11 17:57:16.38+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTSXRBEWPXH5JZ24MWNQF7V1', 'M', 'opt_01KTSXRBEXFMEZ72JJX8RHKAE1', NULL, '2026-06-11 02:26:51.881+03', '2026-06-11 17:57:16.498+03', '2026-06-11 17:57:16.38+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTSXRBEWBCEVN9B2VJBMA4HC', 'L', 'opt_01KTSXRBEXFMEZ72JJX8RHKAE1', NULL, '2026-06-11 02:26:51.881+03', '2026-06-11 17:57:16.499+03', '2026-06-11 17:57:16.38+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTSXRBEX5VSTJERFMSNHF9D7', 'XL', 'opt_01KTSXRBEXFMEZ72JJX8RHKAE1', NULL, '2026-06-11 02:26:51.881+03', '2026-06-11 17:57:16.499+03', '2026-06-11 17:57:16.38+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWF9KEJJJFWZMTAVNMWEX1A', 'S', 'opt_01KTWF9KEJJQH9BJZ10KGHB262', NULL, '2026-06-12 02:11:51.776+03', '2026-06-12 02:12:02.591+03', '2026-06-12 02:12:02.586+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWF9KEJXNMNJ5A5SR008064', 'M', 'opt_01KTWF9KEJJQH9BJZ10KGHB262', NULL, '2026-06-12 02:11:51.776+03', '2026-06-12 02:12:02.591+03', '2026-06-12 02:12:02.586+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWF9KEJBPJS17GRCVG3JVNF', 'L', 'opt_01KTWF9KEJJQH9BJZ10KGHB262', NULL, '2026-06-12 02:11:51.776+03', '2026-06-12 02:12:02.591+03', '2026-06-12 02:12:02.586+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWF9KEJ72DKMVW48XAM8733', 'XL', 'opt_01KTWF9KEJJQH9BJZ10KGHB262', NULL, '2026-06-12 02:11:51.776+03', '2026-06-12 02:12:02.591+03', '2026-06-12 02:12:02.586+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWF9KEJ54HB5H1HCZWDTEQX', 'XXL', 'opt_01KTWF9KEJJQH9BJZ10KGHB262', NULL, '2026-06-12 02:11:51.776+03', '2026-06-12 02:12:02.591+03', '2026-06-12 02:12:02.586+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWF9KEHFPH19H534JTT8XW4', 'MAVİ', 'opt_01KTWF9KEJCVX58PTHPT145XQ3', NULL, '2026-06-12 02:11:51.776+03', '2026-06-12 02:12:02.639+03', '2026-06-12 02:12:02.635+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWF9KEJ8CNJ0HJDQVZ0YVK5', 'SİYAH', 'opt_01KTWF9KEJCVX58PTHPT145XQ3', NULL, '2026-06-12 02:11:51.776+03', '2026-06-12 02:12:02.639+03', '2026-06-12 02:12:02.635+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWF9KEJQN85D9BX0HG5JZQK', 'KAHVE', 'opt_01KTWF9KEJCVX58PTHPT145XQ3', NULL, '2026-06-12 02:11:51.776+03', '2026-06-12 02:12:02.639+03', '2026-06-12 02:12:02.635+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWF9Y4XMFJHGRNWJFVFXAMC', 'S', 'opt_01KTWF9Y4Y5V4NQRJ6GQ2RNXW4', NULL, '2026-06-12 02:12:02.718+03', '2026-06-12 02:32:25.567+03', '2026-06-12 02:32:25.562+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWF9Y4XVFJ6XT5N0471ECNE', 'M', 'opt_01KTWF9Y4Y5V4NQRJ6GQ2RNXW4', NULL, '2026-06-12 02:12:02.718+03', '2026-06-12 02:32:25.567+03', '2026-06-12 02:32:25.562+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWF9Y4YJBX8N88688J6GM4S', 'L', 'opt_01KTWF9Y4Y5V4NQRJ6GQ2RNXW4', NULL, '2026-06-12 02:12:02.718+03', '2026-06-12 02:32:25.567+03', '2026-06-12 02:32:25.562+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWF9Y4YYXMQD81P7S8QETSN', 'XL', 'opt_01KTWF9Y4Y5V4NQRJ6GQ2RNXW4', NULL, '2026-06-12 02:12:02.718+03', '2026-06-12 02:32:25.567+03', '2026-06-12 02:32:25.562+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWF9Y4YDJJ9M2MM1RSSBA1N', 'XXL', 'opt_01KTWF9Y4Y5V4NQRJ6GQ2RNXW4', NULL, '2026-06-12 02:12:02.718+03', '2026-06-12 02:32:25.567+03', '2026-06-12 02:32:25.562+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWF9Y3H7FVFBRM4RWDDB2Z9', 'MAVİ', 'opt_01KTWF9Y3J2P8S3YGJMSJJJPZ9', NULL, '2026-06-12 02:12:02.674+03', '2026-06-12 02:32:25.605+03', '2026-06-12 02:32:25.602+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWF9Y3HQECRJD7NEQ4AKX86', 'SİYAH', 'opt_01KTWF9Y3J2P8S3YGJMSJJJPZ9', NULL, '2026-06-12 02:12:02.674+03', '2026-06-12 02:32:25.605+03', '2026-06-12 02:32:25.602+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWF9Y3HPB7QEX2C0872YK9V', 'KAHVE', 'opt_01KTWF9Y3J2P8S3YGJMSJJJPZ9', NULL, '2026-06-12 02:12:02.674+03', '2026-06-12 02:32:25.605+03', '2026-06-12 02:32:25.602+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWGF8EC7QRMJBVY5T1GE6A4', 'S', 'opt_01KTWGF8ED1HVQ9RH47AEF1KB9', NULL, '2026-06-12 02:32:25.677+03', '2026-06-12 02:33:37.875+03', '2026-06-12 02:33:37.871+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWGF8EDWWPDBE2P09QZZ5ZT', 'M', 'opt_01KTWGF8ED1HVQ9RH47AEF1KB9', NULL, '2026-06-12 02:32:25.677+03', '2026-06-12 02:33:37.875+03', '2026-06-12 02:33:37.871+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWGF8ED1VXFYFEJRXDC8VVP', 'L', 'opt_01KTWGF8ED1HVQ9RH47AEF1KB9', NULL, '2026-06-12 02:32:25.677+03', '2026-06-12 02:33:37.875+03', '2026-06-12 02:33:37.871+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWGF8D856XWCTTSRH7SAJBT', 'SİYAH', 'opt_01KTWGF8D852VES8S413TAFKW8', NULL, '2026-06-12 02:32:25.641+03', '2026-06-12 02:33:37.915+03', '2026-06-12 02:33:37.912+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWGF8D8SSWVBA7SFJ99VC77', 'KAHVE', 'opt_01KTWGF8D852VES8S413TAFKW8', NULL, '2026-06-12 02:32:25.641+03', '2026-06-12 02:33:37.915+03', '2026-06-12 02:33:37.912+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWGHF1XZQMDD1GGS8WMEXVJ', 'S', 'opt_01KTWGHF1XR8MC98Y3HCX3RQTC', NULL, '2026-06-12 02:33:37.982+03', '2026-06-12 02:35:57.563+03', '2026-06-12 02:35:57.559+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWGHF1XX0W8YVV8FTWYBPVW', 'M', 'opt_01KTWGHF1XR8MC98Y3HCX3RQTC', NULL, '2026-06-12 02:33:37.982+03', '2026-06-12 02:35:57.563+03', '2026-06-12 02:35:57.559+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWGHF1XAQ7YDXA459XB8MNX', 'L', 'opt_01KTWGHF1XR8MC98Y3HCX3RQTC', NULL, '2026-06-12 02:33:37.982+03', '2026-06-12 02:35:57.563+03', '2026-06-12 02:35:57.559+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWGHF0VJ5RVJR6CB80PQM3Z', 'SİYAH', 'opt_01KTWGHF0V4X85PN474BJ6SAM9', NULL, '2026-06-12 02:33:37.947+03', '2026-06-12 02:35:57.614+03', '2026-06-12 02:35:57.61+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWGHF0VN7JVVATVN5MR3D4A', 'KAHVE', 'opt_01KTWGHF0V4X85PN474BJ6SAM9', NULL, '2026-06-12 02:33:37.947+03', '2026-06-12 02:35:57.614+03', '2026-06-12 02:35:57.61+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWGNQG3P5A68CVE2YMQM2YH', 'S', 'opt_01KTWGNQG3X4RJ7MXYZQX5QYDH', NULL, '2026-06-12 02:35:57.7+03', '2026-06-12 03:36:47.62+03', '2026-06-12 03:36:47.616+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWGNQG328HCNZ0344BSYAQZ', 'M', 'opt_01KTWGNQG3X4RJ7MXYZQX5QYDH', NULL, '2026-06-12 02:35:57.7+03', '2026-06-12 03:36:47.62+03', '2026-06-12 03:36:47.616+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWGNQG3HV3A99NEMVPNTZXD', 'L', 'opt_01KTWGNQG3X4RJ7MXYZQX5QYDH', NULL, '2026-06-12 02:35:57.7+03', '2026-06-12 03:36:47.62+03', '2026-06-12 03:36:47.616+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWGNQEMF5SDXG5MG0P1W1VQ', 'SİYAH', 'opt_01KTWGNQENTB0S1CT2QJ8RQ82K', NULL, '2026-06-12 02:35:57.653+03', '2026-06-12 03:36:47.656+03', '2026-06-12 03:36:47.653+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWGNQEMPJAHT1KWN1ZXH3YA', 'BEYAZ', 'opt_01KTWGNQENTB0S1CT2QJ8RQ82K', NULL, '2026-06-12 02:35:57.653+03', '2026-06-12 03:36:47.656+03', '2026-06-12 03:36:47.653+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWGNQENRC9ZF28KGDFCZFEZ', 'KIRMIZI', 'opt_01KTWGNQENTB0S1CT2QJ8RQ82K', NULL, '2026-06-12 02:35:57.653+03', '2026-06-12 03:36:47.656+03', '2026-06-12 03:36:47.653+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWMQ5W8GT47BRZEGK5BD051', 'L', 'opt_01KTWMQ5W8CKR9F7G5R9E4HT37', NULL, '2026-06-12 03:46:39.496+03', '2026-06-12 04:32:51.559+03', '2026-06-12 04:32:51.549+03');
INSERT INTO public.product_option_value VALUES ('optval_01KTWQBS6XSTEQBD1VYP5TBSYT', 'SİYAH', 'opt_01KTWQBS6ZGPSB23QFJN5RGRWT', NULL, '2026-06-12 04:32:51.808+03', '2026-06-12 04:32:51.808+03', NULL);
INSERT INTO public.product_option_value VALUES ('optval_01KTWQBS6YT9461K929FAFWQYN', 'BEYAZ', 'opt_01KTWQBS6ZGPSB23QFJN5RGRWT', NULL, '2026-06-12 04:32:51.808+03', '2026-06-12 04:32:51.808+03', NULL);
INSERT INTO public.product_option_value VALUES ('optval_01KTWQBS6YRETEZJHDMQ1CRF4V', 'KIRMIZI', 'opt_01KTWQBS6ZGPSB23QFJN5RGRWT', NULL, '2026-06-12 04:32:51.808+03', '2026-06-12 04:32:51.808+03', NULL);
INSERT INTO public.product_option_value VALUES ('optval_01KTWQBSAV7D8CDBGGJBZMWG3G', 'S', 'opt_01KTWQBSAX7D9JB16FPC49M1V5', NULL, '2026-06-12 04:32:51.934+03', '2026-06-12 04:32:51.934+03', NULL);
INSERT INTO public.product_option_value VALUES ('optval_01KTWQBSAWKRSJSV984N7D1MVT', 'M', 'opt_01KTWQBSAX7D9JB16FPC49M1V5', NULL, '2026-06-12 04:32:51.934+03', '2026-06-12 04:32:51.934+03', NULL);
INSERT INTO public.product_option_value VALUES ('optval_01KTWQBSAW6DTFRH6HXHNDA943', 'L', 'opt_01KTWQBSAX7D9JB16FPC49M1V5', NULL, '2026-06-12 04:32:51.934+03', '2026-06-12 04:32:51.934+03', NULL);
INSERT INTO public.product_option_value VALUES ('optval_01KV1XXB3RAY258EYV02ZKYEK3', 'S', 'opt_01KV1XXB3RQ3G8XSN9BXFBRKMZ', NULL, '2026-06-14 05:03:30.812+03', '2026-06-14 05:16:52.357+03', '2026-06-14 05:16:52.353+03');
INSERT INTO public.product_option_value VALUES ('optval_01KV1XXB3R16ENQXYRR57WZC9E', 'M', 'opt_01KV1XXB3RQ3G8XSN9BXFBRKMZ', NULL, '2026-06-14 05:03:30.812+03', '2026-06-14 05:16:52.358+03', '2026-06-14 05:16:52.353+03');
INSERT INTO public.product_option_value VALUES ('optval_01KV1XXB3RH18FF9Q5TCWC8V84', 'L', 'opt_01KV1XXB3RQ3G8XSN9BXFBRKMZ', NULL, '2026-06-14 05:03:30.812+03', '2026-06-14 05:16:52.358+03', '2026-06-14 05:16:52.353+03');
INSERT INTO public.product_option_value VALUES ('optval_01KV1XXB3R2H9AT67BQP9MR4YJ', 'XL', 'opt_01KV1XXB3RQ3G8XSN9BXFBRKMZ', NULL, '2026-06-14 05:03:30.812+03', '2026-06-14 05:16:52.358+03', '2026-06-14 05:16:52.353+03');
INSERT INTO public.product_option_value VALUES ('optval_01KV1XXB3R7GERK3ER157TPK78', 'XXL', 'opt_01KV1XXB3RQ3G8XSN9BXFBRKMZ', NULL, '2026-06-14 05:03:30.812+03', '2026-06-14 05:16:52.358+03', '2026-06-14 05:16:52.353+03');
INSERT INTO public.product_option_value VALUES ('optval_01KV1XXB3QY6TMV1V4SVM5QMME', 'KIRMIZI', 'opt_01KV1XXB3QR8S7SEEPW9YGM681', NULL, '2026-06-14 05:03:30.812+03', '2026-06-14 05:16:52.4+03', '2026-06-14 05:16:52.395+03');
INSERT INTO public.product_option_value VALUES ('optval_01KV1XXB3Q1MRD70VEK21S972J', 'BEYAZ', 'opt_01KV1XXB3QR8S7SEEPW9YGM681', NULL, '2026-06-14 05:03:30.812+03', '2026-06-14 05:16:52.4+03', '2026-06-14 05:16:52.395+03');
INSERT INTO public.product_option_value VALUES ('optval_01KV1XXB3QPNACB91H5Q5TQB6Q', 'SİYAH', 'opt_01KV1XXB3QR8S7SEEPW9YGM681', NULL, '2026-06-14 05:03:30.812+03', '2026-06-14 05:16:52.4+03', '2026-06-14 05:16:52.395+03');
INSERT INTO public.product_option_value VALUES ('optval_01KV1YNSZNA8FTJ8WJAJJFJWS5', 'S', 'opt_01KV1YNSZP6AWR6MFJAQ9K61BQ', NULL, '2026-06-14 05:16:52.47+03', '2026-06-14 06:22:53.399+03', '2026-06-14 06:22:53.395+03');
INSERT INTO public.product_option_value VALUES ('optval_01KV1YNSZNFBN6SRASBMSX8KSS', 'M', 'opt_01KV1YNSZP6AWR6MFJAQ9K61BQ', NULL, '2026-06-14 05:16:52.47+03', '2026-06-14 06:22:53.399+03', '2026-06-14 06:22:53.395+03');
INSERT INTO public.product_option_value VALUES ('optval_01KV1YNSZPH1K2NXH2QE06XXTK', 'L', 'opt_01KV1YNSZP6AWR6MFJAQ9K61BQ', NULL, '2026-06-14 05:16:52.47+03', '2026-06-14 06:22:53.399+03', '2026-06-14 06:22:53.395+03');
INSERT INTO public.product_option_value VALUES ('optval_01KV1YNSZP95FFEVA4AJBSVVDV', 'XL', 'opt_01KV1YNSZP6AWR6MFJAQ9K61BQ', NULL, '2026-06-14 05:16:52.47+03', '2026-06-14 06:22:53.399+03', '2026-06-14 06:22:53.395+03');
INSERT INTO public.product_option_value VALUES ('optval_01KV1YNSZPEH5QQY575G8MZMRN', 'XXL', 'opt_01KV1YNSZP6AWR6MFJAQ9K61BQ', NULL, '2026-06-14 05:16:52.47+03', '2026-06-14 06:22:53.399+03', '2026-06-14 06:22:53.395+03');
INSERT INTO public.product_option_value VALUES ('optval_01KV1YNSYGAAGPQ75C6GRAZV1B', 'KIRMIZI', 'opt_01KV1YNSYGT0X615T6P17ZH5E1', NULL, '2026-06-14 05:16:52.433+03', '2026-06-14 06:22:53.44+03', '2026-06-14 06:22:53.436+03');
INSERT INTO public.product_option_value VALUES ('optval_01KV1YNSYGQW3RSVNYM1HPN0PZ', 'BEYAZ', 'opt_01KV1YNSYGT0X615T6P17ZH5E1', NULL, '2026-06-14 05:16:52.433+03', '2026-06-14 06:22:53.44+03', '2026-06-14 06:22:53.436+03');
INSERT INTO public.product_option_value VALUES ('optval_01KV1YNSYGP16JX5HQW59ZSTTD', 'SİYAH', 'opt_01KV1YNSYGT0X615T6P17ZH5E1', NULL, '2026-06-14 05:16:52.433+03', '2026-06-14 06:22:53.44+03', '2026-06-14 06:22:53.436+03');
INSERT INTO public.product_option_value VALUES ('optval_01KV22EP4XMM4J45VVG4GDAQ70', 'KIRMIZI', 'opt_01KV22EP4YRG1F91JYEKCR6VZT', NULL, '2026-06-14 06:22:53.471+03', '2026-06-14 06:22:53.471+03', NULL);
INSERT INTO public.product_option_value VALUES ('optval_01KV22EP4YXNHQR74C8N210XV8', 'BEYAZ', 'opt_01KV22EP4YRG1F91JYEKCR6VZT', NULL, '2026-06-14 06:22:53.471+03', '2026-06-14 06:22:53.471+03', NULL);
INSERT INTO public.product_option_value VALUES ('optval_01KV22EP4YK4FEETPCB55YBK4B', 'SİYAH', 'opt_01KV22EP4YRG1F91JYEKCR6VZT', NULL, '2026-06-14 06:22:53.471+03', '2026-06-14 06:22:53.471+03', NULL);
INSERT INTO public.product_option_value VALUES ('optval_01KV22EP5ZF33RJBQMGBGVTH9Z', 'S', 'opt_01KV22EP5ZWW1G9W3ZMCXQPD4V', NULL, '2026-06-14 06:22:53.504+03', '2026-06-14 06:22:53.504+03', NULL);
INSERT INTO public.product_option_value VALUES ('optval_01KV22EP5ZNESTVPDKA5QR44KJ', 'M', 'opt_01KV22EP5ZWW1G9W3ZMCXQPD4V', NULL, '2026-06-14 06:22:53.504+03', '2026-06-14 06:22:53.504+03', NULL);
INSERT INTO public.product_option_value VALUES ('optval_01KV22EP5ZSH8HD2SFKMXG8A2E', 'L', 'opt_01KV22EP5ZWW1G9W3ZMCXQPD4V', NULL, '2026-06-14 06:22:53.504+03', '2026-06-14 06:22:53.504+03', NULL);
INSERT INTO public.product_option_value VALUES ('optval_01KV22EP5Z1VND6E0MZVYM61DY', 'XL', 'opt_01KV22EP5ZWW1G9W3ZMCXQPD4V', NULL, '2026-06-14 06:22:53.504+03', '2026-06-14 06:22:53.504+03', NULL);
INSERT INTO public.product_option_value VALUES ('optval_01KV22EP5Z7D16N05T1DWND81A', 'XXL', 'opt_01KV22EP5ZWW1G9W3ZMCXQPD4V', NULL, '2026-06-14 06:22:53.504+03', '2026-06-14 06:22:53.504+03', NULL);


--
-- Data for Name: product_sales_channel; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product_sales_channel VALUES ('prod_01KTSXRBDY379RRFRYTEVQMYKC', 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'prodsc_01KTSXRBK2REGDYMF8E1C9VPDX', '2026-06-11 02:26:51.999467+03', '2026-06-11 17:53:56.621+03', '2026-06-11 17:53:56.617+03');
INSERT INTO public.product_sales_channel VALUES ('prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'prodsc_01KTVJYP0NAYT0H4K01RH1F4QZ', '2026-06-11 17:56:33.807264+03', '2026-06-11 17:56:33.807264+03', NULL);
INSERT INTO public.product_sales_channel VALUES ('prod_01KTSXRBDY8DGT5DT68AVKFT6D', 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'prodsc_01KTSXRBK0062C9ND9PHX4CSP6', '2026-06-11 02:26:51.999467+03', '2026-06-11 17:57:07.688+03', '2026-06-11 17:57:07.687+03');
INSERT INTO public.product_sales_channel VALUES ('prod_01KTSXRBDY727RPZ8951FP13SB', 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'prodsc_01KTSXRBK2JJ3T36E10XVCP00R', '2026-06-11 02:26:51.999467+03', '2026-06-11 17:57:11.913+03', '2026-06-11 17:57:11.913+03');
INSERT INTO public.product_sales_channel VALUES ('prod_01KTSXRBDYQVEC06K0J41W351T', 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'prodsc_01KTSXRBK3AVX1RQ26D6NF6K6W', '2026-06-11 02:26:51.999467+03', '2026-06-11 17:57:16.385+03', '2026-06-11 17:57:16.384+03');


--
-- Data for Name: product_shipping_profile; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product_shipping_profile VALUES ('prod_01KTSXRBDY379RRFRYTEVQMYKC', 'sp_01KTSXRA2R74VD5YHXMN6GRZDZ', 'prodsp_01KTSXRBMEMZE31T6KZAMN5PNF', '2026-06-11 02:26:52.045093+03', '2026-06-11 17:53:56.635+03', '2026-06-11 17:53:56.631+03');
INSERT INTO public.product_shipping_profile VALUES ('prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', 'sp_01KTSXRA2R74VD5YHXMN6GRZDZ', 'prodsp_01KTVJYP2ZWEN2W9E84D8AQ9S9', '2026-06-11 17:56:33.88665+03', '2026-06-11 17:56:33.88665+03', NULL);
INSERT INTO public.product_shipping_profile VALUES ('prod_01KTSXRBDY8DGT5DT68AVKFT6D', 'sp_01KTSXRA2R74VD5YHXMN6GRZDZ', 'prodsp_01KTSXRBMDT8KKEZP4W3V23R2S', '2026-06-11 02:26:52.045093+03', '2026-06-11 17:57:07.699+03', '2026-06-11 17:57:07.698+03');
INSERT INTO public.product_shipping_profile VALUES ('prod_01KTSXRBDY727RPZ8951FP13SB', 'sp_01KTSXRA2R74VD5YHXMN6GRZDZ', 'prodsp_01KTSXRBMFDTRP6MNA4T93ZXP9', '2026-06-11 02:26:52.045093+03', '2026-06-11 17:57:11.893+03', '2026-06-11 17:57:11.892+03');
INSERT INTO public.product_shipping_profile VALUES ('prod_01KTSXRBDYQVEC06K0J41W351T', 'sp_01KTSXRA2R74VD5YHXMN6GRZDZ', 'prodsp_01KTSXRBMFS05N9KV33GYM3QTT', '2026-06-11 02:26:52.045093+03', '2026-06-11 17:57:16.401+03', '2026-06-11 17:57:16.4+03');
INSERT INTO public.product_shipping_profile VALUES ('prod_01KV1XXB3JP1V8SCP05G7ZPPD4', 'sp_01KTSXRA2R74VD5YHXMN6GRZDZ', 'prodsp_01c7qmb65ne3', '2026-06-15 02:43:14.782594+03', '2026-06-15 02:43:14.782594+03', NULL);


--
-- Data for Name: product_tag; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: product_tags; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: product_type; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: product_variant; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product_variant VALUES ('variant_01KTWGF8G0MQENH7ANE8TE0JRT', 'SİYAH / S', 'ORTLU-TAKM-SİYAH-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219468923-ChatGPTImage9Haz202617_02_13.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:32:25.728+03', '2026-06-12 02:33:36.834+03', '2026-06-12 02:33:36.834+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGHF7432YQRSMH31PX9ZA2', 'SİYAH / M', 'ORTLU-TAKM-SİYAH-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219468923-ChatGPTImage9Haz202617_02_13.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:33:38.148+03', '2026-06-12 02:35:56.456+03', '2026-06-12 02:35:56.456+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGHFBK9WQWBCA1V4KCN067', 'SİYAH / L', 'ORTLU-TAKM-SİYAH-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219468923-ChatGPTImage9Haz202617_02_13.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:33:38.292+03', '2026-06-12 02:35:56.823+03', '2026-06-12 02:35:56.822+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGHFHJMSFHKG8VVX3B3Y6P', 'KAHVE / S', 'ORTLU-TAKM-KAHVE-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219495347-ChatGPTImage9Haz202616_59_49.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:33:38.483+03', '2026-06-12 02:35:57.125+03', '2026-06-12 02:35:57.125+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGHFRB9GRDR0ZWC5EFCKED', 'KAHVE / M', 'ORTLU-TAKM-KAHVE-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219495347-ChatGPTImage9Haz202616_59_49.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:33:38.699+03', '2026-06-12 02:35:57.35+03', '2026-06-12 02:35:57.35+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGHG0HWG535VFS2VA2V5W4', 'KAHVE / L', 'ORTLU-TAKM-KAHVE-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219495347-ChatGPTImage9Haz202616_59_49.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:33:38.961+03', '2026-06-12 02:35:57.507+03', '2026-06-12 02:35:57.507+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQ70PK60F11KJD4BN8Q', 'S', 'SWEATSHIRT-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDY379RRFRYTEVQMYKC', '2026-06-11 02:26:52.144+03', '2026-06-11 17:53:56.795+03', '2026-06-11 17:53:56.596+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQ8H06DERRH0N15Z39H', 'M', 'SWEATSHIRT-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDY379RRFRYTEVQMYKC', '2026-06-11 02:26:52.144+03', '2026-06-11 17:53:56.801+03', '2026-06-11 17:53:56.596+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQ8M00DRQ10C5AGM93G', 'L', 'SWEATSHIRT-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDY379RRFRYTEVQMYKC', '2026-06-11 02:26:52.144+03', '2026-06-11 17:53:56.802+03', '2026-06-11 17:53:56.596+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQ8BFJ2RXVDM2CBVY3V', 'XL', 'SWEATSHIRT-XL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDY379RRFRYTEVQMYKC', '2026-06-11 02:26:52.144+03', '2026-06-11 17:53:56.802+03', '2026-06-11 17:53:56.596+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQ1TRP0F9K1FBSD91JT', 'S / Black', 'SHIRT-S-BLACK', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDY8DGT5DT68AVKFT6D', '2026-06-11 02:26:52.142+03', '2026-06-11 17:57:07.728+03', '2026-06-11 17:57:07.672+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQ3MVMR2DF6RW8PH22V', 'S / White', 'SHIRT-S-WHITE', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDY8DGT5DT68AVKFT6D', '2026-06-11 02:26:52.143+03', '2026-06-11 17:57:07.728+03', '2026-06-11 17:57:07.672+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQ3Q4FR220FETFCPY1R', 'M / Black', 'SHIRT-M-BLACK', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDY8DGT5DT68AVKFT6D', '2026-06-11 02:26:52.143+03', '2026-06-11 17:57:07.728+03', '2026-06-11 17:57:07.672+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQ433WKRGKNCWZCT6K4', 'M / White', 'SHIRT-M-WHITE', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDY8DGT5DT68AVKFT6D', '2026-06-11 02:26:52.143+03', '2026-06-11 17:57:07.728+03', '2026-06-11 17:57:07.672+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQ5F2VK5FXFEBD1HKR2', 'L / Black', 'SHIRT-L-BLACK', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDY8DGT5DT68AVKFT6D', '2026-06-11 02:26:52.143+03', '2026-06-11 17:57:07.729+03', '2026-06-11 17:57:07.672+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQ57H9D9J1HV26808CR', 'L / White', 'SHIRT-L-WHITE', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDY8DGT5DT68AVKFT6D', '2026-06-11 02:26:52.144+03', '2026-06-11 17:57:07.729+03', '2026-06-11 17:57:07.672+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQ6GDPF4C0C12WQFD3F', 'XL / Black', 'SHIRT-XL-BLACK', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDY8DGT5DT68AVKFT6D', '2026-06-11 02:26:52.144+03', '2026-06-11 17:57:07.729+03', '2026-06-11 17:57:07.672+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQ60XY3R71ZASPEGG0G', 'XL / White', 'SHIRT-XL-WHITE', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDY8DGT5DT68AVKFT6D', '2026-06-11 02:26:52.144+03', '2026-06-11 17:57:07.729+03', '2026-06-11 17:57:07.672+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQ9WQNWKF6H7PRM0EW3', 'S', 'SWEATPANTS-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDY727RPZ8951FP13SB', '2026-06-11 02:26:52.144+03', '2026-06-11 17:57:11.925+03', '2026-06-11 17:57:11.85+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQ9PVA4GEQ8BA0RFZC9', 'M', 'SWEATPANTS-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDY727RPZ8951FP13SB', '2026-06-11 02:26:52.144+03', '2026-06-11 17:57:11.925+03', '2026-06-11 17:57:11.85+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQ9PA5NHG640SKXJF4J', 'L', 'SWEATPANTS-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDY727RPZ8951FP13SB', '2026-06-11 02:26:52.145+03', '2026-06-11 17:57:11.925+03', '2026-06-11 17:57:11.85+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQASSFDDHCB4JRVQ6G7', 'XL', 'SWEATPANTS-XL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDY727RPZ8951FP13SB', '2026-06-11 02:26:52.145+03', '2026-06-11 17:57:11.925+03', '2026-06-11 17:57:11.85+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQAEHTRK7770FW58HKF', 'S', 'SHORTS-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDYQVEC06K0J41W351T', '2026-06-11 02:26:52.145+03', '2026-06-11 17:57:16.452+03', '2026-06-11 17:57:16.38+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQBGMJ604Z25DNWT67Q', 'M', 'SHORTS-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDYQVEC06K0J41W351T', '2026-06-11 02:26:52.145+03', '2026-06-11 17:57:16.452+03', '2026-06-11 17:57:16.38+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQBMHDBE8Y0J1XPFZ26', 'L', 'SHORTS-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDYQVEC06K0J41W351T', '2026-06-11 02:26:52.145+03', '2026-06-11 17:57:16.452+03', '2026-06-11 17:57:16.38+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTSXRBQCF6X834577SZZ8WRZ', 'XL', 'SHORTS-XL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KTSXRBDYQVEC06K0J41W351T', '2026-06-11 02:26:52.145+03', '2026-06-11 17:57:16.453+03', '2026-06-11 17:57:16.38+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9KEMBBSY9NR0S51NQX9H', 'MAVİ / S', 'ORTLU-TAKM-MAVİ-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219444531-ChatGPTImage9Haz202617_02_15.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:11:51.772+03', '2026-06-12 02:11:53.251+03', '2026-06-12 02:11:53.251+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9KEMMNHMBV9QKED369VE', 'MAVİ / M', 'ORTLU-TAKM-MAVİ-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219444531-ChatGPTImage9Haz202617_02_15.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:11:51.772+03', '2026-06-12 02:11:54.117+03', '2026-06-12 02:11:54.117+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9KEN1ZRENB8ZFQ9TPY2F', 'MAVİ / XL', 'ORTLU-TAKM-MAVİ-XL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219444531-ChatGPTImage9Haz202617_02_15.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:11:51.772+03', '2026-06-12 02:11:55.129+03', '2026-06-12 02:11:55.129+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9KEN4XEYP5V525001ZBD', 'SİYAH / S', 'ORTLU-TAKM-SİYAH-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219468923-ChatGPTImage9Haz202617_02_13.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:11:51.772+03', '2026-06-12 02:11:56.291+03', '2026-06-12 02:11:56.291+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9KENJ5WWBWJSPDW8C6ZE', 'MAVİ / XXL', 'ORTLU-TAKM-MAVİ-XXL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219444531-ChatGPTImage9Haz202617_02_15.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:11:51.772+03', '2026-06-12 02:11:57.283+03', '2026-06-12 02:11:57.283+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9KENPG55C65KCGEJ3V4G', 'MAVİ / L', 'ORTLU-TAKM-MAVİ-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219444531-ChatGPTImage9Haz202617_02_15.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:11:51.772+03', '2026-06-12 02:11:58.153+03', '2026-06-12 02:11:58.153+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9KEPGC7MAZ54QKFP6R4Q', 'SİYAH / L', 'ORTLU-TAKM-SİYAH-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219468923-ChatGPTImage9Haz202617_02_13.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:11:51.772+03', '2026-06-12 02:12:00.786+03', '2026-06-12 02:12:00.786+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9KEPSAFY4ZA6146KVFXZ', 'SİYAH / M', 'ORTLU-TAKM-SİYAH-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219468923-ChatGPTImage9Haz202617_02_13.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:11:51.772+03', '2026-06-12 02:12:01.265+03', '2026-06-12 02:12:01.265+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGF8KZTZ5JY8NV5M97K04R', 'SİYAH / M', 'ORTLU-TAKM-SİYAH-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219468923-ChatGPTImage9Haz202617_02_13.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:32:25.855+03', '2026-06-12 02:33:37.136+03', '2026-06-12 02:33:37.136+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGF8S0NNTE5FHDKN7PDHMH', 'SİYAH / L', 'ORTLU-TAKM-SİYAH-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219468923-ChatGPTImage9Haz202617_02_13.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:32:26.016+03', '2026-06-12 02:33:37.385+03', '2026-06-12 02:33:37.385+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGF8YN79EF4KMYYGA300HJ', 'KAHVE / S', 'ORTLU-TAKM-KAHVE-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219495347-ChatGPTImage9Haz202616_59_49.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:32:26.197+03', '2026-06-12 02:33:37.569+03', '2026-06-12 02:33:37.569+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGF95PRQ16E4Z7YMT95KZP', 'KAHVE / M', 'ORTLU-TAKM-KAHVE-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219495347-ChatGPTImage9Haz202616_59_49.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:32:26.422+03', '2026-06-12 02:33:37.718+03', '2026-06-12 02:33:37.718+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGF9DJ2AW1XE041XZ6WWBE', 'KAHVE / L', 'ORTLU-TAKM-KAHVE-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219495347-ChatGPTImage9Haz202616_59_49.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:32:26.675+03', '2026-06-12 02:33:37.828+03', '2026-06-12 02:33:37.828+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9KEP2CXA96D31CN4RZED', 'SİYAH / XXL', 'ORTLU-TAKM-SİYAH-XXL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219468923-ChatGPTImage9Haz202617_02_13.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:11:51.773+03', '2026-06-12 02:11:58.905+03', '2026-06-12 02:11:58.905+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9KEP6DTF73N1VC7W82AY', 'KAHVE / S', 'ORTLU-TAKM-KAHVE-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219495347-ChatGPTImage9Haz202616_59_49.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:11:51.773+03', '2026-06-12 02:11:59.554+03', '2026-06-12 02:11:59.554+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9KEPD0KJBBNNCBHXC3H6', 'SİYAH / XL', 'ORTLU-TAKM-SİYAH-XL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219468923-ChatGPTImage9Haz202617_02_13.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:11:51.773+03', '2026-06-12 02:12:00.24+03', '2026-06-12 02:12:00.24+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9KEQ0NX61YDAZXP1RWFH', 'KAHVE / L', 'ORTLU-TAKM-KAHVE-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219495347-ChatGPTImage9Haz202616_59_49.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:11:51.773+03', '2026-06-12 02:12:01.746+03', '2026-06-12 02:12:01.746+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9KEQEBA7EG0ZDT5PMV28', 'KAHVE / XL', 'ORTLU-TAKM-KAHVE-XL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219495347-ChatGPTImage9Haz202616_59_49.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:11:51.773+03', '2026-06-12 02:12:02.066+03', '2026-06-12 02:12:02.065+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9KEQFRW50095R19EWYZD', 'KAHVE / XXL', 'ORTLU-TAKM-KAHVE-XXL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219495347-ChatGPTImage9Haz202616_59_49.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:11:51.773+03', '2026-06-12 02:12:02.411+03', '2026-06-12 02:12:02.411+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9KEQHS9RNSBQAM2CD9AD', 'KAHVE / M', 'ORTLU-TAKM-KAHVE-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219495347-ChatGPTImage9Haz202616_59_49.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:11:51.773+03', '2026-06-12 02:12:02.536+03', '2026-06-12 02:12:02.536+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9Y6V49ED3FQ4XS3GJ434', 'MAVİ / S', 'ORTLU-TAKM-MAVİ-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219444531-ChatGPTImage9Haz202617_02_15.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:12:02.779+03', '2026-06-12 02:32:17.218+03', '2026-06-12 02:32:17.218+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9YBTF01TEEF0KPG5MNGH', 'MAVİ / M', 'ORTLU-TAKM-MAVİ-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219444531-ChatGPTImage9Haz202617_02_15.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:12:02.938+03', '2026-06-12 02:32:18.505+03', '2026-06-12 02:32:18.504+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9YHPJXMTJSFRSTK8R8RB', 'MAVİ / L', 'ORTLU-TAKM-MAVİ-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219444531-ChatGPTImage9Haz202617_02_15.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:12:03.126+03', '2026-06-12 02:32:19.427+03', '2026-06-12 02:32:19.427+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9YWPDZG9EVXXFEFAGX79', 'MAVİ / XL', 'ORTLU-TAKM-MAVİ-XL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219444531-ChatGPTImage9Haz202617_02_15.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:12:03.478+03', '2026-06-12 02:32:20.748+03', '2026-06-12 02:32:20.748+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9Z7YTECSPGDH20AWH4W9', 'MAVİ / XXL', 'ORTLU-TAKM-MAVİ-XXL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219444531-ChatGPTImage9Haz202617_02_15.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:12:03.839+03', '2026-06-12 02:32:21.524+03', '2026-06-12 02:32:21.524+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWF9ZSA5N3ZEZZKNER8CYB2', 'SİYAH / S', 'ORTLU-TAKM-SİYAH-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219468923-ChatGPTImage9Haz202617_02_13.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:12:04.394+03', '2026-06-12 02:32:22.204+03', '2026-06-12 02:32:22.203+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWFA07AKCN7WFV5TR6T32ER', 'SİYAH / M', 'ORTLU-TAKM-SİYAH-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219468923-ChatGPTImage9Haz202617_02_13.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:12:04.843+03', '2026-06-12 02:32:22.798+03', '2026-06-12 02:32:22.798+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWFA0PFGGX0YKX0HSXQ9H9P', 'SİYAH / L', 'ORTLU-TAKM-SİYAH-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219468923-ChatGPTImage9Haz202617_02_13.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:12:05.327+03', '2026-06-12 02:32:23.34+03', '2026-06-12 02:32:23.339+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWFA19MVVWCK74WJ8335FY7', 'SİYAH / XL', 'ORTLU-TAKM-SİYAH-XL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219468923-ChatGPTImage9Haz202617_02_13.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:12:05.941+03', '2026-06-12 02:32:23.801+03', '2026-06-12 02:32:23.8+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWFA1XAWENQ3004NBYJXVHT', 'SİYAH / XXL', 'ORTLU-TAKM-SİYAH-XXL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219468923-ChatGPTImage9Haz202617_02_13.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:12:06.571+03', '2026-06-12 02:32:24.228+03', '2026-06-12 02:32:24.228+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWFA2TE54YKQ3WDWAKR9QQC', 'KAHVE / S', 'ORTLU-TAKM-KAHVE-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219495347-ChatGPTImage9Haz202616_59_49.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:12:07.502+03', '2026-06-12 02:32:24.653+03', '2026-06-12 02:32:24.652+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWFA3FCNHQ6X8C8N9C7YEEG', 'KAHVE / M', 'ORTLU-TAKM-KAHVE-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219495347-ChatGPTImage9Haz202616_59_49.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:12:08.172+03', '2026-06-12 02:32:24.946+03', '2026-06-12 02:32:24.946+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWFA46SK8J2ACRNSEH01EWZ', 'KAHVE / L', 'ORTLU-TAKM-KAHVE-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219495347-ChatGPTImage9Haz202616_59_49.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:12:08.922+03', '2026-06-12 02:32:25.183+03', '2026-06-12 02:32:25.183+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWFA545MJFC6SVY0H5RV1DP', 'KAHVE / XL', 'ORTLU-TAKM-KAHVE-XL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219495347-ChatGPTImage9Haz202616_59_49.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:12:09.861+03', '2026-06-12 02:32:25.371+03', '2026-06-12 02:32:25.371+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWFA5Z4WSA3FXAC0YYWW6XE', 'KAHVE / XXL', 'ORTLU-TAKM-KAHVE-XXL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219495347-ChatGPTImage9Haz202616_59_49.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:12:10.725+03', '2026-06-12 02:32:25.519+03', '2026-06-12 02:32:25.519+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGHF3FHC2G410EP41XAT4B', 'SİYAH / S', 'ORTLU-TAKM-SİYAH-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781219468923-ChatGPTImage9Haz202617_02_13.png", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:33:38.031+03', '2026-06-12 02:35:55.923+03', '2026-06-12 02:35:55.923+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGNQJ48C35RSSRQH387KT2', 'SİYAH / S', 'ORTLU-TAKM-SİYAH-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220889657-5938394158127057970.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:35:57.765+03', '2026-06-12 03:36:46.382+03', '2026-06-12 03:36:46.381+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGNQQH5D122AQFA689J1XW', 'SİYAH / M', 'ORTLU-TAKM-SİYAH-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220889657-5938394158127057970.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:35:57.937+03', '2026-06-12 03:36:46.622+03', '2026-06-12 03:36:46.621+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGNQY7JX0ZDEC5C5A940FE', 'SİYAH / L', 'ORTLU-TAKM-SİYAH-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220889657-5938394158127057970.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:35:58.151+03', '2026-06-12 03:36:46.815+03', '2026-06-12 03:36:46.815+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGNR6QE41HHHBB6BTGFHDY', 'BEYAZ / S', 'ORTLU-TAKM-BEYAZ-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220915852-5938394158127057971.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:35:58.424+03', '2026-06-12 03:36:46.976+03', '2026-06-12 03:36:46.976+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGNRGTM2VPJVEMPDV06VM5', 'BEYAZ / M', 'ORTLU-TAKM-BEYAZ-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220915852-5938394158127057971.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:35:58.746+03', '2026-06-12 03:36:47.109+03', '2026-06-12 03:36:47.109+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGNRY28GRDR27QZXQG9SZK', 'BEYAZ / L', 'ORTLU-TAKM-BEYAZ-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220915852-5938394158127057971.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:35:59.17+03', '2026-06-12 03:36:47.263+03', '2026-06-12 03:36:47.263+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGNSDBD9AQQR92BWK0F254', 'KIRMIZI / S', 'ORTLU-TAKM-KIRMIZI-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220936155-5938394158127057972.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:35:59.659+03', '2026-06-12 03:36:47.388+03', '2026-06-12 03:36:47.388+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGNSX3X728GK24ZGNEZ6RR', 'KIRMIZI / M', 'ORTLU-TAKM-KIRMIZI-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220936155-5938394158127057972.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:36:00.163+03', '2026-06-12 03:36:47.496+03', '2026-06-12 03:36:47.496+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWGNTPDAGFW6V56JWM0707E', 'KIRMIZI / L', 'ORTLU-TAKM-KIRMIZI-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220936155-5938394158127057972.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 02:36:00.973+03', '2026-06-12 03:36:47.58+03', '2026-06-12 03:36:47.579+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWM540EPVGAZKAC4PMHY1EW', 'SİYAH / S', 'ORTLU-TAKM-SİYAH-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220889657-5938394158127057970.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 03:36:47.758+03', '2026-06-12 03:46:37.943+03', '2026-06-12 03:46:37.943+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWM5447KGQG136R4PR5MR3M', 'SİYAH / M', 'ORTLU-TAKM-SİYAH-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220889657-5938394158127057970.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 03:36:47.879+03', '2026-06-12 03:46:38.308+03', '2026-06-12 03:46:38.307+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWM5486PG7QA99VRKSQH6G0', 'SİYAH / L', 'ORTLU-TAKM-SİYAH-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220889657-5938394158127057970.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 03:36:48.007+03', '2026-06-12 03:46:38.58+03', '2026-06-12 03:46:38.579+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWM54BJZE3VKS5A93ZK4F58', 'BEYAZ / S', 'ORTLU-TAKM-BEYAZ-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220915852-5938394158127057971.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 03:36:48.114+03', '2026-06-12 03:46:38.75+03', '2026-06-12 03:46:38.75+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWM54FFE5711TQ767Z79FGW', 'BEYAZ / M', 'ORTLU-TAKM-BEYAZ-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220915852-5938394158127057971.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 03:36:48.239+03', '2026-06-12 03:46:38.892+03', '2026-06-12 03:46:38.892+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWM54K68TETTSSTQPQX94RS', 'BEYAZ / L', 'ORTLU-TAKM-BEYAZ-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220915852-5938394158127057971.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 03:36:48.359+03', '2026-06-12 03:46:39.019+03', '2026-06-12 03:46:39.019+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWM54QRGA2GSCCSJKAKZHJG', 'KIRMIZI / S', 'ORTLU-TAKM-KIRMIZI-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220936155-5938394158127057972.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 03:36:48.505+03', '2026-06-12 03:46:39.131+03', '2026-06-12 03:46:39.13+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWM54WK9SXFN6BJDPBM09MD', 'KIRMIZI / M', 'ORTLU-TAKM-KIRMIZI-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220936155-5938394158127057972.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 03:36:48.659+03', '2026-06-12 03:46:39.242+03', '2026-06-12 03:46:39.241+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWM5527R5NFNBEMMQPFETA9', 'KIRMIZI / L', 'ORTLU-TAKM-KIRMIZI-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220936155-5938394158127057972.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 03:36:48.84+03', '2026-06-12 03:46:39.339+03', '2026-06-12 03:46:39.339+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWMQ62DPHWKYF9S68GDNMPK', 'SİYAH / M', 'ORTLU-TAKM-SİYAH-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220889657-5938394158127057970.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 03:46:39.693+03', '2026-06-12 04:32:48.764+03', '2026-06-12 04:32:48.764+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWMQ667A88EQQ4N8RWF2AKX', 'SİYAH / L', 'ORTLU-TAKM-SİYAH-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220889657-5938394158127057970.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 03:46:39.815+03', '2026-06-12 04:32:49.439+03', '2026-06-12 04:32:49.438+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWMQ6ASYGWX9TMNVMAJT62D', 'BEYAZ / S', 'ORTLU-TAKM-BEYAZ-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220915852-5938394158127057971.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 03:46:39.961+03', '2026-06-12 04:32:49.775+03', '2026-06-12 04:32:49.775+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWMQ6F058ABRGFJT4K9J2VA', 'BEYAZ / M', 'ORTLU-TAKM-BEYAZ-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220915852-5938394158127057971.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 03:46:40.097+03', '2026-06-12 04:32:50.311+03', '2026-06-12 04:32:50.311+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWMQ6KBQT9DHB3WF0CS599Y', 'BEYAZ / L', 'ORTLU-TAKM-BEYAZ-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220915852-5938394158127057971.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 03:46:40.236+03', '2026-06-12 04:32:50.636+03', '2026-06-12 04:32:50.635+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWMQ6R197A997PEEZSSK2ZG', 'KIRMIZI / S', 'ORTLU-TAKM-KIRMIZI-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220936155-5938394158127057972.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 03:46:40.385+03', '2026-06-12 04:32:51.004+03', '2026-06-12 04:32:51.003+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWMQ6X4CPB9SC3HPTVZ17M2', 'KIRMIZI / M', 'ORTLU-TAKM-KIRMIZI-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220936155-5938394158127057972.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 03:46:40.548+03', '2026-06-12 04:32:51.288+03', '2026-06-12 04:32:51.287+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWMQ73WDYYRAK2NSQDNJ9S8', 'KIRMIZI / L', 'ORTLU-TAKM-KIRMIZI-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220936155-5938394158127057972.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 03:46:40.764+03', '2026-06-12 04:32:51.483+03', '2026-06-12 04:32:51.482+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWMQ5Y94RJKPJTXF93AD1JF', 'SİYAH / S', 'ORTLU-TAKM-SİYAH-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220889657-5938394158127057970.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 03:46:39.561+03', '2026-06-12 04:32:48.012+03', '2026-06-12 04:32:48.009+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWQBSF6QS6HG8VQPH1TH5PJ', 'SİYAH / S', 'ORTLU-TAKM-SİYAH-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220889657-5938394158127057970.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 04:32:52.071+03', '2026-06-12 04:32:52.071+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWQBSR3DTDCWMY5RC6PJZRR', 'SİYAH / M', 'ORTLU-TAKM-SİYAH-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220889657-5938394158127057970.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 04:32:52.355+03', '2026-06-12 04:32:52.355+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWQBT1P73D5X7CZEVNAFCAP', 'SİYAH / L', 'ORTLU-TAKM-SİYAH-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220889657-5938394158127057970.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 04:32:52.663+03', '2026-06-12 04:32:52.663+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWQBTCKVJVYCT6KMB4CKHR1', 'BEYAZ / S', 'ORTLU-TAKM-BEYAZ-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220915852-5938394158127057971.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 04:32:53.011+03', '2026-06-12 04:32:53.011+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWQBTSRFMQBWRJDQJM6FG94', 'BEYAZ / M', 'ORTLU-TAKM-BEYAZ-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220915852-5938394158127057971.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 04:32:53.433+03', '2026-06-12 04:32:53.433+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWQBV4ANMXQKEJS4KR26CYW', 'BEYAZ / L', 'ORTLU-TAKM-BEYAZ-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220915852-5938394158127057971.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 04:32:53.771+03', '2026-06-12 04:32:53.771+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWQBVJN2HR5SRSE7PCYB5YH', 'KIRMIZI / S', 'ORTLU-TAKM-KIRMIZI-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220936155-5938394158127057972.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 04:32:54.23+03', '2026-06-12 04:32:54.23+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWQBVZEX916PGDA851QTEZ6', 'KIRMIZI / M', 'ORTLU-TAKM-KIRMIZI-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220936155-5938394158127057972.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 04:32:54.638+03', '2026-06-12 04:32:54.638+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KTWQBWE020M9KEYRDA45X1JE', 'KIRMIZI / L', 'ORTLU-TAKM-KIRMIZI-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781220936155-5938394158127057972.jpg", "cost_price": 350}', 0, 'prod_01KTVJYNS8G4MJ84M0WQ7Y4SHJ', '2026-06-12 04:32:55.105+03', '2026-06-12 04:32:55.105+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1XXB68A8AB8PS93GT31KV2', 'KIRMIZI / S', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402540430-WhatsAppImage2026-06-12at192954.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:03:30.894+03', '2026-06-14 05:16:49.054+03', '2026-06-14 05:16:49.054+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1XXB68DQXV66B0HZ8R70RD', 'KIRMIZI / M', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402540430-WhatsAppImage2026-06-12at192954.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:03:30.894+03', '2026-06-14 05:16:49.442+03', '2026-06-14 05:16:49.442+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1XXB69SCYQK4G1ECAQY4TH', 'KIRMIZI / L', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402540430-WhatsAppImage2026-06-12at192954.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:03:30.894+03', '2026-06-14 05:16:49.859+03', '2026-06-14 05:16:49.859+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1XXB69CG0WQ8592VW7NSBC', 'KIRMIZI / XL', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-XL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402540430-WhatsAppImage2026-06-12at192954.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:03:30.894+03', '2026-06-14 05:16:50.237+03', '2026-06-14 05:16:50.236+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1XXB6AGQ67RAG9A3AK4YDS', 'KIRMIZI / XXL', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-XXL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402540430-WhatsAppImage2026-06-12at192954.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:03:30.894+03', '2026-06-14 05:16:50.499+03', '2026-06-14 05:16:50.498+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1XXB6A3MZ68S7QYSADSPB6', 'BEYAZ / S', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402560080-WhatsAppImage2026-06-12at1929541.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:03:30.894+03', '2026-06-14 05:16:50.742+03', '2026-06-14 05:16:50.742+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1XXB6BYV20WQMBDBEKYJ0K', 'BEYAZ / M', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402560080-WhatsAppImage2026-06-12at1929541.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:03:30.894+03', '2026-06-14 05:16:51.049+03', '2026-06-14 05:16:51.049+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1XXB6BZCC6X7CG316X54VY', 'BEYAZ / L', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402560080-WhatsAppImage2026-06-12at1929541.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:03:30.894+03', '2026-06-14 05:16:51.279+03', '2026-06-14 05:16:51.279+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1XXB6CZ7KEDCY2ZQXNBH3F', 'BEYAZ / XL', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-XL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402560080-WhatsAppImage2026-06-12at1929541.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:03:30.894+03', '2026-06-14 05:16:51.48+03', '2026-06-14 05:16:51.479+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1XXB6C58N5X1RKV7T5N65K', 'BEYAZ / XXL', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-XXL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402560080-WhatsAppImage2026-06-12at1929541.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:03:30.894+03', '2026-06-14 05:16:51.665+03', '2026-06-14 05:16:51.665+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1XXB6CPRC9GA6CHXSCK53M', 'SİYAH / S', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402579617-WhatsAppImage2026-06-12at1929542.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:03:30.895+03', '2026-06-14 05:16:51.822+03', '2026-06-14 05:16:51.822+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1XXB6DDPAYVN3D55882TWC', 'SİYAH / M', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402579617-WhatsAppImage2026-06-12at1929542.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:03:30.895+03', '2026-06-14 05:16:51.97+03', '2026-06-14 05:16:51.97+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1XXB6D9FD6N7MBVM95R8Z1', 'SİYAH / L', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402579617-WhatsAppImage2026-06-12at1929542.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:03:30.895+03', '2026-06-14 05:16:52.1+03', '2026-06-14 05:16:52.1+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1XXB6DAYECEN7PXZAJBC94', 'SİYAH / XL', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-XL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402579617-WhatsAppImage2026-06-12at1929542.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:03:30.895+03', '2026-06-14 05:16:52.21+03', '2026-06-14 05:16:52.209+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1XXB6DCZ91SR4G11WPWN2C', 'SİYAH / XXL', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-XXL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402579617-WhatsAppImage2026-06-12at1929542.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:03:30.895+03', '2026-06-14 05:16:52.309+03', '2026-06-14 05:16:52.309+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1YNT196VHQ360Q3WMC9NNF', 'KIRMIZI / S', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402540430-WhatsAppImage2026-06-12at192954.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:16:52.521+03', '2026-06-14 06:22:49.16+03', '2026-06-14 06:22:49.16+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1YNT4HMZ8TNJAG099ZX3RV', 'KIRMIZI / M', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402540430-WhatsAppImage2026-06-12at192954.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:16:52.625+03', '2026-06-14 06:22:49.735+03', '2026-06-14 06:22:49.735+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1YNTBFTM2X9WVJ3TCG5XAV', 'KIRMIZI / L', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402540430-WhatsAppImage2026-06-12at192954.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:16:52.847+03', '2026-06-14 06:22:50.241+03', '2026-06-14 06:22:50.24+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1YNTG67BQRS4NWE2D9QE0D', 'KIRMIZI / XL', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-XL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402540430-WhatsAppImage2026-06-12at192954.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:16:52.998+03', '2026-06-14 06:22:50.75+03', '2026-06-14 06:22:50.75+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1YNTR9N2XEW4E56W3NTHA0', 'KIRMIZI / XXL', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-XXL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402540430-WhatsAppImage2026-06-12at192954.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:16:53.258+03', '2026-06-14 06:22:51.094+03', '2026-06-14 06:22:51.093+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1YNV26EGEKA909S31Y3V69', 'BEYAZ / S', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402560080-WhatsAppImage2026-06-12at1929541.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:16:53.574+03', '2026-06-14 06:22:51.374+03', '2026-06-14 06:22:51.374+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1YNV7SZCYSZK89KYSX4YD6', 'BEYAZ / M', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402560080-WhatsAppImage2026-06-12at1929541.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:16:53.753+03', '2026-06-14 06:22:51.615+03', '2026-06-14 06:22:51.615+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1YNVDNESETQJ5WNAYGZ724', 'BEYAZ / L', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402560080-WhatsAppImage2026-06-12at1929541.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:16:53.942+03', '2026-06-14 06:22:51.862+03', '2026-06-14 06:22:51.862+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1YNVKY0H4208HVVEW1PWRG', 'BEYAZ / XL', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-XL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402560080-WhatsAppImage2026-06-12at1929541.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:16:54.142+03', '2026-06-14 06:22:52.135+03', '2026-06-14 06:22:52.135+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1YNVTPGP7YNJQEQC310M2J', 'BEYAZ / XXL', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-XXL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402560080-WhatsAppImage2026-06-12at1929541.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:16:54.359+03', '2026-06-14 06:22:52.473+03', '2026-06-14 06:22:52.473+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1YNW2N2Q8507TSWE2JY16D', 'SİYAH / S', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402579617-WhatsAppImage2026-06-12at1929542.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:16:54.614+03', '2026-06-14 06:22:52.784+03', '2026-06-14 06:22:52.784+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1YNWAW1Q4QW3FDGBTCDF6A', 'SİYAH / M', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402579617-WhatsAppImage2026-06-12at1929542.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:16:54.877+03', '2026-06-14 06:22:53.02+03', '2026-06-14 06:22:53.02+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1YNWMB1GW071DN16P9W094', 'SİYAH / L', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402579617-WhatsAppImage2026-06-12at1929542.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:16:55.179+03', '2026-06-14 06:22:53.16+03', '2026-06-14 06:22:53.16+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1YNX05AFVZWBHQ6ZP4T6ZK', 'SİYAH / XL', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-XL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402579617-WhatsAppImage2026-06-12at1929542.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:16:55.558+03', '2026-06-14 06:22:53.273+03', '2026-06-14 06:22:53.273+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV1YNX9RG0PNS20P3AXNXAWY', 'SİYAH / XXL', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-XXL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402579617-WhatsAppImage2026-06-12at1929542.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 05:16:55.864+03', '2026-06-14 06:22:53.362+03', '2026-06-14 06:22:53.362+03', NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV22EP7TAD0HHRHKKYVF4ASH', 'KIRMIZI / S', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402540430-WhatsAppImage2026-06-12at192954.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 06:22:53.563+03', '2026-06-14 06:22:53.563+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV22EPBJTYXS1HAY5BK2B2QP', 'KIRMIZI / M', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402540430-WhatsAppImage2026-06-12at192954.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 06:22:53.682+03', '2026-06-14 06:22:53.682+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV22EPF6ZB5WY6Y3YW1GJW8B', 'KIRMIZI / L', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402540430-WhatsAppImage2026-06-12at192954.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 06:22:53.798+03', '2026-06-14 06:22:53.798+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV22EPJTS04JXW6CDKEK7FQY', 'KIRMIZI / XL', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-XL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402540430-WhatsAppImage2026-06-12at192954.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 06:22:53.915+03', '2026-06-14 06:22:53.915+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV22EPQ578HA2RY70QDBDE5S', 'KIRMIZI / XXL', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-KIRMIZI-XXL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402540430-WhatsAppImage2026-06-12at192954.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 06:22:54.053+03', '2026-06-14 06:22:54.053+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV22EPW43PEDT59ERN26PNYV', 'BEYAZ / S', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402560080-WhatsAppImage2026-06-12at1929541.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 06:22:54.212+03', '2026-06-14 06:22:54.212+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV22EQ361YD245KXJWT9W8RG', 'BEYAZ / M', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402560080-WhatsAppImage2026-06-12at1929541.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 06:22:54.438+03', '2026-06-14 06:22:54.438+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV22EQBHPXC304YQGCZG3HNP', 'BEYAZ / L', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402560080-WhatsAppImage2026-06-12at1929541.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 06:22:54.706+03', '2026-06-14 06:22:54.706+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV22EQMTZJKSDN9YDK00S8S7', 'BEYAZ / XL', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-XL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402560080-WhatsAppImage2026-06-12at1929541.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 06:22:55.002+03', '2026-06-14 06:22:55.002+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV22EQVZTZDYQSZNDCXW3PWN', 'BEYAZ / XXL', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-BEYAZ-XXL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402560080-WhatsAppImage2026-06-12at1929541.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 06:22:55.232+03', '2026-06-14 06:22:55.232+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV22ER4J13F4AK749AP3VNY1', 'SİYAH / S', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-S', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402579617-WhatsAppImage2026-06-12at1929542.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 06:22:55.506+03', '2026-06-14 06:22:55.506+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV22ERK0R9EVMEC5T8ERZ4WH', 'SİYAH / M', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-M', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402579617-WhatsAppImage2026-06-12at1929542.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 06:22:55.969+03', '2026-06-14 06:22:55.969+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV22ERZGRN0N8Q7A3KWNK6CF', 'SİYAH / L', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-L', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402579617-WhatsAppImage2026-06-12at1929542.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 06:22:56.369+03', '2026-06-14 06:22:56.369+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV22ES8MZQH3TBTBT8D5D9HB', 'SİYAH / XL', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-XL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402579617-WhatsAppImage2026-06-12at1929542.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 06:22:56.66+03', '2026-06-14 06:22:56.66+03', NULL, NULL);
INSERT INTO public.product_variant VALUES ('variant_01KV22ESK9VZ22T199H59K1XXG', 'SİYAH / XXL', 'TURKIYE-MILLI-TAKIM-BISIKLET-YAKA-TSHIRT-SİYAH-XXL', NULL, NULL, NULL, false, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"image": "http://localhost:8001/uploads/1781402579617-WhatsAppImage2026-06-12at1929542.jpeg", "cost_price": 330}', 0, 'prod_01KV1XXB3JP1V8SCP05G7ZPPD4', '2026-06-14 06:22:57.002+03', '2026-06-14 06:22:57.002+03', NULL, NULL);


--
-- Data for Name: product_variant_inventory_item; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWQBSF6QS6HG8VQPH1TH5PJ', 'iitem_01KTWQBSG6KP99T9SCYP3BYA29', 'pvitem_01KTWQBSGX8JWQDYD1Z7FB7BGT', 1, '2026-06-12 04:32:52.12494+03', '2026-06-12 04:32:52.12494+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWQBSR3DTDCWMY5RC6PJZRR', 'iitem_01KTWQBSRVN8G2YY7TJCVQ3MTF', 'pvitem_01KTWQBSSK1S5AM6DEGTA5GHGB', 1, '2026-06-12 04:32:52.402941+03', '2026-06-12 04:32:52.402941+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWQBTCKVJVYCT6KMB4CKHR1', 'iitem_01KTWQBTDA6F7ARBTFX91ADYM0', 'pvitem_01KTWQBTDYGGM9RG0M9Z2X1C81', 1, '2026-06-12 04:32:53.054024+03', '2026-06-12 04:32:53.054024+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWQBV4ANMXQKEJS4KR26CYW', 'iitem_01KTWQBV55S53T8D2H0XZ7D0Q0', 'pvitem_01KTWQBV60R3KPKY3RYKKZ9WY7', 1, '2026-06-12 04:32:53.823502+03', '2026-06-12 04:32:53.823502+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWQBVZEX916PGDA851QTEZ6', 'iitem_01KTWQBW03JQ730B4V609KT99P', 'pvitem_01KTWQBW0RYAHEX75NJFWXT37P', 1, '2026-06-12 04:32:54.680047+03', '2026-06-12 04:32:54.680047+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1XXB68DQXV66B0HZ8R70RD', 'iitem_01KV1XXB7WNKEZ1QR4JAZ15TH3', 'pvitem_01KV1XXB8WKB0JPPMPCRH6PF86', 1, '2026-06-14 05:03:30.971544+03', '2026-06-14 05:16:49.396+03', '2026-06-14 05:16:49.396+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQ70PK60F11KJD4BN8Q', 'iitem_01KTSXRBT08JVZ0KNNXH0HDMYR', 'pvitem_01KTSXRBWGGMSYYTTETBYD5KCM', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:53:56.543+03', '2026-06-11 17:53:56.54+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQ8H06DERRH0N15Z39H', 'iitem_01KTSXRBT0C7ZE00W2TV0NFW7Q', 'pvitem_01KTSXRBWH08WEB6QAAT1EKAHA', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:53:56.543+03', '2026-06-11 17:53:56.54+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQ8M00DRQ10C5AGM93G', 'iitem_01KTSXRBT1KJ0K4VSN48TV480C', 'pvitem_01KTSXRBWHKHTJ5G1BHS19P4TJ', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:53:56.544+03', '2026-06-11 17:53:56.54+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQ8BFJ2RXVDM2CBVY3V', 'iitem_01KTSXRBT1PHDCC8RBWWVV3NHH', 'pvitem_01KTSXRBWJKKNJD4YW437PM7NK', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:53:56.543+03', '2026-06-11 17:53:56.54+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQ1TRP0F9K1FBSD91JT', 'iitem_01KTSXRBSWKYBX04CZK09JFE61', 'pvitem_01KTSXRBWAMSX6C0G8AGTRDPMS', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:57:07.633+03', '2026-06-11 17:57:07.632+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQ3MVMR2DF6RW8PH22V', 'iitem_01KTSXRBSXH6EA0AHYMPZQC78P', 'pvitem_01KTSXRBWCSM1JXSTAZFMPD3YD', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:57:07.633+03', '2026-06-11 17:57:07.632+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQ3Q4FR220FETFCPY1R', 'iitem_01KTSXRBSXDH3MHXQF4BXMPJ0F', 'pvitem_01KTSXRBWD676ZWBQ2Y33CFZQC', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:57:07.633+03', '2026-06-11 17:57:07.632+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQ433WKRGKNCWZCT6K4', 'iitem_01KTSXRBSY85VWEFW1Y1T78WMP', 'pvitem_01KTSXRBWDESGQ320HSQN76X01', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:57:07.633+03', '2026-06-11 17:57:07.632+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQ5F2VK5FXFEBD1HKR2', 'iitem_01KTSXRBSYVT8W7MANN1YWW0X4', 'pvitem_01KTSXRBWEWX9P16K8DP10JXYF', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:57:07.634+03', '2026-06-11 17:57:07.632+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQ57H9D9J1HV26808CR', 'iitem_01KTSXRBSYNZD9J1AG6T6YXQ1V', 'pvitem_01KTSXRBWFHKJXZN0JDTEJXW4W', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:57:07.633+03', '2026-06-11 17:57:07.632+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQ6GDPF4C0C12WQFD3F', 'iitem_01KTSXRBSZ7JMAX6H10PBNPQFW', 'pvitem_01KTSXRBWFJ5FEK6YK7CG13PDT', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:57:07.634+03', '2026-06-11 17:57:07.632+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQ60XY3R71ZASPEGG0G', 'iitem_01KTSXRBSZYT165TR2ZAQA0DPF', 'pvitem_01KTSXRBWGA9JGBCJEJ36VGP1X', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:57:07.634+03', '2026-06-11 17:57:07.632+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQ9WQNWKF6H7PRM0EW3', 'iitem_01KTSXRBT1EW6Z76EGS7GPD3P0', 'pvitem_01KTSXRBWJY6PF535C43CSJZXZ', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:57:11.821+03', '2026-06-11 17:57:11.82+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQ9PVA4GEQ8BA0RFZC9', 'iitem_01KTSXRBT2XN1TVK367KHM23VA', 'pvitem_01KTSXRBWJCXT6WNGMF13F8QW4', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:57:11.821+03', '2026-06-11 17:57:11.82+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQ9PA5NHG640SKXJF4J', 'iitem_01KTSXRBT2BX3ZD953AKFZKST3', 'pvitem_01KTSXRBWKF38ZYMT4SGE1AESH', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:57:11.821+03', '2026-06-11 17:57:11.82+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQASSFDDHCB4JRVQ6G7', 'iitem_01KTSXRBT3EFZTGWYK1KJ3ANX2', 'pvitem_01KTSXRBWKN425TNYZQM0E2A5B', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:57:11.821+03', '2026-06-11 17:57:11.82+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQAEHTRK7770FW58HKF', 'iitem_01KTSXRBT3ZGP5CN4SRCS2N68T', 'pvitem_01KTSXRBWK4VBGBVYQ4T88VF9M', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:57:16.338+03', '2026-06-11 17:57:16.336+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQBGMJ604Z25DNWT67Q', 'iitem_01KTSXRBT36V9HDT3SFV5YJFYN', 'pvitem_01KTSXRBWMP3QN26M2H0E9WME5', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:57:16.338+03', '2026-06-11 17:57:16.336+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQBMHDBE8Y0J1XPFZ26', 'iitem_01KTSXRBT42MBJ1D00Y075CRCD', 'pvitem_01KTSXRBWMZWBYPYNVVVBATMXT', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:57:16.338+03', '2026-06-11 17:57:16.336+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTSXRBQCF6X834577SZZ8WRZ', 'iitem_01KTSXRBT4K95CQBBB7F3PN043', 'pvitem_01KTSXRBWM44WRSPM2702FAHS4', 1, '2026-06-11 02:26:52.297824+03', '2026-06-11 17:57:16.341+03', '2026-06-11 17:57:16.336+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1XXB69SCYQK4G1ECAQY4TH', 'iitem_01KV1XXB7WFAQ094JZH08HGNPP', 'pvitem_01KV1XXB8WMGCMS1CS695A2R9M', 1, '2026-06-14 05:03:30.971544+03', '2026-06-14 05:16:49.807+03', '2026-06-14 05:16:49.807+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1XXB69CG0WQ8592VW7NSBC', 'iitem_01KV1XXB7W631J64RJ4EPKMAEE', 'pvitem_01KV1XXB8WCQMTFCBPASM0F9ZK', 1, '2026-06-14 05:03:30.971544+03', '2026-06-14 05:16:50.199+03', '2026-06-14 05:16:50.199+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1XXB6AGQ67RAG9A3AK4YDS', 'iitem_01KV1XXB7W5WNPJNKP9M3VV42V', 'pvitem_01KV1XXB8XVD8D1M33NRJJGK81', 1, '2026-06-14 05:03:30.971544+03', '2026-06-14 05:16:50.46+03', '2026-06-14 05:16:50.46+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1XXB6A3MZ68S7QYSADSPB6', 'iitem_01KV1XXB7XWASVAVNYY13WQN7W', 'pvitem_01KV1XXB8X94MGA2G02QA1F9AV', 1, '2026-06-14 05:03:30.971544+03', '2026-06-14 05:16:50.709+03', '2026-06-14 05:16:50.708+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1XXB6BYV20WQMBDBEKYJ0K', 'iitem_01KV1XXB7X9Y6CEMA25ZFSYDF4', 'pvitem_01KV1XXB8XDWY86AR8WTM8JXYB', 1, '2026-06-14 05:03:30.971544+03', '2026-06-14 05:16:50.977+03', '2026-06-14 05:16:50.977+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1XXB6BZCC6X7CG316X54VY', 'iitem_01KV1XXB7X27QV1MJF58RC3FFX', 'pvitem_01KV1XXB8XBYD38FVVMK2YAB2C', 1, '2026-06-14 05:03:30.971544+03', '2026-06-14 05:16:51.248+03', '2026-06-14 05:16:51.248+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1XXB6CZ7KEDCY2ZQXNBH3F', 'iitem_01KV1XXB7XZYG2B0MW5991DS3B', 'pvitem_01KV1XXB8XTG47PSHAX7VRS2A4', 1, '2026-06-14 05:03:30.971544+03', '2026-06-14 05:16:51.449+03', '2026-06-14 05:16:51.448+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1XXB6CPRC9GA6CHXSCK53M', 'iitem_01KV1XXB7Y5PH3BVGWZ5HYM9KM', 'pvitem_01KV1XXB8XQ3KMM31JNFBD5YHD', 1, '2026-06-14 05:03:30.971544+03', '2026-06-14 05:16:51.789+03', '2026-06-14 05:16:51.788+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1XXB6DDPAYVN3D55882TWC', 'iitem_01KV1XXB7YJSAJ3932BTQGJWSG', 'pvitem_01KV1XXB8X3YDYKS8PWVSKC1G1', 1, '2026-06-14 05:03:30.971544+03', '2026-06-14 05:16:51.937+03', '2026-06-14 05:16:51.936+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1XXB6D9FD6N7MBVM95R8Z1', 'iitem_01KV1XXB7YHNQTB2A393PAD8MM', 'pvitem_01KV1XXB8XE47NCW4FHPX5V714', 1, '2026-06-14 05:03:30.971544+03', '2026-06-14 05:16:52.065+03', '2026-06-14 05:16:52.065+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1XXB6DAYECEN7PXZAJBC94', 'iitem_01KV1XXB7ZXT8K9DET11JHX3TP', 'pvitem_01KV1XXB8XF7CE14V83AGTP3KF', 1, '2026-06-14 05:03:30.971544+03', '2026-06-14 05:16:52.181+03', '2026-06-14 05:16:52.18+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWF9Y6V49ED3FQ4XS3GJ434', 'iitem_01KTWF9Y7V9KYAY5R8HHMM590R', 'pvitem_01KTWF9Y858GZZEMMVV4CG3572', 1, '2026-06-12 02:12:02.821165+03', '2026-06-12 02:32:17.136+03', '2026-06-12 02:32:17.135+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWF9YBTF01TEEF0KPG5MNGH', 'iitem_01KTWF9YC2BKVT9A68J35TP8DC', 'pvitem_01KTWF9YCC3970AC0H6YCSARX4', 1, '2026-06-12 02:12:02.956154+03', '2026-06-12 02:32:18.469+03', '2026-06-12 02:32:18.468+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWF9YHPJXMTJSFRSTK8R8RB', 'iitem_01KTWF9YJ23TDZ4QV0CYK9VDPR', 'pvitem_01KTWF9YJDRP31F2A87W37C8NX', 1, '2026-06-12 02:12:03.149449+03', '2026-06-12 02:32:19.394+03', '2026-06-12 02:32:19.394+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWF9YWPDZG9EVXXFEFAGX79', 'iitem_01KTWF9YXAJ7NTXNGFC288MT94', 'pvitem_01KTWF9YXRCETC8A0A7QPYER4V', 1, '2026-06-12 02:12:03.512715+03', '2026-06-12 02:32:20.705+03', '2026-06-12 02:32:20.704+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWF9Z7YTECSPGDH20AWH4W9', 'iitem_01KTWF9Z89ZQQ0XVB135N7GEWK', 'pvitem_01KTWF9Z8JM2ATV5YAPZZMPYE3', 1, '2026-06-12 02:12:03.858111+03', '2026-06-12 02:32:21.489+03', '2026-06-12 02:32:21.489+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWF9ZSA5N3ZEZZKNER8CYB2', 'iitem_01KTWF9ZSSMRXG0M90923D7FBK', 'pvitem_01KTWF9ZT5RJT6QMMQB77C3HNQ', 1, '2026-06-12 02:12:04.42131+03', '2026-06-12 02:32:22.17+03', '2026-06-12 02:32:22.169+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWFA07AKCN7WFV5TR6T32ER', 'iitem_01KTWFA07RRMX3AT10JKKSZNX6', 'pvitem_01KTWFA0824YKNYEKDXTETHBBN', 1, '2026-06-12 02:12:04.865758+03', '2026-06-12 02:32:22.769+03', '2026-06-12 02:32:22.769+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWFA0PFGGX0YKX0HSXQ9H9P', 'iitem_01KTWFA0PRA1ZRCEE2GNK24T7F', 'pvitem_01KTWFA0Q10K12V3N5NT2H4KCZ', 1, '2026-06-12 02:12:05.345969+03', '2026-06-12 02:32:23.304+03', '2026-06-12 02:32:23.304+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWFA19MVVWCK74WJ8335FY7', 'iitem_01KTWFA19YRJEYAT7C2CK3WD31', 'pvitem_01KTWFA1A7CBTWZDT4ZXR7YF6E', 1, '2026-06-12 02:12:05.959177+03', '2026-06-12 02:32:23.772+03', '2026-06-12 02:32:23.772+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWFA1XAWENQ3004NBYJXVHT', 'iitem_01KTWFA1XRQD5W19WHEVHNE9BP', 'pvitem_01KTWFA1Y31MZTPS1Q9G1R2SVQ', 1, '2026-06-12 02:12:06.595064+03', '2026-06-12 02:32:24.188+03', '2026-06-12 02:32:24.188+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWFA2TE54YKQ3WDWAKR9QQC', 'iitem_01KTWFA2TNE76AGAPFJ4ER1Q45', 'pvitem_01KTWFA2TYGWYA5ZW6P29NGNV4', 1, '2026-06-12 02:12:07.5181+03', '2026-06-12 02:32:24.626+03', '2026-06-12 02:32:24.625+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWQBT1P73D5X7CZEVNAFCAP', 'iitem_01KTWQBT33EANXY8TDJ0C4SVR9', 'pvitem_01KTWQBT4EESXXXTVFCJTJ8F2P', 1, '2026-06-12 04:32:52.749095+03', '2026-06-12 04:32:52.749095+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWQBTSRFMQBWRJDQJM6FG94', 'iitem_01KTWQBTTG4X48RQMBBPD9ACCX', 'pvitem_01KTWQBTV5MFF9K762F703W3N3', 1, '2026-06-12 04:32:53.477108+03', '2026-06-12 04:32:53.477108+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWFA3FCNHQ6X8C8N9C7YEEG', 'iitem_01KTWFA3FNPSDS6RA7P8N720YG', 'pvitem_01KTWFA3FWV9490QHVJKQJDPA1', 1, '2026-06-12 02:12:08.188504+03', '2026-06-12 02:32:24.922+03', '2026-06-12 02:32:24.922+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWFA545MJFC6SVY0H5RV1DP', 'iitem_01KTWFA54JF62WRBT9W5M8NK1M', 'pvitem_01KTWFA54V5B22FXQGRKV574VG', 1, '2026-06-12 02:12:09.883082+03', '2026-06-12 02:32:25.339+03', '2026-06-12 02:32:25.339+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWQBVJN2HR5SRSE7PCYB5YH', 'iitem_01KTWQBVKJVEC5JCZFA8JTAWMN', 'pvitem_01KTWQBVM955NC1V66V79CWWJ7', 1, '2026-06-12 04:32:54.280804+03', '2026-06-12 04:32:54.280804+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWQBWE020M9KEYRDA45X1JE', 'iitem_01KTWQBWEW8NPXVFTVVYQ9N24K', 'pvitem_01KTWQBWFNX06HVJ8HNVEWAJWR', 1, '2026-06-12 04:32:55.157174+03', '2026-06-12 04:32:55.157174+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1XXB6C58N5X1RKV7T5N65K', 'iitem_01KV1XXB7YZ3CZJZTQAEDDA34B', 'pvitem_01KV1XXB8X6DAV5Y99R6ZSGWTA', 1, '2026-06-14 05:03:30.971544+03', '2026-06-14 05:16:51.623+03', '2026-06-14 05:16:51.623+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1XXB6DCZ91SR4G11WPWN2C', 'iitem_01KV1XXB7ZRJV666SJAW3RESTT', 'pvitem_01KV1XXB8X2V3C7RKWVYCK5JS7', 1, '2026-06-14 05:03:30.971544+03', '2026-06-14 05:16:52.276+03', '2026-06-14 05:16:52.275+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1YNT196VHQ360Q3WMC9NNF', 'iitem_01KV1YNT1MHN05YNDC35WQPRBY', 'pvitem_01KV1YNT1YAVTRDX46J7TJD4S7', 1, '2026-06-14 05:16:52.542132+03', '2026-06-14 06:22:49.052+03', '2026-06-14 06:22:49.051+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1YNT4HMZ8TNJAG099ZX3RV', 'iitem_01KV1YNT4YWPRXSHRVTRESS7W6', 'pvitem_01KV1YNT5HXV2368J71BNXNRCR', 1, '2026-06-14 05:16:52.657585+03', '2026-06-14 06:22:49.686+03', '2026-06-14 06:22:49.686+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1YNTBFTM2X9WVJ3TCG5XAV', 'iitem_01KV1YNTBTDYEC9E3H071XW9BY', 'pvitem_01KV1YNTC5YJSEQ6EN5PBZK497', 1, '2026-06-14 05:16:52.869965+03', '2026-06-14 06:22:50.196+03', '2026-06-14 06:22:50.196+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1YNTG67BQRS4NWE2D9QE0D', 'iitem_01KV1YNTGE0TDHENZCHGP8PXJ8', 'pvitem_01KV1YNTGQVR2DEEFBYEKSHAR9', 1, '2026-06-14 05:16:53.015406+03', '2026-06-14 06:22:50.714+03', '2026-06-14 06:22:50.714+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1YNTR9N2XEW4E56W3NTHA0', 'iitem_01KV1YNTRVPCZB4X2FAVWMFF43', 'pvitem_01KV1YNTSAYJHPP9GV0E631HPY', 1, '2026-06-14 05:16:53.290139+03', '2026-06-14 06:22:51.027+03', '2026-06-14 06:22:51.027+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1YNV26EGEKA909S31Y3V69', 'iitem_01KV1YNV2EGYJX6972JX490FK6', 'pvitem_01KV1YNV2PWX3FP6HP5Z8K7T24', 1, '2026-06-14 05:16:53.590751+03', '2026-06-14 06:22:51.337+03', '2026-06-14 06:22:51.337+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1YNV7SZCYSZK89KYSX4YD6', 'iitem_01KV1YNV80CFFV2SSHEPNTM7AN', 'pvitem_01KV1YNV892SCS0KDYNGAQYF7A', 1, '2026-06-14 05:16:53.76976+03', '2026-06-14 06:22:51.582+03', '2026-06-14 06:22:51.582+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1YNVDNESETQJ5WNAYGZ724', 'iitem_01KV1YNVDZRYE6ZDNN3805ACJM', 'pvitem_01KV1YNVE70V80GX84PTHZ7PKA', 1, '2026-06-14 05:16:53.959529+03', '2026-06-14 06:22:51.813+03', '2026-06-14 06:22:51.813+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1YNVKY0H4208HVVEW1PWRG', 'iitem_01KV1YNVM73W648516WERNHD2S', 'pvitem_01KV1YNVMFW2M70EDTT5B9P9CV', 1, '2026-06-14 05:16:54.15922+03', '2026-06-14 06:22:52.053+03', '2026-06-14 06:22:52.052+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1YNVTPGP7YNJQEQC310M2J', 'iitem_01KV1YNVTZ9XR27PZCH0NGSCPB', 'pvitem_01KV1YNVV8DPSH6WS080DBQRFG', 1, '2026-06-14 05:16:54.376674+03', '2026-06-14 06:22:52.422+03', '2026-06-14 06:22:52.422+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1YNW2N2Q8507TSWE2JY16D', 'iitem_01KV1YNW34SMKW78H0PVJ1BQTS', 'pvitem_01KV1YNW3B9VTDAR74C4X9A405', 1, '2026-06-14 05:16:54.63605+03', '2026-06-14 06:22:52.715+03', '2026-06-14 06:22:52.714+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1YNWAW1Q4QW3FDGBTCDF6A', 'iitem_01KV1YNWB58QQQSY7VJZ5TCQGA', 'pvitem_01KV1YNWBCW70AXBKE70TJVWGH', 1, '2026-06-14 05:16:54.892998+03', '2026-06-14 06:22:52.979+03', '2026-06-14 06:22:52.979+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1YNWMB1GW071DN16P9W094', 'iitem_01KV1YNWMSR5ZSB2W9NAYJ1MDJ', 'pvitem_01KV1YNWN6TYK3JC4Y9GM83TF0', 1, '2026-06-14 05:16:55.206366+03', '2026-06-14 06:22:53.128+03', '2026-06-14 06:22:53.128+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1YNX05AFVZWBHQ6ZP4T6ZK', 'iitem_01KV1YNX0HE9B10FZVMXGQ1ZY8', 'pvitem_01KV1YNX0TXEK938ESXWHKET1R', 1, '2026-06-14 05:16:55.579029+03', '2026-06-14 06:22:53.242+03', '2026-06-14 06:22:53.242+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1YNX9RG0PNS20P3AXNXAWY', 'iitem_01KV1YNXA2XTCWXCDRP65A73QZ', 'pvitem_01KV1YNXAAMFAXY85WPZDMR4PN', 1, '2026-06-14 05:16:55.883051+03', '2026-06-14 06:22:53.332+03', '2026-06-14 06:22:53.332+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV22EQ361YD245KXJWT9W8RG', 'iitem_01KV22EQ3HH7NW81Z3FZ7KF1X4', 'pvitem_01KV22EQ3W89X69KN52WKMEXCZ', 1, '2026-06-14 06:22:54.459856+03', '2026-06-14 06:22:54.459856+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV22EQBHPXC304YQGCZG3HNP', 'iitem_01KV22EQBYYNAA309397JC91Y9', 'pvitem_01KV22EQC7E4MCBSXTTEV6BDV1', 1, '2026-06-14 06:22:54.727689+03', '2026-06-14 06:22:54.727689+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV22EQMTZJKSDN9YDK00S8S7', 'iitem_01KV22EQN434ZP7GP5AQQNVQ09', 'pvitem_01KV22EQNFSQS2QM4RRRCRADV5', 1, '2026-06-14 06:22:55.022848+03', '2026-06-14 06:22:55.022848+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV22EQVZTZDYQSZNDCXW3PWN', 'iitem_01KV22EQW96W6Q8GEFHMYS7TDQ', 'pvitem_01KV22EQWH4QDZF51BX3M6PC58', 1, '2026-06-14 06:22:55.249694+03', '2026-06-14 06:22:55.249694+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV22ER4J13F4AK749AP3VNY1', 'iitem_01KV22ER4WT0AP376NEZWF1VVS', 'pvitem_01KV22ER561T6V3W7K700RANDT', 1, '2026-06-14 06:22:55.525835+03', '2026-06-14 06:22:55.525835+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV22ERK0R9EVMEC5T8ERZ4WH', 'iitem_01KV22ERKH4P3GANREA0ZPV8FW', 'pvitem_01KV22ERM0PXDJ6M251DFKBT4G', 1, '2026-06-14 06:22:56.000464+03', '2026-06-14 06:22:56.000464+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV22ERZGRN0N8Q7A3KWNK6CF', 'iitem_01KV22ERZT42G7PP2J3K5EEKJD', 'pvitem_01KV22ES02VN27P6ANQH9D95SH', 1, '2026-06-14 06:22:56.385974+03', '2026-06-14 06:22:56.385974+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV22ES8MZQH3TBTBT8D5D9HB', 'iitem_01KV22ES8Y5PQG9VXCJNJ3FPMC', 'pvitem_01KV22ES989EK3WNG0Q67NWT46', 1, '2026-06-14 06:22:56.679741+03', '2026-06-14 06:22:56.679741+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV22ESK9VZ22T199H59K1XXG', 'iitem_01KV22ESKMJQWK78MJW7R33YV8', 'pvitem_01KV22ESKY7ZQSR0MXR45XEB1R', 1, '2026-06-14 06:22:57.021976+03', '2026-06-14 06:22:57.021976+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWMQ5Y94RJKPJTXF93AD1JF', 'iitem_01KTWMQ5Z1JPFXQ6VX26H6956Q', 'pvitem_01KTWMQ5ZECYRGMT0DDN9DYPJ0', 1, '2026-06-12 03:46:39.598254+03', '2026-06-12 04:32:47.87+03', '2026-06-12 04:32:47.867+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWMQ62DPHWKYF9S68GDNMPK', 'iitem_01KTWMQ62RP5E43X3WM3SX0E29', 'pvitem_01KTWMQ634VBW3B76TXM3QYTVJ', 1, '2026-06-12 03:46:39.716808+03', '2026-06-12 04:32:48.692+03', '2026-06-12 04:32:48.691+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWFA46SK8J2ACRNSEH01EWZ', 'iitem_01KTWFA47243SEEMRC54NKVCSY', 'pvitem_01KTWFA4793VZWTC8CTCPHVTAM', 1, '2026-06-12 02:12:08.937915+03', '2026-06-12 02:32:25.155+03', '2026-06-12 02:32:25.155+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWFA5Z4WSA3FXAC0YYWW6XE', 'iitem_01KTWFA5ZCER42GS9QZ8AWF6HW', 'pvitem_01KTWFA5ZND9ACGZ5XB5ECZYB0', 1, '2026-06-12 02:12:10.741595+03', '2026-06-12 02:32:25.49+03', '2026-06-12 02:32:25.49+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWMQ667A88EQQ4N8RWF2AKX', 'iitem_01KTWMQ66KX040WJG50K9MPNPD', 'pvitem_01KTWMQ66XBFQ2AG520JTQJE14', 1, '2026-06-12 03:46:39.837902+03', '2026-06-12 04:32:49.348+03', '2026-06-12 04:32:49.347+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWMQ6ASYGWX9TMNVMAJT62D', 'iitem_01KTWMQ6B4HS54FXMNFEB41MTY', 'pvitem_01KTWMQ6BCVESNS44JJ7B05R9J', 1, '2026-06-12 03:46:39.980312+03', '2026-06-12 04:32:49.699+03', '2026-06-12 04:32:49.699+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWMQ6F058ABRGFJT4K9J2VA', 'iitem_01KTWMQ6FAX4QASC1Z3Y3DDHCE', 'pvitem_01KTWMQ6FJA3A9ATJGVK95VKTS', 1, '2026-06-12 03:46:40.115005+03', '2026-06-12 04:32:50.213+03', '2026-06-12 04:32:50.212+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWMQ6KBQT9DHB3WF0CS599Y', 'iitem_01KTWMQ6KMMRMXCPZYMF2SF6C7', 'pvitem_01KTWMQ6KWCFH4TRN0BW91CEDZ', 1, '2026-06-12 03:46:40.252729+03', '2026-06-12 04:32:50.558+03', '2026-06-12 04:32:50.557+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWMQ6R197A997PEEZSSK2ZG', 'iitem_01KTWMQ6RB89PNPBXBHSBV0YCD', 'pvitem_01KTWMQ6RNX84MB79FQP96SRY7', 1, '2026-06-12 03:46:40.405057+03', '2026-06-12 04:32:50.891+03', '2026-06-12 04:32:50.891+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWMQ6X4CPB9SC3HPTVZ17M2', 'iitem_01KTWMQ6XD70Q1T33CWVV0KBMT', 'pvitem_01KTWMQ6XPSKR0P4BDZ3CJVGP2', 1, '2026-06-12 03:46:40.566132+03', '2026-06-12 04:32:51.22+03', '2026-06-12 04:32:51.219+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGF8G0MQENH7ANE8TE0JRT', 'iitem_01KTWGF8GHZBEM76EQHEN8SP0E', 'pvitem_01KTWGF8GSXZGT55625ME2A8JN', 1, '2026-06-12 02:32:25.753741+03', '2026-06-12 02:33:36.751+03', '2026-06-12 02:33:36.751+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGF8KZTZ5JY8NV5M97K04R', 'iitem_01KTWGF8MECZQGS918XC5M9GCX', 'pvitem_01KTWGF8MSFYK7DDTVF8A3RNC0', 1, '2026-06-12 02:32:25.881152+03', '2026-06-12 02:33:37.088+03', '2026-06-12 02:33:37.088+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGF8S0NNTE5FHDKN7PDHMH', 'iitem_01KTWGF8S9Z2DWGNPY7H4M6CF1', 'pvitem_01KTWGF8SHSK256D3YJQH1N6AW', 1, '2026-06-12 02:32:26.03356+03', '2026-06-12 02:33:37.358+03', '2026-06-12 02:33:37.357+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGF8YN79EF4KMYYGA300HJ', 'iitem_01KTWGF8YY3KPY2R9BB9TP2242', 'pvitem_01KTWGF8Z51XRX6Z6Q289MR8BH', 1, '2026-06-12 02:32:26.2139+03', '2026-06-12 02:33:37.538+03', '2026-06-12 02:33:37.538+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGF95PRQ16E4Z7YMT95KZP', 'iitem_01KTWGF95XN489GB3MBQPK9M2F', 'pvitem_01KTWGF964YZRDT7ZK65GADVY4', 1, '2026-06-12 02:32:26.436576+03', '2026-06-12 02:33:37.691+03', '2026-06-12 02:33:37.691+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGF9DJ2AW1XE041XZ6WWBE', 'iitem_01KTWGF9DVG6XJ32AY1RNR5CK9', 'pvitem_01KTWGF9E21NWPV2QEG5S8ZDJ3', 1, '2026-06-12 02:32:26.690265+03', '2026-06-12 02:33:37.801+03', '2026-06-12 02:33:37.8+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWMQ73WDYYRAK2NSQDNJ9S8', 'iitem_01KTWMQ7498EJB0FCARGMA7S4E', 'pvitem_01KTWMQ74QW3TBS1SY838S96TV', 1, '2026-06-12 03:46:40.791393+03', '2026-06-12 04:32:51.409+03', '2026-06-12 04:32:51.408+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV1XXB68A8AB8PS93GT31KV2', 'iitem_01KV1XXB7WTBH02A2QH7HQ6TKF', 'pvitem_01KV1XXB8VDEE4BJ6X0WXNMFYC', 1, '2026-06-14 05:03:30.971544+03', '2026-06-14 05:16:48.971+03', '2026-06-14 05:16:48.97+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV22EP7TAD0HHRHKKYVF4ASH', 'iitem_01KV22EP8C1XEWHQG0VT29XDKQ', 'pvitem_01KV22EP8K5WWQME4KQPGG7VT2', 1, '2026-06-14 06:22:53.587447+03', '2026-06-14 06:22:53.587447+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV22EPBJTYXS1HAY5BK2B2QP', 'iitem_01KV22EPBVQMTH29Y0PESPGCSZ', 'pvitem_01KV22EPC4WT5M51S2SCJYS9SX', 1, '2026-06-14 06:22:53.700696+03', '2026-06-14 06:22:53.700696+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV22EPF6ZB5WY6Y3YW1GJW8B', 'iitem_01KV22EPFEWFFPJS4R6E2YXPDH', 'pvitem_01KV22EPFPHN1V8NSNCP53BMMY', 1, '2026-06-14 06:22:53.814365+03', '2026-06-14 06:22:53.814365+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV22EPJTS04JXW6CDKEK7FQY', 'iitem_01KV22EPK28NN95T9F3GFNYXKP', 'pvitem_01KV22EPKC0V76XXMFCTGR492J', 1, '2026-06-14 06:22:53.932007+03', '2026-06-14 06:22:53.932007+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGHF3FHC2G410EP41XAT4B', 'iitem_01KTWGHF3QZR9KPRXAXWV76G38', 'pvitem_01KTWGHF3ZG3R6GGCE98QH2JEF', 1, '2026-06-12 02:33:38.047867+03', '2026-06-12 02:35:55.819+03', '2026-06-12 02:35:55.819+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGHF7432YQRSMH31PX9ZA2', 'iitem_01KTWGHF7DWCS9BJZ6FT2V0A7J', 'pvitem_01KTWGHF7N0ZQ00KHDEB0DESHJ', 1, '2026-06-12 02:33:38.165451+03', '2026-06-12 02:35:56.412+03', '2026-06-12 02:35:56.411+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGHFBK9WQWBCA1V4KCN067', 'iitem_01KTWGHFBWF710EGK9H18ND0MW', 'pvitem_01KTWGHFC57RJ7XMHGG4ZEQ6M3', 1, '2026-06-12 02:33:38.309482+03', '2026-06-12 02:35:56.783+03', '2026-06-12 02:35:56.783+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGHFHJMSFHKG8VVX3B3Y6P', 'iitem_01KTWGHFHTE7H4MHFSJJZ3QPBF', 'pvitem_01KTWGHFJ25GNS5PA7WB6039NP', 1, '2026-06-12 02:33:38.498428+03', '2026-06-12 02:35:57.06+03', '2026-06-12 02:35:57.06+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGHFRB9GRDR0ZWC5EFCKED', 'iitem_01KTWGHFRNN66R23H3759QHBMW', 'pvitem_01KTWGHFRVGW7VDA0Z6EXWXZZV', 1, '2026-06-12 02:33:38.715624+03', '2026-06-12 02:35:57.316+03', '2026-06-12 02:35:57.316+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGHG0HWG535VFS2VA2V5W4', 'iitem_01KTWGHG0YE8V44476TWV9JFDB', 'pvitem_01KTWGHG16GJGEWQD7EXA6T2EC', 1, '2026-06-12 02:33:38.982087+03', '2026-06-12 02:35:57.473+03', '2026-06-12 02:35:57.472+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV22EPQ578HA2RY70QDBDE5S', 'iitem_01KV22EPQF3CPCQ44QRYJF6F2V', 'pvitem_01KV22EPQRXB3JYH3P3V6AKN1A', 1, '2026-06-14 06:22:54.072139+03', '2026-06-14 06:22:54.072139+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KV22EPW43PEDT59ERN26PNYV', 'iitem_01KV22EPWB9XH3SEHM762KHRZC', 'pvitem_01KV22EPWN325BYVRBFJ4RTS33', 1, '2026-06-14 06:22:54.229495+03', '2026-06-14 06:22:54.229495+03', NULL);
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGNQJ48C35RSSRQH387KT2', 'iitem_01KTWGNQJG1E5YQ4BP1Q0DCA4M', 'pvitem_01KTWGNQJT7DT0PYNF77S0QREX', 1, '2026-06-12 02:35:57.786439+03', '2026-06-12 03:36:46.328+03', '2026-06-12 03:36:46.328+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGNQQH5D122AQFA689J1XW', 'iitem_01KTWGNQQTKCA2ZH9X0PZJHZ95', 'pvitem_01KTWGNQR429EHPVWABF0XC0NC', 1, '2026-06-12 02:35:57.956381+03', '2026-06-12 03:36:46.556+03', '2026-06-12 03:36:46.556+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGNQY7JX0ZDEC5C5A940FE', 'iitem_01KTWGNQYJHZ9G8T685KCZTM5T', 'pvitem_01KTWGNQYXWNCFWRHTP79ZDDXH', 1, '2026-06-12 02:35:58.173668+03', '2026-06-12 03:36:46.786+03', '2026-06-12 03:36:46.785+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGNR6QE41HHHBB6BTGFHDY', 'iitem_01KTWGNR728N8S1Q4BKPRE25CE', 'pvitem_01KTWGNR7B56F2XJ9TMN0SJKS9', 1, '2026-06-12 02:35:58.443668+03', '2026-06-12 03:36:46.944+03', '2026-06-12 03:36:46.944+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGNRGTM2VPJVEMPDV06VM5', 'iitem_01KTWGNRH42GMP4R3CB3XQM62V', 'pvitem_01KTWGNRHE8A6QMD798R7CA334', 1, '2026-06-12 02:35:58.766157+03', '2026-06-12 03:36:47.075+03', '2026-06-12 03:36:47.075+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGNRY28GRDR27QZXQG9SZK', 'iitem_01KTWGNRYHH4MS2W972C762SEE', 'pvitem_01KTWGNRYYAN8APEGKREZ6349W', 1, '2026-06-12 02:35:59.198538+03', '2026-06-12 03:36:47.223+03', '2026-06-12 03:36:47.223+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGNSDBD9AQQR92BWK0F254', 'iitem_01KTWGNSDQ9VJZKC7Y3JE3CWPX', 'pvitem_01KTWGNSE01WDH557XZ7ZQ05TG', 1, '2026-06-12 02:35:59.680559+03', '2026-06-12 03:36:47.36+03', '2026-06-12 03:36:47.36+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGNSX3X728GK24ZGNEZ6RR', 'iitem_01KTWGNSXE048ZX2K6Z7MMT9PN', 'pvitem_01KTWGNSXVVVNRF0MV6Z60GRH2', 1, '2026-06-12 02:36:00.187454+03', '2026-06-12 03:36:47.457+03', '2026-06-12 03:36:47.457+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWGNTPDAGFW6V56JWM0707E', 'iitem_01KTWGNTPPWTJV1X75XSZAJ351', 'pvitem_01KTWGNTPYD08JT5XTSV4WP76G', 1, '2026-06-12 02:36:00.990248+03', '2026-06-12 03:36:47.548+03', '2026-06-12 03:36:47.548+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWM540EPVGAZKAC4PMHY1EW', 'iitem_01KTWM54154FWN240PN3Y1S17R', 'pvitem_01KTWM541GR98A5ZYAN8MFY06X', 1, '2026-06-12 03:36:47.792005+03', '2026-06-12 03:46:37.877+03', '2026-06-12 03:46:37.877+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWM5447KGQG136R4PR5MR3M', 'iitem_01KTWM544F61YMJR632RFZ3EXS', 'pvitem_01KTWM5452JPENAZKFREKT0S6J', 1, '2026-06-12 03:36:47.906476+03', '2026-06-12 03:46:38.153+03', '2026-06-12 03:46:38.152+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWM5486PG7QA99VRKSQH6G0', 'iitem_01KTWM548HCNXMMV2PPG169EZ8', 'pvitem_01KTWM548T8YCN2C89062TG0H8', 1, '2026-06-12 03:36:48.026339+03', '2026-06-12 03:46:38.544+03', '2026-06-12 03:46:38.544+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWM54BJZE3VKS5A93ZK4F58', 'iitem_01KTWM54BVRKTWHB2AGH8R3196', 'pvitem_01KTWM54C4D2NP24E0FVQG192F', 1, '2026-06-12 03:36:48.13225+03', '2026-06-12 03:46:38.719+03', '2026-06-12 03:46:38.719+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWM54FFE5711TQ767Z79FGW', 'iitem_01KTWM54FS3RNNJ00BW5WVSSS9', 'pvitem_01KTWM54FZPBDT51NDC2YXJPT6', 1, '2026-06-12 03:36:48.255087+03', '2026-06-12 03:46:38.86+03', '2026-06-12 03:46:38.859+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWM54K68TETTSSTQPQX94RS', 'iitem_01KTWM54KH47FTDP3V5HWAZC53', 'pvitem_01KTWM54KW80JPQ5Z1KV928CTS', 1, '2026-06-12 03:36:48.380054+03', '2026-06-12 03:46:38.983+03', '2026-06-12 03:46:38.982+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWM54QRGA2GSCCSJKAKZHJG', 'iitem_01KTWM54R1G6ACRV3VMHVTPX8C', 'pvitem_01KTWM54RA04F71GGF04RG2MDH', 1, '2026-06-12 03:36:48.522773+03', '2026-06-12 03:46:39.101+03', '2026-06-12 03:46:39.101+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWM54WK9SXFN6BJDPBM09MD', 'iitem_01KTWM54WVZ1Z60047M3Q5AB0A', 'pvitem_01KTWM54X3D5QGF2J9B7DX4TFJ', 1, '2026-06-12 03:36:48.674952+03', '2026-06-12 03:46:39.207+03', '2026-06-12 03:46:39.207+03');
INSERT INTO public.product_variant_inventory_item VALUES ('variant_01KTWM5527R5NFNBEMMQPFETA9', 'iitem_01KTWM552PQYRJH5CWQNHR59HP', 'pvitem_01KTWM55327RNS3TQV6EK2VG9Q', 1, '2026-06-12 03:36:48.86575+03', '2026-06-12 03:46:39.308+03', '2026-06-12 03:46:39.308+03');


--
-- Data for Name: product_variant_option; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ1TRP0F9K1FBSD91JT', 'optval_01KTSXRBE9EWN2J8QYQQRE8Z78');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ1TRP0F9K1FBSD91JT', 'optval_01KTSXRBEBN7H74KA686CXJ3BC');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ3MVMR2DF6RW8PH22V', 'optval_01KTSXRBE9EWN2J8QYQQRE8Z78');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ3MVMR2DF6RW8PH22V', 'optval_01KTSXRBEC5EAG7YRV51JGKFTJ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ3Q4FR220FETFCPY1R', 'optval_01KTSXRBE9WJSE3CNBZV2X06G3');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ3Q4FR220FETFCPY1R', 'optval_01KTSXRBEBN7H74KA686CXJ3BC');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ433WKRGKNCWZCT6K4', 'optval_01KTSXRBE9WJSE3CNBZV2X06G3');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ433WKRGKNCWZCT6K4', 'optval_01KTSXRBEC5EAG7YRV51JGKFTJ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ5F2VK5FXFEBD1HKR2', 'optval_01KTSXRBE9JS5FHHDHH3EXRYNP');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ5F2VK5FXFEBD1HKR2', 'optval_01KTSXRBEBN7H74KA686CXJ3BC');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ57H9D9J1HV26808CR', 'optval_01KTSXRBE9JS5FHHDHH3EXRYNP');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ57H9D9J1HV26808CR', 'optval_01KTSXRBEC5EAG7YRV51JGKFTJ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ6GDPF4C0C12WQFD3F', 'optval_01KTSXRBEAGBKRCG1TH77ZP0Y3');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ6GDPF4C0C12WQFD3F', 'optval_01KTSXRBEBN7H74KA686CXJ3BC');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ60XY3R71ZASPEGG0G', 'optval_01KTSXRBEAGBKRCG1TH77ZP0Y3');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ60XY3R71ZASPEGG0G', 'optval_01KTSXRBEC5EAG7YRV51JGKFTJ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ70PK60F11KJD4BN8Q', 'optval_01KTSXRBEMS2BPYE6VBFXK0HES');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ8H06DERRH0N15Z39H', 'optval_01KTSXRBENFWX91T1YD673H2A7');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ8M00DRQ10C5AGM93G', 'optval_01KTSXRBEN8WQQC75W8J0Q6QBX');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ8BFJ2RXVDM2CBVY3V', 'optval_01KTSXRBENCJD0RRRVG2SK9PRS');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ9WQNWKF6H7PRM0EW3', 'optval_01KTSXRBER9C4SG5DN598W0YYM');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ9PVA4GEQ8BA0RFZC9', 'optval_01KTSXRBERH2N3C4ZASE0S34TZ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQ9PA5NHG640SKXJF4J', 'optval_01KTSXRBES7TJ0QZDKQTRNXSTT');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQASSFDDHCB4JRVQ6G7', 'optval_01KTSXRBESVTCCPCQSJTBX4RME');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQAEHTRK7770FW58HKF', 'optval_01KTSXRBEWVWQ8JG0XJ71BXVCY');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQBGMJ604Z25DNWT67Q', 'optval_01KTSXRBEWPXH5JZ24MWNQF7V1');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQBMHDBE8Y0J1XPFZ26', 'optval_01KTSXRBEWBCEVN9B2VJBMA4HC');
INSERT INTO public.product_variant_option VALUES ('variant_01KTSXRBQCF6X834577SZZ8WRZ', 'optval_01KTSXRBEX5VSTJERFMSNHF9D7');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEMBBSY9NR0S51NQX9H', 'optval_01KTWF9KEHFPH19H534JTT8XW4');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEMBBSY9NR0S51NQX9H', 'optval_01KTWF9KEJJJFWZMTAVNMWEX1A');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEMMNHMBV9QKED369VE', 'optval_01KTWF9KEHFPH19H534JTT8XW4');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEMMNHMBV9QKED369VE', 'optval_01KTWF9KEJXNMNJ5A5SR008064');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KENPG55C65KCGEJ3V4G', 'optval_01KTWF9KEHFPH19H534JTT8XW4');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KENPG55C65KCGEJ3V4G', 'optval_01KTWF9KEJBPJS17GRCVG3JVNF');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEN1ZRENB8ZFQ9TPY2F', 'optval_01KTWF9KEHFPH19H534JTT8XW4');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEN1ZRENB8ZFQ9TPY2F', 'optval_01KTWF9KEJ72DKMVW48XAM8733');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KENJ5WWBWJSPDW8C6ZE', 'optval_01KTWF9KEHFPH19H534JTT8XW4');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KENJ5WWBWJSPDW8C6ZE', 'optval_01KTWF9KEJ54HB5H1HCZWDTEQX');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEN4XEYP5V525001ZBD', 'optval_01KTWF9KEJ8CNJ0HJDQVZ0YVK5');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEN4XEYP5V525001ZBD', 'optval_01KTWF9KEJJJFWZMTAVNMWEX1A');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEPSAFY4ZA6146KVFXZ', 'optval_01KTWF9KEJ8CNJ0HJDQVZ0YVK5');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEPSAFY4ZA6146KVFXZ', 'optval_01KTWF9KEJXNMNJ5A5SR008064');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEPGC7MAZ54QKFP6R4Q', 'optval_01KTWF9KEJ8CNJ0HJDQVZ0YVK5');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEPGC7MAZ54QKFP6R4Q', 'optval_01KTWF9KEJBPJS17GRCVG3JVNF');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEPD0KJBBNNCBHXC3H6', 'optval_01KTWF9KEJ8CNJ0HJDQVZ0YVK5');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEPD0KJBBNNCBHXC3H6', 'optval_01KTWF9KEJ72DKMVW48XAM8733');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEP2CXA96D31CN4RZED', 'optval_01KTWF9KEJ8CNJ0HJDQVZ0YVK5');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEP2CXA96D31CN4RZED', 'optval_01KTWF9KEJ54HB5H1HCZWDTEQX');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEP6DTF73N1VC7W82AY', 'optval_01KTWF9KEJQN85D9BX0HG5JZQK');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEP6DTF73N1VC7W82AY', 'optval_01KTWF9KEJJJFWZMTAVNMWEX1A');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEQHS9RNSBQAM2CD9AD', 'optval_01KTWF9KEJQN85D9BX0HG5JZQK');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEQHS9RNSBQAM2CD9AD', 'optval_01KTWF9KEJXNMNJ5A5SR008064');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEQ0NX61YDAZXP1RWFH', 'optval_01KTWF9KEJQN85D9BX0HG5JZQK');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEQ0NX61YDAZXP1RWFH', 'optval_01KTWF9KEJBPJS17GRCVG3JVNF');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEQEBA7EG0ZDT5PMV28', 'optval_01KTWF9KEJQN85D9BX0HG5JZQK');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEQEBA7EG0ZDT5PMV28', 'optval_01KTWF9KEJ72DKMVW48XAM8733');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEQFRW50095R19EWYZD', 'optval_01KTWF9KEJQN85D9BX0HG5JZQK');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9KEQFRW50095R19EWYZD', 'optval_01KTWF9KEJ54HB5H1HCZWDTEQX');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9Y6V49ED3FQ4XS3GJ434', 'optval_01KTWF9Y3H7FVFBRM4RWDDB2Z9');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9Y6V49ED3FQ4XS3GJ434', 'optval_01KTWF9Y4XMFJHGRNWJFVFXAMC');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9YBTF01TEEF0KPG5MNGH', 'optval_01KTWF9Y3H7FVFBRM4RWDDB2Z9');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9YBTF01TEEF0KPG5MNGH', 'optval_01KTWF9Y4XVFJ6XT5N0471ECNE');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9YHPJXMTJSFRSTK8R8RB', 'optval_01KTWF9Y3H7FVFBRM4RWDDB2Z9');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9YHPJXMTJSFRSTK8R8RB', 'optval_01KTWF9Y4YJBX8N88688J6GM4S');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9YWPDZG9EVXXFEFAGX79', 'optval_01KTWF9Y3H7FVFBRM4RWDDB2Z9');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9YWPDZG9EVXXFEFAGX79', 'optval_01KTWF9Y4YYXMQD81P7S8QETSN');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9Z7YTECSPGDH20AWH4W9', 'optval_01KTWF9Y3H7FVFBRM4RWDDB2Z9');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9Z7YTECSPGDH20AWH4W9', 'optval_01KTWF9Y4YDJJ9M2MM1RSSBA1N');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9ZSA5N3ZEZZKNER8CYB2', 'optval_01KTWF9Y3HQECRJD7NEQ4AKX86');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWF9ZSA5N3ZEZZKNER8CYB2', 'optval_01KTWF9Y4XMFJHGRNWJFVFXAMC');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWFA07AKCN7WFV5TR6T32ER', 'optval_01KTWF9Y3HQECRJD7NEQ4AKX86');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWFA07AKCN7WFV5TR6T32ER', 'optval_01KTWF9Y4XVFJ6XT5N0471ECNE');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWFA0PFGGX0YKX0HSXQ9H9P', 'optval_01KTWF9Y3HQECRJD7NEQ4AKX86');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWFA0PFGGX0YKX0HSXQ9H9P', 'optval_01KTWF9Y4YJBX8N88688J6GM4S');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWFA19MVVWCK74WJ8335FY7', 'optval_01KTWF9Y3HQECRJD7NEQ4AKX86');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWFA19MVVWCK74WJ8335FY7', 'optval_01KTWF9Y4YYXMQD81P7S8QETSN');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWFA1XAWENQ3004NBYJXVHT', 'optval_01KTWF9Y3HQECRJD7NEQ4AKX86');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWFA1XAWENQ3004NBYJXVHT', 'optval_01KTWF9Y4YDJJ9M2MM1RSSBA1N');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWFA2TE54YKQ3WDWAKR9QQC', 'optval_01KTWF9Y3HPB7QEX2C0872YK9V');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWFA2TE54YKQ3WDWAKR9QQC', 'optval_01KTWF9Y4XMFJHGRNWJFVFXAMC');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWFA3FCNHQ6X8C8N9C7YEEG', 'optval_01KTWF9Y3HPB7QEX2C0872YK9V');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWFA3FCNHQ6X8C8N9C7YEEG', 'optval_01KTWF9Y4XVFJ6XT5N0471ECNE');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWFA46SK8J2ACRNSEH01EWZ', 'optval_01KTWF9Y3HPB7QEX2C0872YK9V');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWFA46SK8J2ACRNSEH01EWZ', 'optval_01KTWF9Y4YJBX8N88688J6GM4S');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWFA545MJFC6SVY0H5RV1DP', 'optval_01KTWF9Y3HPB7QEX2C0872YK9V');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWFA545MJFC6SVY0H5RV1DP', 'optval_01KTWF9Y4YYXMQD81P7S8QETSN');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWFA5Z4WSA3FXAC0YYWW6XE', 'optval_01KTWF9Y3HPB7QEX2C0872YK9V');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWFA5Z4WSA3FXAC0YYWW6XE', 'optval_01KTWF9Y4YDJJ9M2MM1RSSBA1N');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGF8G0MQENH7ANE8TE0JRT', 'optval_01KTWGF8D856XWCTTSRH7SAJBT');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGF8G0MQENH7ANE8TE0JRT', 'optval_01KTWGF8EC7QRMJBVY5T1GE6A4');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGF8KZTZ5JY8NV5M97K04R', 'optval_01KTWGF8D856XWCTTSRH7SAJBT');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGF8KZTZ5JY8NV5M97K04R', 'optval_01KTWGF8EDWWPDBE2P09QZZ5ZT');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGF8S0NNTE5FHDKN7PDHMH', 'optval_01KTWGF8D856XWCTTSRH7SAJBT');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGF8S0NNTE5FHDKN7PDHMH', 'optval_01KTWGF8ED1VXFYFEJRXDC8VVP');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGF8YN79EF4KMYYGA300HJ', 'optval_01KTWGF8D8SSWVBA7SFJ99VC77');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGF8YN79EF4KMYYGA300HJ', 'optval_01KTWGF8EC7QRMJBVY5T1GE6A4');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGF95PRQ16E4Z7YMT95KZP', 'optval_01KTWGF8D8SSWVBA7SFJ99VC77');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGF95PRQ16E4Z7YMT95KZP', 'optval_01KTWGF8EDWWPDBE2P09QZZ5ZT');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGF9DJ2AW1XE041XZ6WWBE', 'optval_01KTWGF8D8SSWVBA7SFJ99VC77');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGF9DJ2AW1XE041XZ6WWBE', 'optval_01KTWGF8ED1VXFYFEJRXDC8VVP');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGHF3FHC2G410EP41XAT4B', 'optval_01KTWGHF0VJ5RVJR6CB80PQM3Z');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGHF3FHC2G410EP41XAT4B', 'optval_01KTWGHF1XZQMDD1GGS8WMEXVJ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGHF7432YQRSMH31PX9ZA2', 'optval_01KTWGHF0VJ5RVJR6CB80PQM3Z');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGHF7432YQRSMH31PX9ZA2', 'optval_01KTWGHF1XX0W8YVV8FTWYBPVW');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGHFBK9WQWBCA1V4KCN067', 'optval_01KTWGHF0VJ5RVJR6CB80PQM3Z');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGHFBK9WQWBCA1V4KCN067', 'optval_01KTWGHF1XAQ7YDXA459XB8MNX');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGHFHJMSFHKG8VVX3B3Y6P', 'optval_01KTWGHF0VN7JVVATVN5MR3D4A');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGHFHJMSFHKG8VVX3B3Y6P', 'optval_01KTWGHF1XZQMDD1GGS8WMEXVJ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGHFRB9GRDR0ZWC5EFCKED', 'optval_01KTWGHF0VN7JVVATVN5MR3D4A');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGHFRB9GRDR0ZWC5EFCKED', 'optval_01KTWGHF1XX0W8YVV8FTWYBPVW');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGHG0HWG535VFS2VA2V5W4', 'optval_01KTWGHF0VN7JVVATVN5MR3D4A');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGHG0HWG535VFS2VA2V5W4', 'optval_01KTWGHF1XAQ7YDXA459XB8MNX');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGNQJ48C35RSSRQH387KT2', 'optval_01KTWGNQEMF5SDXG5MG0P1W1VQ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGNQJ48C35RSSRQH387KT2', 'optval_01KTWGNQG3P5A68CVE2YMQM2YH');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGNQQH5D122AQFA689J1XW', 'optval_01KTWGNQEMF5SDXG5MG0P1W1VQ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGNQQH5D122AQFA689J1XW', 'optval_01KTWGNQG328HCNZ0344BSYAQZ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGNQY7JX0ZDEC5C5A940FE', 'optval_01KTWGNQEMF5SDXG5MG0P1W1VQ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGNQY7JX0ZDEC5C5A940FE', 'optval_01KTWGNQG3HV3A99NEMVPNTZXD');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGNR6QE41HHHBB6BTGFHDY', 'optval_01KTWGNQEMPJAHT1KWN1ZXH3YA');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGNR6QE41HHHBB6BTGFHDY', 'optval_01KTWGNQG3P5A68CVE2YMQM2YH');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGNRGTM2VPJVEMPDV06VM5', 'optval_01KTWGNQEMPJAHT1KWN1ZXH3YA');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGNRGTM2VPJVEMPDV06VM5', 'optval_01KTWGNQG328HCNZ0344BSYAQZ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGNRY28GRDR27QZXQG9SZK', 'optval_01KTWGNQEMPJAHT1KWN1ZXH3YA');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGNRY28GRDR27QZXQG9SZK', 'optval_01KTWGNQG3HV3A99NEMVPNTZXD');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGNSDBD9AQQR92BWK0F254', 'optval_01KTWGNQENRC9ZF28KGDFCZFEZ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGNSDBD9AQQR92BWK0F254', 'optval_01KTWGNQG3P5A68CVE2YMQM2YH');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGNSX3X728GK24ZGNEZ6RR', 'optval_01KTWGNQENRC9ZF28KGDFCZFEZ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGNSX3X728GK24ZGNEZ6RR', 'optval_01KTWGNQG328HCNZ0344BSYAQZ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGNTPDAGFW6V56JWM0707E', 'optval_01KTWGNQENRC9ZF28KGDFCZFEZ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWGNTPDAGFW6V56JWM0707E', 'optval_01KTWGNQG3HV3A99NEMVPNTZXD');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWM540EPVGAZKAC4PMHY1EW', 'optval_01KTWM53Y3D4YH9PCA7AKB1M9C');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWM540EPVGAZKAC4PMHY1EW', 'optval_01KTWM53Z5BQFPE6YMKM5FJSBZ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWM5447KGQG136R4PR5MR3M', 'optval_01KTWM53Y3D4YH9PCA7AKB1M9C');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWM5447KGQG136R4PR5MR3M', 'optval_01KTWM53Z55ZA6VDSPW8AF5KNB');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWM54BJZE3VKS5A93ZK4F58', 'optval_01KTWM53Y3AP4R4JTR7SHH85KX');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWM54BJZE3VKS5A93ZK4F58', 'optval_01KTWM53Z5BQFPE6YMKM5FJSBZ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWM54K68TETTSSTQPQX94RS', 'optval_01KTWM53Y3AP4R4JTR7SHH85KX');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWM54K68TETTSSTQPQX94RS', 'optval_01KTWM53Z59VZJXSNJJNWVXKF4');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWM54WK9SXFN6BJDPBM09MD', 'optval_01KTWM53Y34R4X9RAGNP49HRF0');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWM54WK9SXFN6BJDPBM09MD', 'optval_01KTWM53Z55ZA6VDSPW8AF5KNB');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWM5527R5NFNBEMMQPFETA9', 'optval_01KTWM53Y34R4X9RAGNP49HRF0');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWM5527R5NFNBEMMQPFETA9', 'optval_01KTWM53Z59VZJXSNJJNWVXKF4');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWM5486PG7QA99VRKSQH6G0', 'optval_01KTWM53Y3D4YH9PCA7AKB1M9C');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWM5486PG7QA99VRKSQH6G0', 'optval_01KTWM53Z59VZJXSNJJNWVXKF4');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWM54FFE5711TQ767Z79FGW', 'optval_01KTWM53Y3AP4R4JTR7SHH85KX');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWM54FFE5711TQ767Z79FGW', 'optval_01KTWM53Z55ZA6VDSPW8AF5KNB');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWM54QRGA2GSCCSJKAKZHJG', 'optval_01KTWM53Y34R4X9RAGNP49HRF0');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWM54QRGA2GSCCSJKAKZHJG', 'optval_01KTWM53Z5BQFPE6YMKM5FJSBZ');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWMQ5Y94RJKPJTXF93AD1JF', 'optval_01KTWMQ5TSW7PPPT0JT83K1ANT');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWMQ5Y94RJKPJTXF93AD1JF', 'optval_01KTWMQ5W75SHYPH2DDCPZH02R');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWMQ62DPHWKYF9S68GDNMPK', 'optval_01KTWMQ5TSW7PPPT0JT83K1ANT');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWMQ62DPHWKYF9S68GDNMPK', 'optval_01KTWMQ5W8HBQ82CXGZHQFT513');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWMQ667A88EQQ4N8RWF2AKX', 'optval_01KTWMQ5TSW7PPPT0JT83K1ANT');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWMQ667A88EQQ4N8RWF2AKX', 'optval_01KTWMQ5W8GT47BRZEGK5BD051');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWMQ6ASYGWX9TMNVMAJT62D', 'optval_01KTWMQ5TS01702X3ZM61YJBTK');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWMQ6ASYGWX9TMNVMAJT62D', 'optval_01KTWMQ5W75SHYPH2DDCPZH02R');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWMQ6F058ABRGFJT4K9J2VA', 'optval_01KTWMQ5TS01702X3ZM61YJBTK');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWMQ6F058ABRGFJT4K9J2VA', 'optval_01KTWMQ5W8HBQ82CXGZHQFT513');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWMQ6KBQT9DHB3WF0CS599Y', 'optval_01KTWMQ5TS01702X3ZM61YJBTK');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWMQ6KBQT9DHB3WF0CS599Y', 'optval_01KTWMQ5W8GT47BRZEGK5BD051');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWMQ6R197A997PEEZSSK2ZG', 'optval_01KTWMQ5TSTWJYP3HDYFBP12FT');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWMQ6R197A997PEEZSSK2ZG', 'optval_01KTWMQ5W75SHYPH2DDCPZH02R');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWMQ6X4CPB9SC3HPTVZ17M2', 'optval_01KTWMQ5TSTWJYP3HDYFBP12FT');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWMQ6X4CPB9SC3HPTVZ17M2', 'optval_01KTWMQ5W8HBQ82CXGZHQFT513');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWMQ73WDYYRAK2NSQDNJ9S8', 'optval_01KTWMQ5TSTWJYP3HDYFBP12FT');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWMQ73WDYYRAK2NSQDNJ9S8', 'optval_01KTWMQ5W8GT47BRZEGK5BD051');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWQBSF6QS6HG8VQPH1TH5PJ', 'optval_01KTWQBS6XSTEQBD1VYP5TBSYT');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWQBSF6QS6HG8VQPH1TH5PJ', 'optval_01KTWQBSAV7D8CDBGGJBZMWG3G');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWQBSR3DTDCWMY5RC6PJZRR', 'optval_01KTWQBS6XSTEQBD1VYP5TBSYT');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWQBSR3DTDCWMY5RC6PJZRR', 'optval_01KTWQBSAWKRSJSV984N7D1MVT');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWQBT1P73D5X7CZEVNAFCAP', 'optval_01KTWQBS6XSTEQBD1VYP5TBSYT');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWQBT1P73D5X7CZEVNAFCAP', 'optval_01KTWQBSAW6DTFRH6HXHNDA943');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWQBTCKVJVYCT6KMB4CKHR1', 'optval_01KTWQBS6YT9461K929FAFWQYN');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWQBTCKVJVYCT6KMB4CKHR1', 'optval_01KTWQBSAV7D8CDBGGJBZMWG3G');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWQBTSRFMQBWRJDQJM6FG94', 'optval_01KTWQBS6YT9461K929FAFWQYN');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWQBTSRFMQBWRJDQJM6FG94', 'optval_01KTWQBSAWKRSJSV984N7D1MVT');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWQBV4ANMXQKEJS4KR26CYW', 'optval_01KTWQBS6YT9461K929FAFWQYN');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWQBV4ANMXQKEJS4KR26CYW', 'optval_01KTWQBSAW6DTFRH6HXHNDA943');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWQBVJN2HR5SRSE7PCYB5YH', 'optval_01KTWQBS6YRETEZJHDMQ1CRF4V');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWQBVJN2HR5SRSE7PCYB5YH', 'optval_01KTWQBSAV7D8CDBGGJBZMWG3G');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWQBVZEX916PGDA851QTEZ6', 'optval_01KTWQBS6YRETEZJHDMQ1CRF4V');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWQBVZEX916PGDA851QTEZ6', 'optval_01KTWQBSAWKRSJSV984N7D1MVT');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWQBWE020M9KEYRDA45X1JE', 'optval_01KTWQBS6YRETEZJHDMQ1CRF4V');
INSERT INTO public.product_variant_option VALUES ('variant_01KTWQBWE020M9KEYRDA45X1JE', 'optval_01KTWQBSAW6DTFRH6HXHNDA943');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB68A8AB8PS93GT31KV2', 'optval_01KV1XXB3QY6TMV1V4SVM5QMME');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB68A8AB8PS93GT31KV2', 'optval_01KV1XXB3RAY258EYV02ZKYEK3');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB68DQXV66B0HZ8R70RD', 'optval_01KV1XXB3QY6TMV1V4SVM5QMME');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB68DQXV66B0HZ8R70RD', 'optval_01KV1XXB3R16ENQXYRR57WZC9E');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB69SCYQK4G1ECAQY4TH', 'optval_01KV1XXB3QY6TMV1V4SVM5QMME');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB69SCYQK4G1ECAQY4TH', 'optval_01KV1XXB3RH18FF9Q5TCWC8V84');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB69CG0WQ8592VW7NSBC', 'optval_01KV1XXB3QY6TMV1V4SVM5QMME');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB69CG0WQ8592VW7NSBC', 'optval_01KV1XXB3R2H9AT67BQP9MR4YJ');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6AGQ67RAG9A3AK4YDS', 'optval_01KV1XXB3QY6TMV1V4SVM5QMME');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6AGQ67RAG9A3AK4YDS', 'optval_01KV1XXB3R7GERK3ER157TPK78');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6A3MZ68S7QYSADSPB6', 'optval_01KV1XXB3Q1MRD70VEK21S972J');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6A3MZ68S7QYSADSPB6', 'optval_01KV1XXB3RAY258EYV02ZKYEK3');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6BYV20WQMBDBEKYJ0K', 'optval_01KV1XXB3Q1MRD70VEK21S972J');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6BYV20WQMBDBEKYJ0K', 'optval_01KV1XXB3R16ENQXYRR57WZC9E');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6BZCC6X7CG316X54VY', 'optval_01KV1XXB3Q1MRD70VEK21S972J');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6BZCC6X7CG316X54VY', 'optval_01KV1XXB3RH18FF9Q5TCWC8V84');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6CZ7KEDCY2ZQXNBH3F', 'optval_01KV1XXB3Q1MRD70VEK21S972J');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6CZ7KEDCY2ZQXNBH3F', 'optval_01KV1XXB3R2H9AT67BQP9MR4YJ');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6C58N5X1RKV7T5N65K', 'optval_01KV1XXB3Q1MRD70VEK21S972J');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6C58N5X1RKV7T5N65K', 'optval_01KV1XXB3R7GERK3ER157TPK78');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6CPRC9GA6CHXSCK53M', 'optval_01KV1XXB3QPNACB91H5Q5TQB6Q');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6CPRC9GA6CHXSCK53M', 'optval_01KV1XXB3RAY258EYV02ZKYEK3');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6DDPAYVN3D55882TWC', 'optval_01KV1XXB3QPNACB91H5Q5TQB6Q');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6DDPAYVN3D55882TWC', 'optval_01KV1XXB3R16ENQXYRR57WZC9E');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6D9FD6N7MBVM95R8Z1', 'optval_01KV1XXB3QPNACB91H5Q5TQB6Q');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6D9FD6N7MBVM95R8Z1', 'optval_01KV1XXB3RH18FF9Q5TCWC8V84');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6DAYECEN7PXZAJBC94', 'optval_01KV1XXB3QPNACB91H5Q5TQB6Q');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6DAYECEN7PXZAJBC94', 'optval_01KV1XXB3R2H9AT67BQP9MR4YJ');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6DCZ91SR4G11WPWN2C', 'optval_01KV1XXB3QPNACB91H5Q5TQB6Q');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1XXB6DCZ91SR4G11WPWN2C', 'optval_01KV1XXB3R7GERK3ER157TPK78');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNT196VHQ360Q3WMC9NNF', 'optval_01KV1YNSYGAAGPQ75C6GRAZV1B');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNT196VHQ360Q3WMC9NNF', 'optval_01KV1YNSZNA8FTJ8WJAJJFJWS5');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNT4HMZ8TNJAG099ZX3RV', 'optval_01KV1YNSYGAAGPQ75C6GRAZV1B');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNT4HMZ8TNJAG099ZX3RV', 'optval_01KV1YNSZNFBN6SRASBMSX8KSS');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNTBFTM2X9WVJ3TCG5XAV', 'optval_01KV1YNSYGAAGPQ75C6GRAZV1B');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNTBFTM2X9WVJ3TCG5XAV', 'optval_01KV1YNSZPH1K2NXH2QE06XXTK');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNTG67BQRS4NWE2D9QE0D', 'optval_01KV1YNSYGAAGPQ75C6GRAZV1B');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNTG67BQRS4NWE2D9QE0D', 'optval_01KV1YNSZP95FFEVA4AJBSVVDV');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNTR9N2XEW4E56W3NTHA0', 'optval_01KV1YNSYGAAGPQ75C6GRAZV1B');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNTR9N2XEW4E56W3NTHA0', 'optval_01KV1YNSZPEH5QQY575G8MZMRN');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNV26EGEKA909S31Y3V69', 'optval_01KV1YNSYGQW3RSVNYM1HPN0PZ');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNV26EGEKA909S31Y3V69', 'optval_01KV1YNSZNA8FTJ8WJAJJFJWS5');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNV7SZCYSZK89KYSX4YD6', 'optval_01KV1YNSYGQW3RSVNYM1HPN0PZ');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNV7SZCYSZK89KYSX4YD6', 'optval_01KV1YNSZNFBN6SRASBMSX8KSS');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNVDNESETQJ5WNAYGZ724', 'optval_01KV1YNSYGQW3RSVNYM1HPN0PZ');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNVDNESETQJ5WNAYGZ724', 'optval_01KV1YNSZPH1K2NXH2QE06XXTK');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNVKY0H4208HVVEW1PWRG', 'optval_01KV1YNSYGQW3RSVNYM1HPN0PZ');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNVKY0H4208HVVEW1PWRG', 'optval_01KV1YNSZP95FFEVA4AJBSVVDV');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNVTPGP7YNJQEQC310M2J', 'optval_01KV1YNSYGQW3RSVNYM1HPN0PZ');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNVTPGP7YNJQEQC310M2J', 'optval_01KV1YNSZPEH5QQY575G8MZMRN');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNW2N2Q8507TSWE2JY16D', 'optval_01KV1YNSYGP16JX5HQW59ZSTTD');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNW2N2Q8507TSWE2JY16D', 'optval_01KV1YNSZNA8FTJ8WJAJJFJWS5');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNWAW1Q4QW3FDGBTCDF6A', 'optval_01KV1YNSYGP16JX5HQW59ZSTTD');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNWAW1Q4QW3FDGBTCDF6A', 'optval_01KV1YNSZNFBN6SRASBMSX8KSS');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNWMB1GW071DN16P9W094', 'optval_01KV1YNSYGP16JX5HQW59ZSTTD');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNWMB1GW071DN16P9W094', 'optval_01KV1YNSZPH1K2NXH2QE06XXTK');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNX05AFVZWBHQ6ZP4T6ZK', 'optval_01KV1YNSYGP16JX5HQW59ZSTTD');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNX05AFVZWBHQ6ZP4T6ZK', 'optval_01KV1YNSZP95FFEVA4AJBSVVDV');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNX9RG0PNS20P3AXNXAWY', 'optval_01KV1YNSYGP16JX5HQW59ZSTTD');
INSERT INTO public.product_variant_option VALUES ('variant_01KV1YNX9RG0PNS20P3AXNXAWY', 'optval_01KV1YNSZPEH5QQY575G8MZMRN');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EP7TAD0HHRHKKYVF4ASH', 'optval_01KV22EP4XMM4J45VVG4GDAQ70');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EP7TAD0HHRHKKYVF4ASH', 'optval_01KV22EP5ZF33RJBQMGBGVTH9Z');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EPBJTYXS1HAY5BK2B2QP', 'optval_01KV22EP4XMM4J45VVG4GDAQ70');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EPBJTYXS1HAY5BK2B2QP', 'optval_01KV22EP5ZNESTVPDKA5QR44KJ');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EPF6ZB5WY6Y3YW1GJW8B', 'optval_01KV22EP4XMM4J45VVG4GDAQ70');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EPF6ZB5WY6Y3YW1GJW8B', 'optval_01KV22EP5ZSH8HD2SFKMXG8A2E');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EPJTS04JXW6CDKEK7FQY', 'optval_01KV22EP4XMM4J45VVG4GDAQ70');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EPJTS04JXW6CDKEK7FQY', 'optval_01KV22EP5Z1VND6E0MZVYM61DY');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EPQ578HA2RY70QDBDE5S', 'optval_01KV22EP4XMM4J45VVG4GDAQ70');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EPQ578HA2RY70QDBDE5S', 'optval_01KV22EP5Z7D16N05T1DWND81A');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EPW43PEDT59ERN26PNYV', 'optval_01KV22EP4YXNHQR74C8N210XV8');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EPW43PEDT59ERN26PNYV', 'optval_01KV22EP5ZF33RJBQMGBGVTH9Z');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EQ361YD245KXJWT9W8RG', 'optval_01KV22EP4YXNHQR74C8N210XV8');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EQ361YD245KXJWT9W8RG', 'optval_01KV22EP5ZNESTVPDKA5QR44KJ');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EQBHPXC304YQGCZG3HNP', 'optval_01KV22EP4YXNHQR74C8N210XV8');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EQBHPXC304YQGCZG3HNP', 'optval_01KV22EP5ZSH8HD2SFKMXG8A2E');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EQMTZJKSDN9YDK00S8S7', 'optval_01KV22EP4YXNHQR74C8N210XV8');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EQMTZJKSDN9YDK00S8S7', 'optval_01KV22EP5Z1VND6E0MZVYM61DY');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EQVZTZDYQSZNDCXW3PWN', 'optval_01KV22EP4YXNHQR74C8N210XV8');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22EQVZTZDYQSZNDCXW3PWN', 'optval_01KV22EP5Z7D16N05T1DWND81A');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22ER4J13F4AK749AP3VNY1', 'optval_01KV22EP4YK4FEETPCB55YBK4B');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22ER4J13F4AK749AP3VNY1', 'optval_01KV22EP5ZF33RJBQMGBGVTH9Z');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22ERK0R9EVMEC5T8ERZ4WH', 'optval_01KV22EP4YK4FEETPCB55YBK4B');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22ERK0R9EVMEC5T8ERZ4WH', 'optval_01KV22EP5ZNESTVPDKA5QR44KJ');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22ERZGRN0N8Q7A3KWNK6CF', 'optval_01KV22EP4YK4FEETPCB55YBK4B');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22ERZGRN0N8Q7A3KWNK6CF', 'optval_01KV22EP5ZSH8HD2SFKMXG8A2E');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22ES8MZQH3TBTBT8D5D9HB', 'optval_01KV22EP4YK4FEETPCB55YBK4B');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22ES8MZQH3TBTBT8D5D9HB', 'optval_01KV22EP5Z1VND6E0MZVYM61DY');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22ESK9VZ22T199H59K1XXG', 'optval_01KV22EP4YK4FEETPCB55YBK4B');
INSERT INTO public.product_variant_option VALUES ('variant_01KV22ESK9VZ22T199H59K1XXG', 'optval_01KV22EP5Z7D16N05T1DWND81A');


--
-- Data for Name: product_variant_price_set; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGHF3FHC2G410EP41XAT4B', 'pset_01KTWGHF420T88D85BKQF8E5XH', 'pvps_01KTWGHF4JFC11KX5TZBJXEF3W', '2026-06-12 02:33:38.066947+03', '2026-06-12 02:35:55.821+03', '2026-06-12 02:35:55.821+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGHFBK9WQWBCA1V4KCN067', 'pset_01KTWGHFC8TS4D4P6FPWSB0KWJ', 'pvps_01KTWGHFCF6Y09533AGTRE6PBV', '2026-06-12 02:33:38.319533+03', '2026-06-12 02:35:56.784+03', '2026-06-12 02:35:56.784+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGHFRB9GRDR0ZWC5EFCKED', 'pset_01KTWGHFRX2MMD0VNJ7N6H1075', 'pvps_01KTWGHFS38XA16VFJPD51TFVJ', '2026-06-12 02:33:38.723683+03', '2026-06-12 02:35:57.318+03', '2026-06-12 02:35:57.317+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGNQJ48C35RSSRQH387KT2', 'pset_01KTWGNQK15ZBE79Q6H6D2356J', 'pvps_01KTWGNQKNN0PMCZT55JQR6A08', '2026-06-12 02:35:57.813145+03', '2026-06-12 03:36:46.33+03', '2026-06-12 03:36:46.33+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGNR6QE41HHHBB6BTGFHDY', 'pset_01KTWGNR7JWABP7SBCMA3WH3R5', 'pvps_01KTWGNR7T0J2VG1P4BA8YT15H', '2026-06-12 02:35:58.458655+03', '2026-06-12 03:36:46.947+03', '2026-06-12 03:36:46.946+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGNRY28GRDR27QZXQG9SZK', 'pset_01KTWGNRZHCVTG3FXBFG1GNEGW', 'pvps_01KTWGNS01MQ4NECCA7Y0H74QQ', '2026-06-12 02:35:59.233111+03', '2026-06-12 03:36:47.227+03', '2026-06-12 03:36:47.227+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGNTPDAGFW6V56JWM0707E', 'pset_01KTWGNTQ1QT0HTHCWANG7AH4A', 'pvps_01KTWGNTQA6T5G47046298Z0P6', '2026-06-12 02:36:01.002674+03', '2026-06-12 03:36:47.55+03', '2026-06-12 03:36:47.549+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWM540EPVGAZKAC4PMHY1EW', 'pset_01KTWM541NH9N2CWECE42K5V9F', 'pvps_01KTWM5421RBGMWMMAN3XV3S71', '2026-06-12 03:36:47.809563+03', '2026-06-12 03:46:37.878+03', '2026-06-12 03:46:37.878+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWM5486PG7QA99VRKSQH6G0', 'pset_01KTWM548Y61Z3NFDM1EJFX26N', 'pvps_01KTWM5495X49NT6TPXB72H396', '2026-06-12 03:36:48.037686+03', '2026-06-12 03:46:38.545+03', '2026-06-12 03:46:38.545+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQ70PK60F11KJD4BN8Q', 'pset_01KTSXRBY2R0W9QH9H1JXBP730', 'pvps_01KTSXRC3DCZVD8VT3N324TJRH', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:53:56.61+03', '2026-06-11 17:53:56.607+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQ8H06DERRH0N15Z39H', 'pset_01KTSXRBY4A1ZVQFAE79T2JTEH', 'pvps_01KTSXRC3EAQYAENRA2KREPC1S', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:53:56.61+03', '2026-06-11 17:53:56.607+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQ8M00DRQ10C5AGM93G', 'pset_01KTSXRBY5XW53P1YSPW8HFH4P', 'pvps_01KTSXRC3ESKMYPMYFQGG5VNES', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:53:56.61+03', '2026-06-11 17:53:56.607+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQ8BFJ2RXVDM2CBVY3V', 'pset_01KTSXRBY6QRXZ6SRG8MS8NNEP', 'pvps_01KTSXRC3FCPKCNM3MMB9VJ4SF', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:53:56.611+03', '2026-06-11 17:53:56.607+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWM54FFE5711TQ767Z79FGW', 'pset_01KTWM54G19J34A9C8VV5GWF18', 'pvps_01KTWM54G9B7HGPZTC4FAD5PW9', '2026-06-12 03:36:48.265324+03', '2026-06-12 03:46:38.861+03', '2026-06-12 03:46:38.86+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWM54QRGA2GSCCSJKAKZHJG', 'pset_01KTWM54REMBFDJ6EH844VWKD9', 'pvps_01KTWM54RPEEBBP0SAQS5TXP66', '2026-06-12 03:36:48.534823+03', '2026-06-12 03:46:39.101+03', '2026-06-12 03:46:39.101+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWM5527R5NFNBEMMQPFETA9', 'pset_01KTWM5536MPKYEC6R4KT4VM60', 'pvps_01KTWM553KJPX9RT8T3ZVBCHY1', '2026-06-12 03:36:48.882886+03', '2026-06-12 03:46:39.309+03', '2026-06-12 03:46:39.309+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWMQ667A88EQQ4N8RWF2AKX', 'pset_01KTWMQ671K39YE08TBA41TXH2', 'pvps_01KTWMQ67ANW2XHQS5XT5X3NAT', '2026-06-12 03:46:39.851006+03', '2026-06-12 04:32:49.353+03', '2026-06-12 04:32:49.352+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWMQ6ASYGWX9TMNVMAJT62D', 'pset_01KTWMQ6BEKEM8JCK4RGE0N2NF', 'pvps_01KTWMQ6BQD2PN6CM5QDW8A2FE', '2026-06-12 03:46:39.991898+03', '2026-06-12 04:32:49.702+03', '2026-06-12 04:32:49.702+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWMQ6F058ABRGFJT4K9J2VA', 'pset_01KTWMQ6FPF4V47SVGNBE5ZS3F', 'pvps_01KTWMQ6FXJK7T164B85865MNW', '2026-06-12 03:46:40.125718+03', '2026-06-12 04:32:50.217+03', '2026-06-12 04:32:50.217+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWMQ6KBQT9DHB3WF0CS599Y', 'pset_01KTWMQ6M0H5DSSXSVY63M4B66', 'pvps_01KTWMQ6M8D2Q09BH916F0FTJ9', '2026-06-12 03:46:40.264516+03', '2026-06-12 04:32:50.563+03', '2026-06-12 04:32:50.563+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWMQ6R197A997PEEZSSK2ZG', 'pset_01KTWMQ6RRE6V80JH26TJN5G3F', 'pvps_01KTWMQ6RYBCM6TMCSGA6FKNC6', '2026-06-12 03:46:40.415143+03', '2026-06-12 04:32:50.894+03', '2026-06-12 04:32:50.894+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQ1TRP0F9K1FBSD91JT', 'pset_01KTSXRBXS5XG7ZT3E7G6YBA88', 'pvps_01KTSXRC39E7G4N2VJWPK606ET', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:57:07.684+03', '2026-06-11 17:57:07.682+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQ3MVMR2DF6RW8PH22V', 'pset_01KTSXRBXTWE4VA4FK4PW7NWCK', 'pvps_01KTSXRC3B73C0QRYZ6H5NZ5XR', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:57:07.684+03', '2026-06-11 17:57:07.682+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQ3Q4FR220FETFCPY1R', 'pset_01KTSXRBXVFTCMHG4G6BVW4KG1', 'pvps_01KTSXRC3BX37Q5SJ4253ZFGV5', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:57:07.684+03', '2026-06-11 17:57:07.682+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQ433WKRGKNCWZCT6K4', 'pset_01KTSXRBXXFJX977TXEHFCPD8A', 'pvps_01KTSXRC3CHEJJ76KMW02TWT7K', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:57:07.684+03', '2026-06-11 17:57:07.682+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQ5F2VK5FXFEBD1HKR2', 'pset_01KTSXRBXYTHPS5F140TF75QPS', 'pvps_01KTSXRC3CND6H8K00BXD24YAH', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:57:07.684+03', '2026-06-11 17:57:07.682+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQ57H9D9J1HV26808CR', 'pset_01KTSXRBXZAXKKBD94R97Z6739', 'pvps_01KTSXRC3CV7RZE9X83J3M1BCA', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:57:07.684+03', '2026-06-11 17:57:07.682+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQ6GDPF4C0C12WQFD3F', 'pset_01KTSXRBY0PGP72A6MJCT31JXX', 'pvps_01KTSXRC3DTYN6BJQGX05M40SZ', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:57:07.684+03', '2026-06-11 17:57:07.682+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQ60XY3R71ZASPEGG0G', 'pset_01KTSXRBY14T0KJHTZ07SVA6QV', 'pvps_01KTSXRC3D8YCEZDDW61B58BN9', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:57:07.684+03', '2026-06-11 17:57:07.682+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQ9WQNWKF6H7PRM0EW3', 'pset_01KTSXRBY70DRD8VMX8A1CMW94', 'pvps_01KTSXRC3FEPW7G5GQDCXG5JDH', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:57:11.909+03', '2026-06-11 17:57:11.907+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQ9PVA4GEQ8BA0RFZC9', 'pset_01KTSXRBY8HSJWQHT50GJV7ANH', 'pvps_01KTSXRC3FZJWQZZB6M0SRY16W', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:57:11.909+03', '2026-06-11 17:57:11.907+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQ9PA5NHG640SKXJF4J', 'pset_01KTSXRBY92YKAVKD7NQ5Z5Z0G', 'pvps_01KTSXRC3GERV949VR5MVYKEF9', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:57:11.909+03', '2026-06-11 17:57:11.907+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQASSFDDHCB4JRVQ6G7', 'pset_01KTSXRBYAKNWSAH7VXHMSXQZB', 'pvps_01KTSXRC3G9TCB69WPKY9EDMQJ', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:57:11.909+03', '2026-06-11 17:57:11.907+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQAEHTRK7770FW58HKF', 'pset_01KTSXRBYBKQ8MCVZAKFNZRHG6', 'pvps_01KTSXRC3G5VWYVB2P0YWV628K', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:57:16.396+03', '2026-06-11 17:57:16.395+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQBGMJ604Z25DNWT67Q', 'pset_01KTSXRBYC4KGKCTVJAYP4AZGM', 'pvps_01KTSXRC3HP2AWW84Z1D531478', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:57:16.397+03', '2026-06-11 17:57:16.395+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQBMHDBE8Y0J1XPFZ26', 'pset_01KTSXRBYDABPA8XETG854MB12', 'pvps_01KTSXRC3HJKSPAXT0R4JTDJCS', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:57:16.397+03', '2026-06-11 17:57:16.395+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTSXRBQCF6X834577SZZ8WRZ', 'pset_01KTSXRBYEMDGTPF0YKHTHBE2T', 'pvps_01KTSXRC3HQEEA7N3S1W3CCX8W', '2026-06-11 02:26:52.520964+03', '2026-06-11 17:57:16.397+03', '2026-06-11 17:57:16.395+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTVJYP6R4129RVJY07Y8A68D', 'pset_01KTVJYPJTG7BEG9AVQV2PQSAZ', 'pvps_01KTVJYPR56JZSYA0QY0CP4GTR', '2026-06-11 17:56:34.564145+03', '2026-06-12 02:11:51.872+03', '2026-06-12 02:11:51.87+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTVJYP6TSWR00VA9B9FNKE6K', 'pset_01KTVJYPJVQ1NAEK0RS2J5JCXH', 'pvps_01KTVJYPR660HQWTW3STS7MVN6', '2026-06-11 17:56:34.564145+03', '2026-06-12 02:11:51.872+03', '2026-06-12 02:11:51.87+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTVJYP6VC0CE7RKHSKEMXTGQ', 'pset_01KTVJYPJX155C53YRW0C1J5KC', 'pvps_01KTVJYPR77KPSKD6MH1KH5STH', '2026-06-11 17:56:34.564145+03', '2026-06-12 02:11:51.872+03', '2026-06-12 02:11:51.87+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTVJYP6WJS04F6RQ3GMY8TTD', 'pset_01KTVJYPJYM90C9G070PTPC9DP', 'pvps_01KTVJYPR7D86RT3XJ4FGQWB78', '2026-06-11 17:56:34.564145+03', '2026-06-12 02:11:51.872+03', '2026-06-12 02:11:51.87+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTVJYP6Y6Y5JMBNS90580PY3', 'pset_01KTVJYPJZ663TPZ5BAPK73G98', 'pvps_01KTVJYPR8T0AS2KTG8DRZ974S', '2026-06-11 17:56:34.564145+03', '2026-06-12 02:11:51.872+03', '2026-06-12 02:11:51.87+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTVJYP6Z5TEP0K2YD7MHM4RD', 'pset_01KTVJYPJZFHT4J4KRRRRHY27F', 'pvps_01KTVJYPR8BR4X09GYMDZSDP0Z', '2026-06-11 17:56:34.564145+03', '2026-06-12 02:11:51.872+03', '2026-06-12 02:11:51.87+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTVJYP70FMHQ4GZ9QT4BMJ30', 'pset_01KTVJYPK077WXT9AQJMJQRQ04', 'pvps_01KTVJYPR98CQ32AGKTD9ES93B', '2026-06-11 17:56:34.564145+03', '2026-06-12 02:11:51.872+03', '2026-06-12 02:11:51.87+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTVJYP71ADABY13K7VGFXHAA', 'pset_01KTVJYPK0X5823D07JSJP3N56', 'pvps_01KTVJYPR9S7Z570TFN6SC2Z8P', '2026-06-11 17:56:34.564145+03', '2026-06-12 02:11:51.873+03', '2026-06-12 02:11:51.87+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTVJYP72EH16GZ861NJQAP87', 'pset_01KTVJYPK1S6077PRCE4VAWJAX', 'pvps_01KTVJYPRAD1RQQ1MT36PM4KYT', '2026-06-11 17:56:34.564145+03', '2026-06-12 02:11:51.873+03', '2026-06-12 02:11:51.87+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTVJYP73XAAW8ENGY5A4H0SB', 'pset_01KTVJYPK24ADHD9D1S19ZHFDP', 'pvps_01KTVJYPRAD61S9XBQV383E00X', '2026-06-11 17:56:34.564145+03', '2026-06-12 02:11:51.873+03', '2026-06-12 02:11:51.87+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTVJYP74MZNEMZXEJBVG7PPP', 'pset_01KTVJYPK2R3VC7TRRXSMXBR4Y', 'pvps_01KTVJYPRB9EJR4V13WY8THPZP', '2026-06-11 17:56:34.564145+03', '2026-06-12 02:11:51.873+03', '2026-06-12 02:11:51.87+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTVJYP75B12PC2EGS0NVRSJZ', 'pset_01KTVJYPK3NDJFYHESVC38HHC4', 'pvps_01KTVJYPRBHYCME7AY18ACQST5', '2026-06-11 17:56:34.564145+03', '2026-06-12 02:11:51.873+03', '2026-06-12 02:11:51.87+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTVJYP76A2VV1W2H4QRCWHYY', 'pset_01KTVJYPK3P4Q61AKQE1ZHE7J7', 'pvps_01KTVJYPRC8BSMK4K8XY1JJP76', '2026-06-11 17:56:34.564145+03', '2026-06-12 02:11:51.873+03', '2026-06-12 02:11:51.87+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTVJYP77FFB6XR1N44CQBQ7T', 'pset_01KTVJYPK4GAK6W0B976130YF9', 'pvps_01KTVJYPRCJF7Z8HYM340PDAH1', '2026-06-11 17:56:34.564145+03', '2026-06-12 02:11:51.873+03', '2026-06-12 02:11:51.87+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTVJYP787PY5JPM6R599K60M', 'pset_01KTVJYPK42PW38XQP7QRBZP02', 'pvps_01KTVJYPRDKPD4F3K77H036HDE', '2026-06-11 17:56:34.564145+03', '2026-06-12 02:11:51.873+03', '2026-06-12 02:11:51.87+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGF8G0MQENH7ANE8TE0JRT', 'pset_01KTWGF8H5D4CKDG0WTCYXQ3XV', 'pvps_01KTWGF8HC91ESBXPWD8HA5AJ2', '2026-06-12 02:32:25.772851+03', '2026-06-12 02:33:36.755+03', '2026-06-12 02:33:36.755+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGF8KZTZ5JY8NV5M97K04R', 'pset_01KTWGF8MX2XJR0ATNVE61ZA2C', 'pvps_01KTWGF8N7KDX93DZSC3BF1EVV', '2026-06-12 02:32:25.895018+03', '2026-06-12 02:33:37.092+03', '2026-06-12 02:33:37.092+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGF8S0NNTE5FHDKN7PDHMH', 'pset_01KTWGF8SK7H2737PZK49Q3CYG', 'pvps_01KTWGF8SSFP5P8AF9C5P43W9G', '2026-06-12 02:32:26.041658+03', '2026-06-12 02:33:37.359+03', '2026-06-12 02:33:37.359+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGF8YN79EF4KMYYGA300HJ', 'pset_01KTWGF8ZA7GPFB99XEPCAKDJW', 'pvps_01KTWGF8ZGTBE44M3CNP3NF9VM', '2026-06-12 02:32:26.224589+03', '2026-06-12 02:33:37.539+03', '2026-06-12 02:33:37.539+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGF95PRQ16E4Z7YMT95KZP', 'pset_01KTWGF9679VKZHZRAKJ4Z24KH', 'pvps_01KTWGF96DBWAH25RVCHE4HS2H', '2026-06-12 02:32:26.445968+03', '2026-06-12 02:33:37.692+03', '2026-06-12 02:33:37.692+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGF9DJ2AW1XE041XZ6WWBE', 'pset_01KTWGF9E4DP7Y7G4NSXWFNBT9', 'pvps_01KTWGF9EBSD8PHZNG5A6YCPNH', '2026-06-12 02:32:26.699787+03', '2026-06-12 02:33:37.802+03', '2026-06-12 02:33:37.802+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGHF7432YQRSMH31PX9ZA2', 'pset_01KTWGHF7R16GFKXN00TM81ARP', 'pvps_01KTWGHF7YSQNM1N4E597WZK3S', '2026-06-12 02:33:38.174419+03', '2026-06-12 02:35:56.413+03', '2026-06-12 02:35:56.413+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGHFHJMSFHKG8VVX3B3Y6P', 'pset_01KTWGHFJ5ES5XYEDE3KFDBVKJ', 'pvps_01KTWGHFJBRGJBF7AG70DJKD74', '2026-06-12 02:33:38.507624+03', '2026-06-12 02:35:57.064+03', '2026-06-12 02:35:57.064+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGHG0HWG535VFS2VA2V5W4', 'pset_01KTWGHG18DQ6BRWF7JXD4FZHN', 'pvps_01KTWGHG1DJSRHB1YM8W07YVTS', '2026-06-12 02:33:38.989869+03', '2026-06-12 02:35:57.474+03', '2026-06-12 02:35:57.474+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9KEMBBSY9NR0S51NQX9H', 'pset_01KTWF9KMBNJY9VJVCFMXQXYJG', 'pvps_01KTWF9KNTBP3Q33B7SXE7GN9A', '2026-06-12 02:11:51.994442+03', '2026-06-12 02:11:53.217+03', '2026-06-12 02:11:53.217+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9KEMMNHMBV9QKED369VE', 'pset_01KTWF9KMCHNDEPMW5XY0N6F6W', 'pvps_01KTWF9KNV8RMKWRADP50YDT21', '2026-06-12 02:11:51.994442+03', '2026-06-12 02:11:54.093+03', '2026-06-12 02:11:54.092+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9KEN1ZRENB8ZFQ9TPY2F', 'pset_01KTWF9KMCRQDHB0TTY7YGJZMR', 'pvps_01KTWF9KNWK6FENJEP75ERR3H7', '2026-06-12 02:11:51.994442+03', '2026-06-12 02:11:55.083+03', '2026-06-12 02:11:55.083+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9KEN4XEYP5V525001ZBD', 'pset_01KTWF9KMCZ9S0JNRP1BYFB5CV', 'pvps_01KTWF9KNWGE6Z6JR5N8A0NZFZ', '2026-06-12 02:11:51.994442+03', '2026-06-12 02:11:56.271+03', '2026-06-12 02:11:56.271+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9KENJ5WWBWJSPDW8C6ZE', 'pset_01KTWF9KMCFNT3VTTZXP3J3C42', 'pvps_01KTWF9KNWH2M6FY1TDC08P3FV', '2026-06-12 02:11:51.994442+03', '2026-06-12 02:11:57.258+03', '2026-06-12 02:11:57.258+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9KENPG55C65KCGEJ3V4G', 'pset_01KTWF9KMCRA47ANFBRE38S0YV', 'pvps_01KTWF9KNVV53DQ9GYH3PG557P', '2026-06-12 02:11:51.994442+03', '2026-06-12 02:11:58.121+03', '2026-06-12 02:11:58.121+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9KEP2CXA96D31CN4RZED', 'pset_01KTWF9KMDYFTNGTGFZFDFP5T0', 'pvps_01KTWF9KNWFT73ZFRYVTXDT92D', '2026-06-12 02:11:51.994442+03', '2026-06-12 02:11:58.87+03', '2026-06-12 02:11:58.87+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9KEP6DTF73N1VC7W82AY', 'pset_01KTWF9KME6DDHP141S0XX15JA', 'pvps_01KTWF9KNW6FPVF2G6Y71S13G4', '2026-06-12 02:11:51.994442+03', '2026-06-12 02:11:59.529+03', '2026-06-12 02:11:59.529+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9KEPD0KJBBNNCBHXC3H6', 'pset_01KTWF9KMD1RE28A1M0VZXW0Q0', 'pvps_01KTWF9KNWYBGXVX8FVWJ8DXRW', '2026-06-12 02:11:51.994442+03', '2026-06-12 02:12:00.216+03', '2026-06-12 02:12:00.216+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9KEPGC7MAZ54QKFP6R4Q', 'pset_01KTWF9KMD9WZQ3NRG01GVNB0S', 'pvps_01KTWF9KNWZENKGVHZFTGJ1SX0', '2026-06-12 02:11:51.994442+03', '2026-06-12 02:12:00.758+03', '2026-06-12 02:12:00.758+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9KEPSAFY4ZA6146KVFXZ', 'pset_01KTWF9KMD3NS2K4SWP7B3NK1Y', 'pvps_01KTWF9KNW87CKJXCYGYRM5W7F', '2026-06-12 02:11:51.994442+03', '2026-06-12 02:12:01.242+03', '2026-06-12 02:12:01.242+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9KEQ0NX61YDAZXP1RWFH', 'pset_01KTWF9KME7ET8J7R78V72CAJK', 'pvps_01KTWF9KNX02MJ1A22JY9DNH1M', '2026-06-12 02:11:51.994442+03', '2026-06-12 02:12:01.727+03', '2026-06-12 02:12:01.727+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9KEQEBA7EG0ZDT5PMV28', 'pset_01KTWF9KME5W7PJEVT4RA35DAE', 'pvps_01KTWF9KNXHZJS1FDFZMY3M5KV', '2026-06-12 02:11:51.994442+03', '2026-06-12 02:12:02.036+03', '2026-06-12 02:12:02.036+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9KEQFRW50095R19EWYZD', 'pset_01KTWF9KMEW947JM0G4EAQBH5C', 'pvps_01KTWF9KNXGY0JQ96ERYJ0VGJN', '2026-06-12 02:11:51.994442+03', '2026-06-12 02:12:02.388+03', '2026-06-12 02:12:02.387+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9KEQHS9RNSBQAM2CD9AD', 'pset_01KTWF9KMEHG5V3ZH5HX0F8W8R', 'pvps_01KTWF9KNXQAMN59EWEKZ80034', '2026-06-12 02:11:51.994442+03', '2026-06-12 02:12:02.512+03', '2026-06-12 02:12:02.512+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGNQQH5D122AQFA689J1XW', 'pset_01KTWGNQR7F3BSEH0MKG1DAHYY', 'pvps_01KTWGNQRG7TGNSPKHPWC0BDFP', '2026-06-12 02:35:57.969004+03', '2026-06-12 03:36:46.559+03', '2026-06-12 03:36:46.559+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGNQY7JX0ZDEC5C5A940FE', 'pset_01KTWGNQZ2EJBZCMSP72VZ82H5', 'pvps_01KTWGNQZDTS94900BAYDXXSZH', '2026-06-12 02:35:58.18991+03', '2026-06-12 03:36:46.787+03', '2026-06-12 03:36:46.787+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGNRGTM2VPJVEMPDV06VM5', 'pset_01KTWGNRHJ61809N5RKNHVSM2J', 'pvps_01KTWGNRHSVCWDC4M02TN3JV8F', '2026-06-12 02:35:58.777459+03', '2026-06-12 03:36:47.076+03', '2026-06-12 03:36:47.076+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGNSDBD9AQQR92BWK0F254', 'pset_01KTWGNSE4RJE379KMQW70J5EJ', 'pvps_01KTWGNSEGQEV3PXJBE1G5FVFW', '2026-06-12 02:35:59.696264+03', '2026-06-12 03:36:47.362+03', '2026-06-12 03:36:47.362+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWGNSX3X728GK24ZGNEZ6RR', 'pset_01KTWGNSY0YPJR3578PDHXPHD0', 'pvps_01KTWGNSYB68HTKVRK8TSDV1BT', '2026-06-12 02:36:00.203537+03', '2026-06-12 03:36:47.458+03', '2026-06-12 03:36:47.458+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWM5447KGQG136R4PR5MR3M', 'pset_01KTWM54556GWH716AMJFXRM60', 'pvps_01KTWM545FKC526P12CEZ36JFH', '2026-06-12 03:36:47.919591+03', '2026-06-12 03:46:38.155+03', '2026-06-12 03:46:38.155+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWM54BJZE3VKS5A93ZK4F58', 'pset_01KTWM54C6CH2FC6PQ7SNAZMK8', 'pvps_01KTWM54CDKCC4WC3VJBDGPMTB', '2026-06-12 03:36:48.140978+03', '2026-06-12 03:46:38.72+03', '2026-06-12 03:46:38.72+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWM54K68TETTSSTQPQX94RS', 'pset_01KTWM54KY0PSDKSKDJ11N2T64', 'pvps_01KTWM54M45C8WYK5R60BZCMV4', '2026-06-12 03:36:48.38883+03', '2026-06-12 03:46:38.983+03', '2026-06-12 03:46:38.983+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9Y6V49ED3FQ4XS3GJ434', 'pset_01KTWF9Y8BY1SFAY96KD96SK7N', 'pvps_01KTWF9Y8KZSV084N2EYZ72SSJ', '2026-06-12 02:12:02.835589+03', '2026-06-12 02:32:17.139+03', '2026-06-12 02:32:17.139+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9YBTF01TEEF0KPG5MNGH', 'pset_01KTWF9YCFSBG30M6TG6D70DTQ', 'pvps_01KTWF9YCPNXQ1YCVJKEP850K1', '2026-06-12 02:12:02.965834+03', '2026-06-12 02:32:18.471+03', '2026-06-12 02:32:18.471+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9YHPJXMTJSFRSTK8R8RB', 'pset_01KTWF9YJJ79DRTDS7PS08KHRZ', 'pvps_01KTWF9YJTHAGJSG9Z1MDN7V67', '2026-06-12 02:12:03.162498+03', '2026-06-12 02:32:19.395+03', '2026-06-12 02:32:19.395+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9YWPDZG9EVXXFEFAGX79', 'pset_01KTWF9YXXJJ24HPDE8D51T9MQ', 'pvps_01KTWF9YY8YAKD5G7EPP95AS1X', '2026-06-12 02:12:03.528569+03', '2026-06-12 02:32:20.709+03', '2026-06-12 02:32:20.708+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9Z7YTECSPGDH20AWH4W9', 'pset_01KTWF9Z8M54SVV4GG9E8V81MS', 'pvps_01KTWF9Z8X06A5SZ37RGWMRAMR', '2026-06-12 02:12:03.869238+03', '2026-06-12 02:32:21.491+03', '2026-06-12 02:32:21.49+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWF9ZSA5N3ZEZZKNER8CYB2', 'pset_01KTWF9ZT94B4XYBQCJATY05V9', 'pvps_01KTWF9ZTNBJ515XXPJKQK6AHY', '2026-06-12 02:12:04.437748+03', '2026-06-12 02:32:22.171+03', '2026-06-12 02:32:22.171+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWFA07AKCN7WFV5TR6T32ER', 'pset_01KTWFA086VZ9JG6CQ8KEV62BR', 'pvps_01KTWFA08CFVT7WDHN5R2NDWWP', '2026-06-12 02:12:04.876186+03', '2026-06-12 02:32:22.771+03', '2026-06-12 02:32:22.77+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWFA0PFGGX0YKX0HSXQ9H9P', 'pset_01KTWFA0Q59GNP7K8T34BHSAN4', 'pvps_01KTWFA0QE5E9A7PZ5K8SAY194', '2026-06-12 02:12:05.358526+03', '2026-06-12 02:32:23.305+03', '2026-06-12 02:32:23.305+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWFA19MVVWCK74WJ8335FY7', 'pset_01KTWFA1A9A43EW69342A3WRKA', 'pvps_01KTWFA1AH3RKZE5JGEVHADP0P', '2026-06-12 02:12:05.969894+03', '2026-06-12 02:32:23.773+03', '2026-06-12 02:32:23.773+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWFA1XAWENQ3004NBYJXVHT', 'pset_01KTWFA1Y9Q4F5QAHFBZKBNJ6F', 'pvps_01KTWFA1YSRKZBXM85MP8ZYJ3R', '2026-06-12 02:12:06.617443+03', '2026-06-12 02:32:24.19+03', '2026-06-12 02:32:24.189+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWFA2TE54YKQ3WDWAKR9QQC', 'pset_01KTWFA2V0J5CFVBPBF5WVB9D2', 'pvps_01KTWFA2V6QV6SDK7FBTVKRF3F', '2026-06-12 02:12:07.526924+03', '2026-06-12 02:32:24.626+03', '2026-06-12 02:32:24.626+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWFA3FCNHQ6X8C8N9C7YEEG', 'pset_01KTWFA3FZZG7HKECS2QR45C08', 'pvps_01KTWFA3G8YBK0FD5993JJVJNF', '2026-06-12 02:12:08.200375+03', '2026-06-12 02:32:24.923+03', '2026-06-12 02:32:24.923+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWFA46SK8J2ACRNSEH01EWZ', 'pset_01KTWFA47N58QN02RT8MB4RGA6', 'pvps_01KTWFA47VE24W8XDNJPKSXB4E', '2026-06-12 02:12:08.955363+03', '2026-06-12 02:32:25.156+03', '2026-06-12 02:32:25.156+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWFA545MJFC6SVY0H5RV1DP', 'pset_01KTWFA54XPMSWSXQTS3SJ032F', 'pvps_01KTWFA555M1FKP6G2QGQFEPBT', '2026-06-12 02:12:09.893838+03', '2026-06-12 02:32:25.34+03', '2026-06-12 02:32:25.34+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWFA5Z4WSA3FXAC0YYWW6XE', 'pset_01KTWFA5ZR19YRD8TTS409W8DD', 'pvps_01KTWFA601PJSK23P3FD9WKJDA', '2026-06-12 02:12:10.753171+03', '2026-06-12 02:32:25.491+03', '2026-06-12 02:32:25.491+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWM54WK9SXFN6BJDPBM09MD', 'pset_01KTWM54X6CWPRTCBARR6ZTQAK', 'pvps_01KTWM54XCEK9EK3J6F7X8K6W0', '2026-06-12 03:36:48.684521+03', '2026-06-12 03:46:39.211+03', '2026-06-12 03:46:39.21+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWMQ5Y94RJKPJTXF93AD1JF', 'pset_01KTWMQ5ZJAPQM2RC25WK8X138', 'pvps_01KTWMQ6011JJNJ7P8JPXVK18W', '2026-06-12 03:46:39.617263+03', '2026-06-12 04:32:47.875+03', '2026-06-12 04:32:47.873+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWMQ62DPHWKYF9S68GDNMPK', 'pset_01KTWMQ639Y207FVX308K5ZV11', 'pvps_01KTWMQ63JS34538DJ940VG5XJ', '2026-06-12 03:46:39.730259+03', '2026-06-12 04:32:48.695+03', '2026-06-12 04:32:48.694+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWMQ6X4CPB9SC3HPTVZ17M2', 'pset_01KTWMQ6XSF434KPHSWH224BXE', 'pvps_01KTWMQ6Y1A76T7DX4DY09VWPM', '2026-06-12 03:46:40.577898+03', '2026-06-12 04:32:51.222+03', '2026-06-12 04:32:51.221+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWMQ73WDYYRAK2NSQDNJ9S8', 'pset_01KTWMQ74X79HCHZDJM5H8NJWT', 'pvps_01KTWMQ75B7NVA9SG1GHDA6AAD', '2026-06-12 03:46:40.811749+03', '2026-06-12 04:32:51.411+03', '2026-06-12 04:32:51.411+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWQBSF6QS6HG8VQPH1TH5PJ', 'pset_01KTWQBSHHA1QE07HA12TWR0N7', 'pvps_01KTWQBSJJ649DM8MFMEJT4EHY', '2026-06-12 04:32:52.178281+03', '2026-06-12 04:32:52.178281+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWQBSR3DTDCWMY5RC6PJZRR', 'pset_01KTWQBSSWZPJ1Z5YMVQ471RH6', 'pvps_01KTWQBSTJGW90KW7QWA38KV87', '2026-06-12 04:32:52.433894+03', '2026-06-12 04:32:52.433894+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWQBT1P73D5X7CZEVNAFCAP', 'pset_01KTWQBT4WFYAZ37JNSS17RZFK', 'pvps_01KTWQBT5NB12459P5Q98TZZ30', '2026-06-12 04:32:52.789132+03', '2026-06-12 04:32:52.789132+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWQBTCKVJVYCT6KMB4CKHR1', 'pset_01KTWQBTE6Y1HEF028Z0J9M9BB', 'pvps_01KTWQBTETQR60J0QP4YR3Y25Q', '2026-06-12 04:32:53.081498+03', '2026-06-12 04:32:53.081498+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWQBTSRFMQBWRJDQJM6FG94', 'pset_01KTWQBTVC52RJ72DYGQWKBWFQ', 'pvps_01KTWQBTW014MPBM73QZCJ9QXF', '2026-06-12 04:32:53.504041+03', '2026-06-12 04:32:53.504041+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWQBV4ANMXQKEJS4KR26CYW', 'pset_01KTWQBV685P42NCX2V332MCKJ', 'pvps_01KTWQBV752BRMHJ14H232ZFCS', '2026-06-12 04:32:53.86065+03', '2026-06-12 04:32:53.86065+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWQBVJN2HR5SRSE7PCYB5YH', 'pset_01KTWQBVMH6TZGGS0SZ9J1FSZX', 'pvps_01KTWQBVN52EY75KS164P5D6R2', '2026-06-12 04:32:54.309175+03', '2026-06-12 04:32:54.309175+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWQBVZEX916PGDA851QTEZ6', 'pset_01KTWQBW10TQK6W5XTS6F7BH01', 'pvps_01KTWQBW1HZT4KMDFVPCGK4JEC', '2026-06-12 04:32:54.705616+03', '2026-06-12 04:32:54.705616+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KTWQBWE020M9KEYRDA45X1JE', 'pset_01KTWQBWFZCY41HZAQW5BY3832', 'pvps_01KTWQBWGP8QXZMB376K805VQK', '2026-06-12 04:32:55.189841+03', '2026-06-12 04:32:55.189841+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1XXB68A8AB8PS93GT31KV2', 'pset_01KV1XXB9FMPTBZAF7942DP59T', 'pvps_01KV1XXBAQ7PDC8V1N69J3G5D9', '2026-06-14 05:03:31.031618+03', '2026-06-14 05:16:48.975+03', '2026-06-14 05:16:48.974+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1XXB68DQXV66B0HZ8R70RD', 'pset_01KV1XXB9FRXYQ4ZQKQ4S5N7Y8', 'pvps_01KV1XXBARQW7CMR7ECG11Q9MQ', '2026-06-14 05:03:31.031618+03', '2026-06-14 05:16:49.398+03', '2026-06-14 05:16:49.398+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1XXB69SCYQK4G1ECAQY4TH', 'pset_01KV1XXB9F4KW4KP7AW2PH6WA5', 'pvps_01KV1XXBAR8X5EKCC66TFB41TH', '2026-06-14 05:03:31.031618+03', '2026-06-14 05:16:49.808+03', '2026-06-14 05:16:49.808+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1XXB69CG0WQ8592VW7NSBC', 'pset_01KV1XXB9G10YC207VS87FQW1R', 'pvps_01KV1XXBAR69DV4Q7211S7RVN7', '2026-06-14 05:03:31.031618+03', '2026-06-14 05:16:50.2+03', '2026-06-14 05:16:50.2+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1XXB6AGQ67RAG9A3AK4YDS', 'pset_01KV1XXB9GVFVAPK8DGZDSME7J', 'pvps_01KV1XXBARCSV94RB4YZXS2SP6', '2026-06-14 05:03:31.031618+03', '2026-06-14 05:16:50.461+03', '2026-06-14 05:16:50.461+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1XXB6A3MZ68S7QYSADSPB6', 'pset_01KV1XXB9G1ZY2DZEYM15VMGCR', 'pvps_01KV1XXBARPVSHCP2A71YJ8QEA', '2026-06-14 05:03:31.031618+03', '2026-06-14 05:16:50.71+03', '2026-06-14 05:16:50.709+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1XXB6BYV20WQMBDBEKYJ0K', 'pset_01KV1XXB9G2DW36VTGNEQWXA6K', 'pvps_01KV1XXBARH0QE36CSXDP8A6Q4', '2026-06-14 05:03:31.031618+03', '2026-06-14 05:16:50.981+03', '2026-06-14 05:16:50.98+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1XXB6BZCC6X7CG316X54VY', 'pset_01KV1XXB9GCXSB96DCPB8PN76B', 'pvps_01KV1XXBARRV8GS9JEMA8XB532', '2026-06-14 05:03:31.031618+03', '2026-06-14 05:16:51.249+03', '2026-06-14 05:16:51.249+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1XXB6CZ7KEDCY2ZQXNBH3F', 'pset_01KV1XXB9H09PNZK9W1W99FHC4', 'pvps_01KV1XXBARD0MVBZSMVME4R3ZH', '2026-06-14 05:03:31.031618+03', '2026-06-14 05:16:51.45+03', '2026-06-14 05:16:51.449+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1XXB6C58N5X1RKV7T5N65K', 'pset_01KV1XXB9HZ9WPV7BN30R12964', 'pvps_01KV1XXBAR77S68Z8DBEYRDPFV', '2026-06-14 05:03:31.031618+03', '2026-06-14 05:16:51.624+03', '2026-06-14 05:16:51.624+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1XXB6CPRC9GA6CHXSCK53M', 'pset_01KV1XXB9HJ6HGK01T3KS4ARXJ', 'pvps_01KV1XXBARB61FHN3D3AB7R7ZZ', '2026-06-14 05:03:31.031618+03', '2026-06-14 05:16:51.79+03', '2026-06-14 05:16:51.789+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1XXB6DDPAYVN3D55882TWC', 'pset_01KV1XXB9J07VSRNG8SQ79VHXF', 'pvps_01KV1XXBAS1WWBAWE0Y8SRB0GG', '2026-06-14 05:03:31.031618+03', '2026-06-14 05:16:51.938+03', '2026-06-14 05:16:51.938+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1XXB6D9FD6N7MBVM95R8Z1', 'pset_01KV1XXB9JC8XA6FER63X1ZC3E', 'pvps_01KV1XXBASTGWQG35TNNWV1212', '2026-06-14 05:03:31.031618+03', '2026-06-14 05:16:52.066+03', '2026-06-14 05:16:52.066+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1XXB6DAYECEN7PXZAJBC94', 'pset_01KV1XXB9J4S1C6G9C2AYXGJYJ', 'pvps_01KV1XXBASRGA5VBD46FWED170', '2026-06-14 05:03:31.031618+03', '2026-06-14 05:16:52.182+03', '2026-06-14 05:16:52.182+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1XXB6DCZ91SR4G11WPWN2C', 'pset_01KV1XXB9JB8CMYDCYWT984XSR', 'pvps_01KV1XXBAS9N0P1AAB0PF7SHYM', '2026-06-14 05:03:31.031618+03', '2026-06-14 05:16:52.277+03', '2026-06-14 05:16:52.277+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1YNT196VHQ360Q3WMC9NNF', 'pset_01KV1YNT22GKNG4M967A8GCG21', 'pvps_01KV1YNT2CFMV7Y1WNQJDHZS63', '2026-06-14 05:16:52.556123+03', '2026-06-14 06:22:49.054+03', '2026-06-14 06:22:49.053+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1YNT4HMZ8TNJAG099ZX3RV', 'pset_01KV1YNT5SN4NKSEREZ8EW5KPK', 'pvps_01KV1YNT6AFP4P2A55B51DBT8Z', '2026-06-14 05:16:52.682399+03', '2026-06-14 06:22:49.688+03', '2026-06-14 06:22:49.687+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1YNTBFTM2X9WVJ3TCG5XAV', 'pset_01KV1YNTCADKFHYC9VW55V4HDR', 'pvps_01KV1YNTCM22EDARF2E7V6V50Z', '2026-06-14 05:16:52.884929+03', '2026-06-14 06:22:50.197+03', '2026-06-14 06:22:50.197+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1YNTG67BQRS4NWE2D9QE0D', 'pset_01KV1YNTGTJTHKJYQNSS1J0M0R', 'pvps_01KV1YNTH2S90XZBCN2RK1QYC9', '2026-06-14 05:16:53.026719+03', '2026-06-14 06:22:50.716+03', '2026-06-14 06:22:50.715+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1YNTR9N2XEW4E56W3NTHA0', 'pset_01KV1YNTSGZM0XBDA8V1P4N7X5', 'pvps_01KV1YNTT1KZVJAXH38E9CY875', '2026-06-14 05:16:53.313284+03', '2026-06-14 06:22:51.029+03', '2026-06-14 06:22:51.029+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1YNV26EGEKA909S31Y3V69', 'pset_01KV1YNV2T1J0YAJ1V465BT3Y7', 'pvps_01KV1YNV342JKBMJD576SA2KZG', '2026-06-14 05:16:53.604145+03', '2026-06-14 06:22:51.338+03', '2026-06-14 06:22:51.337+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1YNV7SZCYSZK89KYSX4YD6', 'pset_01KV1YNV8C2X0H7E9TCV9ES836', 'pvps_01KV1YNV8PM29125BE0ZWTWXC4', '2026-06-14 05:16:53.782147+03', '2026-06-14 06:22:51.583+03', '2026-06-14 06:22:51.583+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1YNVDNESETQJ5WNAYGZ724', 'pset_01KV1YNVEBAZK6GG9JAMGQRDY1', 'pvps_01KV1YNVEKQVMH5DY69Y7KWMZM', '2026-06-14 05:16:53.971626+03', '2026-06-14 06:22:51.814+03', '2026-06-14 06:22:51.814+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1YNVKY0H4208HVVEW1PWRG', 'pset_01KV1YNVMK2BXMKRGZA5SW45G9', 'pvps_01KV1YNVMVMC6X94K41NRZX024', '2026-06-14 05:16:54.171589+03', '2026-06-14 06:22:52.054+03', '2026-06-14 06:22:52.054+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1YNVTPGP7YNJQEQC310M2J', 'pset_01KV1YNVVDMDHVG3641R0H4H2A', 'pvps_01KV1YNVVMKNNRB37ZRV8TWVDW', '2026-06-14 05:16:54.38888+03', '2026-06-14 06:22:52.424+03', '2026-06-14 06:22:52.424+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1YNW2N2Q8507TSWE2JY16D', 'pset_01KV1YNW3EEC8S52KYY3P18N06', 'pvps_01KV1YNW3R2VDP1K30EP7JCXK3', '2026-06-14 05:16:54.648151+03', '2026-06-14 06:22:52.716+03', '2026-06-14 06:22:52.716+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1YNWAW1Q4QW3FDGBTCDF6A', 'pset_01KV1YNWBGDRZGA9G1KCH6K5TY', 'pvps_01KV1YNWBQRV9J6G1XF2ASA6VX', '2026-06-14 05:16:54.903437+03', '2026-06-14 06:22:52.981+03', '2026-06-14 06:22:52.98+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1YNWMB1GW071DN16P9W094', 'pset_01KV1YNWNCWEXDRK4G8MHDHTNR', 'pvps_01KV1YNWP4P8STB79M969K3ZVJ', '2026-06-14 05:16:55.236386+03', '2026-06-14 06:22:53.129+03', '2026-06-14 06:22:53.129+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1YNX05AFVZWBHQ6ZP4T6ZK', 'pset_01KV1YNX0YN95MEJGQR8NQPQSQ', 'pvps_01KV1YNX15XRSBM03SYZJ2VV4S', '2026-06-14 05:16:55.589489+03', '2026-06-14 06:22:53.244+03', '2026-06-14 06:22:53.243+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV1YNX9RG0PNS20P3AXNXAWY', 'pset_01KV1YNXAE9Y3E3XJEMXE78BFE', 'pvps_01KV1YNXAP363YSNXPFXT2AP3B', '2026-06-14 05:16:55.89423+03', '2026-06-14 06:22:53.333+03', '2026-06-14 06:22:53.333+03');
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV22EP7TAD0HHRHKKYVF4ASH', 'pset_01KV22EP8RWV8WAZGYYN8YAFQ3', 'pvps_01KV22EP90PDX3FT74Q5VWK3NH', '2026-06-14 06:22:53.600629+03', '2026-06-14 06:22:53.600629+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV22EPBJTYXS1HAY5BK2B2QP', 'pset_01KV22EPC9DWEZQH8265AM53MH', 'pvps_01KV22EPCHXK9NFEGSB4X50D0E', '2026-06-14 06:22:53.713153+03', '2026-06-14 06:22:53.713153+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV22EPF6ZB5WY6Y3YW1GJW8B', 'pset_01KV22EPFTSK2SN9W0JP27R0RR', 'pvps_01KV22EPG39KPNQHRFH1H1VY8D', '2026-06-14 06:22:53.827436+03', '2026-06-14 06:22:53.827436+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV22EPJTS04JXW6CDKEK7FQY', 'pset_01KV22EPKF3CEKW75MPR3ZXYF9', 'pvps_01KV22EPKQ10KH7WR0VWG1TC7X', '2026-06-14 06:22:53.943533+03', '2026-06-14 06:22:53.943533+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV22EPQ578HA2RY70QDBDE5S', 'pset_01KV22EPQWH9ZK18WXKYX9YJH8', 'pvps_01KV22EPR4WMASNPWMYKA4MR00', '2026-06-14 06:22:54.084215+03', '2026-06-14 06:22:54.084215+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV22EPW43PEDT59ERN26PNYV', 'pset_01KV22EPWS7KAXREX5SQKDEZ07', 'pvps_01KV22EPX1FN9JWMRAX9EA97EE', '2026-06-14 06:22:54.2416+03', '2026-06-14 06:22:54.2416+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV22EQ361YD245KXJWT9W8RG', 'pset_01KV22EQ403N3G05YPSHVE3TT2', 'pvps_01KV22EQ4CPN653KZ4W1ZZFEYM', '2026-06-14 06:22:54.475947+03', '2026-06-14 06:22:54.475947+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV22EQBHPXC304YQGCZG3HNP', 'pset_01KV22EQCB5TK9AK28BPNZYVDY', 'pvps_01KV22EQCPK7HMV8KWGZGN1NXE', '2026-06-14 06:22:54.741622+03', '2026-06-14 06:22:54.741622+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV22EQMTZJKSDN9YDK00S8S7', 'pset_01KV22EQNHX33J79XTAM1JVWQF', 'pvps_01KV22EQNRKVHTZXHP2V93GF49', '2026-06-14 06:22:55.032208+03', '2026-06-14 06:22:55.032208+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV22EQVZTZDYQSZNDCXW3PWN', 'pset_01KV22EQWNC9BTPKNBSVWQFFHC', 'pvps_01KV22EQWYMNQQQ2X0A1NR1TC1', '2026-06-14 06:22:55.261839+03', '2026-06-14 06:22:55.261839+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV22ER4J13F4AK749AP3VNY1', 'pset_01KV22ER5A2YT2D2H59AQJX2CY', 'pvps_01KV22ER5M85MZA24DYF20M8ZZ', '2026-06-14 06:22:55.540167+03', '2026-06-14 06:22:55.540167+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV22ERK0R9EVMEC5T8ERZ4WH', 'pset_01KV22ERM7418HM043CPJMJ428', 'pvps_01KV22ERN3PM1HQP15P67FX2VS', '2026-06-14 06:22:56.034745+03', '2026-06-14 06:22:56.034745+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV22ERZGRN0N8Q7A3KWNK6CF', 'pset_01KV22ES06KXZ9J8896CSF6VQ3', 'pvps_01KV22ES0H99J2P0Y4A3YVGH7G', '2026-06-14 06:22:56.401618+03', '2026-06-14 06:22:56.401618+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV22ES8MZQH3TBTBT8D5D9HB', 'pset_01KV22ES9BB74VH7DC9C21S0WE', 'pvps_01KV22ES9M36J19Q75N2YMN26Z', '2026-06-14 06:22:56.692791+03', '2026-06-14 06:22:56.692791+03', NULL);
INSERT INTO public.product_variant_price_set VALUES ('variant_01KV22ESK9VZ22T199H59K1XXG', 'pset_01KV22ESM1SYT2NDYPBBSYQFE4', 'pvps_01KV22ESM9CCFR84TVDDBE8J3N', '2026-06-14 06:22:57.03347+03', '2026-06-14 06:22:57.03347+03', NULL);


--
-- Data for Name: product_variant_product_image; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: promotion; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: promotion_application_method; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: promotion_campaign; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: promotion_campaign_budget; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: promotion_campaign_budget_usage; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: promotion_promotion_rule; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: promotion_rule; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: promotion_rule_value; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: property_label; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: provider_identity; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.provider_identity VALUES ('01KTSXZNCQNPG71KGZEEK8NG39', 'admin@medusa-test.com', 'emailpass', 'authid_01KTSXZNCRDSG3SQBB704R5VNQ', NULL, '{"password": "c2NyeXB0AA8AAAAIAAAAAbPkkLyWe16riT+1H8pSlxdqtVrVpWLDGb2VD2LJiqstaJMkrfEvzFYBdw0XAdC9wLtqgdVlRpc+NBPf/r1TITi+SA8m6ZGdgEXTVn8o7KNZ"}', '2026-06-11 02:30:51.416+03', '2026-06-11 02:30:51.416+03', NULL);
INSERT INTO public.provider_identity VALUES ('01KVXXVB3JY76ZB9X82RTSRM0P', 'admin2@medusa-test.com', 'emailpass', 'authid_01KVXXVB3M7DSD624APC1ZFYBN', NULL, '{"password": "c2NyeXB0AA8AAAAIAAAAAXvRMr/40a/Sit+d2UKAr9SPP2Ha5Gmaj+6tcfLgFQq4JkhHvcp3tyV5wPqgMGOFPw6ortbK49P6PbDB1bjbFssh+1mqf1tznslSGxoTVDSS"}', '2026-06-25 02:01:09.365+03', '2026-06-25 02:01:09.365+03', NULL);
INSERT INTO public.provider_identity VALUES ('01KWA4859WT0Q516ZT5G8K310B', 'admin@admin.com', 'emailpass', 'authid_01KWA4859ZQ5CECYZ2B84V9635', NULL, '{"password": "c2NyeXB0AA8AAAAIAAAAAc+OuR/f9xY3BPHWME+JGcdMpUkjJYBEhO4cnM95S49sykUG3Czeivr1+mGs9mD2jEsvPJk1MM1A8jCU/pzTaAc9VQocvDt4qpslfFOHTKkZ"}', '2026-06-29 19:43:54.048+03', '2026-06-29 19:43:54.048+03', NULL);
INSERT INTO public.provider_identity VALUES ('01KWARA11NHY2KEKKFKV7X85C0', 'hakki@admin.com', 'emailpass', 'authid_01KWARA11QAW74X58Y8A9ND5Y8', NULL, '{"password": "c2NyeXB0AA8AAAAIAAAAAea0HWfpV6UDIHYsPShT07IFpEhWijBoega/e75yPYXOcxvBgT/Hfi/hP+HbQWgV2SpsVhbiTVhT0/qIJaewSHWRqYm3SsUecA+lkNv/i/CN"}', '2026-06-30 01:34:26.744+03', '2026-06-30 01:34:26.744+03', NULL);


--
-- Data for Name: publishable_api_key_sales_channel; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.publishable_api_key_sales_channel VALUES ('apk_01KTSXRAE1VZ78BAQ9JFC83RKC', 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'pksc_01KTSXRAFKD1J2JAN7S0D5DNZE', '2026-06-11 02:26:50.866197+03', '2026-06-11 02:26:50.866197+03', NULL);


--
-- Data for Name: refund; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: refund_reason; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.refund_reason VALUES ('refr_01KTSXPYBDWSNDT99K31BVTQ0Z', 'Shipping Issue', 'Refund due to lost, delayed, or misdelivered shipment', NULL, '2026-06-11 02:26:04.419888+03', '2026-06-11 02:26:04.419888+03', NULL, 'shipping_issue');
INSERT INTO public.refund_reason VALUES ('refr_01KTSXPYBFTXS8RBTEQDGXKJJG', 'Customer Care Adjustment', 'Refund given as goodwill or compensation for inconvenience', NULL, '2026-06-11 02:26:04.419888+03', '2026-06-11 02:26:04.419888+03', NULL, 'customer_care_adjustment');
INSERT INTO public.refund_reason VALUES ('refr_01KTSXPYBFGDJVN8R4MFPEMF4H', 'Pricing Error', 'Refund to correct an overcharge, missing discount, or incorrect price', NULL, '2026-06-11 02:26:04.419888+03', '2026-06-11 02:26:04.419888+03', NULL, 'pricing_error');


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.region VALUES ('reg_01KTSXRAKEE634P20BK48VVW24', 'Europe', 'eur', NULL, '2026-06-11 02:26:51.023+03', '2026-06-11 02:26:51.023+03', NULL, true);
INSERT INTO public.region VALUES ('reg_tr', 'Turkey', 'try', NULL, '2026-06-12 04:53:20.442571+03', '2026-06-12 04:53:20.442571+03', NULL, true);


--
-- Data for Name: region_country; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.region_country VALUES ('af', 'afg', '004', 'AFGHANISTAN', 'Afghanistan', NULL, NULL, '2026-06-11 02:26:37.423+03', '2026-06-11 02:26:37.423+03', NULL);
INSERT INTO public.region_country VALUES ('al', 'alb', '008', 'ALBANIA', 'Albania', NULL, NULL, '2026-06-11 02:26:37.431+03', '2026-06-11 02:26:37.431+03', NULL);
INSERT INTO public.region_country VALUES ('dz', 'dza', '012', 'ALGERIA', 'Algeria', NULL, NULL, '2026-06-11 02:26:37.431+03', '2026-06-11 02:26:37.431+03', NULL);
INSERT INTO public.region_country VALUES ('as', 'asm', '016', 'AMERICAN SAMOA', 'American Samoa', NULL, NULL, '2026-06-11 02:26:37.431+03', '2026-06-11 02:26:37.431+03', NULL);
INSERT INTO public.region_country VALUES ('ad', 'and', '020', 'ANDORRA', 'Andorra', NULL, NULL, '2026-06-11 02:26:37.431+03', '2026-06-11 02:26:37.431+03', NULL);
INSERT INTO public.region_country VALUES ('ao', 'ago', '024', 'ANGOLA', 'Angola', NULL, NULL, '2026-06-11 02:26:37.431+03', '2026-06-11 02:26:37.431+03', NULL);
INSERT INTO public.region_country VALUES ('ai', 'aia', '660', 'ANGUILLA', 'Anguilla', NULL, NULL, '2026-06-11 02:26:37.432+03', '2026-06-11 02:26:37.432+03', NULL);
INSERT INTO public.region_country VALUES ('aq', 'ata', '010', 'ANTARCTICA', 'Antarctica', NULL, NULL, '2026-06-11 02:26:37.433+03', '2026-06-11 02:26:37.433+03', NULL);
INSERT INTO public.region_country VALUES ('ag', 'atg', '028', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', NULL, NULL, '2026-06-11 02:26:37.433+03', '2026-06-11 02:26:37.433+03', NULL);
INSERT INTO public.region_country VALUES ('ar', 'arg', '032', 'ARGENTINA', 'Argentina', NULL, NULL, '2026-06-11 02:26:37.433+03', '2026-06-11 02:26:37.433+03', NULL);
INSERT INTO public.region_country VALUES ('am', 'arm', '051', 'ARMENIA', 'Armenia', NULL, NULL, '2026-06-11 02:26:37.433+03', '2026-06-11 02:26:37.433+03', NULL);
INSERT INTO public.region_country VALUES ('aw', 'abw', '533', 'ARUBA', 'Aruba', NULL, NULL, '2026-06-11 02:26:37.433+03', '2026-06-11 02:26:37.433+03', NULL);
INSERT INTO public.region_country VALUES ('au', 'aus', '036', 'AUSTRALIA', 'Australia', NULL, NULL, '2026-06-11 02:26:37.433+03', '2026-06-11 02:26:37.433+03', NULL);
INSERT INTO public.region_country VALUES ('at', 'aut', '040', 'AUSTRIA', 'Austria', NULL, NULL, '2026-06-11 02:26:37.433+03', '2026-06-11 02:26:37.433+03', NULL);
INSERT INTO public.region_country VALUES ('az', 'aze', '031', 'AZERBAIJAN', 'Azerbaijan', NULL, NULL, '2026-06-11 02:26:37.434+03', '2026-06-11 02:26:37.434+03', NULL);
INSERT INTO public.region_country VALUES ('bs', 'bhs', '044', 'BAHAMAS', 'Bahamas', NULL, NULL, '2026-06-11 02:26:37.434+03', '2026-06-11 02:26:37.434+03', NULL);
INSERT INTO public.region_country VALUES ('bh', 'bhr', '048', 'BAHRAIN', 'Bahrain', NULL, NULL, '2026-06-11 02:26:37.434+03', '2026-06-11 02:26:37.434+03', NULL);
INSERT INTO public.region_country VALUES ('bd', 'bgd', '050', 'BANGLADESH', 'Bangladesh', NULL, NULL, '2026-06-11 02:26:37.434+03', '2026-06-11 02:26:37.434+03', NULL);
INSERT INTO public.region_country VALUES ('bb', 'brb', '052', 'BARBADOS', 'Barbados', NULL, NULL, '2026-06-11 02:26:37.434+03', '2026-06-11 02:26:37.434+03', NULL);
INSERT INTO public.region_country VALUES ('by', 'blr', '112', 'BELARUS', 'Belarus', NULL, NULL, '2026-06-11 02:26:37.434+03', '2026-06-11 02:26:37.434+03', NULL);
INSERT INTO public.region_country VALUES ('be', 'bel', '056', 'BELGIUM', 'Belgium', NULL, NULL, '2026-06-11 02:26:37.434+03', '2026-06-11 02:26:37.434+03', NULL);
INSERT INTO public.region_country VALUES ('bz', 'blz', '084', 'BELIZE', 'Belize', NULL, NULL, '2026-06-11 02:26:37.434+03', '2026-06-11 02:26:37.434+03', NULL);
INSERT INTO public.region_country VALUES ('bj', 'ben', '204', 'BENIN', 'Benin', NULL, NULL, '2026-06-11 02:26:37.434+03', '2026-06-11 02:26:37.434+03', NULL);
INSERT INTO public.region_country VALUES ('bm', 'bmu', '060', 'BERMUDA', 'Bermuda', NULL, NULL, '2026-06-11 02:26:37.435+03', '2026-06-11 02:26:37.435+03', NULL);
INSERT INTO public.region_country VALUES ('bt', 'btn', '064', 'BHUTAN', 'Bhutan', NULL, NULL, '2026-06-11 02:26:37.435+03', '2026-06-11 02:26:37.435+03', NULL);
INSERT INTO public.region_country VALUES ('bo', 'bol', '068', 'BOLIVIA', 'Bolivia', NULL, NULL, '2026-06-11 02:26:37.435+03', '2026-06-11 02:26:37.435+03', NULL);
INSERT INTO public.region_country VALUES ('bq', 'bes', '535', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', NULL, NULL, '2026-06-11 02:26:37.435+03', '2026-06-11 02:26:37.435+03', NULL);
INSERT INTO public.region_country VALUES ('ba', 'bih', '070', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', NULL, NULL, '2026-06-11 02:26:37.435+03', '2026-06-11 02:26:37.435+03', NULL);
INSERT INTO public.region_country VALUES ('bw', 'bwa', '072', 'BOTSWANA', 'Botswana', NULL, NULL, '2026-06-11 02:26:37.435+03', '2026-06-11 02:26:37.435+03', NULL);
INSERT INTO public.region_country VALUES ('bv', 'bvd', '074', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, '2026-06-11 02:26:37.435+03', '2026-06-11 02:26:37.435+03', NULL);
INSERT INTO public.region_country VALUES ('br', 'bra', '076', 'BRAZIL', 'Brazil', NULL, NULL, '2026-06-11 02:26:37.435+03', '2026-06-11 02:26:37.435+03', NULL);
INSERT INTO public.region_country VALUES ('io', 'iot', '086', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, '2026-06-11 02:26:37.436+03', '2026-06-11 02:26:37.436+03', NULL);
INSERT INTO public.region_country VALUES ('bn', 'brn', '096', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', NULL, NULL, '2026-06-11 02:26:37.436+03', '2026-06-11 02:26:37.436+03', NULL);
INSERT INTO public.region_country VALUES ('bg', 'bgr', '100', 'BULGARIA', 'Bulgaria', NULL, NULL, '2026-06-11 02:26:37.436+03', '2026-06-11 02:26:37.436+03', NULL);
INSERT INTO public.region_country VALUES ('bf', 'bfa', '854', 'BURKINA FASO', 'Burkina Faso', NULL, NULL, '2026-06-11 02:26:37.436+03', '2026-06-11 02:26:37.436+03', NULL);
INSERT INTO public.region_country VALUES ('bi', 'bdi', '108', 'BURUNDI', 'Burundi', NULL, NULL, '2026-06-11 02:26:37.436+03', '2026-06-11 02:26:37.436+03', NULL);
INSERT INTO public.region_country VALUES ('kh', 'khm', '116', 'CAMBODIA', 'Cambodia', NULL, NULL, '2026-06-11 02:26:37.436+03', '2026-06-11 02:26:37.436+03', NULL);
INSERT INTO public.region_country VALUES ('cm', 'cmr', '120', 'CAMEROON', 'Cameroon', NULL, NULL, '2026-06-11 02:26:37.436+03', '2026-06-11 02:26:37.436+03', NULL);
INSERT INTO public.region_country VALUES ('ca', 'can', '124', 'CANADA', 'Canada', NULL, NULL, '2026-06-11 02:26:37.436+03', '2026-06-11 02:26:37.436+03', NULL);
INSERT INTO public.region_country VALUES ('cv', 'cpv', '132', 'CAPE VERDE', 'Cape Verde', NULL, NULL, '2026-06-11 02:26:37.436+03', '2026-06-11 02:26:37.436+03', NULL);
INSERT INTO public.region_country VALUES ('ky', 'cym', '136', 'CAYMAN ISLANDS', 'Cayman Islands', NULL, NULL, '2026-06-11 02:26:37.436+03', '2026-06-11 02:26:37.436+03', NULL);
INSERT INTO public.region_country VALUES ('cf', 'caf', '140', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', NULL, NULL, '2026-06-11 02:26:37.436+03', '2026-06-11 02:26:37.436+03', NULL);
INSERT INTO public.region_country VALUES ('td', 'tcd', '148', 'CHAD', 'Chad', NULL, NULL, '2026-06-11 02:26:37.436+03', '2026-06-11 02:26:37.436+03', NULL);
INSERT INTO public.region_country VALUES ('cl', 'chl', '152', 'CHILE', 'Chile', NULL, NULL, '2026-06-11 02:26:37.436+03', '2026-06-11 02:26:37.436+03', NULL);
INSERT INTO public.region_country VALUES ('cn', 'chn', '156', 'CHINA', 'China', NULL, NULL, '2026-06-11 02:26:37.436+03', '2026-06-11 02:26:37.436+03', NULL);
INSERT INTO public.region_country VALUES ('cx', 'cxr', '162', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, '2026-06-11 02:26:37.436+03', '2026-06-11 02:26:37.436+03', NULL);
INSERT INTO public.region_country VALUES ('cc', 'cck', '166', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, '2026-06-11 02:26:37.437+03', '2026-06-11 02:26:37.437+03', NULL);
INSERT INTO public.region_country VALUES ('co', 'col', '170', 'COLOMBIA', 'Colombia', NULL, NULL, '2026-06-11 02:26:37.437+03', '2026-06-11 02:26:37.437+03', NULL);
INSERT INTO public.region_country VALUES ('km', 'com', '174', 'COMOROS', 'Comoros', NULL, NULL, '2026-06-11 02:26:37.437+03', '2026-06-11 02:26:37.437+03', NULL);
INSERT INTO public.region_country VALUES ('cg', 'cog', '178', 'CONGO', 'Congo', NULL, NULL, '2026-06-11 02:26:37.437+03', '2026-06-11 02:26:37.437+03', NULL);
INSERT INTO public.region_country VALUES ('cd', 'cod', '180', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', NULL, NULL, '2026-06-11 02:26:37.437+03', '2026-06-11 02:26:37.437+03', NULL);
INSERT INTO public.region_country VALUES ('ck', 'cok', '184', 'COOK ISLANDS', 'Cook Islands', NULL, NULL, '2026-06-11 02:26:37.437+03', '2026-06-11 02:26:37.437+03', NULL);
INSERT INTO public.region_country VALUES ('cr', 'cri', '188', 'COSTA RICA', 'Costa Rica', NULL, NULL, '2026-06-11 02:26:37.437+03', '2026-06-11 02:26:37.437+03', NULL);
INSERT INTO public.region_country VALUES ('ci', 'civ', '384', 'COTE D''IVOIRE', 'Cote D''Ivoire', NULL, NULL, '2026-06-11 02:26:37.437+03', '2026-06-11 02:26:37.437+03', NULL);
INSERT INTO public.region_country VALUES ('hr', 'hrv', '191', 'CROATIA', 'Croatia', NULL, NULL, '2026-06-11 02:26:37.437+03', '2026-06-11 02:26:37.437+03', NULL);
INSERT INTO public.region_country VALUES ('cu', 'cub', '192', 'CUBA', 'Cuba', NULL, NULL, '2026-06-11 02:26:37.437+03', '2026-06-11 02:26:37.437+03', NULL);
INSERT INTO public.region_country VALUES ('cw', 'cuw', '531', 'CURAÇAO', 'Curaçao', NULL, NULL, '2026-06-11 02:26:37.437+03', '2026-06-11 02:26:37.437+03', NULL);
INSERT INTO public.region_country VALUES ('cy', 'cyp', '196', 'CYPRUS', 'Cyprus', NULL, NULL, '2026-06-11 02:26:37.437+03', '2026-06-11 02:26:37.437+03', NULL);
INSERT INTO public.region_country VALUES ('cz', 'cze', '203', 'CZECH REPUBLIC', 'Czech Republic', NULL, NULL, '2026-06-11 02:26:37.438+03', '2026-06-11 02:26:37.438+03', NULL);
INSERT INTO public.region_country VALUES ('dj', 'dji', '262', 'DJIBOUTI', 'Djibouti', NULL, NULL, '2026-06-11 02:26:37.438+03', '2026-06-11 02:26:37.438+03', NULL);
INSERT INTO public.region_country VALUES ('dm', 'dma', '212', 'DOMINICA', 'Dominica', NULL, NULL, '2026-06-11 02:26:37.438+03', '2026-06-11 02:26:37.438+03', NULL);
INSERT INTO public.region_country VALUES ('do', 'dom', '214', 'DOMINICAN REPUBLIC', 'Dominican Republic', NULL, NULL, '2026-06-11 02:26:37.438+03', '2026-06-11 02:26:37.438+03', NULL);
INSERT INTO public.region_country VALUES ('ec', 'ecu', '218', 'ECUADOR', 'Ecuador', NULL, NULL, '2026-06-11 02:26:37.438+03', '2026-06-11 02:26:37.438+03', NULL);
INSERT INTO public.region_country VALUES ('eg', 'egy', '818', 'EGYPT', 'Egypt', NULL, NULL, '2026-06-11 02:26:37.438+03', '2026-06-11 02:26:37.438+03', NULL);
INSERT INTO public.region_country VALUES ('sv', 'slv', '222', 'EL SALVADOR', 'El Salvador', NULL, NULL, '2026-06-11 02:26:37.438+03', '2026-06-11 02:26:37.438+03', NULL);
INSERT INTO public.region_country VALUES ('gq', 'gnq', '226', 'EQUATORIAL GUINEA', 'Equatorial Guinea', NULL, NULL, '2026-06-11 02:26:37.438+03', '2026-06-11 02:26:37.438+03', NULL);
INSERT INTO public.region_country VALUES ('er', 'eri', '232', 'ERITREA', 'Eritrea', NULL, NULL, '2026-06-11 02:26:37.438+03', '2026-06-11 02:26:37.438+03', NULL);
INSERT INTO public.region_country VALUES ('ee', 'est', '233', 'ESTONIA', 'Estonia', NULL, NULL, '2026-06-11 02:26:37.438+03', '2026-06-11 02:26:37.438+03', NULL);
INSERT INTO public.region_country VALUES ('et', 'eth', '231', 'ETHIOPIA', 'Ethiopia', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('fk', 'flk', '238', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('fo', 'fro', '234', 'FAROE ISLANDS', 'Faroe Islands', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('fj', 'fji', '242', 'FIJI', 'Fiji', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('fi', 'fin', '246', 'FINLAND', 'Finland', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('gf', 'guf', '254', 'FRENCH GUIANA', 'French Guiana', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('pf', 'pyf', '258', 'FRENCH POLYNESIA', 'French Polynesia', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('tf', 'atf', '260', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('ga', 'gab', '266', 'GABON', 'Gabon', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('gm', 'gmb', '270', 'GAMBIA', 'Gambia', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('ge', 'geo', '268', 'GEORGIA', 'Georgia', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('gh', 'gha', '288', 'GHANA', 'Ghana', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('gi', 'gib', '292', 'GIBRALTAR', 'Gibraltar', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('gr', 'grc', '300', 'GREECE', 'Greece', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('gl', 'grl', '304', 'GREENLAND', 'Greenland', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('gd', 'grd', '308', 'GRENADA', 'Grenada', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('gp', 'glp', '312', 'GUADELOUPE', 'Guadeloupe', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('gu', 'gum', '316', 'GUAM', 'Guam', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('gt', 'gtm', '320', 'GUATEMALA', 'Guatemala', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('gg', 'ggy', '831', 'GUERNSEY', 'Guernsey', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('gn', 'gin', '324', 'GUINEA', 'Guinea', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('gw', 'gnb', '624', 'GUINEA-BISSAU', 'Guinea-Bissau', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('gy', 'guy', '328', 'GUYANA', 'Guyana', NULL, NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:37.439+03', NULL);
INSERT INTO public.region_country VALUES ('ht', 'hti', '332', 'HAITI', 'Haiti', NULL, NULL, '2026-06-11 02:26:37.44+03', '2026-06-11 02:26:37.44+03', NULL);
INSERT INTO public.region_country VALUES ('hm', 'hmd', '334', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island And Mcdonald Islands', NULL, NULL, '2026-06-11 02:26:37.44+03', '2026-06-11 02:26:37.44+03', NULL);
INSERT INTO public.region_country VALUES ('va', 'vat', '336', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', NULL, NULL, '2026-06-11 02:26:37.44+03', '2026-06-11 02:26:37.44+03', NULL);
INSERT INTO public.region_country VALUES ('hn', 'hnd', '340', 'HONDURAS', 'Honduras', NULL, NULL, '2026-06-11 02:26:37.44+03', '2026-06-11 02:26:37.44+03', NULL);
INSERT INTO public.region_country VALUES ('hk', 'hkg', '344', 'HONG KONG', 'Hong Kong', NULL, NULL, '2026-06-11 02:26:37.44+03', '2026-06-11 02:26:37.44+03', NULL);
INSERT INTO public.region_country VALUES ('hu', 'hun', '348', 'HUNGARY', 'Hungary', NULL, NULL, '2026-06-11 02:26:37.44+03', '2026-06-11 02:26:37.44+03', NULL);
INSERT INTO public.region_country VALUES ('is', 'isl', '352', 'ICELAND', 'Iceland', NULL, NULL, '2026-06-11 02:26:37.44+03', '2026-06-11 02:26:37.44+03', NULL);
INSERT INTO public.region_country VALUES ('in', 'ind', '356', 'INDIA', 'India', NULL, NULL, '2026-06-11 02:26:37.44+03', '2026-06-11 02:26:37.44+03', NULL);
INSERT INTO public.region_country VALUES ('id', 'idn', '360', 'INDONESIA', 'Indonesia', NULL, NULL, '2026-06-11 02:26:37.44+03', '2026-06-11 02:26:37.44+03', NULL);
INSERT INTO public.region_country VALUES ('ir', 'irn', '364', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', NULL, NULL, '2026-06-11 02:26:37.44+03', '2026-06-11 02:26:37.44+03', NULL);
INSERT INTO public.region_country VALUES ('iq', 'irq', '368', 'IRAQ', 'Iraq', NULL, NULL, '2026-06-11 02:26:37.44+03', '2026-06-11 02:26:37.44+03', NULL);
INSERT INTO public.region_country VALUES ('ie', 'irl', '372', 'IRELAND', 'Ireland', NULL, NULL, '2026-06-11 02:26:37.44+03', '2026-06-11 02:26:37.44+03', NULL);
INSERT INTO public.region_country VALUES ('im', 'imn', '833', 'ISLE OF MAN', 'Isle Of Man', NULL, NULL, '2026-06-11 02:26:37.44+03', '2026-06-11 02:26:37.44+03', NULL);
INSERT INTO public.region_country VALUES ('il', 'isr', '376', 'ISRAEL', 'Israel', NULL, NULL, '2026-06-11 02:26:37.44+03', '2026-06-11 02:26:37.44+03', NULL);
INSERT INTO public.region_country VALUES ('jm', 'jam', '388', 'JAMAICA', 'Jamaica', NULL, NULL, '2026-06-11 02:26:37.44+03', '2026-06-11 02:26:37.44+03', NULL);
INSERT INTO public.region_country VALUES ('jp', 'jpn', '392', 'JAPAN', 'Japan', NULL, NULL, '2026-06-11 02:26:37.44+03', '2026-06-11 02:26:37.44+03', NULL);
INSERT INTO public.region_country VALUES ('je', 'jey', '832', 'JERSEY', 'Jersey', NULL, NULL, '2026-06-11 02:26:37.44+03', '2026-06-11 02:26:37.44+03', NULL);
INSERT INTO public.region_country VALUES ('jo', 'jor', '400', 'JORDAN', 'Jordan', NULL, NULL, '2026-06-11 02:26:37.441+03', '2026-06-11 02:26:37.441+03', NULL);
INSERT INTO public.region_country VALUES ('kz', 'kaz', '398', 'KAZAKHSTAN', 'Kazakhstan', NULL, NULL, '2026-06-11 02:26:37.441+03', '2026-06-11 02:26:37.441+03', NULL);
INSERT INTO public.region_country VALUES ('ke', 'ken', '404', 'KENYA', 'Kenya', NULL, NULL, '2026-06-11 02:26:37.441+03', '2026-06-11 02:26:37.441+03', NULL);
INSERT INTO public.region_country VALUES ('ki', 'kir', '296', 'KIRIBATI', 'Kiribati', NULL, NULL, '2026-06-11 02:26:37.441+03', '2026-06-11 02:26:37.441+03', NULL);
INSERT INTO public.region_country VALUES ('kp', 'prk', '408', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', NULL, NULL, '2026-06-11 02:26:37.441+03', '2026-06-11 02:26:37.441+03', NULL);
INSERT INTO public.region_country VALUES ('kr', 'kor', '410', 'KOREA, REPUBLIC OF', 'Korea, Republic of', NULL, NULL, '2026-06-11 02:26:37.441+03', '2026-06-11 02:26:37.441+03', NULL);
INSERT INTO public.region_country VALUES ('xk', 'xkx', '900', 'KOSOVO', 'Kosovo', NULL, NULL, '2026-06-11 02:26:37.441+03', '2026-06-11 02:26:37.441+03', NULL);
INSERT INTO public.region_country VALUES ('kw', 'kwt', '414', 'KUWAIT', 'Kuwait', NULL, NULL, '2026-06-11 02:26:37.441+03', '2026-06-11 02:26:37.441+03', NULL);
INSERT INTO public.region_country VALUES ('kg', 'kgz', '417', 'KYRGYZSTAN', 'Kyrgyzstan', NULL, NULL, '2026-06-11 02:26:37.441+03', '2026-06-11 02:26:37.441+03', NULL);
INSERT INTO public.region_country VALUES ('la', 'lao', '418', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', NULL, NULL, '2026-06-11 02:26:37.441+03', '2026-06-11 02:26:37.441+03', NULL);
INSERT INTO public.region_country VALUES ('lv', 'lva', '428', 'LATVIA', 'Latvia', NULL, NULL, '2026-06-11 02:26:37.441+03', '2026-06-11 02:26:37.441+03', NULL);
INSERT INTO public.region_country VALUES ('lb', 'lbn', '422', 'LEBANON', 'Lebanon', NULL, NULL, '2026-06-11 02:26:37.441+03', '2026-06-11 02:26:37.441+03', NULL);
INSERT INTO public.region_country VALUES ('ls', 'lso', '426', 'LESOTHO', 'Lesotho', NULL, NULL, '2026-06-11 02:26:37.441+03', '2026-06-11 02:26:37.441+03', NULL);
INSERT INTO public.region_country VALUES ('lr', 'lbr', '430', 'LIBERIA', 'Liberia', NULL, NULL, '2026-06-11 02:26:37.442+03', '2026-06-11 02:26:37.442+03', NULL);
INSERT INTO public.region_country VALUES ('ly', 'lby', '434', 'LIBYA', 'Libya', NULL, NULL, '2026-06-11 02:26:37.442+03', '2026-06-11 02:26:37.442+03', NULL);
INSERT INTO public.region_country VALUES ('li', 'lie', '438', 'LIECHTENSTEIN', 'Liechtenstein', NULL, NULL, '2026-06-11 02:26:37.442+03', '2026-06-11 02:26:37.442+03', NULL);
INSERT INTO public.region_country VALUES ('lt', 'ltu', '440', 'LITHUANIA', 'Lithuania', NULL, NULL, '2026-06-11 02:26:37.442+03', '2026-06-11 02:26:37.442+03', NULL);
INSERT INTO public.region_country VALUES ('lu', 'lux', '442', 'LUXEMBOURG', 'Luxembourg', NULL, NULL, '2026-06-11 02:26:37.442+03', '2026-06-11 02:26:37.443+03', NULL);
INSERT INTO public.region_country VALUES ('mo', 'mac', '446', 'MACAO', 'Macao', NULL, NULL, '2026-06-11 02:26:37.443+03', '2026-06-11 02:26:37.443+03', NULL);
INSERT INTO public.region_country VALUES ('mg', 'mdg', '450', 'MADAGASCAR', 'Madagascar', NULL, NULL, '2026-06-11 02:26:37.443+03', '2026-06-11 02:26:37.443+03', NULL);
INSERT INTO public.region_country VALUES ('mw', 'mwi', '454', 'MALAWI', 'Malawi', NULL, NULL, '2026-06-11 02:26:37.443+03', '2026-06-11 02:26:37.443+03', NULL);
INSERT INTO public.region_country VALUES ('my', 'mys', '458', 'MALAYSIA', 'Malaysia', NULL, NULL, '2026-06-11 02:26:37.443+03', '2026-06-11 02:26:37.443+03', NULL);
INSERT INTO public.region_country VALUES ('mv', 'mdv', '462', 'MALDIVES', 'Maldives', NULL, NULL, '2026-06-11 02:26:37.443+03', '2026-06-11 02:26:37.443+03', NULL);
INSERT INTO public.region_country VALUES ('ml', 'mli', '466', 'MALI', 'Mali', NULL, NULL, '2026-06-11 02:26:37.444+03', '2026-06-11 02:26:37.444+03', NULL);
INSERT INTO public.region_country VALUES ('mt', 'mlt', '470', 'MALTA', 'Malta', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('mh', 'mhl', '584', 'MARSHALL ISLANDS', 'Marshall Islands', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('mq', 'mtq', '474', 'MARTINIQUE', 'Martinique', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('mr', 'mrt', '478', 'MAURITANIA', 'Mauritania', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('mu', 'mus', '480', 'MAURITIUS', 'Mauritius', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('yt', 'myt', '175', 'MAYOTTE', 'Mayotte', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('mx', 'mex', '484', 'MEXICO', 'Mexico', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('fm', 'fsm', '583', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('md', 'mda', '498', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('mc', 'mco', '492', 'MONACO', 'Monaco', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('mn', 'mng', '496', 'MONGOLIA', 'Mongolia', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('me', 'mne', '499', 'MONTENEGRO', 'Montenegro', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('ms', 'msr', '500', 'MONTSERRAT', 'Montserrat', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('ma', 'mar', '504', 'MOROCCO', 'Morocco', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('mz', 'moz', '508', 'MOZAMBIQUE', 'Mozambique', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('mm', 'mmr', '104', 'MYANMAR', 'Myanmar', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('na', 'nam', '516', 'NAMIBIA', 'Namibia', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('nr', 'nru', '520', 'NAURU', 'Nauru', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('np', 'npl', '524', 'NEPAL', 'Nepal', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('nl', 'nld', '528', 'NETHERLANDS', 'Netherlands', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('nc', 'ncl', '540', 'NEW CALEDONIA', 'New Caledonia', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('nz', 'nzl', '554', 'NEW ZEALAND', 'New Zealand', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('ni', 'nic', '558', 'NICARAGUA', 'Nicaragua', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('ne', 'ner', '562', 'NIGER', 'Niger', NULL, NULL, '2026-06-11 02:26:37.445+03', '2026-06-11 02:26:37.445+03', NULL);
INSERT INTO public.region_country VALUES ('ng', 'nga', '566', 'NIGERIA', 'Nigeria', NULL, NULL, '2026-06-11 02:26:37.446+03', '2026-06-11 02:26:37.446+03', NULL);
INSERT INTO public.region_country VALUES ('nu', 'niu', '570', 'NIUE', 'Niue', NULL, NULL, '2026-06-11 02:26:37.446+03', '2026-06-11 02:26:37.446+03', NULL);
INSERT INTO public.region_country VALUES ('nf', 'nfk', '574', 'NORFOLK ISLAND', 'Norfolk Island', NULL, NULL, '2026-06-11 02:26:37.446+03', '2026-06-11 02:26:37.446+03', NULL);
INSERT INTO public.region_country VALUES ('mk', 'mkd', '807', 'NORTH MACEDONIA', 'North Macedonia', NULL, NULL, '2026-06-11 02:26:37.446+03', '2026-06-11 02:26:37.446+03', NULL);
INSERT INTO public.region_country VALUES ('mp', 'mnp', '580', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', NULL, NULL, '2026-06-11 02:26:37.446+03', '2026-06-11 02:26:37.446+03', NULL);
INSERT INTO public.region_country VALUES ('no', 'nor', '578', 'NORWAY', 'Norway', NULL, NULL, '2026-06-11 02:26:37.446+03', '2026-06-11 02:26:37.446+03', NULL);
INSERT INTO public.region_country VALUES ('om', 'omn', '512', 'OMAN', 'Oman', NULL, NULL, '2026-06-11 02:26:37.446+03', '2026-06-11 02:26:37.446+03', NULL);
INSERT INTO public.region_country VALUES ('pk', 'pak', '586', 'PAKISTAN', 'Pakistan', NULL, NULL, '2026-06-11 02:26:37.446+03', '2026-06-11 02:26:37.446+03', NULL);
INSERT INTO public.region_country VALUES ('pw', 'plw', '585', 'PALAU', 'Palau', NULL, NULL, '2026-06-11 02:26:37.446+03', '2026-06-11 02:26:37.446+03', NULL);
INSERT INTO public.region_country VALUES ('ps', 'pse', '275', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, '2026-06-11 02:26:37.446+03', '2026-06-11 02:26:37.446+03', NULL);
INSERT INTO public.region_country VALUES ('pa', 'pan', '591', 'PANAMA', 'Panama', NULL, NULL, '2026-06-11 02:26:37.446+03', '2026-06-11 02:26:37.446+03', NULL);
INSERT INTO public.region_country VALUES ('pg', 'png', '598', 'PAPUA NEW GUINEA', 'Papua New Guinea', NULL, NULL, '2026-06-11 02:26:37.446+03', '2026-06-11 02:26:37.446+03', NULL);
INSERT INTO public.region_country VALUES ('py', 'pry', '600', 'PARAGUAY', 'Paraguay', NULL, NULL, '2026-06-11 02:26:37.446+03', '2026-06-11 02:26:37.446+03', NULL);
INSERT INTO public.region_country VALUES ('pe', 'per', '604', 'PERU', 'Peru', NULL, NULL, '2026-06-11 02:26:37.446+03', '2026-06-11 02:26:37.446+03', NULL);
INSERT INTO public.region_country VALUES ('ph', 'phl', '608', 'PHILIPPINES', 'Philippines', NULL, NULL, '2026-06-11 02:26:37.446+03', '2026-06-11 02:26:37.446+03', NULL);
INSERT INTO public.region_country VALUES ('pn', 'pcn', '612', 'PITCAIRN', 'Pitcairn', NULL, NULL, '2026-06-11 02:26:37.447+03', '2026-06-11 02:26:37.447+03', NULL);
INSERT INTO public.region_country VALUES ('pl', 'pol', '616', 'POLAND', 'Poland', NULL, NULL, '2026-06-11 02:26:37.447+03', '2026-06-11 02:26:37.447+03', NULL);
INSERT INTO public.region_country VALUES ('pt', 'prt', '620', 'PORTUGAL', 'Portugal', NULL, NULL, '2026-06-11 02:26:37.447+03', '2026-06-11 02:26:37.447+03', NULL);
INSERT INTO public.region_country VALUES ('pr', 'pri', '630', 'PUERTO RICO', 'Puerto Rico', NULL, NULL, '2026-06-11 02:26:37.447+03', '2026-06-11 02:26:37.447+03', NULL);
INSERT INTO public.region_country VALUES ('qa', 'qat', '634', 'QATAR', 'Qatar', NULL, NULL, '2026-06-11 02:26:37.447+03', '2026-06-11 02:26:37.447+03', NULL);
INSERT INTO public.region_country VALUES ('re', 'reu', '638', 'REUNION', 'Reunion', NULL, NULL, '2026-06-11 02:26:37.447+03', '2026-06-11 02:26:37.447+03', NULL);
INSERT INTO public.region_country VALUES ('ro', 'rom', '642', 'ROMANIA', 'Romania', NULL, NULL, '2026-06-11 02:26:37.447+03', '2026-06-11 02:26:37.447+03', NULL);
INSERT INTO public.region_country VALUES ('ru', 'rus', '643', 'RUSSIAN FEDERATION', 'Russian Federation', NULL, NULL, '2026-06-11 02:26:37.447+03', '2026-06-11 02:26:37.447+03', NULL);
INSERT INTO public.region_country VALUES ('rw', 'rwa', '646', 'RWANDA', 'Rwanda', NULL, NULL, '2026-06-11 02:26:37.447+03', '2026-06-11 02:26:37.447+03', NULL);
INSERT INTO public.region_country VALUES ('bl', 'blm', '652', 'SAINT BARTHÉLEMY', 'Saint Barthélemy', NULL, NULL, '2026-06-11 02:26:37.447+03', '2026-06-11 02:26:37.447+03', NULL);
INSERT INTO public.region_country VALUES ('sh', 'shn', '654', 'SAINT HELENA', 'Saint Helena', NULL, NULL, '2026-06-11 02:26:37.447+03', '2026-06-11 02:26:37.447+03', NULL);
INSERT INTO public.region_country VALUES ('kn', 'kna', '659', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', NULL, NULL, '2026-06-11 02:26:37.447+03', '2026-06-11 02:26:37.447+03', NULL);
INSERT INTO public.region_country VALUES ('lc', 'lca', '662', 'SAINT LUCIA', 'Saint Lucia', NULL, NULL, '2026-06-11 02:26:37.447+03', '2026-06-11 02:26:37.447+03', NULL);
INSERT INTO public.region_country VALUES ('mf', 'maf', '663', 'SAINT MARTIN (FRENCH PART)', 'Saint Martin (French part)', NULL, NULL, '2026-06-11 02:26:37.447+03', '2026-06-11 02:26:37.447+03', NULL);
INSERT INTO public.region_country VALUES ('pm', 'spm', '666', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', NULL, NULL, '2026-06-11 02:26:37.447+03', '2026-06-11 02:26:37.447+03', NULL);
INSERT INTO public.region_country VALUES ('vc', 'vct', '670', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', NULL, NULL, '2026-06-11 02:26:37.447+03', '2026-06-11 02:26:37.447+03', NULL);
INSERT INTO public.region_country VALUES ('ws', 'wsm', '882', 'SAMOA', 'Samoa', NULL, NULL, '2026-06-11 02:26:37.448+03', '2026-06-11 02:26:37.448+03', NULL);
INSERT INTO public.region_country VALUES ('sm', 'smr', '674', 'SAN MARINO', 'San Marino', NULL, NULL, '2026-06-11 02:26:37.448+03', '2026-06-11 02:26:37.448+03', NULL);
INSERT INTO public.region_country VALUES ('st', 'stp', '678', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', NULL, NULL, '2026-06-11 02:26:37.448+03', '2026-06-11 02:26:37.448+03', NULL);
INSERT INTO public.region_country VALUES ('sa', 'sau', '682', 'SAUDI ARABIA', 'Saudi Arabia', NULL, NULL, '2026-06-11 02:26:37.448+03', '2026-06-11 02:26:37.448+03', NULL);
INSERT INTO public.region_country VALUES ('sn', 'sen', '686', 'SENEGAL', 'Senegal', NULL, NULL, '2026-06-11 02:26:37.448+03', '2026-06-11 02:26:37.448+03', NULL);
INSERT INTO public.region_country VALUES ('rs', 'srb', '688', 'SERBIA', 'Serbia', NULL, NULL, '2026-06-11 02:26:37.448+03', '2026-06-11 02:26:37.448+03', NULL);
INSERT INTO public.region_country VALUES ('sc', 'syc', '690', 'SEYCHELLES', 'Seychelles', NULL, NULL, '2026-06-11 02:26:37.448+03', '2026-06-11 02:26:37.448+03', NULL);
INSERT INTO public.region_country VALUES ('sl', 'sle', '694', 'SIERRA LEONE', 'Sierra Leone', NULL, NULL, '2026-06-11 02:26:37.448+03', '2026-06-11 02:26:37.448+03', NULL);
INSERT INTO public.region_country VALUES ('sg', 'sgp', '702', 'SINGAPORE', 'Singapore', NULL, NULL, '2026-06-11 02:26:37.448+03', '2026-06-11 02:26:37.448+03', NULL);
INSERT INTO public.region_country VALUES ('sx', 'sxm', '534', 'SINT MAARTEN', 'Sint Maarten', NULL, NULL, '2026-06-11 02:26:37.449+03', '2026-06-11 02:26:37.449+03', NULL);
INSERT INTO public.region_country VALUES ('sk', 'svk', '703', 'SLOVAKIA', 'Slovakia', NULL, NULL, '2026-06-11 02:26:37.449+03', '2026-06-11 02:26:37.449+03', NULL);
INSERT INTO public.region_country VALUES ('si', 'svn', '705', 'SLOVENIA', 'Slovenia', NULL, NULL, '2026-06-11 02:26:37.449+03', '2026-06-11 02:26:37.449+03', NULL);
INSERT INTO public.region_country VALUES ('sb', 'slb', '090', 'SOLOMON ISLANDS', 'Solomon Islands', NULL, NULL, '2026-06-11 02:26:37.449+03', '2026-06-11 02:26:37.449+03', NULL);
INSERT INTO public.region_country VALUES ('so', 'som', '706', 'SOMALIA', 'Somalia', NULL, NULL, '2026-06-11 02:26:37.449+03', '2026-06-11 02:26:37.449+03', NULL);
INSERT INTO public.region_country VALUES ('za', 'zaf', '710', 'SOUTH AFRICA', 'South Africa', NULL, NULL, '2026-06-11 02:26:37.45+03', '2026-06-11 02:26:37.45+03', NULL);
INSERT INTO public.region_country VALUES ('gs', 'sgs', '239', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, '2026-06-11 02:26:37.45+03', '2026-06-11 02:26:37.45+03', NULL);
INSERT INTO public.region_country VALUES ('ss', 'ssd', '728', 'SOUTH SUDAN', 'South Sudan', NULL, NULL, '2026-06-11 02:26:37.45+03', '2026-06-11 02:26:37.45+03', NULL);
INSERT INTO public.region_country VALUES ('lk', 'lka', '144', 'SRI LANKA', 'Sri Lanka', NULL, NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);
INSERT INTO public.region_country VALUES ('sd', 'sdn', '729', 'SUDAN', 'Sudan', NULL, NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);
INSERT INTO public.region_country VALUES ('sr', 'sur', '740', 'SURINAME', 'Suriname', NULL, NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);
INSERT INTO public.region_country VALUES ('sj', 'sjm', '744', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', NULL, NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);
INSERT INTO public.region_country VALUES ('sz', 'swz', '748', 'SWAZILAND', 'Swaziland', NULL, NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);
INSERT INTO public.region_country VALUES ('ch', 'che', '756', 'SWITZERLAND', 'Switzerland', NULL, NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);
INSERT INTO public.region_country VALUES ('sy', 'syr', '760', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', NULL, NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);
INSERT INTO public.region_country VALUES ('tw', 'twn', '158', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', NULL, NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);
INSERT INTO public.region_country VALUES ('tj', 'tjk', '762', 'TAJIKISTAN', 'Tajikistan', NULL, NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);
INSERT INTO public.region_country VALUES ('tz', 'tza', '834', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', NULL, NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);
INSERT INTO public.region_country VALUES ('th', 'tha', '764', 'THAILAND', 'Thailand', NULL, NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);
INSERT INTO public.region_country VALUES ('tl', 'tls', '626', 'TIMOR LESTE', 'Timor Leste', NULL, NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);
INSERT INTO public.region_country VALUES ('tg', 'tgo', '768', 'TOGO', 'Togo', NULL, NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);
INSERT INTO public.region_country VALUES ('tk', 'tkl', '772', 'TOKELAU', 'Tokelau', NULL, NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);
INSERT INTO public.region_country VALUES ('to', 'ton', '776', 'TONGA', 'Tonga', NULL, NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);
INSERT INTO public.region_country VALUES ('tt', 'tto', '780', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', NULL, NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);
INSERT INTO public.region_country VALUES ('tn', 'tun', '788', 'TUNISIA', 'Tunisia', NULL, NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);
INSERT INTO public.region_country VALUES ('tm', 'tkm', '795', 'TURKMENISTAN', 'Turkmenistan', NULL, NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);
INSERT INTO public.region_country VALUES ('tc', 'tca', '796', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('tv', 'tuv', '798', 'TUVALU', 'Tuvalu', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('ug', 'uga', '800', 'UGANDA', 'Uganda', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('ua', 'ukr', '804', 'UKRAINE', 'Ukraine', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('ae', 'are', '784', 'UNITED ARAB EMIRATES', 'United Arab Emirates', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('us', 'usa', '840', 'UNITED STATES', 'United States', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('um', 'umi', '581', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('uy', 'ury', '858', 'URUGUAY', 'Uruguay', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('uz', 'uzb', '860', 'UZBEKISTAN', 'Uzbekistan', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('vu', 'vut', '548', 'VANUATU', 'Vanuatu', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('ve', 'ven', '862', 'VENEZUELA', 'Venezuela', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('vn', 'vnm', '704', 'VIET NAM', 'Viet Nam', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('vg', 'vgb', '092', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('vi', 'vir', '850', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.S.', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('wf', 'wlf', '876', 'WALLIS AND FUTUNA', 'Wallis and Futuna', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('eh', 'esh', '732', 'WESTERN SAHARA', 'Western Sahara', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('ye', 'yem', '887', 'YEMEN', 'Yemen', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('zm', 'zmb', '894', 'ZAMBIA', 'Zambia', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('zw', 'zwe', '716', 'ZIMBABWE', 'Zimbabwe', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('ax', 'ala', '248', 'ÅLAND ISLANDS', 'Åland Islands', NULL, NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:37.452+03', NULL);
INSERT INTO public.region_country VALUES ('dk', 'dnk', '208', 'DENMARK', 'Denmark', 'reg_01KTSXRAKEE634P20BK48VVW24', NULL, '2026-06-11 02:26:37.438+03', '2026-06-11 02:26:51.025+03', NULL);
INSERT INTO public.region_country VALUES ('fr', 'fra', '250', 'FRANCE', 'France', 'reg_01KTSXRAKEE634P20BK48VVW24', NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:51.025+03', NULL);
INSERT INTO public.region_country VALUES ('de', 'deu', '276', 'GERMANY', 'Germany', 'reg_01KTSXRAKEE634P20BK48VVW24', NULL, '2026-06-11 02:26:37.439+03', '2026-06-11 02:26:51.024+03', NULL);
INSERT INTO public.region_country VALUES ('it', 'ita', '380', 'ITALY', 'Italy', 'reg_01KTSXRAKEE634P20BK48VVW24', NULL, '2026-06-11 02:26:37.44+03', '2026-06-11 02:26:51.026+03', NULL);
INSERT INTO public.region_country VALUES ('es', 'esp', '724', 'SPAIN', 'Spain', 'reg_01KTSXRAKEE634P20BK48VVW24', NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:51.025+03', NULL);
INSERT INTO public.region_country VALUES ('se', 'swe', '752', 'SWEDEN', 'Sweden', 'reg_01KTSXRAKEE634P20BK48VVW24', NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:51.026+03', NULL);
INSERT INTO public.region_country VALUES ('gb', 'gbr', '826', 'UNITED KINGDOM', 'United Kingdom', 'reg_01KTSXRAKEE634P20BK48VVW24', NULL, '2026-06-11 02:26:37.452+03', '2026-06-11 02:26:51.025+03', NULL);
INSERT INTO public.region_country VALUES ('tr', 'tur', '792', 'TURKEY', 'Turkey', 'reg_tr', NULL, '2026-06-11 02:26:37.451+03', '2026-06-11 02:26:37.451+03', NULL);


--
-- Data for Name: region_payment_provider; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.region_payment_provider VALUES ('reg_01KTSXRAKEE634P20BK48VVW24', 'pp_system_default', 'regpp_01KTSXRAQHXXD6CMPWHV4S6626', '2026-06-11 02:26:51.119313+03', '2026-06-11 02:26:51.119313+03', NULL);


--
-- Data for Name: reservation_item; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.reservation_item VALUES ('resitem_01KTWRRG6215G154TD9KHQR4PZ', '2026-06-12 04:57:17.134+03', '2026-06-12 04:57:17.134+03', NULL, 'ordli_01KTWRRFX6FTGWCSNZ7Z6AJF3W', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1, NULL, NULL, NULL, NULL, 'iitem_01KTWQBSRVN8G2YY7TJCVQ3MTF', false, '{"value": "1", "precision": 20}');
INSERT INTO public.reservation_item VALUES ('resitem_01KTWRRG63ZFPZ05NEA13VF0PC', '2026-06-12 04:57:17.134+03', '2026-06-12 04:57:17.134+03', NULL, 'ordli_01KTWRRFX6YW92GQQA1Z24TVAY', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 2, NULL, NULL, NULL, NULL, 'iitem_01KTWQBSG6KP99T9SCYP3BYA29', false, '{"value": "2", "precision": 20}');
INSERT INTO public.reservation_item VALUES ('resitem_01KTYAMP8A5TCK1QES8K5SH3CN', '2026-06-12 19:29:01.074+03', '2026-06-12 19:29:01.074+03', NULL, 'ordli_01KTYAMP32QBB522C2XKHGE692', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1, NULL, NULL, NULL, NULL, 'iitem_01KTWQBSRVN8G2YY7TJCVQ3MTF', false, '{"value": "1", "precision": 20}');
INSERT INTO public.reservation_item VALUES ('resitem_01KTYAMP8BM4S803RHY4GZQQM2', '2026-06-12 19:29:01.074+03', '2026-06-12 19:29:01.074+03', NULL, 'ordli_01KTYAMP333XY9HCQR651P0W3A', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1, NULL, NULL, NULL, NULL, 'iitem_01KTWQBW03JQ730B4V609KT99P', false, '{"value": "1", "precision": 20}');
INSERT INTO public.reservation_item VALUES ('resitem_01KTYAMP8B6SR12J3NDK1XES0J', '2026-06-12 19:29:01.074+03', '2026-06-12 19:29:01.074+03', NULL, 'ordli_01KTYAMP33RPR9V9AFK6NR93DS', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1, NULL, NULL, NULL, NULL, 'iitem_01KTWQBTTG4X48RQMBBPD9ACCX', false, '{"value": "1", "precision": 20}');
INSERT INTO public.reservation_item VALUES ('resitem_01KTYDC3PTDXQQFANR94BJJT95', '2026-06-12 20:16:45.661+03', '2026-06-12 20:16:45.661+03', NULL, 'ordli_01KTYDC3KXF5BGNZNXZG4FJN00', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 2, NULL, NULL, NULL, NULL, 'iitem_01KTWQBSG6KP99T9SCYP3BYA29', false, '{"value": "2", "precision": 20}');
INSERT INTO public.reservation_item VALUES ('resitem_01KV1SMHA71X3KS8ZVZ2SE51QV', '2026-06-14 03:48:47.947+03', '2026-06-14 03:48:47.947+03', NULL, 'ordli_01KV1SMH6QMV8J8Z0J43R5EM26', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1, NULL, NULL, NULL, NULL, 'iitem_01KTWQBSRVN8G2YY7TJCVQ3MTF', false, '{"value": "1", "precision": 20}');
INSERT INTO public.reservation_item VALUES ('resitem_01KV1SMHA74GKYAZYXGCC5N27H', '2026-06-14 03:48:47.947+03', '2026-06-14 03:48:47.947+03', NULL, 'ordli_01KV1SMH6RNDXXCEK1EK0YJY05', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1, NULL, NULL, NULL, NULL, 'iitem_01KTWQBTTG4X48RQMBBPD9ACCX', false, '{"value": "1", "precision": 20}');
INSERT INTO public.reservation_item VALUES ('resitem_01KV48DNZMJ1PCJQ7HRCF2XG5M', '2026-06-15 02:45:40.869+03', '2026-06-15 02:45:40.869+03', NULL, 'ordli_01KV48DNR38XZTXHX1J6FV50ME', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1, NULL, NULL, NULL, NULL, 'iitem_01KV22EPBVQMTH29Y0PESPGCSZ', false, '{"value": "1", "precision": 20}');
INSERT INTO public.reservation_item VALUES ('resitem_01KV48DNZMWKDRH17YKB31J8QW', '2026-06-15 02:45:40.87+03', '2026-06-15 02:45:40.87+03', NULL, 'ordli_01KV48DNR3NR7SRB0M8KP5WT6F', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1, NULL, NULL, NULL, NULL, 'iitem_01KV22EQN434ZP7GP5AQQNVQ09', false, '{"value": "1", "precision": 20}');
INSERT INTO public.reservation_item VALUES ('resitem_01KV5NCZHWY2GFVP6SVJVXR8D1', '2026-06-15 15:51:43.811+03', '2026-06-15 15:51:43.811+03', NULL, 'ordli_01KV5NCZF376QWFN8Z0JDBGVH0', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1, NULL, NULL, NULL, NULL, 'iitem_01KV22EPBVQMTH29Y0PESPGCSZ', false, '{"value": "1", "precision": 20}');
INSERT INTO public.reservation_item VALUES ('resitem_01KV5NCZHWWX385PPFTHQAC6XQ', '2026-06-15 15:51:43.811+03', '2026-06-15 15:51:43.811+03', NULL, 'ordli_01KV5NCZF3ZC5SBKSAEMJXHB6J', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1, NULL, NULL, NULL, NULL, 'iitem_01KV22EQBYYNAA309397JC91Y9', false, '{"value": "1", "precision": 20}');
INSERT INTO public.reservation_item VALUES ('resitem_01KV8NAWEE0KMK6FBH4D6VQG6G', '2026-06-16 19:48:18.393+03', '2026-06-16 19:48:18.393+03', NULL, 'ordli_01KV8NAWAFC3MHXEG9STT3KJMZ', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1, NULL, NULL, NULL, NULL, 'iitem_01KV22EQW96W6Q8GEFHMYS7TDQ', false, '{"value": "1", "precision": 20}');
INSERT INTO public.reservation_item VALUES ('resitem_01KV8NAWEEA62S3DRQ5B5BJ3VW', '2026-06-16 19:48:18.394+03', '2026-06-16 19:48:18.394+03', NULL, 'ordli_01KV8NAWAGHXTPF2B366BX8E8N', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1, NULL, NULL, NULL, NULL, 'iitem_01KV22EQN434ZP7GP5AQQNVQ09', false, '{"value": "1", "precision": 20}');
INSERT INTO public.reservation_item VALUES ('resitem_01KVRJXQK66FJB85QM17AJPN4J', '2026-06-23 00:14:01.192+03', '2026-06-23 00:14:01.192+03', NULL, 'ordli_01KVRJXQBDBXGTRD2TN51FQXA3', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 1, NULL, NULL, NULL, NULL, 'iitem_01KTWQBV55S53T8D2H0XZ7D0Q0', false, '{"value": "1", "precision": 20}');


--
-- Data for Name: return; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: return_fulfillment; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: return_item; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: return_reason; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: sales_channel; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sales_channel VALUES ('sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'Default Sales Channel', 'Created by Medusa', false, NULL, '2026-06-11 02:26:50.777+03', '2026-06-11 02:26:50.777+03', NULL);


--
-- Data for Name: sales_channel_stock_location; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sales_channel_stock_location VALUES ('sc_01KTSXRACSHSTBPYBE5P2G0VHC', 'sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', 'scloc_01KTSXRB9V39RHHJHN56K9ZP3V', '2026-06-11 02:26:51.706646+03', '2026-06-11 02:26:51.706646+03', NULL);


--
-- Data for Name: script_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.script_migrations VALUES (1, 'migrate-normalize-currency-codes-normalization.js', '2026-06-11 02:26:40.82658+03', '2026-06-11 02:26:41.123344+03');
INSERT INTO public.script_migrations VALUES (2, 'migrate-product-shipping-profile.js', '2026-06-11 02:26:50.380583+03', '2026-06-11 02:26:50.479841+03');
INSERT INTO public.script_migrations VALUES (3, 'migrate-tax-region-provider.js', '2026-06-11 02:26:50.491958+03', '2026-06-11 02:26:50.524578+03');
INSERT INTO public.script_migrations VALUES (4, 'reconcile-inventory-reserved-quantity.js', '2026-06-11 02:26:50.533632+03', '2026-06-11 02:26:50.569256+03');
INSERT INTO public.script_migrations VALUES (5, 'initial-data-seed.ts', '2026-06-11 02:26:50.756632+03', '2026-06-11 02:26:52.68306+03');


--
-- Data for Name: service_zone; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.service_zone VALUES ('serzo_01KTSXRAVKR5QPZY1JDK9NZWTY', 'Europe', NULL, 'fuset_01KTSXRAVK50TNK77ASNXJJKZN', '2026-06-11 02:26:51.253+03', '2026-06-11 02:26:51.253+03', NULL);


--
-- Data for Name: shipping_option; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.shipping_option VALUES ('so_01KTSXRB0Q7VGVK082FMXJJ0PZ', 'Standard Shipping', 'flat', 'serzo_01KTSXRAVKR5QPZY1JDK9NZWTY', 'sp_01KTSXRA2R74VD5YHXMN6GRZDZ', 'manual_manual', NULL, NULL, 'sotype_01KTSXRB0M2GE38D3PPFWZ9MM4', '2026-06-11 02:26:51.418+03', '2026-06-11 02:26:51.418+03', NULL);
INSERT INTO public.shipping_option VALUES ('so_01KTSXRB0SS53FA51HHVY3M417', 'Express Shipping', 'flat', 'serzo_01KTSXRAVKR5QPZY1JDK9NZWTY', 'sp_01KTSXRA2R74VD5YHXMN6GRZDZ', 'manual_manual', NULL, NULL, 'sotype_01KTSXRB0RF6KXXMB0R99AXVMK', '2026-06-11 02:26:51.419+03', '2026-06-11 02:26:51.419+03', NULL);


--
-- Data for Name: shipping_option_price_set; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.shipping_option_price_set VALUES ('so_01KTSXRB0Q7VGVK082FMXJJ0PZ', 'pset_01KTSXRB2DFTFH69FT3KSKE8T6', 'sops_01KTSXRB90SQYGG6DHNZ052WVY', '2026-06-11 02:26:51.680399+03', '2026-06-11 02:26:51.680399+03', NULL);
INSERT INTO public.shipping_option_price_set VALUES ('so_01KTSXRB0SS53FA51HHVY3M417', 'pset_01KTSXRB2G7ARK37GDXS2FWQNN', 'sops_01KTSXRB92AV2Z5CVTTA9K4AAG', '2026-06-11 02:26:51.680399+03', '2026-06-11 02:26:51.680399+03', NULL);


--
-- Data for Name: shipping_option_rule; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.shipping_option_rule VALUES ('sorul_01KTSXRB0P5BGT529AMV1NATQM', 'enabled_in_store', 'eq', '"true"', 'so_01KTSXRB0Q7VGVK082FMXJJ0PZ', '2026-06-11 02:26:51.419+03', '2026-06-11 02:26:51.419+03', NULL);
INSERT INTO public.shipping_option_rule VALUES ('sorul_01KTSXRB0PA9FXN1099DACWZ8D', 'is_return', 'eq', '"false"', 'so_01KTSXRB0Q7VGVK082FMXJJ0PZ', '2026-06-11 02:26:51.42+03', '2026-06-11 02:26:51.42+03', NULL);
INSERT INTO public.shipping_option_rule VALUES ('sorul_01KTSXRB0RSVJBX4R1RC0CZEJG', 'enabled_in_store', 'eq', '"true"', 'so_01KTSXRB0SS53FA51HHVY3M417', '2026-06-11 02:26:51.42+03', '2026-06-11 02:26:51.42+03', NULL);
INSERT INTO public.shipping_option_rule VALUES ('sorul_01KTSXRB0SMAPX8RVB1J06088Z', 'is_return', 'eq', '"false"', 'so_01KTSXRB0SS53FA51HHVY3M417', '2026-06-11 02:26:51.42+03', '2026-06-11 02:26:51.42+03', NULL);


--
-- Data for Name: shipping_option_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.shipping_option_type VALUES ('sotype_01KTSXRB0M2GE38D3PPFWZ9MM4', 'Standard', 'Ship in 2-3 days.', 'standard', '2026-06-11 02:26:51.418+03', '2026-06-11 02:26:51.418+03', NULL);
INSERT INTO public.shipping_option_type VALUES ('sotype_01KTSXRB0RF6KXXMB0R99AXVMK', 'Express', 'Ship in 24 hours.', 'express', '2026-06-11 02:26:51.419+03', '2026-06-11 02:26:51.419+03', NULL);


--
-- Data for Name: shipping_profile; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.shipping_profile VALUES ('sp_01KTSXRA2R74VD5YHXMN6GRZDZ', 'Default Shipping Profile', 'default', NULL, '2026-06-11 02:26:50.457+03', '2026-06-11 02:26:50.457+03', NULL);


--
-- Data for Name: stock_location; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.stock_location VALUES ('sloc_01KTSXRASJTE4J6YP2ZW82QBXZ', '2026-06-11 02:26:51.188+03', '2026-06-11 02:26:51.188+03', NULL, 'European Warehouse', 'laddr_01KTSXRASJKMP62VYC0ACFSKBA', NULL);


--
-- Data for Name: stock_location_address; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.stock_location_address VALUES ('laddr_01KTSXRASJKMP62VYC0ACFSKBA', '2026-06-11 02:26:51.187+03', '2026-06-11 02:26:51.187+03', NULL, '', NULL, NULL, 'Copenhagen', 'DK', NULL, NULL, NULL, NULL);


--
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.store VALUES ('store_01KTSXRAHBBZYBCYJQWX4SFARG', 'Default Store', 'sc_01KTSXRACSHSTBPYBE5P2G0VHC', NULL, NULL, NULL, '2026-06-11 02:26:50.918867+03', '2026-06-11 02:26:50.918867+03', NULL);


--
-- Data for Name: store_currency; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.store_currency VALUES ('stocur_01KTSXRAHV8YRAQH5WXEFNBVH4', 'eur', true, 'store_01KTSXRAHBBZYBCYJQWX4SFARG', '2026-06-11 02:26:50.918867+03', '2026-06-11 02:26:50.918867+03', NULL);
INSERT INTO public.store_currency VALUES ('stocur_01KTSXRAHVZQS8ZT630237CYGG', 'usd', false, 'store_01KTSXRAHBBZYBCYJQWX4SFARG', '2026-06-11 02:26:50.918867+03', '2026-06-11 02:26:50.918867+03', NULL);


--
-- Data for Name: store_locale; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: tax_provider; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tax_provider VALUES ('tp_system', true, '2026-06-11 02:26:38.109+03', '2026-06-11 02:26:38.109+03', NULL);


--
-- Data for Name: tax_rate; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: tax_rate_rule; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: tax_region; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tax_region VALUES ('txreg_01KTSXRARAGB05X37TDXNPAD92', 'tp_system', 'gb', NULL, NULL, NULL, '2026-06-11 02:26:51.149+03', '2026-06-11 02:26:51.149+03', NULL, NULL);
INSERT INTO public.tax_region VALUES ('txreg_01KTSXRARBFQMAF474QYXJ427F', 'tp_system', 'de', NULL, NULL, NULL, '2026-06-11 02:26:51.15+03', '2026-06-11 02:26:51.15+03', NULL, NULL);
INSERT INTO public.tax_region VALUES ('txreg_01KTSXRARBP9MZSHFJ7ETBAH8H', 'tp_system', 'dk', NULL, NULL, NULL, '2026-06-11 02:26:51.15+03', '2026-06-11 02:26:51.15+03', NULL, NULL);
INSERT INTO public.tax_region VALUES ('txreg_01KTSXRARBM1MD2TV2EN4SBWKZ', 'tp_system', 'se', NULL, NULL, NULL, '2026-06-11 02:26:51.15+03', '2026-06-11 02:26:51.15+03', NULL, NULL);
INSERT INTO public.tax_region VALUES ('txreg_01KTSXRARC6JDGFP7PCYDVJNRM', 'tp_system', 'fr', NULL, NULL, NULL, '2026-06-11 02:26:51.15+03', '2026-06-11 02:26:51.15+03', NULL, NULL);
INSERT INTO public.tax_region VALUES ('txreg_01KTSXRARCM1QDAFMQTP59CN6P', 'tp_system', 'es', NULL, NULL, NULL, '2026-06-11 02:26:51.15+03', '2026-06-11 02:26:51.15+03', NULL, NULL);
INSERT INTO public.tax_region VALUES ('txreg_01KTSXRARCTRGM1AWFGSNBEWM5', 'tp_system', 'it', NULL, NULL, NULL, '2026-06-11 02:26:51.15+03', '2026-06-11 02:26:51.151+03', NULL, NULL);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."user" VALUES ('user_01KTSXZN8CW3B3N2HBTZN0S85S', '', '', 'admin@medusa-test.com', NULL, NULL, '2026-06-11 02:30:51.276+03', '2026-06-11 14:55:27.988+03', NULL);
INSERT INTO public."user" VALUES ('user_01KVXXVAVYMTA9J9WQKCSDFF96', NULL, NULL, 'admin2@medusa-test.com', NULL, NULL, '2026-06-25 02:01:09.118+03', '2026-06-25 02:01:09.118+03', NULL);
INSERT INTO public."user" VALUES ('user_01KWA4852WMYYY51EZPD19R9DD', NULL, NULL, 'admin@admin.com', NULL, NULL, '2026-06-29 19:43:53.821+03', '2026-06-29 19:43:53.821+03', NULL);
INSERT INTO public."user" VALUES ('user_01KWARA0TDRYCEY1HP09TE6PAM', NULL, NULL, 'hakki@admin.com', NULL, NULL, '2026-06-30 01:34:26.51+03', '2026-06-30 01:34:26.51+03', NULL);


--
-- Data for Name: user_preference; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: user_rbac_role; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: view_configuration; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: workflow_execution; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: link_module_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.link_module_migrations_id_seq', 20, true);


--
-- Name: mikro_orm_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mikro_orm_migrations_id_seq', 164, true);


--
-- Name: order_change_action_ordering_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.order_change_action_ordering_seq', 2, true);


--
-- Name: order_claim_display_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.order_claim_display_id_seq', 1, false);


--
-- Name: order_display_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.order_display_id_seq', 10, true);


--
-- Name: order_exchange_display_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.order_exchange_display_id_seq', 1, false);


--
-- Name: return_display_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.return_display_id_seq', 1, false);


--
-- Name: script_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.script_migrations_id_seq', 5, true);


--
-- Name: account_holder account_holder_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account_holder
    ADD CONSTRAINT account_holder_pkey PRIMARY KEY (id);


--
-- Name: api_key api_key_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.api_key
    ADD CONSTRAINT api_key_pkey PRIMARY KEY (id);


--
-- Name: application_method_buy_rules application_method_buy_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.application_method_buy_rules
    ADD CONSTRAINT application_method_buy_rules_pkey PRIMARY KEY (application_method_id, promotion_rule_id);


--
-- Name: application_method_target_rules application_method_target_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.application_method_target_rules
    ADD CONSTRAINT application_method_target_rules_pkey PRIMARY KEY (application_method_id, promotion_rule_id);


--
-- Name: auth_identity auth_identity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_identity
    ADD CONSTRAINT auth_identity_pkey PRIMARY KEY (id);


--
-- Name: auth_mfa_factor auth_mfa_factor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_mfa_factor
    ADD CONSTRAINT auth_mfa_factor_pkey PRIMARY KEY (id);


--
-- Name: auth_mfa_recovery_code auth_mfa_recovery_code_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_mfa_recovery_code
    ADD CONSTRAINT auth_mfa_recovery_code_pkey PRIMARY KEY (id);


--
-- Name: auth_verification_token auth_verification_token_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_verification_token
    ADD CONSTRAINT auth_verification_token_pkey PRIMARY KEY (id);


--
-- Name: capture capture_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capture
    ADD CONSTRAINT capture_pkey PRIMARY KEY (id);


--
-- Name: cart_address cart_address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_address
    ADD CONSTRAINT cart_address_pkey PRIMARY KEY (id);


--
-- Name: cart_line_item_adjustment cart_line_item_adjustment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_line_item_adjustment
    ADD CONSTRAINT cart_line_item_adjustment_pkey PRIMARY KEY (id);


--
-- Name: cart_line_item cart_line_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_line_item
    ADD CONSTRAINT cart_line_item_pkey PRIMARY KEY (id);


--
-- Name: cart_line_item_tax_line cart_line_item_tax_line_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_line_item_tax_line
    ADD CONSTRAINT cart_line_item_tax_line_pkey PRIMARY KEY (id);


--
-- Name: cart_payment_collection cart_payment_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_payment_collection
    ADD CONSTRAINT cart_payment_collection_pkey PRIMARY KEY (cart_id, payment_collection_id);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- Name: cart_promotion cart_promotion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_promotion
    ADD CONSTRAINT cart_promotion_pkey PRIMARY KEY (cart_id, promotion_id);


--
-- Name: cart_shipping_method_adjustment cart_shipping_method_adjustment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_shipping_method_adjustment
    ADD CONSTRAINT cart_shipping_method_adjustment_pkey PRIMARY KEY (id);


--
-- Name: cart_shipping_method cart_shipping_method_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_shipping_method
    ADD CONSTRAINT cart_shipping_method_pkey PRIMARY KEY (id);


--
-- Name: cart_shipping_method_tax_line cart_shipping_method_tax_line_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_shipping_method_tax_line
    ADD CONSTRAINT cart_shipping_method_tax_line_pkey PRIMARY KEY (id);


--
-- Name: credit_line credit_line_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credit_line
    ADD CONSTRAINT credit_line_pkey PRIMARY KEY (id);


--
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (code);


--
-- Name: customer_account_holder customer_account_holder_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_account_holder
    ADD CONSTRAINT customer_account_holder_pkey PRIMARY KEY (customer_id, account_holder_id);


--
-- Name: customer_address customer_address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_address
    ADD CONSTRAINT customer_address_pkey PRIMARY KEY (id);


--
-- Name: customer_group_customer customer_group_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_group_customer
    ADD CONSTRAINT customer_group_customer_pkey PRIMARY KEY (id);


--
-- Name: customer_group customer_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_group
    ADD CONSTRAINT customer_group_pkey PRIMARY KEY (id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: fulfillment_address fulfillment_address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fulfillment_address
    ADD CONSTRAINT fulfillment_address_pkey PRIMARY KEY (id);


--
-- Name: fulfillment_item fulfillment_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fulfillment_item
    ADD CONSTRAINT fulfillment_item_pkey PRIMARY KEY (id);


--
-- Name: fulfillment_label fulfillment_label_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fulfillment_label
    ADD CONSTRAINT fulfillment_label_pkey PRIMARY KEY (id);


--
-- Name: fulfillment fulfillment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT fulfillment_pkey PRIMARY KEY (id);


--
-- Name: fulfillment_provider fulfillment_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fulfillment_provider
    ADD CONSTRAINT fulfillment_provider_pkey PRIMARY KEY (id);


--
-- Name: fulfillment_set fulfillment_set_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fulfillment_set
    ADD CONSTRAINT fulfillment_set_pkey PRIMARY KEY (id);


--
-- Name: geo_zone geo_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geo_zone
    ADD CONSTRAINT geo_zone_pkey PRIMARY KEY (id);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: inventory_item inventory_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_item
    ADD CONSTRAINT inventory_item_pkey PRIMARY KEY (id);


--
-- Name: inventory_level inventory_level_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_level
    ADD CONSTRAINT inventory_level_pkey PRIMARY KEY (id);


--
-- Name: invite invite_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invite
    ADD CONSTRAINT invite_pkey PRIMARY KEY (id);


--
-- Name: invite_rbac_role invite_rbac_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invite_rbac_role
    ADD CONSTRAINT invite_rbac_role_pkey PRIMARY KEY (invite_id, rbac_role_id);


--
-- Name: link_module_migrations link_module_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.link_module_migrations
    ADD CONSTRAINT link_module_migrations_pkey PRIMARY KEY (id);


--
-- Name: link_module_migrations link_module_migrations_table_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.link_module_migrations
    ADD CONSTRAINT link_module_migrations_table_name_key UNIQUE (table_name);


--
-- Name: location_fulfillment_provider location_fulfillment_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location_fulfillment_provider
    ADD CONSTRAINT location_fulfillment_provider_pkey PRIMARY KEY (stock_location_id, fulfillment_provider_id);


--
-- Name: location_fulfillment_set location_fulfillment_set_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location_fulfillment_set
    ADD CONSTRAINT location_fulfillment_set_pkey PRIMARY KEY (stock_location_id, fulfillment_set_id);


--
-- Name: mikro_orm_migrations mikro_orm_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mikro_orm_migrations
    ADD CONSTRAINT mikro_orm_migrations_pkey PRIMARY KEY (id);


--
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- Name: notification_provider notification_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification_provider
    ADD CONSTRAINT notification_provider_pkey PRIMARY KEY (id);


--
-- Name: order_address order_address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_address
    ADD CONSTRAINT order_address_pkey PRIMARY KEY (id);


--
-- Name: order_cart order_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_cart
    ADD CONSTRAINT order_cart_pkey PRIMARY KEY (order_id, cart_id);


--
-- Name: order_change_action order_change_action_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_change_action
    ADD CONSTRAINT order_change_action_pkey PRIMARY KEY (id);


--
-- Name: order_change order_change_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_change
    ADD CONSTRAINT order_change_pkey PRIMARY KEY (id);


--
-- Name: order_claim_item_image order_claim_item_image_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_claim_item_image
    ADD CONSTRAINT order_claim_item_image_pkey PRIMARY KEY (id);


--
-- Name: order_claim_item order_claim_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_claim_item
    ADD CONSTRAINT order_claim_item_pkey PRIMARY KEY (id);


--
-- Name: order_claim order_claim_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_claim
    ADD CONSTRAINT order_claim_pkey PRIMARY KEY (id);


--
-- Name: order_credit_line order_credit_line_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_credit_line
    ADD CONSTRAINT order_credit_line_pkey PRIMARY KEY (id);


--
-- Name: order_exchange_item order_exchange_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_exchange_item
    ADD CONSTRAINT order_exchange_item_pkey PRIMARY KEY (id);


--
-- Name: order_exchange order_exchange_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_exchange
    ADD CONSTRAINT order_exchange_pkey PRIMARY KEY (id);


--
-- Name: order_fulfillment order_fulfillment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_fulfillment
    ADD CONSTRAINT order_fulfillment_pkey PRIMARY KEY (order_id, fulfillment_id);


--
-- Name: order_item order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (id);


--
-- Name: order_line_item_adjustment order_line_item_adjustment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_line_item_adjustment
    ADD CONSTRAINT order_line_item_adjustment_pkey PRIMARY KEY (id);


--
-- Name: order_line_item order_line_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_line_item
    ADD CONSTRAINT order_line_item_pkey PRIMARY KEY (id);


--
-- Name: order_line_item_tax_line order_line_item_tax_line_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_line_item_tax_line
    ADD CONSTRAINT order_line_item_tax_line_pkey PRIMARY KEY (id);


--
-- Name: order_payment_collection order_payment_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_payment_collection
    ADD CONSTRAINT order_payment_collection_pkey PRIMARY KEY (order_id, payment_collection_id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: order_promotion order_promotion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_promotion
    ADD CONSTRAINT order_promotion_pkey PRIMARY KEY (order_id, promotion_id);


--
-- Name: order_shipping_method_adjustment order_shipping_method_adjustment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_shipping_method_adjustment
    ADD CONSTRAINT order_shipping_method_adjustment_pkey PRIMARY KEY (id);


--
-- Name: order_shipping_method order_shipping_method_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_shipping_method
    ADD CONSTRAINT order_shipping_method_pkey PRIMARY KEY (id);


--
-- Name: order_shipping_method_tax_line order_shipping_method_tax_line_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_shipping_method_tax_line
    ADD CONSTRAINT order_shipping_method_tax_line_pkey PRIMARY KEY (id);


--
-- Name: order_shipping order_shipping_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_shipping
    ADD CONSTRAINT order_shipping_pkey PRIMARY KEY (id);


--
-- Name: order_summary order_summary_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_summary
    ADD CONSTRAINT order_summary_pkey PRIMARY KEY (id);


--
-- Name: order_transaction order_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_transaction
    ADD CONSTRAINT order_transaction_pkey PRIMARY KEY (id);


--
-- Name: payment_collection_payment_providers payment_collection_payment_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_collection_payment_providers
    ADD CONSTRAINT payment_collection_payment_providers_pkey PRIMARY KEY (payment_collection_id, payment_provider_id);


--
-- Name: payment_collection payment_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_collection
    ADD CONSTRAINT payment_collection_pkey PRIMARY KEY (id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: payment_provider payment_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_provider
    ADD CONSTRAINT payment_provider_pkey PRIMARY KEY (id);


--
-- Name: payment_session payment_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_session
    ADD CONSTRAINT payment_session_pkey PRIMARY KEY (id);


--
-- Name: price_list price_list_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price_list
    ADD CONSTRAINT price_list_pkey PRIMARY KEY (id);


--
-- Name: price_list_rule price_list_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price_list_rule
    ADD CONSTRAINT price_list_rule_pkey PRIMARY KEY (id);


--
-- Name: price price_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_pkey PRIMARY KEY (id);


--
-- Name: price_preference price_preference_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price_preference
    ADD CONSTRAINT price_preference_pkey PRIMARY KEY (id);


--
-- Name: price_rule price_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price_rule
    ADD CONSTRAINT price_rule_pkey PRIMARY KEY (id);


--
-- Name: price_set price_set_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price_set
    ADD CONSTRAINT price_set_pkey PRIMARY KEY (id);


--
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);


--
-- Name: product_category_product product_category_product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_category_product
    ADD CONSTRAINT product_category_product_pkey PRIMARY KEY (product_id, product_category_id);


--
-- Name: product_collection product_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_collection
    ADD CONSTRAINT product_collection_pkey PRIMARY KEY (id);


--
-- Name: product_option product_option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT product_option_pkey PRIMARY KEY (id);


--
-- Name: product_option_value product_option_value_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_option_value
    ADD CONSTRAINT product_option_value_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: product_sales_channel product_sales_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_sales_channel
    ADD CONSTRAINT product_sales_channel_pkey PRIMARY KEY (product_id, sales_channel_id);


--
-- Name: product_shipping_profile product_shipping_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_shipping_profile
    ADD CONSTRAINT product_shipping_profile_pkey PRIMARY KEY (product_id, shipping_profile_id);


--
-- Name: product_tag product_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_tag
    ADD CONSTRAINT product_tag_pkey PRIMARY KEY (id);


--
-- Name: product_tags product_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT product_tags_pkey PRIMARY KEY (product_id, product_tag_id);


--
-- Name: product_type product_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_type
    ADD CONSTRAINT product_type_pkey PRIMARY KEY (id);


--
-- Name: product_variant_inventory_item product_variant_inventory_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_variant_inventory_item
    ADD CONSTRAINT product_variant_inventory_item_pkey PRIMARY KEY (variant_id, inventory_item_id);


--
-- Name: product_variant_option product_variant_option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_variant_option
    ADD CONSTRAINT product_variant_option_pkey PRIMARY KEY (variant_id, option_value_id);


--
-- Name: product_variant product_variant_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT product_variant_pkey PRIMARY KEY (id);


--
-- Name: product_variant_price_set product_variant_price_set_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_variant_price_set
    ADD CONSTRAINT product_variant_price_set_pkey PRIMARY KEY (variant_id, price_set_id);


--
-- Name: product_variant_product_image product_variant_product_image_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_variant_product_image
    ADD CONSTRAINT product_variant_product_image_pkey PRIMARY KEY (id);


--
-- Name: promotion_application_method promotion_application_method_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promotion_application_method
    ADD CONSTRAINT promotion_application_method_pkey PRIMARY KEY (id);


--
-- Name: promotion_campaign_budget promotion_campaign_budget_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promotion_campaign_budget
    ADD CONSTRAINT promotion_campaign_budget_pkey PRIMARY KEY (id);


--
-- Name: promotion_campaign_budget_usage promotion_campaign_budget_usage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promotion_campaign_budget_usage
    ADD CONSTRAINT promotion_campaign_budget_usage_pkey PRIMARY KEY (id);


--
-- Name: promotion_campaign promotion_campaign_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promotion_campaign
    ADD CONSTRAINT promotion_campaign_pkey PRIMARY KEY (id);


--
-- Name: promotion promotion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT promotion_pkey PRIMARY KEY (id);


--
-- Name: promotion_promotion_rule promotion_promotion_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promotion_promotion_rule
    ADD CONSTRAINT promotion_promotion_rule_pkey PRIMARY KEY (promotion_id, promotion_rule_id);


--
-- Name: promotion_rule promotion_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promotion_rule
    ADD CONSTRAINT promotion_rule_pkey PRIMARY KEY (id);


--
-- Name: promotion_rule_value promotion_rule_value_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promotion_rule_value
    ADD CONSTRAINT promotion_rule_value_pkey PRIMARY KEY (id);


--
-- Name: property_label property_label_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.property_label
    ADD CONSTRAINT property_label_pkey PRIMARY KEY (id);


--
-- Name: provider_identity provider_identity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.provider_identity
    ADD CONSTRAINT provider_identity_pkey PRIMARY KEY (id);


--
-- Name: publishable_api_key_sales_channel publishable_api_key_sales_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.publishable_api_key_sales_channel
    ADD CONSTRAINT publishable_api_key_sales_channel_pkey PRIMARY KEY (publishable_key_id, sales_channel_id);


--
-- Name: refund refund_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT refund_pkey PRIMARY KEY (id);


--
-- Name: refund_reason refund_reason_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.refund_reason
    ADD CONSTRAINT refund_reason_pkey PRIMARY KEY (id);


--
-- Name: region_country region_country_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.region_country
    ADD CONSTRAINT region_country_pkey PRIMARY KEY (iso_2);


--
-- Name: region_payment_provider region_payment_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.region_payment_provider
    ADD CONSTRAINT region_payment_provider_pkey PRIMARY KEY (region_id, payment_provider_id);


--
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- Name: reservation_item reservation_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservation_item
    ADD CONSTRAINT reservation_item_pkey PRIMARY KEY (id);


--
-- Name: return_fulfillment return_fulfillment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.return_fulfillment
    ADD CONSTRAINT return_fulfillment_pkey PRIMARY KEY (return_id, fulfillment_id);


--
-- Name: return_item return_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.return_item
    ADD CONSTRAINT return_item_pkey PRIMARY KEY (id);


--
-- Name: return return_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.return
    ADD CONSTRAINT return_pkey PRIMARY KEY (id);


--
-- Name: return_reason return_reason_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.return_reason
    ADD CONSTRAINT return_reason_pkey PRIMARY KEY (id);


--
-- Name: sales_channel sales_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_channel
    ADD CONSTRAINT sales_channel_pkey PRIMARY KEY (id);


--
-- Name: sales_channel_stock_location sales_channel_stock_location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sales_channel_stock_location
    ADD CONSTRAINT sales_channel_stock_location_pkey PRIMARY KEY (sales_channel_id, stock_location_id);


--
-- Name: script_migrations script_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.script_migrations
    ADD CONSTRAINT script_migrations_pkey PRIMARY KEY (id);


--
-- Name: service_zone service_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_zone
    ADD CONSTRAINT service_zone_pkey PRIMARY KEY (id);


--
-- Name: shipping_option shipping_option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT shipping_option_pkey PRIMARY KEY (id);


--
-- Name: shipping_option_price_set shipping_option_price_set_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_option_price_set
    ADD CONSTRAINT shipping_option_price_set_pkey PRIMARY KEY (shipping_option_id, price_set_id);


--
-- Name: shipping_option_rule shipping_option_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_option_rule
    ADD CONSTRAINT shipping_option_rule_pkey PRIMARY KEY (id);


--
-- Name: shipping_option_type shipping_option_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_option_type
    ADD CONSTRAINT shipping_option_type_pkey PRIMARY KEY (id);


--
-- Name: shipping_profile shipping_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_profile
    ADD CONSTRAINT shipping_profile_pkey PRIMARY KEY (id);


--
-- Name: stock_location_address stock_location_address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_location_address
    ADD CONSTRAINT stock_location_address_pkey PRIMARY KEY (id);


--
-- Name: stock_location stock_location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_location
    ADD CONSTRAINT stock_location_pkey PRIMARY KEY (id);


--
-- Name: store_currency store_currency_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_currency
    ADD CONSTRAINT store_currency_pkey PRIMARY KEY (id);


--
-- Name: store_locale store_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_locale
    ADD CONSTRAINT store_locale_pkey PRIMARY KEY (id);


--
-- Name: store store_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_pkey PRIMARY KEY (id);


--
-- Name: tax_provider tax_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_provider
    ADD CONSTRAINT tax_provider_pkey PRIMARY KEY (id);


--
-- Name: tax_rate tax_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT tax_rate_pkey PRIMARY KEY (id);


--
-- Name: tax_rate_rule tax_rate_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_rate_rule
    ADD CONSTRAINT tax_rate_rule_pkey PRIMARY KEY (id);


--
-- Name: tax_region tax_region_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_region
    ADD CONSTRAINT tax_region_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_preference user_preference_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_preference
    ADD CONSTRAINT user_preference_pkey PRIMARY KEY (id);


--
-- Name: user_rbac_role user_rbac_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_rbac_role
    ADD CONSTRAINT user_rbac_role_pkey PRIMARY KEY (user_id, rbac_role_id);


--
-- Name: view_configuration view_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.view_configuration
    ADD CONSTRAINT view_configuration_pkey PRIMARY KEY (id);


--
-- Name: workflow_execution workflow_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflow_execution
    ADD CONSTRAINT workflow_execution_pkey PRIMARY KEY (workflow_id, transaction_id, run_id);


--
-- Name: IDX_account_holder_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_account_holder_deleted_at" ON public.account_holder USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_account_holder_id_5cb3a0c0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_account_holder_id_5cb3a0c0" ON public.customer_account_holder USING btree (account_holder_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_account_holder_provider_id_external_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_account_holder_provider_id_external_id_unique" ON public.account_holder USING btree (provider_id, external_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_api_key_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_api_key_deleted_at" ON public.api_key USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_api_key_redacted; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_api_key_redacted" ON public.api_key USING btree (redacted) WHERE (deleted_at IS NULL);


--
-- Name: IDX_api_key_revoked_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_api_key_revoked_at" ON public.api_key USING btree (revoked_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_api_key_token_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_api_key_token_unique" ON public.api_key USING btree (token);


--
-- Name: IDX_api_key_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_api_key_type" ON public.api_key USING btree (type);


--
-- Name: IDX_application_method_allocation; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_application_method_allocation" ON public.promotion_application_method USING btree (allocation);


--
-- Name: IDX_application_method_target_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_application_method_target_type" ON public.promotion_application_method USING btree (target_type);


--
-- Name: IDX_application_method_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_application_method_type" ON public.promotion_application_method USING btree (type);


--
-- Name: IDX_auth_identity_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_auth_identity_deleted_at" ON public.auth_identity USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_mfa_factor_auth_identity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_auth_mfa_factor_auth_identity_id" ON public.auth_mfa_factor USING btree (auth_identity_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_mfa_factor_auth_identity_provider_active; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_auth_mfa_factor_auth_identity_provider_active" ON public.auth_mfa_factor USING btree (auth_identity_id, provider) WHERE ((deleted_at IS NULL) AND (status = ANY (ARRAY['pending'::text, 'enabled'::text])));


--
-- Name: IDX_auth_mfa_factor_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_auth_mfa_factor_deleted_at" ON public.auth_mfa_factor USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_mfa_recovery_code_auth_identity_code_hash; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_auth_mfa_recovery_code_auth_identity_code_hash" ON public.auth_mfa_recovery_code USING btree (auth_identity_id, code_hash) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_mfa_recovery_code_auth_identity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_auth_mfa_recovery_code_auth_identity_id" ON public.auth_mfa_recovery_code USING btree (auth_identity_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_mfa_recovery_code_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_auth_mfa_recovery_code_deleted_at" ON public.auth_mfa_recovery_code USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_verification_token_auth_identity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_auth_verification_token_auth_identity_id" ON public.auth_verification_token USING btree (auth_identity_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_verification_token_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_auth_verification_token_deleted_at" ON public.auth_verification_token USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_verification_token_expires_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_auth_verification_token_expires_at" ON public.auth_verification_token USING btree (expires_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_verification_token_provider_identity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_auth_verification_token_provider_identity_id" ON public.auth_verification_token USING btree (provider_identity_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_auth_verification_token_token_hash; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_auth_verification_token_token_hash" ON public.auth_verification_token USING btree (token_hash) WHERE (deleted_at IS NULL);


--
-- Name: IDX_campaign_budget_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_campaign_budget_type" ON public.promotion_campaign_budget USING btree (type);


--
-- Name: IDX_capture_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_capture_deleted_at" ON public.capture USING btree (deleted_at);


--
-- Name: IDX_capture_payment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_capture_payment_id" ON public.capture USING btree (payment_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_cart_address_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_address_deleted_at" ON public.cart_address USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_cart_billing_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_billing_address_id" ON public.cart USING btree (billing_address_id) WHERE ((deleted_at IS NULL) AND (billing_address_id IS NOT NULL));


--
-- Name: IDX_cart_credit_line_reference_reference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_credit_line_reference_reference_id" ON public.credit_line USING btree (reference, reference_id) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_cart_currency_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_currency_code" ON public.cart USING btree (currency_code);


--
-- Name: IDX_cart_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_customer_id" ON public.cart USING btree (customer_id) WHERE ((deleted_at IS NULL) AND (customer_id IS NOT NULL));


--
-- Name: IDX_cart_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_deleted_at" ON public.cart USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_cart_id_-4a39f6c9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_id_-4a39f6c9" ON public.cart_payment_collection USING btree (cart_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_cart_id_-71069c16; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_id_-71069c16" ON public.order_cart USING btree (cart_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_cart_id_-a9d4a70b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_id_-a9d4a70b" ON public.cart_promotion USING btree (cart_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_cart_line_item_adjustment_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_line_item_adjustment_deleted_at" ON public.cart_line_item_adjustment USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_cart_line_item_adjustment_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_line_item_adjustment_item_id" ON public.cart_line_item_adjustment USING btree (item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_cart_line_item_cart_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_line_item_cart_id" ON public.cart_line_item USING btree (cart_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_cart_line_item_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_line_item_deleted_at" ON public.cart_line_item USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_cart_line_item_tax_line_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_line_item_tax_line_deleted_at" ON public.cart_line_item_tax_line USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_cart_line_item_tax_line_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_line_item_tax_line_item_id" ON public.cart_line_item_tax_line USING btree (item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_cart_region_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_region_id" ON public.cart USING btree (region_id) WHERE ((deleted_at IS NULL) AND (region_id IS NOT NULL));


--
-- Name: IDX_cart_sales_channel_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_sales_channel_id" ON public.cart USING btree (sales_channel_id) WHERE ((deleted_at IS NULL) AND (sales_channel_id IS NOT NULL));


--
-- Name: IDX_cart_shipping_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_shipping_address_id" ON public.cart USING btree (shipping_address_id) WHERE ((deleted_at IS NULL) AND (shipping_address_id IS NOT NULL));


--
-- Name: IDX_cart_shipping_method_adjustment_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_shipping_method_adjustment_deleted_at" ON public.cart_shipping_method_adjustment USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_cart_shipping_method_adjustment_shipping_method_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_shipping_method_adjustment_shipping_method_id" ON public.cart_shipping_method_adjustment USING btree (shipping_method_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_cart_shipping_method_cart_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_shipping_method_cart_id" ON public.cart_shipping_method USING btree (cart_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_cart_shipping_method_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_shipping_method_deleted_at" ON public.cart_shipping_method USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_cart_shipping_method_tax_line_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_shipping_method_tax_line_deleted_at" ON public.cart_shipping_method_tax_line USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_cart_shipping_method_tax_line_shipping_method_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cart_shipping_method_tax_line_shipping_method_id" ON public.cart_shipping_method_tax_line USING btree (shipping_method_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_category_handle_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_category_handle_unique" ON public.product_category USING btree (handle) WHERE (deleted_at IS NULL);


--
-- Name: IDX_collection_handle_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_collection_handle_unique" ON public.product_collection USING btree (handle) WHERE (deleted_at IS NULL);


--
-- Name: IDX_credit_line_cart_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_credit_line_cart_id" ON public.credit_line USING btree (cart_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_credit_line_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_credit_line_deleted_at" ON public.credit_line USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_customer_address_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_customer_address_customer_id" ON public.customer_address USING btree (customer_id);


--
-- Name: IDX_customer_address_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_customer_address_deleted_at" ON public.customer_address USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_customer_address_unique_customer_billing; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_customer_address_unique_customer_billing" ON public.customer_address USING btree (customer_id) WHERE (is_default_billing = true);


--
-- Name: IDX_customer_address_unique_customer_shipping; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_customer_address_unique_customer_shipping" ON public.customer_address USING btree (customer_id) WHERE (is_default_shipping = true);


--
-- Name: IDX_customer_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_customer_deleted_at" ON public.customer USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_customer_email_has_account_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_customer_email_has_account_unique" ON public.customer USING btree (email, has_account) WHERE (deleted_at IS NULL);


--
-- Name: IDX_customer_group_customer_customer_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_customer_group_customer_customer_group_id" ON public.customer_group_customer USING btree (customer_group_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_customer_group_customer_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_customer_group_customer_customer_id" ON public.customer_group_customer USING btree (customer_id);


--
-- Name: IDX_customer_group_customer_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_customer_group_customer_deleted_at" ON public.customer_group_customer USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_customer_group_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_customer_group_deleted_at" ON public.customer_group USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_customer_group_name_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_customer_group_name_unique" ON public.customer_group USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: IDX_customer_id_5cb3a0c0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_customer_id_5cb3a0c0" ON public.customer_account_holder USING btree (customer_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_deleted_at_-1d67bae40; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_-1d67bae40" ON public.publishable_api_key_sales_channel USING btree (deleted_at);


--
-- Name: IDX_deleted_at_-1e5992737; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_-1e5992737" ON public.location_fulfillment_provider USING btree (deleted_at);


--
-- Name: IDX_deleted_at_-31ea43a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_-31ea43a" ON public.return_fulfillment USING btree (deleted_at);


--
-- Name: IDX_deleted_at_-4a39f6c9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_-4a39f6c9" ON public.cart_payment_collection USING btree (deleted_at);


--
-- Name: IDX_deleted_at_-71069c16; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_-71069c16" ON public.order_cart USING btree (deleted_at);


--
-- Name: IDX_deleted_at_-71518339; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_-71518339" ON public.order_promotion USING btree (deleted_at);


--
-- Name: IDX_deleted_at_-85069d44; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_-85069d44" ON public.invite_rbac_role USING btree (deleted_at);


--
-- Name: IDX_deleted_at_-a9d4a70b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_-a9d4a70b" ON public.cart_promotion USING btree (deleted_at);


--
-- Name: IDX_deleted_at_-e88adb96; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_-e88adb96" ON public.location_fulfillment_set USING btree (deleted_at);


--
-- Name: IDX_deleted_at_-e8d2543e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_-e8d2543e" ON public.order_fulfillment USING btree (deleted_at);


--
-- Name: IDX_deleted_at_17a262437; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_17a262437" ON public.product_shipping_profile USING btree (deleted_at);


--
-- Name: IDX_deleted_at_17b4c4e35; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_17b4c4e35" ON public.product_variant_inventory_item USING btree (deleted_at);


--
-- Name: IDX_deleted_at_1c934dab0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_1c934dab0" ON public.region_payment_provider USING btree (deleted_at);


--
-- Name: IDX_deleted_at_20b454295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_20b454295" ON public.product_sales_channel USING btree (deleted_at);


--
-- Name: IDX_deleted_at_26d06f470; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_26d06f470" ON public.sales_channel_stock_location USING btree (deleted_at);


--
-- Name: IDX_deleted_at_52b23597; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_52b23597" ON public.product_variant_price_set USING btree (deleted_at);


--
-- Name: IDX_deleted_at_5cb3a0c0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_5cb3a0c0" ON public.customer_account_holder USING btree (deleted_at);


--
-- Name: IDX_deleted_at_64ff0c4c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_64ff0c4c" ON public.user_rbac_role USING btree (deleted_at);


--
-- Name: IDX_deleted_at_ba32fa9c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_ba32fa9c" ON public.shipping_option_price_set USING btree (deleted_at);


--
-- Name: IDX_deleted_at_f42b9949; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_deleted_at_f42b9949" ON public.order_payment_collection USING btree (deleted_at);


--
-- Name: IDX_fulfillment_address_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_fulfillment_address_deleted_at" ON public.fulfillment_address USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_fulfillment_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_fulfillment_deleted_at" ON public.fulfillment USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_fulfillment_id_-31ea43a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_fulfillment_id_-31ea43a" ON public.return_fulfillment USING btree (fulfillment_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_id_-e8d2543e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_fulfillment_id_-e8d2543e" ON public.order_fulfillment USING btree (fulfillment_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_item_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_fulfillment_item_deleted_at" ON public.fulfillment_item USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_fulfillment_item_fulfillment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_fulfillment_item_fulfillment_id" ON public.fulfillment_item USING btree (fulfillment_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_item_inventory_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_fulfillment_item_inventory_item_id" ON public.fulfillment_item USING btree (inventory_item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_item_line_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_fulfillment_item_line_item_id" ON public.fulfillment_item USING btree (line_item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_label_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_fulfillment_label_deleted_at" ON public.fulfillment_label USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_fulfillment_label_fulfillment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_fulfillment_label_fulfillment_id" ON public.fulfillment_label USING btree (fulfillment_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_location_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_fulfillment_location_id" ON public.fulfillment USING btree (location_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_provider_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_fulfillment_provider_deleted_at" ON public.fulfillment_provider USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_provider_id_-1e5992737; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_fulfillment_provider_id_-1e5992737" ON public.location_fulfillment_provider USING btree (fulfillment_provider_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_set_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_fulfillment_set_deleted_at" ON public.fulfillment_set USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_fulfillment_set_id_-e88adb96; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_fulfillment_set_id_-e88adb96" ON public.location_fulfillment_set USING btree (fulfillment_set_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_set_name_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_fulfillment_set_name_unique" ON public.fulfillment_set USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: IDX_fulfillment_shipping_option_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_fulfillment_shipping_option_id" ON public.fulfillment USING btree (shipping_option_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_geo_zone_city; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_geo_zone_city" ON public.geo_zone USING btree (city) WHERE ((deleted_at IS NULL) AND (city IS NOT NULL));


--
-- Name: IDX_geo_zone_country_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_geo_zone_country_code" ON public.geo_zone USING btree (country_code) WHERE (deleted_at IS NULL);


--
-- Name: IDX_geo_zone_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_geo_zone_deleted_at" ON public.geo_zone USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_geo_zone_province_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_geo_zone_province_code" ON public.geo_zone USING btree (province_code) WHERE ((deleted_at IS NULL) AND (province_code IS NOT NULL));


--
-- Name: IDX_geo_zone_service_zone_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_geo_zone_service_zone_id" ON public.geo_zone USING btree (service_zone_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_id_-1d67bae40; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_-1d67bae40" ON public.publishable_api_key_sales_channel USING btree (id);


--
-- Name: IDX_id_-1e5992737; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_-1e5992737" ON public.location_fulfillment_provider USING btree (id);


--
-- Name: IDX_id_-31ea43a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_-31ea43a" ON public.return_fulfillment USING btree (id);


--
-- Name: IDX_id_-4a39f6c9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_-4a39f6c9" ON public.cart_payment_collection USING btree (id);


--
-- Name: IDX_id_-71069c16; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_-71069c16" ON public.order_cart USING btree (id);


--
-- Name: IDX_id_-71518339; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_-71518339" ON public.order_promotion USING btree (id);


--
-- Name: IDX_id_-85069d44; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_-85069d44" ON public.invite_rbac_role USING btree (id);


--
-- Name: IDX_id_-a9d4a70b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_-a9d4a70b" ON public.cart_promotion USING btree (id);


--
-- Name: IDX_id_-e88adb96; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_-e88adb96" ON public.location_fulfillment_set USING btree (id);


--
-- Name: IDX_id_-e8d2543e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_-e8d2543e" ON public.order_fulfillment USING btree (id);


--
-- Name: IDX_id_17a262437; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_17a262437" ON public.product_shipping_profile USING btree (id);


--
-- Name: IDX_id_17b4c4e35; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_17b4c4e35" ON public.product_variant_inventory_item USING btree (id);


--
-- Name: IDX_id_1c934dab0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_1c934dab0" ON public.region_payment_provider USING btree (id);


--
-- Name: IDX_id_20b454295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_20b454295" ON public.product_sales_channel USING btree (id);


--
-- Name: IDX_id_26d06f470; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_26d06f470" ON public.sales_channel_stock_location USING btree (id);


--
-- Name: IDX_id_52b23597; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_52b23597" ON public.product_variant_price_set USING btree (id);


--
-- Name: IDX_id_5cb3a0c0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_5cb3a0c0" ON public.customer_account_holder USING btree (id);


--
-- Name: IDX_id_64ff0c4c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_64ff0c4c" ON public.user_rbac_role USING btree (id);


--
-- Name: IDX_id_ba32fa9c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_ba32fa9c" ON public.shipping_option_price_set USING btree (id);


--
-- Name: IDX_id_f42b9949; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_id_f42b9949" ON public.order_payment_collection USING btree (id);


--
-- Name: IDX_image_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_image_deleted_at" ON public.image USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_image_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_image_product_id" ON public.image USING btree (product_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_inventory_item_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_inventory_item_deleted_at" ON public.inventory_item USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_inventory_item_id_17b4c4e35; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_inventory_item_id_17b4c4e35" ON public.product_variant_inventory_item USING btree (inventory_item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_inventory_item_sku; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_inventory_item_sku" ON public.inventory_item USING btree (sku) WHERE (deleted_at IS NULL);


--
-- Name: IDX_inventory_level_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_inventory_level_deleted_at" ON public.inventory_level USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_inventory_level_inventory_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_inventory_level_inventory_item_id" ON public.inventory_level USING btree (inventory_item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_inventory_level_location_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_inventory_level_location_id" ON public.inventory_level USING btree (location_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_inventory_level_location_id_inventory_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_inventory_level_location_id_inventory_item_id" ON public.inventory_level USING btree (inventory_item_id, location_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_invite_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_invite_deleted_at" ON public.invite USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_invite_email_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_invite_email_unique" ON public.invite USING btree (email) WHERE (deleted_at IS NULL);


--
-- Name: IDX_invite_id_-85069d44; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_invite_id_-85069d44" ON public.invite_rbac_role USING btree (invite_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_invite_token; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_invite_token" ON public.invite USING btree (token) WHERE (deleted_at IS NULL);


--
-- Name: IDX_line_item_adjustment_promotion_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_line_item_adjustment_promotion_id" ON public.cart_line_item_adjustment USING btree (promotion_id) WHERE ((deleted_at IS NULL) AND (promotion_id IS NOT NULL));


--
-- Name: IDX_line_item_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_line_item_product_id" ON public.cart_line_item USING btree (product_id) WHERE ((deleted_at IS NULL) AND (product_id IS NOT NULL));


--
-- Name: IDX_line_item_product_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_line_item_product_type_id" ON public.order_line_item USING btree (product_type_id) WHERE ((deleted_at IS NULL) AND (product_type_id IS NOT NULL));


--
-- Name: IDX_line_item_tax_line_tax_rate_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_line_item_tax_line_tax_rate_id" ON public.cart_line_item_tax_line USING btree (tax_rate_id) WHERE ((deleted_at IS NULL) AND (tax_rate_id IS NOT NULL));


--
-- Name: IDX_line_item_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_line_item_variant_id" ON public.cart_line_item USING btree (variant_id) WHERE ((deleted_at IS NULL) AND (variant_id IS NOT NULL));


--
-- Name: IDX_notification_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_notification_deleted_at" ON public.notification USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_notification_idempotency_key_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_notification_idempotency_key_unique" ON public.notification USING btree (idempotency_key) WHERE (deleted_at IS NULL);


--
-- Name: IDX_notification_provider_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_notification_provider_deleted_at" ON public.notification_provider USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_notification_provider_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_notification_provider_id" ON public.notification USING btree (provider_id);


--
-- Name: IDX_notification_receiver_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_notification_receiver_id" ON public.notification USING btree (receiver_id);


--
-- Name: IDX_option_product_id_title_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_option_product_id_title_unique" ON public.product_option USING btree (product_id, title) WHERE (deleted_at IS NULL);


--
-- Name: IDX_option_value_option_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_option_value_option_id_unique" ON public.product_option_value USING btree (option_id, value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_address_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_address_customer_id" ON public.order_address USING btree (customer_id);


--
-- Name: IDX_order_address_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_address_deleted_at" ON public.order_address USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_billing_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_billing_address_id" ON public."order" USING btree (billing_address_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_change_action_claim_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_change_action_claim_id" ON public.order_change_action USING btree (claim_id) WHERE ((claim_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_change_action_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_change_action_deleted_at" ON public.order_change_action USING btree (deleted_at);


--
-- Name: IDX_order_change_action_exchange_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_change_action_exchange_id" ON public.order_change_action USING btree (exchange_id) WHERE ((exchange_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_change_action_order_change_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_change_action_order_change_id" ON public.order_change_action USING btree (order_change_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_change_action_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_change_action_order_id" ON public.order_change_action USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_change_action_ordering; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_change_action_ordering" ON public.order_change_action USING btree (ordering) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_change_action_return_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_change_action_return_id" ON public.order_change_action USING btree (return_id) WHERE ((return_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_change_change_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_change_change_type" ON public.order_change USING btree (change_type);


--
-- Name: IDX_order_change_claim_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_change_claim_id" ON public.order_change USING btree (claim_id) WHERE ((claim_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_change_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_change_deleted_at" ON public.order_change USING btree (deleted_at);


--
-- Name: IDX_order_change_exchange_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_change_exchange_id" ON public.order_change USING btree (exchange_id) WHERE ((exchange_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_change_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_change_order_id" ON public.order_change USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_change_order_id_version; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_change_order_id_version" ON public.order_change USING btree (order_id, version);


--
-- Name: IDX_order_change_return_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_change_return_id" ON public.order_change USING btree (return_id) WHERE ((return_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_change_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_change_status" ON public.order_change USING btree (status) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_change_version; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_change_version" ON public.order_change USING btree (order_id, version) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_claim_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_claim_deleted_at" ON public.order_claim USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_claim_display_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_claim_display_id" ON public.order_claim USING btree (display_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_claim_item_claim_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_claim_item_claim_id" ON public.order_claim_item USING btree (claim_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_claim_item_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_claim_item_deleted_at" ON public.order_claim_item USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_claim_item_image_claim_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_claim_item_image_claim_item_id" ON public.order_claim_item_image USING btree (claim_item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_claim_item_image_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_claim_item_image_deleted_at" ON public.order_claim_item_image USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_order_claim_item_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_claim_item_item_id" ON public.order_claim_item USING btree (item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_claim_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_claim_order_id" ON public.order_claim USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_claim_return_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_claim_return_id" ON public.order_claim USING btree (return_id) WHERE ((return_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_credit_line_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_credit_line_deleted_at" ON public.order_credit_line USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_order_credit_line_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_credit_line_order_id" ON public.order_credit_line USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_credit_line_order_id_version; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_credit_line_order_id_version" ON public.order_credit_line USING btree (order_id, version) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_currency_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_currency_code" ON public."order" USING btree (currency_code) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_custom_display_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_order_custom_display_id" ON public."order" USING btree (custom_display_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_customer_id" ON public."order" USING btree (customer_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_deleted_at" ON public."order" USING btree (deleted_at);


--
-- Name: IDX_order_display_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_display_id" ON public."order" USING btree (display_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_exchange_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_exchange_deleted_at" ON public.order_exchange USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_exchange_display_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_exchange_display_id" ON public.order_exchange USING btree (display_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_exchange_item_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_exchange_item_deleted_at" ON public.order_exchange_item USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_exchange_item_exchange_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_exchange_item_exchange_id" ON public.order_exchange_item USING btree (exchange_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_exchange_item_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_exchange_item_item_id" ON public.order_exchange_item USING btree (item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_exchange_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_exchange_order_id" ON public.order_exchange USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_exchange_return_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_exchange_return_id" ON public.order_exchange USING btree (return_id) WHERE ((return_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_id_-71069c16; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_id_-71069c16" ON public.order_cart USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_id_-71518339; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_id_-71518339" ON public.order_promotion USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_id_-e8d2543e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_id_-e8d2543e" ON public.order_fulfillment USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_id_f42b9949; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_id_f42b9949" ON public.order_payment_collection USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_is_draft_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_is_draft_order" ON public."order" USING btree (is_draft_order) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_item_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_item_deleted_at" ON public.order_item USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_order_item_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_item_item_id" ON public.order_item USING btree (item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_item_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_item_order_id" ON public.order_item USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_item_order_id_version; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_item_order_id_version" ON public.order_item USING btree (order_id, version) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_line_item_adjustment_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_line_item_adjustment_item_id" ON public.order_line_item_adjustment USING btree (item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_line_item_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_line_item_product_id" ON public.order_line_item USING btree (product_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_line_item_tax_line_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_line_item_tax_line_item_id" ON public.order_line_item_tax_line USING btree (item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_line_item_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_line_item_variant_id" ON public.order_line_item USING btree (variant_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_region_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_region_id" ON public."order" USING btree (region_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_sales_channel_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_sales_channel_id" ON public."order" USING btree (sales_channel_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_shipping_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_shipping_address_id" ON public."order" USING btree (shipping_address_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_shipping_claim_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_shipping_claim_id" ON public.order_shipping USING btree (claim_id) WHERE ((claim_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_shipping_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_shipping_deleted_at" ON public.order_shipping USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_order_shipping_exchange_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_shipping_exchange_id" ON public.order_shipping USING btree (exchange_id) WHERE ((exchange_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_shipping_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_shipping_item_id" ON public.order_shipping USING btree (shipping_method_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_shipping_method_adjustment_shipping_method_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_shipping_method_adjustment_shipping_method_id" ON public.order_shipping_method_adjustment USING btree (shipping_method_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_shipping_method_adjustment_version_shipping_method; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_order_shipping_method_adjustment_version_shipping_method" ON public.order_shipping_method_adjustment USING btree (version, shipping_method_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_shipping_method_shipping_option_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_shipping_method_shipping_option_id" ON public.order_shipping_method USING btree (shipping_option_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_shipping_method_tax_line_shipping_method_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_shipping_method_tax_line_shipping_method_id" ON public.order_shipping_method_tax_line USING btree (shipping_method_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_shipping_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_shipping_order_id" ON public.order_shipping USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_shipping_order_id_version; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_shipping_order_id_version" ON public.order_shipping USING btree (order_id, version) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_shipping_return_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_shipping_return_id" ON public.order_shipping USING btree (return_id) WHERE ((return_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_shipping_shipping_method_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_shipping_shipping_method_id" ON public.order_shipping USING btree (shipping_method_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_summary_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_summary_deleted_at" ON public.order_summary USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_order_summary_order_id_version; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_summary_order_id_version" ON public.order_summary USING btree (order_id, version) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_transaction_claim_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_transaction_claim_id" ON public.order_transaction USING btree (claim_id) WHERE ((claim_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_transaction_currency_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_transaction_currency_code" ON public.order_transaction USING btree (currency_code) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_transaction_exchange_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_transaction_exchange_id" ON public.order_transaction USING btree (exchange_id) WHERE ((exchange_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_order_transaction_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_transaction_order_id" ON public.order_transaction USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_transaction_order_id_version; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_transaction_order_id_version" ON public.order_transaction USING btree (order_id, version) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_transaction_reference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_transaction_reference_id" ON public.order_transaction USING btree (reference_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_order_transaction_return_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_order_transaction_return_id" ON public.order_transaction USING btree (return_id) WHERE ((return_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_payment_collection_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_payment_collection_deleted_at" ON public.payment_collection USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_payment_collection_id_-4a39f6c9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_payment_collection_id_-4a39f6c9" ON public.cart_payment_collection USING btree (payment_collection_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_payment_collection_id_f42b9949; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_payment_collection_id_f42b9949" ON public.order_payment_collection USING btree (payment_collection_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_payment_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_payment_deleted_at" ON public.payment USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_payment_payment_collection_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_payment_payment_collection_id" ON public.payment USING btree (payment_collection_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_payment_payment_session_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_payment_payment_session_id" ON public.payment USING btree (payment_session_id);


--
-- Name: IDX_payment_payment_session_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_payment_payment_session_id_unique" ON public.payment USING btree (payment_session_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_payment_provider_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_payment_provider_deleted_at" ON public.payment_provider USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_payment_provider_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_payment_provider_id" ON public.payment USING btree (provider_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_payment_provider_id_1c934dab0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_payment_provider_id_1c934dab0" ON public.region_payment_provider USING btree (payment_provider_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_payment_session_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_payment_session_deleted_at" ON public.payment_session USING btree (deleted_at);


--
-- Name: IDX_payment_session_payment_collection_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_payment_session_payment_collection_id" ON public.payment_session USING btree (payment_collection_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_currency_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_currency_code" ON public.price USING btree (currency_code) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_deleted_at" ON public.price USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_price_list_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_list_deleted_at" ON public.price_list USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_price_list_id_status_starts_at_ends_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_list_id_status_starts_at_ends_at" ON public.price_list USING btree (id, status, starts_at, ends_at) WHERE ((deleted_at IS NULL) AND (status = 'active'::text));


--
-- Name: IDX_price_list_rule_attribute; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_list_rule_attribute" ON public.price_list_rule USING btree (attribute) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_list_rule_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_list_rule_deleted_at" ON public.price_list_rule USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_price_list_rule_price_list_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_list_rule_price_list_id" ON public.price_list_rule USING btree (price_list_id) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_price_list_rule_value; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_list_rule_value" ON public.price_list_rule USING gin (value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_preference_attribute_value; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_price_preference_attribute_value" ON public.price_preference USING btree (attribute, value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_preference_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_preference_deleted_at" ON public.price_preference USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_price_price_list_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_price_list_id" ON public.price USING btree (price_list_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_price_set_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_price_set_id" ON public.price USING btree (price_set_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_rule_attribute; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_rule_attribute" ON public.price_rule USING btree (attribute) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_rule_attribute_value; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_rule_attribute_value" ON public.price_rule USING btree (attribute, value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_rule_attribute_value_price_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_rule_attribute_value_price_id" ON public.price_rule USING btree (attribute, value, price_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_rule_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_rule_deleted_at" ON public.price_rule USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_price_rule_operator; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_rule_operator" ON public.price_rule USING btree (operator);


--
-- Name: IDX_price_rule_operator_value; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_rule_operator_value" ON public.price_rule USING btree (operator, value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_rule_price_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_rule_price_id" ON public.price_rule USING btree (price_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_rule_price_id_attribute_operator_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_price_rule_price_id_attribute_operator_unique" ON public.price_rule USING btree (price_id, attribute, operator) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_set_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_set_deleted_at" ON public.price_set USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_price_set_id_52b23597; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_set_id_52b23597" ON public.product_variant_price_set USING btree (price_set_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_price_set_id_ba32fa9c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_price_set_id_ba32fa9c" ON public.shipping_option_price_set USING btree (price_set_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_category_parent_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_category_parent_category_id" ON public.product_category USING btree (parent_category_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_category_path; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_category_path" ON public.product_category USING btree (mpath) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_collection_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_collection_deleted_at" ON public.product_collection USING btree (deleted_at);


--
-- Name: IDX_product_collection_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_collection_id" ON public.product USING btree (collection_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_deleted_at" ON public.product USING btree (deleted_at);


--
-- Name: IDX_product_handle_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_product_handle_unique" ON public.product USING btree (handle) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_id_17a262437; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_id_17a262437" ON public.product_shipping_profile USING btree (product_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_id_20b454295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_id_20b454295" ON public.product_sales_channel USING btree (product_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_image_rank; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_image_rank" ON public.image USING btree (rank) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_image_rank_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_image_rank_product_id" ON public.image USING btree (rank, product_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_image_url; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_image_url" ON public.image USING btree (url) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_image_url_rank_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_image_url_rank_product_id" ON public.image USING btree (url, rank, product_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_option_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_option_deleted_at" ON public.product_option USING btree (deleted_at);


--
-- Name: IDX_product_option_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_option_product_id" ON public.product_option USING btree (product_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_option_value_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_option_value_deleted_at" ON public.product_option_value USING btree (deleted_at);


--
-- Name: IDX_product_option_value_option_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_option_value_option_id" ON public.product_option_value USING btree (option_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_status" ON public.product USING btree (status) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_tag_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_tag_deleted_at" ON public.product_tag USING btree (deleted_at);


--
-- Name: IDX_product_type_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_type_deleted_at" ON public.product_type USING btree (deleted_at);


--
-- Name: IDX_product_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_type_id" ON public.product USING btree (type_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_barcode_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_product_variant_barcode_unique" ON public.product_variant USING btree (barcode) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_variant_deleted_at" ON public.product_variant USING btree (deleted_at);


--
-- Name: IDX_product_variant_ean_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_product_variant_ean_unique" ON public.product_variant USING btree (ean) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_id_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_variant_id_product_id" ON public.product_variant USING btree (id, product_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_variant_product_id" ON public.product_variant USING btree (product_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_product_image_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_variant_product_image_deleted_at" ON public.product_variant_product_image USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_product_image_image_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_variant_product_image_image_id" ON public.product_variant_product_image USING btree (image_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_product_image_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_product_variant_product_image_variant_id" ON public.product_variant_product_image USING btree (variant_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_sku_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_product_variant_sku_unique" ON public.product_variant USING btree (sku) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_upc_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_product_variant_upc_unique" ON public.product_variant USING btree (upc) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_application_method_currency_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_application_method_currency_code" ON public.promotion_application_method USING btree (currency_code) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_promotion_application_method_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_application_method_deleted_at" ON public.promotion_application_method USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_application_method_promotion_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_promotion_application_method_promotion_id_unique" ON public.promotion_application_method USING btree (promotion_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_campaign_budget_campaign_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_promotion_campaign_budget_campaign_id_unique" ON public.promotion_campaign_budget USING btree (campaign_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_campaign_budget_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_campaign_budget_deleted_at" ON public.promotion_campaign_budget USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_campaign_budget_usage_attribute_value_budget_id_u; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_promotion_campaign_budget_usage_attribute_value_budget_id_u" ON public.promotion_campaign_budget_usage USING btree (attribute_value, budget_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_campaign_budget_usage_budget_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_campaign_budget_usage_budget_id" ON public.promotion_campaign_budget_usage USING btree (budget_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_campaign_budget_usage_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_campaign_budget_usage_deleted_at" ON public.promotion_campaign_budget_usage USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_campaign_campaign_identifier_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_promotion_campaign_campaign_identifier_unique" ON public.promotion_campaign USING btree (campaign_identifier) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_campaign_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_campaign_deleted_at" ON public.promotion_campaign USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_campaign_id" ON public.promotion USING btree (campaign_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_deleted_at" ON public.promotion USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_id_-71518339; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_id_-71518339" ON public.order_promotion USING btree (promotion_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_id_-a9d4a70b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_id_-a9d4a70b" ON public.cart_promotion USING btree (promotion_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_is_automatic; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_is_automatic" ON public.promotion USING btree (is_automatic) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_rule_attribute; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_rule_attribute" ON public.promotion_rule USING btree (attribute);


--
-- Name: IDX_promotion_rule_attribute_operator; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_rule_attribute_operator" ON public.promotion_rule USING btree (attribute, operator) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_rule_attribute_operator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_rule_attribute_operator_id" ON public.promotion_rule USING btree (operator, attribute, id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_rule_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_rule_deleted_at" ON public.promotion_rule USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_rule_operator; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_rule_operator" ON public.promotion_rule USING btree (operator);


--
-- Name: IDX_promotion_rule_value_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_rule_value_deleted_at" ON public.promotion_rule_value USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_rule_value_promotion_rule_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_rule_value_promotion_rule_id" ON public.promotion_rule_value USING btree (promotion_rule_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_rule_value_rule_id_value; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_rule_value_rule_id_value" ON public.promotion_rule_value USING btree (promotion_rule_id, value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_rule_value_value; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_rule_value_value" ON public.promotion_rule_value USING btree (value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_status" ON public.promotion USING btree (status) WHERE (deleted_at IS NULL);


--
-- Name: IDX_promotion_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_promotion_type" ON public.promotion USING btree (type);


--
-- Name: IDX_property_label_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_property_label_deleted_at" ON public.property_label USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_property_label_entity; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_property_label_entity" ON public.property_label USING btree (entity) WHERE (deleted_at IS NULL);


--
-- Name: IDX_property_label_entity_property_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_property_label_entity_property_unique" ON public.property_label USING btree (entity, property) WHERE (deleted_at IS NULL);


--
-- Name: IDX_provider_identity_auth_identity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_provider_identity_auth_identity_id" ON public.provider_identity USING btree (auth_identity_id);


--
-- Name: IDX_provider_identity_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_provider_identity_deleted_at" ON public.provider_identity USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_provider_identity_provider_entity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_provider_identity_provider_entity_id" ON public.provider_identity USING btree (entity_id, provider);


--
-- Name: IDX_publishable_key_id_-1d67bae40; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_publishable_key_id_-1d67bae40" ON public.publishable_api_key_sales_channel USING btree (publishable_key_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_rbac_role_id_-85069d44; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_rbac_role_id_-85069d44" ON public.invite_rbac_role USING btree (rbac_role_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_rbac_role_id_64ff0c4c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_rbac_role_id_64ff0c4c" ON public.user_rbac_role USING btree (rbac_role_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_refund_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_refund_deleted_at" ON public.refund USING btree (deleted_at);


--
-- Name: IDX_refund_payment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_refund_payment_id" ON public.refund USING btree (payment_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_refund_reason_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_refund_reason_deleted_at" ON public.refund_reason USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_refund_refund_reason_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_refund_refund_reason_id" ON public.refund USING btree (refund_reason_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_region_country_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_region_country_deleted_at" ON public.region_country USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_region_country_region_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_region_country_region_id" ON public.region_country USING btree (region_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_region_country_region_id_iso_2_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_region_country_region_id_iso_2_unique" ON public.region_country USING btree (region_id, iso_2);


--
-- Name: IDX_region_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_region_deleted_at" ON public.region USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_region_id_1c934dab0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_region_id_1c934dab0" ON public.region_payment_provider USING btree (region_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_reservation_item_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_reservation_item_deleted_at" ON public.reservation_item USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_reservation_item_inventory_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_reservation_item_inventory_item_id" ON public.reservation_item USING btree (inventory_item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_reservation_item_line_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_reservation_item_line_item_id" ON public.reservation_item USING btree (line_item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_reservation_item_location_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_reservation_item_location_id" ON public.reservation_item USING btree (location_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_return_claim_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_return_claim_id" ON public.return USING btree (claim_id) WHERE ((claim_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_return_display_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_return_display_id" ON public.return USING btree (display_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_return_exchange_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_return_exchange_id" ON public.return USING btree (exchange_id) WHERE ((exchange_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_return_id_-31ea43a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_return_id_-31ea43a" ON public.return_fulfillment USING btree (return_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_return_item_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_return_item_deleted_at" ON public.return_item USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_return_item_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_return_item_item_id" ON public.return_item USING btree (item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_return_item_reason_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_return_item_reason_id" ON public.return_item USING btree (reason_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_return_item_return_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_return_item_return_id" ON public.return_item USING btree (return_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_return_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_return_order_id" ON public.return USING btree (order_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_return_reason_parent_return_reason_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_return_reason_parent_return_reason_id" ON public.return_reason USING btree (parent_return_reason_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_return_reason_value; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_return_reason_value" ON public.return_reason USING btree (value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_sales_channel_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_sales_channel_deleted_at" ON public.sales_channel USING btree (deleted_at);


--
-- Name: IDX_sales_channel_id_-1d67bae40; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_sales_channel_id_-1d67bae40" ON public.publishable_api_key_sales_channel USING btree (sales_channel_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_sales_channel_id_20b454295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_sales_channel_id_20b454295" ON public.product_sales_channel USING btree (sales_channel_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_sales_channel_id_26d06f470; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_sales_channel_id_26d06f470" ON public.sales_channel_stock_location USING btree (sales_channel_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_service_zone_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_service_zone_deleted_at" ON public.service_zone USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_service_zone_fulfillment_set_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_service_zone_fulfillment_set_id" ON public.service_zone USING btree (fulfillment_set_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_service_zone_name_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_service_zone_name_unique" ON public.service_zone USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: IDX_shipping_method_adjustment_promotion_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_shipping_method_adjustment_promotion_id" ON public.cart_shipping_method_adjustment USING btree (promotion_id) WHERE ((deleted_at IS NULL) AND (promotion_id IS NOT NULL));


--
-- Name: IDX_shipping_method_option_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_shipping_method_option_id" ON public.cart_shipping_method USING btree (shipping_option_id) WHERE ((deleted_at IS NULL) AND (shipping_option_id IS NOT NULL));


--
-- Name: IDX_shipping_method_tax_line_tax_rate_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_shipping_method_tax_line_tax_rate_id" ON public.cart_shipping_method_tax_line USING btree (tax_rate_id) WHERE ((deleted_at IS NULL) AND (tax_rate_id IS NOT NULL));


--
-- Name: IDX_shipping_option_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_shipping_option_deleted_at" ON public.shipping_option USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_shipping_option_id_ba32fa9c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_shipping_option_id_ba32fa9c" ON public.shipping_option_price_set USING btree (shipping_option_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_shipping_option_provider_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_shipping_option_provider_id" ON public.shipping_option USING btree (provider_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_shipping_option_rule_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_shipping_option_rule_deleted_at" ON public.shipping_option_rule USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_shipping_option_rule_shipping_option_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_shipping_option_rule_shipping_option_id" ON public.shipping_option_rule USING btree (shipping_option_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_shipping_option_service_zone_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_shipping_option_service_zone_id" ON public.shipping_option USING btree (service_zone_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_shipping_option_shipping_option_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_shipping_option_shipping_option_type_id" ON public.shipping_option USING btree (shipping_option_type_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_shipping_option_shipping_profile_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_shipping_option_shipping_profile_id" ON public.shipping_option USING btree (shipping_profile_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_shipping_option_type_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_shipping_option_type_deleted_at" ON public.shipping_option_type USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_shipping_profile_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_shipping_profile_deleted_at" ON public.shipping_profile USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_shipping_profile_id_17a262437; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_shipping_profile_id_17a262437" ON public.product_shipping_profile USING btree (shipping_profile_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_shipping_profile_name_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_shipping_profile_name_unique" ON public.shipping_profile USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: IDX_single_default_region; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_single_default_region" ON public.tax_rate USING btree (tax_region_id) WHERE ((is_default = true) AND (deleted_at IS NULL));


--
-- Name: IDX_stock_location_address_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_stock_location_address_deleted_at" ON public.stock_location_address USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_stock_location_address_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_stock_location_address_id_unique" ON public.stock_location USING btree (address_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_stock_location_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_stock_location_deleted_at" ON public.stock_location USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_stock_location_id_-1e5992737; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_stock_location_id_-1e5992737" ON public.location_fulfillment_provider USING btree (stock_location_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_stock_location_id_-e88adb96; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_stock_location_id_-e88adb96" ON public.location_fulfillment_set USING btree (stock_location_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_stock_location_id_26d06f470; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_stock_location_id_26d06f470" ON public.sales_channel_stock_location USING btree (stock_location_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_store_currency_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_store_currency_deleted_at" ON public.store_currency USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_store_currency_store_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_store_currency_store_id" ON public.store_currency USING btree (store_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_store_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_store_deleted_at" ON public.store USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_store_locale_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_store_locale_deleted_at" ON public.store_locale USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_store_locale_store_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_store_locale_store_id" ON public.store_locale USING btree (store_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_tag_value_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_tag_value_unique" ON public.product_tag USING btree (value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_tax_provider_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_tax_provider_deleted_at" ON public.tax_provider USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_tax_rate_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_tax_rate_deleted_at" ON public.tax_rate USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_tax_rate_rule_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_tax_rate_rule_deleted_at" ON public.tax_rate_rule USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_tax_rate_rule_reference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_tax_rate_rule_reference_id" ON public.tax_rate_rule USING btree (reference_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_tax_rate_rule_tax_rate_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_tax_rate_rule_tax_rate_id" ON public.tax_rate_rule USING btree (tax_rate_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_tax_rate_rule_unique_rate_reference; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_tax_rate_rule_unique_rate_reference" ON public.tax_rate_rule USING btree (tax_rate_id, reference_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_tax_rate_tax_region_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_tax_rate_tax_region_id" ON public.tax_rate USING btree (tax_region_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_tax_region_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_tax_region_deleted_at" ON public.tax_region USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_tax_region_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_tax_region_parent_id" ON public.tax_region USING btree (parent_id);


--
-- Name: IDX_tax_region_provider_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_tax_region_provider_id" ON public.tax_region USING btree (provider_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_tax_region_unique_country_nullable_province; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_tax_region_unique_country_nullable_province" ON public.tax_region USING btree (country_code) WHERE ((province_code IS NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_tax_region_unique_country_province; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_tax_region_unique_country_province" ON public.tax_region USING btree (country_code, province_code) WHERE (deleted_at IS NULL);


--
-- Name: IDX_type_value_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_type_value_unique" ON public.product_type USING btree (value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_unique_promotion_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_unique_promotion_code" ON public.promotion USING btree (code) WHERE (deleted_at IS NULL);


--
-- Name: IDX_user_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_deleted_at" ON public."user" USING btree (deleted_at) WHERE (deleted_at IS NOT NULL);


--
-- Name: IDX_user_email_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_user_email_unique" ON public."user" USING btree (email) WHERE (deleted_at IS NULL);


--
-- Name: IDX_user_id_64ff0c4c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_id_64ff0c4c" ON public.user_rbac_role USING btree (user_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_user_preference_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_preference_deleted_at" ON public.user_preference USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_user_preference_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_preference_user_id" ON public.user_preference USING btree (user_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_user_preference_user_id_key_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_user_preference_user_id_key_unique" ON public.user_preference USING btree (user_id, key) WHERE (deleted_at IS NULL);


--
-- Name: IDX_variant_id_17b4c4e35; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_variant_id_17b4c4e35" ON public.product_variant_inventory_item USING btree (variant_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_variant_id_52b23597; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_variant_id_52b23597" ON public.product_variant_price_set USING btree (variant_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_view_configuration_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_view_configuration_deleted_at" ON public.view_configuration USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_view_configuration_entity_is_system_default; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_view_configuration_entity_is_system_default" ON public.view_configuration USING btree (entity, is_system_default) WHERE (deleted_at IS NULL);


--
-- Name: IDX_view_configuration_entity_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_view_configuration_entity_user_id" ON public.view_configuration USING btree (entity, user_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_view_configuration_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_view_configuration_user_id" ON public.view_configuration USING btree (user_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_workflow_execution_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_workflow_execution_deleted_at" ON public.workflow_execution USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_workflow_execution_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_workflow_execution_id" ON public.workflow_execution USING btree (id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_workflow_execution_retention_time_updated_at_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_workflow_execution_retention_time_updated_at_state" ON public.workflow_execution USING btree (retention_time, updated_at, state) WHERE ((deleted_at IS NULL) AND (retention_time IS NOT NULL));


--
-- Name: IDX_workflow_execution_run_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_workflow_execution_run_id" ON public.workflow_execution USING btree (run_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_workflow_execution_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_workflow_execution_state" ON public.workflow_execution USING btree (state) WHERE (deleted_at IS NULL);


--
-- Name: IDX_workflow_execution_state_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_workflow_execution_state_updated_at" ON public.workflow_execution USING btree (state, updated_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_workflow_execution_transaction_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_workflow_execution_transaction_id" ON public.workflow_execution USING btree (transaction_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_workflow_execution_updated_at_retention_time; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_workflow_execution_updated_at_retention_time" ON public.workflow_execution USING btree (updated_at, retention_time) WHERE ((deleted_at IS NULL) AND (retention_time IS NOT NULL) AND ((state)::text = ANY ((ARRAY['done'::character varying, 'failed'::character varying, 'reverted'::character varying])::text[])));


--
-- Name: IDX_workflow_execution_workflow_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_workflow_execution_workflow_id" ON public.workflow_execution USING btree (workflow_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_workflow_execution_workflow_id_transaction_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_workflow_execution_workflow_id_transaction_id" ON public.workflow_execution USING btree (workflow_id, transaction_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_workflow_execution_workflow_id_transaction_id_run_id_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_workflow_execution_workflow_id_transaction_id_run_id_unique" ON public.workflow_execution USING btree (workflow_id, transaction_id, run_id) WHERE (deleted_at IS NULL);


--
-- Name: idx_script_name_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_script_name_unique ON public.script_migrations USING btree (script_name);


--
-- Name: tax_rate_rule FK_tax_rate_rule_tax_rate_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_rate_rule
    ADD CONSTRAINT "FK_tax_rate_rule_tax_rate_id" FOREIGN KEY (tax_rate_id) REFERENCES public.tax_rate(id) ON DELETE CASCADE;


--
-- Name: tax_rate FK_tax_rate_tax_region_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "FK_tax_rate_tax_region_id" FOREIGN KEY (tax_region_id) REFERENCES public.tax_region(id) ON DELETE CASCADE;


--
-- Name: tax_region FK_tax_region_parent_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_region
    ADD CONSTRAINT "FK_tax_region_parent_id" FOREIGN KEY (parent_id) REFERENCES public.tax_region(id) ON DELETE CASCADE;


--
-- Name: tax_region FK_tax_region_provider_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tax_region
    ADD CONSTRAINT "FK_tax_region_provider_id" FOREIGN KEY (provider_id) REFERENCES public.tax_provider(id) ON DELETE SET NULL;


--
-- Name: application_method_buy_rules application_method_buy_rules_application_method_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.application_method_buy_rules
    ADD CONSTRAINT application_method_buy_rules_application_method_id_foreign FOREIGN KEY (application_method_id) REFERENCES public.promotion_application_method(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: application_method_buy_rules application_method_buy_rules_promotion_rule_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.application_method_buy_rules
    ADD CONSTRAINT application_method_buy_rules_promotion_rule_id_foreign FOREIGN KEY (promotion_rule_id) REFERENCES public.promotion_rule(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: application_method_target_rules application_method_target_rules_application_method_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.application_method_target_rules
    ADD CONSTRAINT application_method_target_rules_application_method_id_foreign FOREIGN KEY (application_method_id) REFERENCES public.promotion_application_method(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: application_method_target_rules application_method_target_rules_promotion_rule_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.application_method_target_rules
    ADD CONSTRAINT application_method_target_rules_promotion_rule_id_foreign FOREIGN KEY (promotion_rule_id) REFERENCES public.promotion_rule(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_mfa_factor auth_mfa_factor_auth_identity_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_mfa_factor
    ADD CONSTRAINT auth_mfa_factor_auth_identity_id_foreign FOREIGN KEY (auth_identity_id) REFERENCES public.auth_identity(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_mfa_recovery_code auth_mfa_recovery_code_auth_identity_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_mfa_recovery_code
    ADD CONSTRAINT auth_mfa_recovery_code_auth_identity_id_foreign FOREIGN KEY (auth_identity_id) REFERENCES public.auth_identity(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_verification_token auth_verification_token_auth_identity_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_verification_token
    ADD CONSTRAINT auth_verification_token_auth_identity_id_foreign FOREIGN KEY (auth_identity_id) REFERENCES public.auth_identity(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_verification_token auth_verification_token_provider_identity_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_verification_token
    ADD CONSTRAINT auth_verification_token_provider_identity_id_foreign FOREIGN KEY (provider_identity_id) REFERENCES public.provider_identity(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: capture capture_payment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.capture
    ADD CONSTRAINT capture_payment_id_foreign FOREIGN KEY (payment_id) REFERENCES public.payment(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart cart_billing_address_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_billing_address_id_foreign FOREIGN KEY (billing_address_id) REFERENCES public.cart_address(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: cart_line_item_adjustment cart_line_item_adjustment_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_line_item_adjustment
    ADD CONSTRAINT cart_line_item_adjustment_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.cart_line_item(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart_line_item cart_line_item_cart_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_line_item
    ADD CONSTRAINT cart_line_item_cart_id_foreign FOREIGN KEY (cart_id) REFERENCES public.cart(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart_line_item_tax_line cart_line_item_tax_line_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_line_item_tax_line
    ADD CONSTRAINT cart_line_item_tax_line_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.cart_line_item(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart cart_shipping_address_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_shipping_address_id_foreign FOREIGN KEY (shipping_address_id) REFERENCES public.cart_address(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: cart_shipping_method_adjustment cart_shipping_method_adjustment_shipping_method_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_shipping_method_adjustment
    ADD CONSTRAINT cart_shipping_method_adjustment_shipping_method_id_foreign FOREIGN KEY (shipping_method_id) REFERENCES public.cart_shipping_method(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart_shipping_method cart_shipping_method_cart_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_shipping_method
    ADD CONSTRAINT cart_shipping_method_cart_id_foreign FOREIGN KEY (cart_id) REFERENCES public.cart(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart_shipping_method_tax_line cart_shipping_method_tax_line_shipping_method_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart_shipping_method_tax_line
    ADD CONSTRAINT cart_shipping_method_tax_line_shipping_method_id_foreign FOREIGN KEY (shipping_method_id) REFERENCES public.cart_shipping_method(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: credit_line credit_line_cart_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credit_line
    ADD CONSTRAINT credit_line_cart_id_foreign FOREIGN KEY (cart_id) REFERENCES public.cart(id) ON UPDATE CASCADE;


--
-- Name: customer_address customer_address_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_address
    ADD CONSTRAINT customer_address_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: customer_group_customer customer_group_customer_customer_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_group_customer
    ADD CONSTRAINT customer_group_customer_customer_group_id_foreign FOREIGN KEY (customer_group_id) REFERENCES public.customer_group(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: customer_group_customer customer_group_customer_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_group_customer
    ADD CONSTRAINT customer_group_customer_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fulfillment fulfillment_delivery_address_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT fulfillment_delivery_address_id_foreign FOREIGN KEY (delivery_address_id) REFERENCES public.fulfillment_address(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: fulfillment_item fulfillment_item_fulfillment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fulfillment_item
    ADD CONSTRAINT fulfillment_item_fulfillment_id_foreign FOREIGN KEY (fulfillment_id) REFERENCES public.fulfillment(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fulfillment_label fulfillment_label_fulfillment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fulfillment_label
    ADD CONSTRAINT fulfillment_label_fulfillment_id_foreign FOREIGN KEY (fulfillment_id) REFERENCES public.fulfillment(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fulfillment fulfillment_provider_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT fulfillment_provider_id_foreign FOREIGN KEY (provider_id) REFERENCES public.fulfillment_provider(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: fulfillment fulfillment_shipping_option_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT fulfillment_shipping_option_id_foreign FOREIGN KEY (shipping_option_id) REFERENCES public.shipping_option(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: geo_zone geo_zone_service_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geo_zone
    ADD CONSTRAINT geo_zone_service_zone_id_foreign FOREIGN KEY (service_zone_id) REFERENCES public.service_zone(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: image image_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: inventory_level inventory_level_inventory_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_level
    ADD CONSTRAINT inventory_level_inventory_item_id_foreign FOREIGN KEY (inventory_item_id) REFERENCES public.inventory_item(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: notification notification_provider_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_provider_id_foreign FOREIGN KEY (provider_id) REFERENCES public.notification_provider(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order order_billing_address_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_billing_address_id_foreign FOREIGN KEY (billing_address_id) REFERENCES public.order_address(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order_change_action order_change_action_order_change_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_change_action
    ADD CONSTRAINT order_change_action_order_change_id_foreign FOREIGN KEY (order_change_id) REFERENCES public.order_change(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_change order_change_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_change
    ADD CONSTRAINT order_change_order_id_foreign FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_credit_line order_credit_line_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_credit_line
    ADD CONSTRAINT order_credit_line_order_id_foreign FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_item order_item_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.order_line_item(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_item order_item_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_order_id_foreign FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_line_item_adjustment order_line_item_adjustment_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_line_item_adjustment
    ADD CONSTRAINT order_line_item_adjustment_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.order_line_item(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_line_item_tax_line order_line_item_tax_line_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_line_item_tax_line
    ADD CONSTRAINT order_line_item_tax_line_item_id_foreign FOREIGN KEY (item_id) REFERENCES public.order_line_item(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_line_item order_line_item_totals_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_line_item
    ADD CONSTRAINT order_line_item_totals_id_foreign FOREIGN KEY (totals_id) REFERENCES public.order_item(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order order_shipping_address_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_shipping_address_id_foreign FOREIGN KEY (shipping_address_id) REFERENCES public.order_address(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order_shipping_method_adjustment order_shipping_method_adjustment_shipping_method_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_shipping_method_adjustment
    ADD CONSTRAINT order_shipping_method_adjustment_shipping_method_id_foreign FOREIGN KEY (shipping_method_id) REFERENCES public.order_shipping_method(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_shipping_method_tax_line order_shipping_method_tax_line_shipping_method_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_shipping_method_tax_line
    ADD CONSTRAINT order_shipping_method_tax_line_shipping_method_id_foreign FOREIGN KEY (shipping_method_id) REFERENCES public.order_shipping_method(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_shipping order_shipping_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_shipping
    ADD CONSTRAINT order_shipping_order_id_foreign FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_summary order_summary_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_summary
    ADD CONSTRAINT order_summary_order_id_foreign FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_transaction order_transaction_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_transaction
    ADD CONSTRAINT order_transaction_order_id_foreign FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: payment_collection_payment_providers payment_collection_payment_providers_payment_col_aa276_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_collection_payment_providers
    ADD CONSTRAINT payment_collection_payment_providers_payment_col_aa276_foreign FOREIGN KEY (payment_collection_id) REFERENCES public.payment_collection(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: payment_collection_payment_providers payment_collection_payment_providers_payment_pro_2d555_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_collection_payment_providers
    ADD CONSTRAINT payment_collection_payment_providers_payment_pro_2d555_foreign FOREIGN KEY (payment_provider_id) REFERENCES public.payment_provider(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: payment payment_payment_collection_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_payment_collection_id_foreign FOREIGN KEY (payment_collection_id) REFERENCES public.payment_collection(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: payment_session payment_session_payment_collection_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_session
    ADD CONSTRAINT payment_session_payment_collection_id_foreign FOREIGN KEY (payment_collection_id) REFERENCES public.payment_collection(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: price_list_rule price_list_rule_price_list_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price_list_rule
    ADD CONSTRAINT price_list_rule_price_list_id_foreign FOREIGN KEY (price_list_id) REFERENCES public.price_list(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: price price_price_list_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_price_list_id_foreign FOREIGN KEY (price_list_id) REFERENCES public.price_list(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: price price_price_set_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_price_set_id_foreign FOREIGN KEY (price_set_id) REFERENCES public.price_set(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: price_rule price_rule_price_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price_rule
    ADD CONSTRAINT price_rule_price_id_foreign FOREIGN KEY (price_id) REFERENCES public.price(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_category product_category_parent_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_parent_category_id_foreign FOREIGN KEY (parent_category_id) REFERENCES public.product_category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_category_product product_category_product_product_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_category_product
    ADD CONSTRAINT product_category_product_product_category_id_foreign FOREIGN KEY (product_category_id) REFERENCES public.product_category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_category_product product_category_product_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_category_product
    ADD CONSTRAINT product_category_product_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product product_collection_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_collection_id_foreign FOREIGN KEY (collection_id) REFERENCES public.product_collection(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: product_option product_option_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT product_option_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_option_value product_option_value_option_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_option_value
    ADD CONSTRAINT product_option_value_option_id_foreign FOREIGN KEY (option_id) REFERENCES public.product_option(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_tags product_tags_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT product_tags_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_tags product_tags_product_tag_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT product_tags_product_tag_id_foreign FOREIGN KEY (product_tag_id) REFERENCES public.product_tag(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product product_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_type_id_foreign FOREIGN KEY (type_id) REFERENCES public.product_type(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: product_variant_option product_variant_option_option_value_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_variant_option
    ADD CONSTRAINT product_variant_option_option_value_id_foreign FOREIGN KEY (option_value_id) REFERENCES public.product_option_value(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_variant_option product_variant_option_variant_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_variant_option
    ADD CONSTRAINT product_variant_option_variant_id_foreign FOREIGN KEY (variant_id) REFERENCES public.product_variant(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_variant product_variant_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT product_variant_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_variant_product_image product_variant_product_image_image_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_variant_product_image
    ADD CONSTRAINT product_variant_product_image_image_id_foreign FOREIGN KEY (image_id) REFERENCES public.image(id) ON DELETE CASCADE;


--
-- Name: promotion_application_method promotion_application_method_promotion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promotion_application_method
    ADD CONSTRAINT promotion_application_method_promotion_id_foreign FOREIGN KEY (promotion_id) REFERENCES public.promotion(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: promotion_campaign_budget promotion_campaign_budget_campaign_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promotion_campaign_budget
    ADD CONSTRAINT promotion_campaign_budget_campaign_id_foreign FOREIGN KEY (campaign_id) REFERENCES public.promotion_campaign(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: promotion_campaign_budget_usage promotion_campaign_budget_usage_budget_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promotion_campaign_budget_usage
    ADD CONSTRAINT promotion_campaign_budget_usage_budget_id_foreign FOREIGN KEY (budget_id) REFERENCES public.promotion_campaign_budget(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: promotion promotion_campaign_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT promotion_campaign_id_foreign FOREIGN KEY (campaign_id) REFERENCES public.promotion_campaign(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: promotion_promotion_rule promotion_promotion_rule_promotion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promotion_promotion_rule
    ADD CONSTRAINT promotion_promotion_rule_promotion_id_foreign FOREIGN KEY (promotion_id) REFERENCES public.promotion(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: promotion_promotion_rule promotion_promotion_rule_promotion_rule_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promotion_promotion_rule
    ADD CONSTRAINT promotion_promotion_rule_promotion_rule_id_foreign FOREIGN KEY (promotion_rule_id) REFERENCES public.promotion_rule(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: promotion_rule_value promotion_rule_value_promotion_rule_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promotion_rule_value
    ADD CONSTRAINT promotion_rule_value_promotion_rule_id_foreign FOREIGN KEY (promotion_rule_id) REFERENCES public.promotion_rule(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: provider_identity provider_identity_auth_identity_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.provider_identity
    ADD CONSTRAINT provider_identity_auth_identity_id_foreign FOREIGN KEY (auth_identity_id) REFERENCES public.auth_identity(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: refund refund_payment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT refund_payment_id_foreign FOREIGN KEY (payment_id) REFERENCES public.payment(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: region_country region_country_region_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.region_country
    ADD CONSTRAINT region_country_region_id_foreign FOREIGN KEY (region_id) REFERENCES public.region(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: reservation_item reservation_item_inventory_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservation_item
    ADD CONSTRAINT reservation_item_inventory_item_id_foreign FOREIGN KEY (inventory_item_id) REFERENCES public.inventory_item(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: return_reason return_reason_parent_return_reason_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.return_reason
    ADD CONSTRAINT return_reason_parent_return_reason_id_foreign FOREIGN KEY (parent_return_reason_id) REFERENCES public.return_reason(id);


--
-- Name: service_zone service_zone_fulfillment_set_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_zone
    ADD CONSTRAINT service_zone_fulfillment_set_id_foreign FOREIGN KEY (fulfillment_set_id) REFERENCES public.fulfillment_set(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shipping_option shipping_option_provider_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT shipping_option_provider_id_foreign FOREIGN KEY (provider_id) REFERENCES public.fulfillment_provider(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: shipping_option_rule shipping_option_rule_shipping_option_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_option_rule
    ADD CONSTRAINT shipping_option_rule_shipping_option_id_foreign FOREIGN KEY (shipping_option_id) REFERENCES public.shipping_option(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shipping_option shipping_option_service_zone_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT shipping_option_service_zone_id_foreign FOREIGN KEY (service_zone_id) REFERENCES public.service_zone(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: shipping_option shipping_option_shipping_option_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT shipping_option_shipping_option_type_id_foreign FOREIGN KEY (shipping_option_type_id) REFERENCES public.shipping_option_type(id) ON UPDATE CASCADE;


--
-- Name: shipping_option shipping_option_shipping_profile_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT shipping_option_shipping_profile_id_foreign FOREIGN KEY (shipping_profile_id) REFERENCES public.shipping_profile(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: stock_location stock_location_address_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_location
    ADD CONSTRAINT stock_location_address_id_foreign FOREIGN KEY (address_id) REFERENCES public.stock_location_address(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: store_currency store_currency_store_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_currency
    ADD CONSTRAINT store_currency_store_id_foreign FOREIGN KEY (store_id) REFERENCES public.store(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: store_locale store_locale_store_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_locale
    ADD CONSTRAINT store_locale_store_id_foreign FOREIGN KEY (store_id) REFERENCES public.store(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict nV2J2rOYgZTQ7YpmRlMFGi2BVBOsG0hfr6UuISm7zHvB62cnh5AuWJz9Di9wBVn

