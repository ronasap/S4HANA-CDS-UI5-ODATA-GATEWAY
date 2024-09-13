@AbapCatalog.sqlViewName: 'ZST9_PURHDR1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Order Header'
@VDM.viewType:  #BASIC
@OData.publish: true
define view ZST9_PurOrderHdr as select from ekko
association [0..*] to ZST9_PurOrderDet as _POItem on $projection.PurchaseOrder = _POItem.PurchaseOrder

{
    key ebeln as PurchaseOrder,
//    bsart as PurOrderType,
case (bsart)
when 'RQ' then 'External Quotation'
when 'UB' then 'Stock Transport Order'
else 'Other Order'
end as PurOrderType,
    ekorg as PurOrganisation,
    ekgrp as PurGroup,
    lifnr as Supplier,
    waers as DocCurrency,
    aedat as CreationDate,
@ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
    _POItem
} 
