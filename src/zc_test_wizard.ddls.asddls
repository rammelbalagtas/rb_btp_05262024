@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_TEST_WIZARD
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TEST_WIZARD
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
  StringText,
  IntegerValue,
  TypeDecAmount,
  TypeRawstring,
  CreatedBy,
  CreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt
  
}
