@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Z_I_SIGNATURE'
define root view entity Z_I_SIGNATURE as select from zsignature
{
    key organisation as Organisation,
    key pos as Pos,
    key username as Username,
    col1 as Col1,
    col2 as Col2,
    @Aggregation.default: #SUM
    count1 as Count1,
    signature as Signature
}
