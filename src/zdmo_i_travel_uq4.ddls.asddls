@EndUserText.label: 'Custom entity for unmanaged travel query'
@ObjectModel.query.implementedBy:'ABAP:ZDMO_CL_TRAVEL_UQ'

define root custom entity ZDMO_I_TRAVEL_UQ4
{

        @UI.facet: [
        { id:     'Travel',
        purpose:  #STANDARD,
        type:     #IDENTIFICATION_REFERENCE,
        label:    'Travel',
        position: 10 } 
        ]
  
    @UI: { lineItem:    [ { position: 10, label: 'Travel ID',
                             importance: #HIGH } ] ,
           identification: [ { position: 10 , label: 'Travel ID' }, { type: #FOR_ACTION, dataAction: 'createFile', label: 'Create File' } ],
         selectionField: [ { position: 10 } ] }
  key Travel_ID     : abap.numc( 8 );
     @UI: { lineItem:    [ { position: 20, label: 'Agency',
                             importance: #HIGH } ],
            identification: [ { position: 20 , label: 'Agency ID' } ],
         selectionField: [ { position: 20 } ] }
      Agency_ID     : abap.numc( 6 );
     @UI: { lineItem:    [ { position: 30, label: 'Customer',
                             importance: #HIGH } ],
         identification: [ { position: 30 , label: 'Customer' } ],
         selectionField: [ { position: 30 } ] }
      Customer_ID   : abap.numc( 6 );
     @UI: { lineItem:    [ { position: 40, label: 'Begin Date',
                             importance: #HIGH } ],
         identification: [ { position: 40 , label: 'Customer' } ],
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
//      @Semantics.amount.currencyCode: 'Currency_Code'
      Booking_Fee   : abap.dec( 17, 3 );
     @UI: { lineItem:    [ { position: 70, label: 'Total Price',
                             importance: #HIGH } ],
         selectionField: [ { position: 70 } ] }
//      @Semantics.amount.currencyCode: 'Currency_Code'
//      @Aggregation.default: #SUM
      Total_Price   : abap.dec( 17, 3 );
//     @UI: { lineItem:    [ { position: 80, label: 'Currency Code',
//                             importance: #HIGH } ],
//         selectionField: [ { position: 80 } ] }
      Currency_Code : abap.cuky;
      Status        : abap.char( 1 );
      LastChangedAt : timestampl;
      @Semantics.largeObject:
      { mimeType: 'Mimetype',
        fileName: 'Filename',
        acceptableMimeTypes: [ 'text/csv', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ],
        contentDispositionPreference: #INLINE }  // This will store the File into our table 
//     @UI: { lineItem:    [ { position: 100, label: 'Attachment' } ],
//            identification: [ { position: 20 , label: 'Agency ID' } ] }
     @UI.identification: [ { position: 20 , label: 'Agency ID' } ]
      Attachment                                                                                    : /dmo/attachment;
      @Semantics.mimeType: true
      @UI.hidden: true
      Mimetype                                                                                       : abap.char(128);
      @UI.hidden: true
      Filename                                                                                       : abap.char(128);
}
