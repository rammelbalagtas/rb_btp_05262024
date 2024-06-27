@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_DMOUPLOAD2
  provider contract transactional_query
  as projection on ZR_DMOUPLOAD
{
  key TravelId,
  AgencyId,
  CustomerId,
  Attachment,
  Mimetype,
  Filename,
  CreatedBy,
  CreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt
  
}
