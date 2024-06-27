//@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_DMOUPLOAD
  as select from zdmoupload as Upload
{
  key travel_id as TravelId,
  agency_id as AgencyId,
  customer_id as CustomerId,
  @Semantics.largeObject:
  { mimeType: 'Mimetype',
    fileName: 'Filename',
    acceptableMimeTypes: [ 'text/csv', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ],
    contentDispositionPreference: #INLINE } 
  attachment as Attachment,
  mimetype as Mimetype,
  filename as Filename,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
  
}
