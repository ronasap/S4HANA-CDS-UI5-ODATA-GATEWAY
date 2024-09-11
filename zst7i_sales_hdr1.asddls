@AbapCatalog.sqlViewName: 'ZST7ISALESHDR1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Header interface view'
define view zst7i_sales_hdr1 as select from ZST7_SALES_HEAD {
key sd_key,
doc_date,
name,
catg,
order_type,
order_reason,
@Semantics.amount.currencyCode: 'currency'
net_value,
currency
}
