@EndUserText.label: 'DPCTR - transmission information'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZI_DpctrTransmissionIn
  as select from ZDPCTR_TRANH
  association to parent ZI_DpctrTransmissionIn_S as _DpctrTransmissioAll on $projection.SingletonID = _DpctrTransmissioAll.SingletonID
{
  key TRAN_ID as TranId,
  SIMULATION as Simulation,
  TRAN_TYPE as TranType,
  TRAN_DATE as TranDate,
  TRAN_TIME as TranTime,
  TRAN_STATUS as TranStatus,
  TOT_RCD_NO as TotRcdNo,
  CRT_DATE as CrtDate,
  CRT_TIME as CrtTime,
  @Semantics.user.createdBy: true
  CRT_USER as CrtUser,
  SELECTION_DATE as SelectionDate,
  SELECTION_MONTH as SelectionMonth,
  @Consumption.hidden: true
  1 as SingletonID,
  _DpctrTransmissioAll
  
}
