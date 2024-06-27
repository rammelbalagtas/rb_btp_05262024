@AbapCatalog.sqlViewName: 'ZCUBEFLIGHTBOOK'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight Bookings'

@Analytics.dataCategory: #CUBE
define view Z_Cube_FlightBook2 as select from /dmo/booking
  association [0..1] to I_CalendarDate           as _CalendarDate on  $projection.FlightDate = _CalendarDate.CalendarDate
  association [0..1] to Z_DIMENSION_CARRIER      as _Airline      on  $projection.Airline = _Airline.Airline
  association [0..1] to Z_Dimension_Connection2  as _Connection   on  $projection.Airline          = _Connection.Airline
                                                                  and $projection.FlightConnection = _Connection.FlightConnection
  association [0..1] to Z_Dimension_Customer2     as _Customer     on  $projection.Customer = _Customer.Customer
{

/** DIMENSIONS **/

  @EndUserText.label: 'Airline'
  @ObjectModel.foreignKey.association: '_Airline'
  carrier_id as Airline,

  @EndUserText.label: 'Connection'
  @ObjectModel.foreignKey.association: '_Connection'
  connection_id as FlightConnection,

  @EndUserText.label: 'Flight Date'
  @ObjectModel.foreignKey.association: '_CalendarDate'
  flight_date as FlightDate,

  @EndUserText.label: 'Book No.'
  booking_id as BookingId,
  
  @EndUserText.label: 'Customer'
  @ObjectModel.foreignKey.association: '_Customer'
  customer_id as Customer,

//  @EndUserText.label: 'Travel Agency'
//  @ObjectModel.foreignKey.association: '_TravelAgency'
//  agencynum              as TravelAgency,

  @EndUserText.label: 'Flight Year'
  _CalendarDate.CalendarYear,

  @EndUserText.label: 'Flight Month'
  _CalendarDate.CalendarMonth,

  @EndUserText.label: 'Customer Country'
  @ObjectModel.foreignKey.association: '_CustomerCountry'
  _Customer.Country      as CustomerCountry,

  @EndUserText.label: 'Customer City'
  _Customer.City         as CustomerCity,

//  @EndUserText.label: 'Travel Agency Country'
//  @ObjectModel.foreignKey.association: '_TravelAgencyCountry'
//  _TravelAgency.Country  as TravelAgencyCountry,
//
//  @EndUserText.label: 'Travel Agency Customer City'
//  _TravelAgency.City     as TravelAgencyCity,

  /** MEASURES **/

  @EndUserText.label: 'Total of Bookings'
  @DefaultAggregation: #SUM
  1                      as TotalOfBookings,

  @EndUserText.label: 'Booking Price'
  @DefaultAggregation: #SUM
  @Semantics.amount.currencyCode: 'Currency'
  flight_price as BookingPrice,

  @EndUserText.label: 'Currency'
//  @Semantics.currencyCode: true
  currency_code as Currency,

  // Associations
  _Airline,
  _CalendarDate,
  _CalendarDate._CalendarMonth,
  _CalendarDate._CalendarYear,
  _Connection,
  _Customer,
  _Customer._Country     as _CustomerCountry
//  _TravelAgency,
//  _TravelAgency._Country as _TravelAgencyCountry
  
}
