@EndUserText.label: 'Consumption View for File'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity zc_ses_parent
  provider contract transactional_query
  as projection on zi_ses_parent
{
  key End_User,
      @EndUserText.label: 'Processing Status'
      Status,
      Attachment,
      MimeType,
      Filename,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      @EndUserText.label: 'Last Action On'
      LocalLastChangedAt,
      LastChangedAt,
      
      /* Associations */
      _ses_excel : redirected to composition child zc_ses_excel
}
