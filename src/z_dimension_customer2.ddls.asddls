@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Z_Dimension_Customer2'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Analytics.dataCategory: #DIMENSION
define view entity Z_Dimension_Customer2 
as select from /dmo/customer
association [0..1] to I_Country as _Country on $projection.Country = _Country.Country
{   
    @ObjectModel.text.element: [ 'Name' ]
    key customer_id as Customer,
    @Semantics.text: true
    concat(first_name, last_name) as Name,
    title as Title,
    street as Street,
    postal_code as PostalCode,
    @Semantics.address.city: true
    city as City,
    @ObjectModel.foreignKey.association: '_Country'
    @Semantics.address.country: true
    country_code as Country,
    _Country
}
