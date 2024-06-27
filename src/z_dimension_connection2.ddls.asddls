@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Z_Dimension_Connection2'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Analytics.dataCategory: #DIMENSION
define view entity Z_Dimension_Connection2
    as select from /dmo/connection
    association [0..1] to Z_DIMENSION_CARRIER as _Airline on $projection.Airline = _Airline.Airline
{
    @ObjectModel.foreignKey.association: '_Airline'
    key carrier_id as Airline,
    @ObjectModel.text.element: [ 'Destination' ]
    key connection_id as FlightConnection,
    @Semantics.text: true
      concat(airport_from_id,
        concat(' -> ', airport_to_id)) as Destination,
    airport_from_id as AirportFromId,
    airport_to_id as AirportToId,
    _Airline
}
