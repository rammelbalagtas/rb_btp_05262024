@EndUserText.label: 'Consumption View for Ses Excel Data'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true 
define view entity zc_ses_excel
  as projection on zi_ses_excel_data
{
  key end_user,
  key Entrysheet,
  key Ebeln,
  key Ebelp,
      Ext_Number,
      Quantity,
      Base_Uom,
      Fin_Entry,
      Error,
      Error_Message,
      /* Associations */
      _ses_file : redirected to parent zc_ses_parent
}
