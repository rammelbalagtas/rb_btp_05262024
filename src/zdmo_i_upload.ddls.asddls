@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'zdmoupload'
define root view entity zdmo_i_upload as select from zdmoupload
composition [0..*] of ZDMO_I_MESSAGES2 as _Messages
{ 
    key travel_id as Travel_Id,
    agency_id as Agency_Id,
    customer_id as Customer_Id,
       @Semantics.largeObject:
      { mimeType: 'Mimetype',
      fileName: 'Filename',
      acceptableMimeTypes: [ 'text/csv', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ],
      contentDispositionPreference: #INLINE }  // This will store the File into our table 
    attachment as Attachment,
    @Semantics.mimeType: true
    mimetype as Mimetype,
    filename as Filename,
    _Messages
}
