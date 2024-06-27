@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Z_DIMENSION_CARRIER'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

@Analytics.dataCategory: #DIMENSION
define view entity Z_DIMENSION_CARRIER as select from /dmo/carrier
{
    @ObjectModel.text.element: [ 'AirlineName' ]
    key carrier_id as Airline,
        name as AirlineName,
        currency_code as CurrencyCode,
        local_created_by as LocalCreatedBy,
        local_created_at as LocalCreatedAt,
        local_last_changed_by as LocalLastChangedBy,
        local_last_changed_at as LocalLastChangedAt,
        last_changed_at as LastChangedAt
}
