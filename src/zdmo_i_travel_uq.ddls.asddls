@EndUserText.label: 'Custom entity for unmanaged travel query'
@ObjectModel.query.implementedBy:'ABAP:ZDMO_CL_TRAVEL_UQ'

@UI.headerInfo: {
        typeName: 'ZDMO_I_Flight_R',
        typeNamePlural: 'Flights'
    }

    
@UI.selectionVariant: [
  {
    text: 'Agency',
    qualifier: 'Agency'
//    filter: 'Agency_ID EQ "70001"'
  },
  {
    text: 'Customer',
    qualifier: 'Customer'
//    filter: 'Customer_ID EQ "1"'
  }
]

@UI.presentationVariant: [
  {
    qualifier: 'Agency',
    text: 'Agency',
    sortOrder: [
      {
        by: 'Agency_ID',
        direction: #ASC
      }
    ],
    visualizations: [{type: #AS_LINEITEM}]
  },
  {
    qualifier: 'Customer',
    text: 'Customer',
    sortOrder: [
      {
        by: 'Customer_ID',
        direction: #ASC
      }
    ],
    maxItems: 1,
    visualizations: [{type: #AS_LINEITEM}]
  }
] 

@UI.selectionPresentationVariant: [
  {
    id: 'Agency',
    text: 'Agency',
    presentationVariantQualifier: 'Agency',
    selectionVariantQualifier: 'Agency',
    qualifier: 'Agency'
  },
  {
    id: 'Customer',
    text: 'Customer',
    presentationVariantQualifier: 'Customer',
    selectionVariantQualifier: 'Customer',
    qualifier: 'Customer'
  }
]

define root custom entity ZDMO_I_TRAVEL_UQ
{

     @UI: { lineItem:    [ { position: 10, label: 'Travel ID',
                             importance: #HIGH } ],
         selectionField: [ { position: 10 } ] }
  key Travel_ID     : abap.numc( 8 );
     @UI: { lineItem:    [ { position: 20, label: 'Agency',
                             importance: #HIGH } ],
         selectionField: [ { position: 20 } ] }
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Agency_StdVH', element: 'AgencyID'  }, useForValidation: true }]
      Agency_ID     : abap.numc( 6 );
     @UI: { lineItem:    [ { position: 30, label: 'Customer',
                             importance: #HIGH } ],
         selectionField: [ { position: 30 } ] }
      Customer_ID   : abap.numc( 6 );
     @UI: { lineItem:    [ { position: 40, label: 'Begin Date',
                             importance: #HIGH } ],
         selectionField: [ { position: 40 } ] }
      Begin_Date    : abap.dats;
     @UI: { lineItem:    [ { position: 50, label: 'End Date',
                             importance: #HIGH } ],
         selectionField: [ { position: 50 } ] }
      End_Date      : abap.dats;
//      @Aggregation.default: #SUM
     @UI: { lineItem:    [ { position: 60, label: 'Booking Fee',
                             importance: #HIGH } ],
         selectionField: [ { position: 60 } ] }
      @Semantics.amount.currencyCode: 'Currency_Code'
      Booking_Fee   : abap.dec( 17, 3 );
     @UI: { lineItem:    [ { position: 70, label: 'Total Price',
                             importance: #HIGH } ],
         selectionField: [ { position: 70 } ] }
      @Semantics.amount.currencyCode: 'Currency_Code'
//      @Aggregation.default: #SUM
      Total_Price   : abap.dec( 17, 3 );
     @UI: { lineItem:    [ { position: 80, label: 'Currency Code',
                             importance: #HIGH } ],
         selectionField: [ { position: 80 } ] }
      Currency_Code : abap.cuky;
      Status        : abap.char( 1 );
      LastChangedAt : timestampl;
}
