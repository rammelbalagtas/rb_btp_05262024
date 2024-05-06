@EndUserText.label: 'Z_C_SIGNATURE_MAINTAIN'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity Z_C_SIGNATURE_MAINTAIN 
 provider contract transactional_query
 as projection on Z_I_SIGNATURE
{
    key Organisation,
    key Pos,
    key Username,
    Col1,
    Col2,
    Signature
}
