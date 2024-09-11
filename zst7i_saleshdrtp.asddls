

@AbapCatalog.sqlViewName: 'ZISALESHDR1TP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales header TP view'
@VDM.viewType: #TRANSACTIONAL
@ObjectModel.transactionalProcessingEnabled: true
@ObjectModel.writeActivePersistence:'ZST7_SALES_HEAD'
@ObjectModel.modelCategory: #BUSINESS_OBJECT
@ObjectModel.compositionRoot: true
@ObjectModel.createEnabled: true
@ObjectModel.deleteEnabled: true
@ObjectModel.updateEnabled: true
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
define view zst7i_saleshdrtp as select from zst7i_sales_hdr1     
association [1..*] to zst7i_salesitemtp as _salesitm on $projection.sd_key = _salesitm.parentkey{
key sd_key,
doc_date,
name,
catg,
order_type,
order_reason,
@Semantics.amount.currencyCode: 'currency'
net_value,
currency,
@ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
_salesitm
}
