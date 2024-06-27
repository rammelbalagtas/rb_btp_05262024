@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoice Excel'
//@Metadata.ignorePropagatedAnnotations: true
//@ObjectModel.usageType:{
//    serviceQuality: #X,
//    sizeCategory: #S,
//    dataClass: #MIXED
//}
define view entity ZI_Invoceexcel2 as select from zinvoiceexcel
 association to parent ZI_INVOICETABLE2 as _Invoice     
 on  $projection.Invoice = _Invoice.Invoice
{
    key invoice as Invoice,
    a as A,
    b as B,
    c as C,
    d as D,
    _Invoice
}
