@AbapCatalog.sqlViewName: 'ZST9_PURHDR2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Order Items'
define view ZST9_PurOrderDet as select from ekpo
association [1..1] to ZST9_PurOrderHdr as _POHdr on $projection.PurchaseOrder = _POHdr.PurchaseOrder
{
key  ebeln as PurchaseOrder,
key ebelp as PurchaseOrderItem,
matnr as Material,
_POHdr.Supplier,
txz01 as PurchaseOrderItemText,
matkl as MaterialGroup,
werks as Plant,
lgort as StorageLocation,
concat_with_space(werks,lgort,1) as StorageDetails,
@Semantics.quantity.unitOfMeasure: 'OrderUnit'
menge as OrderQuantity,
@Semantics.unitOfMeasure: true
meins as OrderUnit,
netpr as NetPrice  ,
cast( netpr as abap.fltp(16) )*  0.35 as TaxAmount,
netwr as NetOrderValue,
cast(netwr as abap.fltp(16)) * 0.75 as DiscountedNetOrder,
ceil(cast(netwr as abap.fltp(16))  *  0.75) as DiscountedRoundedNetOrder,
@ObjectModel.association.type: [#TO_COMPOSITION_PARENT ,#TO_COMPOSITION_ROOT]
_POHdr
}
