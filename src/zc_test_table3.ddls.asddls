@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_TEST_TABLE3
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TEST_TABLE3
{
  key Id,
  Destination,
  Tranid,
  Simulation,
  Msgtype,
  Extractdate,
  Extractweek,
  MaterialHidden,
  PoHidden,
  CreatedBy,
  CreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt
  
}
