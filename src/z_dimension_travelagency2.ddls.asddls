@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Z_Dimension_TravelAgency2'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Analytics.dataCategory: #DIMENSION
define view entity Z_Dimension_TravelAgency2 
as select from /dmo/agency
association [0..1] to I_Country as _Country on $projection.Country = _Country.Country
{
    @ObjectModel.text.element: [ 'TravelAgencyName' ]
    key agency_id as TravelAgency,
    name as TravelAgencyName,
    street as Street,
    postal_code as PostalCode,
      @Semantics.address.city: true
    city as City,
      @ObjectModel.foreignKey.association: '_Country'
      @Semantics.address.country: true
    country_code as Country,
    _Country
}
