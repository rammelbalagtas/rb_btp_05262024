@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_TEST_TABLE3
  as select from ZTEST_TABLE3 as Transmission
{
  key id as Id,
  destination as Destination,
  tranid as Tranid,
  simulation as Simulation,
  msgtype as Msgtype,
  extractdate as Extractdate,
  extractweek as Extractweek,
  material_hidden as MaterialHidden,
  po_hidden as PoHidden,
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
