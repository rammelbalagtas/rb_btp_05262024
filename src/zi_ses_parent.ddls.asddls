@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Excel File Table'
define root view entity zi_ses_parent
  as select from   zses_user           as _user
    left outer join zses_file_table2 as _ses_file on _user.bname = _ses_file.end_user
  composition [0..*] of zi_ses_excel_data as _ses_excel
{
  key _user.bname                                                                                              as End_User,
      _ses_file.status                                                                                         as Status,
      @Semantics.largeObject:
      { mimeType: 'MimeType',
      fileName: 'Filename',
      acceptableMimeTypes: [ 'text/csv', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ],
      contentDispositionPreference: #INLINE }  // This will store the File into our table 
      _ses_file.attachment                                                                                     as Attachment,
      @Semantics.mimeType: true
      _ses_file.mimetype                                                                                       as MimeType,
      _ses_file.filename                                                                                       as Filename,
      @Semantics.user.createdBy: true
      _ses_file.local_created_by                                                                               as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      _ses_file.local_created_at                                                                               as LocalCreatedAt,
      @Semantics.user.lastChangedBy: true
      _ses_file.local_last_changed_by                                                                          as LocalLastChangedBy,
      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      _ses_file.local_last_changed_at                                                                          as LocalLastChangedAt,
      //total ETag field
      @Semantics.systemDateTime.lastChangedAt: true
      _ses_file.last_changed_at                                                                                as LastChangedAt,

      _ses_excel
}
where
  _user.bname = 'RAM'
