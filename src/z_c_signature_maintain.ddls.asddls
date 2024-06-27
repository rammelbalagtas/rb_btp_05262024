@EndUserText.label: 'Signature Read View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.query.implementedBy: 'ABAP:ZCL_SIGNATURE_READ'
@Metadata.allowExtensions: true
define root view entity Z_C_SIGNATURE_MAINTAIN 
 provider contract transactional_query
 as projection on Z_I_SIGNATURE
{
    key Organisation,
    key Pos,
    key Username,
    Col1,
    Col2,
//    @Aggregation.default: #SUM
    Count1,
    Signature
}
