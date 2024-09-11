
@AbapCatalog.sqlViewName: 'ZISALESITEM1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales item interface view'
define view  ZST7i_sales_item1 as select from  zst7_sales_item {
key itm_key,
parentkey,
mat_num,
mat_grp,
itm_type,
@Semantics.amount.currencyCode: 'currency'
item_value,
currency
}
