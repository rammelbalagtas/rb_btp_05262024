@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_TEST_TABLE2
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TEST_TABLE2
{
  key Id,
  CustomerId,
  MandatoryField,
  OptionalField1,
  OptionalField2,
  OptionalField3,
  DateField,
  TimeField,
  Timestamp,
  Email,
  AppServerPath,
  IntegerValue,
  TypeDecAmount,
  CreatedBy,
  CreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt
  
}
