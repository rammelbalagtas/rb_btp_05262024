@EndUserText.label: 'Test Upload'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.query.implementedBy: 'ABAP:ZDMO_CL_TRAVEL_UQ'
@Metadata.allowExtensions: true
define root view entity zdmo_c_upload 
 provider contract transactional_query
  as projection on zdmo_i_upload
{
    key Travel_Id,
    Agency_Id,
    Customer_Id,
    Attachment,
    Mimetype,
    Filename,
    _Messages
}
