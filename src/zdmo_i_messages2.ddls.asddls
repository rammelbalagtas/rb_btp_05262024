@EndUserText.label: 'Custom entity for unmanaged travel query'
@ObjectModel.query.implementedBy:'ABAP:ZDMO_TEST_UPLOAD'

define custom entity ZDMO_I_MESSAGES2
{
   
  @UI: { lineItem:    [ { position: 10, label: 'Travel ID'} ] }
//  @UI.fieldGroup: [{ position: 10 , label: 'Travel ID', qualifier: 'MESSAGES' }]
  key Travel_ID     : abap.numc( 8 );
  @UI: { lineItem:    [ { position: 20, label: 'Message ID'} ] }
//  @UI.fieldGroup: [{ position: 20 , label: 'Message ID', qualifier: 'MESSAGES' }]
  key Message_ID     : abap.numc( 6 );
  @UI: { lineItem:    [ { position: 30, label: 'Message'} ] }
//  @UI.fieldGroup: [{ position: 30 , label: 'Message', qualifier: 'MESSAGES' }]
  Message: abap.char( 20 );
   _Travel : association to parent zdmo_i_upload 
        on $projection.Travel_ID = _Travel.Travel_Id ;
}
