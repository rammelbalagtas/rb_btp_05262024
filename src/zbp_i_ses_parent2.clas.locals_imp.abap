CLASS lhc_File DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR File RESULT result.

*    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
*      IMPORTING keys REQUEST requested_authorizations FOR File RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE File.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE File.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE File.

    METHODS read FOR READ
      IMPORTING keys FOR READ File RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK File.

    METHODS rba_Ses_excel FOR READ
      IMPORTING keys_rba FOR READ File\_Ses_excel FULL result_requested RESULT result LINK association_links.

    METHODS cba_Ses_excel FOR MODIFY
      IMPORTING entities_cba FOR CREATE File\_Ses_excel.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR File RESULT result.


ENDCLASS.

CLASS lhc_File IMPLEMENTATION.

  METHOD get_instance_features.
    IF 1 = 1.
    ENDIF.
  ENDMETHOD.

*  METHOD get_instance_authorizations.
*  ENDMETHOD.

  METHOD update.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs_upload>).

      DATA(lv_attachment) = <fs_upload>-attachment.

        TYPES: BEGIN OF ty_excel,
             entrysheet TYPE string, "lblni,
             ebeln      TYPE string, "ebeln,
             ebelp      TYPE string, "ebelp,
             ext_number TYPE string, "lblne1,
             begdate    TYPE string, "lzvon,
             enddate    TYPE string, "lzbis,
             quantity   TYPE string, "mengev,
             fin_entry  TYPE string, "final,
           END OF ty_excel,
           tt_row TYPE STANDARD TABLE OF ty_excel.

    DATA lt_rows TYPE tt_row.

    DATA(lo_xlsx) = xco_cp_xlsx=>document->for_file_content( iv_file_content = lv_attachment )->read_access( ).
    DATA(lo_worksheet) = lo_xlsx->get_workbook( )->worksheet->at_position( 1 ).

    DATA(lo_selection_pattern) = xco_cp_xlsx_selection=>pattern_builder->simple_from_to( )->get_pattern( ).

    data(lo_execute) = lo_worksheet->select( lo_selection_pattern
      )->row_stream(
      )->operation->write_to( REF #( lt_rows ) ).

     lo_execute->set_value_transformation( xco_cp_xlsx_read_access=>value_transformation->string_value
                )->if_xco_xlsx_ra_operation~execute( ).


    ENDLOOP.
  ENDMETHOD.

  METHOD delete.
    IF 1 = 1.
    ENDIF.
  ENDMETHOD.

  METHOD read.
      IF 1 = 1.
    ENDIF.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Ses_excel.
  ENDMETHOD.

  METHOD cba_Ses_excel.
  ENDMETHOD.

  METHOD create.
    IF 1 = 1.
    ENDIF.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_ExcelData DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE ExcelData.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE ExcelData.

    METHODS read FOR READ
      IMPORTING keys FOR READ ExcelData RESULT result.

    METHODS rba_Ses_file FOR READ
      IMPORTING keys_rba FOR READ ExcelData\_Ses_file FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_ExcelData IMPLEMENTATION.

  METHOD update.
    IF 1 = 1.
    ENDIF.
  ENDMETHOD.

  METHOD delete.
    IF 1 = 1.
    ENDIF.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Ses_file.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_SES_PARENT2 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_SES_PARENT2 IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
