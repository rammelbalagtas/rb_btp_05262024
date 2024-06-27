@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_TEST_TABLE2
  as select from ZTEST_TABLE2
{
  key id as Id,
  customer_id as CustomerId,
  mandatory_field as MandatoryField,
  optional_field1 as OptionalField1,
  optional_field2 as OptionalField2,
  optional_field3 as OptionalField3,
  date_field as DateField,
  time_field as TimeField,
  timestamp as Timestamp,
  email as Email,
  app_server_path as AppServerPath,
  integer_value as IntegerValue,
  type_dec_amount as TypeDecAmount,
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
