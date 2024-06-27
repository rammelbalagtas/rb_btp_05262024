@EndUserText.label: 'DPCTR - transmission information Singlet'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZI_DpctrTransmissionIn_S
  as select from I_Language
    left outer join I_CstmBizConfignLastChgd on I_CstmBizConfignLastChgd.ViewEntityName = 'ZI_DPCTRTRANSMISSIONIN'
  composition [0..*] of ZI_DpctrTransmissionIn as _DpctrTransmissionIn
{
  key 1 as SingletonID,
  _DpctrTransmissionIn,
  I_CstmBizConfignLastChgd.LastChangedDateTime as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
