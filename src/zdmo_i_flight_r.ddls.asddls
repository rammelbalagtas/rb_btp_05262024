@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier View - CDS Data Model'
@Search.searchable: true

//@UI: {
//    headerInfo: {
//        typeName: 'ZDMO_I_Flight_R',
//        typeNamePlural: 'Flights'
//    },
//    selectionVariant: [
//        {
//            qualifier: 'CarrierAA',
//            text: 'Carrier AA',
//            filter: 'carrier_id EQ "AA"'
//        },
//        {
//            qualifier: 'CarrierAZ',
//            text: 'Carrier AZ',
//            filter: 'carrier_id EQ "AZ"'
//        }
//    ]
//}

//@UI.selectionPresentationVariant: [{
//  id: '',
//  text: 'Cheap',
//  selectionVariantQualifier: 'Default',
//  presentationVariantQualifier: 'Default',
//  qualifier: 'Cheap'
//}]
//
//@UI.selectionVariant: [
//  {
//    text: 'Cheap',
//    qualifier: 'Default'
//  }
//]
//
//@UI.presentationVariant: [
//  {
//    qualifier: 'Default',
//    sortOrder: [{by: 'GrossAmount', direction: #ASC }]
//  }
//]

//    presentationVariant: [{
////        sortOrder: [{
////            by: 'connection_id',
////            direction: #ASC
////        }],
//       qualifier: 'pvariant',
//       groupBy : [ 'carrier_id' ],
////       total : [ 'seats_max' ],
//        visualizations: [{
//            type: #AS_LINEITEM
//        }],
//        requestAtLeast: [ 'carrier_id' ]
//    }],


@UI.selectionVariant: [
  {
    text: 'Carrier AA',
    qualifier: 'CarrierAA',
    filter: 'carrier_id EQ "AA"'
  },
  {
    text: 'Carrier AZ',
    qualifier: 'CarrierAZ',
    filter: 'carrier_id EQ "AZ"'
  }
]

@UI.presentationVariant: [
  {
    qualifier: 'CarrierAA',
    text: 'Carrier AA',
    sortOrder: [
      {
        by: 'connection_id',
        direction: #ASC
      }
    ],
    visualizations: [{type: #AS_LINEITEM, qualifier: 'CarrierAA'}]
  },
  {
    qualifier: 'CarrierAZ',
    text: 'Carrier AZ',
    sortOrder: [
      {
        by: 'flight_date',
        direction: #DESC
      }
    ],
    visualizations: [{type: #AS_LINEITEM, qualifier: 'CarrierAZ'}]
  }
] 

@UI.selectionPresentationVariant: [
  {
    id: 'CarrierAA',
    text: 'Carrier AA',
    presentationVariantQualifier: 'CarrierAA',
    selectionVariantQualifier: 'CarrierAA',
    qualifier: 'CarrierAA'
  },
  {
    id: 'CarrierAZ',
    text: 'Carrier AZ',
    presentationVariantQualifier: 'CarrierAZ',
    selectionVariantQualifier: 'CarrierAZ',
    qualifier: 'CarrierAZ'
  }
]

define root view entity ZDMO_I_Flight_R 
  as select from /dmo/flight as Flight

  association [1] to ZDMO_I_Carrier as _Airline on $projection.carrier_id = _Airline.AirlineID

{
  @UI: {
         lineItem:       [ { position: 10,
                             importance: #HIGH }  ],
         selectionField: [ { position: 10 } ] }
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @ObjectModel.text.association: '_Airline'
//      @Consumption.filter.mandatory: true
//      @Consumption.filter.defaultValue: 'AA'
//      @Consumption.derivation: { lookupEntity: 'ZDMO_I_Carrier',
//      resultElement: 'carrier_id',
//      binding: [{ targetElement: 'CompanyCode', type: #CONSTANT, value: 'AA' },
//                { targetElement: 'CompanyCode', type: #CONSTANT, value: 'BB' }
//      ]}  
  key Flight.carrier_id     as carrier_id,

  @UI: { lineItem:       [ { position: 20,
                             importance: #HIGH } ],
         selectionField: [ { position: 20 } ] }
  key Flight.connection_id  as connection_id,

  @UI: { lineItem:       [ { position: 30,
                             importance: #HIGH } ],
         selectionField: [ { position: 30 } ] }
  key Flight.flight_date    as flight_date,
  
//Virtual element 
    @UI: { lineItem:       [ { position: 80 } ] }
//    @Aggregation.default: #SUM
//    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_CALCULATION_DISCOUNT'
    cast(0 as abap.int4 ) as newfield, 

//      @Aggregation.default: #SUM
  @UI: { lineItem:       [ { position: 40,
                             importance: #HIGH,
                             qualifier: 'CarrierAA' },
                            { position: 40,
                             importance: #HIGH,
                             qualifier: 'CarrierAZ' } ],
         selectionField: [ { position: 40 } ] }
      @Semantics.amount.currencyCode: 'currency_code'
      Flight.price          as price,

      Flight.currency_code  as currency_code,

  @UI: { lineItem:       [ { position: 50,
                             importance: #HIGH } ],
         selectionField: [ { position: 50 } ] }
//  @UI: { lineItem:       [ { position: 50,
//                             importance: #HIGH } ],
//         selectionField: [ { position: 10 } ] }
//      @UI.lineItem: [ { selection: 10, label: 'Plane Type' } ]
//      @Search.defaultSearchElement: true
//      @Search.fuzzinessThreshold: 0.7
//      @Consumption.filter.mandatory: true
      Flight.plane_type_id  as plane_type_id,

  @UI: { lineItem:       [ { position: 60,
                             importance: #HIGH } ] }
//      @Aggregation.default: #SUM
      Flight.seats_max      as seats_max,

  @UI: { lineItem:       [ { position: 70,
                             importance: #HIGH,
                             qualifier: 'CarrierAZ' } ],
         selectionField: [ { position: 70 } ] }
//      @Aggregation.default: #SUM
      Flight.seats_occupied as seats_occupied, 

      /* Associations */
      _Airline
}
