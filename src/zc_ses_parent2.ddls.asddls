@EndUserText.label: 'Consumption View for File'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity zc_ses_parent2
  provider contract transactional_query
  as projection on zi_ses_parent2
{
  key end_user,
      @EndUserText.label: 'Processing Status'
      FileStatus as status,
      Attachment,
      MimeType,
      Filename,
      Local_Created_By,
      Local_Created_At,
      Local_Last_Changed_By,
      @EndUserText.label: 'Last Action On'
      Local_Last_Changed_At,
      Last_Changed_At,
      CriticalityStatus,
      HideExcel,
      
      /* Associations */
      _ses_excel : redirected to composition child zc_ses_excel2
}
