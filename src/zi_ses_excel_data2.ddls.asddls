@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SES_excel_data'
@Metadata.allowExtensions: true 
define view entity zi_ses_excel_data2
  as select from zses_db
  association to parent zi_ses_parent2 as _ses_file on $projection.end_user = _ses_file.end_user
{
  key end_user              as end_user,
  key zses_db.entrysheet    as Entrysheet,
  key zses_db.ebeln         as Ebeln,
  key zses_db.ebelp         as Ebelp,
      zses_db.ext_number    as Ext_Number,
//      zses_db.begdate       as Begdate,
//      zses_db.enddate       as Enddate,
      zses_db.quantity      as Quantity,
      zses_db.base_uom      as Base_Uom,
      zses_db.fin_entry     as Fin_Entry,
      zses_db.error         as Error,
      zses_db.error_message as Error_Message,
      _ses_file
}
