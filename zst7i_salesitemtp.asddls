
@AbapCatalog.sqlViewName: 'ZISALESITM1TP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'sales item tp view'
@VDM.viewType: #TRANSACTIONAL
@ObjectModel.transactionalProcessingEnabled: true
@ObjectModel.writeActivePersistence:'ZST7_SALES_ITEM'
@ObjectModel.createEnabled: true
@ObjectModel.deleteEnabled: true
@ObjectModel.updateEnabled: true
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
define view zst7i_salesitemtp as select from ZST7i_sales_item1
association [1..1] to zst7i_saleshdrtp as _saleshdr on $projection.parentkey = _saleshdr.sd_key
{
key itm_key,
parentkey,
mat_num,
mat_grp,
itm_type,
@Semantics.amount.currencyCode: 'currency'
item_value,
currency,
@ObjectModel.association.type: [#TO_COMPOSITION_ROOT,#TO_COMPOSITION_PARENT]
_saleshdr
}
