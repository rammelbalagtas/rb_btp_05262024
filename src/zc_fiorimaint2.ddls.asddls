@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_FIORIMAINT2
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_FIORIMAINT2
{
  key ProcessKey,
  ScriptId,
  ProcessDesc,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt
  
}
