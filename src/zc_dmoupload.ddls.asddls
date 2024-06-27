@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_DMOUPLOAD
  provider contract transactional_query
  as projection on ZR_DMOUPLOAD
{
  key TravelId,
  AgencyId,
  CustomerId,
  Attachment,
  Mimetype,
  Filename,
  @Semantics.largeObject:
  { mimeType: 'downloadMimeType',
    fileName: 'downloadFileName' } 
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_DOWNLOAD_VIRTUAL'
  virtual downloadFile : /dmo/attachment,
  @Semantics.mimeType: true
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_DOWNLOAD_VIRTUAL'
  virtual downloadMimeType : abap.char(128),
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_DOWNLOAD_VIRTUAL'
  virtual downloadFileName : abap.char(128),
  CreatedBy,
  CreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt 
}
