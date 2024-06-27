CLASS lsc_zi_ses_parent DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_zi_ses_parent IMPLEMENTATION.

  METHOD save_modified.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_File DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR File RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR File RESULT result.

    METHODS uploadExcelData FOR MODIFY
      IMPORTING keys FOR ACTION File~uploadExcelData RESULT result.

    METHODS fields FOR DETERMINE ON MODIFY
      IMPORTING keys FOR File~fields.

ENDCLASS.

CLASS lhc_File IMPLEMENTATION.

 METHOD get_instance_features.

    READ ENTITIES OF zi_ses_parent IN LOCAL MODE
           ENTITY file
             FIELDS ( end_user )
                WITH CORRESPONDING #( keys )
              RESULT DATA(lt_file).


    result = VALUE #( FOR ls_file IN lt_file ( %key = ls_file-%key
                                               %is_draft = ls_file-%is_draft
                                               %features-%action-uploadexceldata = COND #( WHEN ls_file-%is_draft = '00'
                                                                                           THEN if_abap_behv=>fc-f-read_only
                                                                                           ELSE if_abap_behv=>fc-f-unrestricted ) ) ).

  ENDMETHOD.

  METHOD get_instance_authorizations.
    IF 1 = 1.
    ENDIF.
  ENDMETHOD.

  METHOD uploadExcelData.
    READ ENTITIES OF zi_ses_parent IN LOCAL MODE
      ENTITY file
      ALL FIELDS WITH
      CORRESPONDING #( keys )
      RESULT DATA(lt_inv).


    DATA(lv_attachment) = lt_inv[ 1 ]-attachment.

     TYPES: BEGIN OF ty_excel,
             entrysheet TYPE string, "lblni,
             ebeln      TYPE string, "ebeln,
             ebelp      TYPE string, "ebelp,
             ext_number TYPE string, "lblne1,
             quantity   TYPE string, "mengev,
             fin_entry  TYPE string, "final,
           END OF ty_excel,
           tt_row TYPE STANDARD TABLE OF ty_excel.

    DATA lt_rows TYPE tt_row.

    DATA(lo_xlsx) = xco_cp_xlsx=>document->for_file_content( iv_file_content = lv_attachment )->read_access( ).
    DATA(lo_worksheet) = lo_xlsx->get_workbook( )->worksheet->at_position( 1 ).

    DATA(lo_selection_pattern) = xco_cp_xlsx_selection=>pattern_builder->simple_from_to( )->get_pattern( ).

    DATA(lo_execute) = lo_worksheet->select( lo_selection_pattern
      )->row_stream(
      )->operation->write_to( REF #( lt_rows ) ).

    lo_execute->set_value_transformation( xco_cp_xlsx_read_access=>value_transformation->string_value
               )->if_xco_xlsx_ra_operation~execute( ).


    DATA: rows          TYPE STANDARD TABLE OF string,
          content       TYPE string,
          conv          TYPE REF TO cl_abap_conv_codepage,
          ls_excel_data TYPE zses_db,
          lt_excel_data TYPE STANDARD TABLE OF zses_db,
          lv_quantity   TYPE char10,
          lv_entrysheet TYPE ebeln.

    LOOP AT lt_rows INTO DATA(ls_row).
      ls_excel_data-entrysheet = ls_row-entrysheet.
      ls_excel_data-ebeln = ls_row-ebeln.
      ls_excel_data-ebelp = ls_row-ebelp.
      ls_excel_data-ext_number = ls_row-ext_number.
      lv_quantity = ls_row-quantity.
      ls_excel_data-fin_entry = ls_row-fin_entry.
      ls_excel_data-entrysheet = lv_entrysheet = |{ ls_excel_data-entrysheet ALPHA = IN }|.
      ls_excel_data-ebeln      = |{ ls_excel_data-ebeln ALPHA = IN }|.
      ls_excel_data-ebelp      = |{ ls_excel_data-ebelp ALPHA = IN }|.
      ls_excel_data-quantity = CONV #( lv_quantity ).
      APPEND ls_excel_data TO lt_excel_data.
      CLEAR: ls_row, ls_excel_data.
    ENDLOOP.
*
*    content =
*      cl_abap_conv_codepage=>create_in(
*                 )->convert( source = lv_attachment ).
*
*    SPLIT content AT cl_abap_char_utilities=>cr_lf INTO TABLE rows.
*
*    LOOP AT rows INTO DATA(ls_row).
*      SPLIT ls_row AT ',' INTO ls_excel_data-entrysheet
*                               ls_excel_data-ebeln
*                               ls_excel_data-ebelp
*                               ls_excel_data-ext_number
*                               ls_excel_data-begdate
*                               ls_excel_data-enddate
*                               lv_quantity
*                               "ls_attdata-BASE_UOM
*                               ls_excel_data-fin_entry.
*
*      ls_excel_data-entrysheet = lv_entrysheet = |{ ls_excel_data-entrysheet ALPHA = IN }|.
*      ls_excel_data-ebeln      = |{ ls_excel_data-ebeln ALPHA = IN }|.
*      ls_excel_data-ebelp      = |{ ls_excel_data-ebelp ALPHA = IN }|.
*      ls_excel_data-quantity = CONV #( lv_quantity ).
*
*      APPEND ls_excel_data TO lt_excel_data.
*      CLEAR: ls_row, ls_excel_data.
*ENDLOOP.

** Delete duplicate records
    DELETE ADJACENT DUPLICATES FROM lt_excel_data.
    DELETE lt_excel_data WHERE ebeln IS INITIAL.

** Prepare the datatypes to store the data from internal table lt_excel_data to child entity through EML
    DATA lt_att_create TYPE TABLE FOR CREATE zi_ses_parent\_ses_excel.

    lt_att_create = VALUE #( (  %cid_ref  = keys[ 1 ]-%cid_ref
                                %is_draft = keys[ 1 ]-%is_draft
                                end_user  = keys[ 1 ]-end_user
                                %target   = VALUE #( FOR ls_data IN lt_excel_data ( %cid       = |{ ls_data-ebeln }{ ls_data-ebelp }|
                                                                                   %is_draft   = keys[ 1 ]-%is_draft
                                                                                   end_user    = 'RAM'
                                                                                   entrysheet  = ls_data-entrysheet
                                                                                   ebeln       = ls_data-ebeln
                                                                                   ebelp       = ls_data-ebelp
                                                                                   ext_number  = ls_data-ext_number
                                                                                   quantity    = ls_data-quantity
                                                                                  " BASE_UOM    = ls_data-
                                                                                   fin_entry   = ls_data-fin_entry
                                                                                  %control = VALUE #( end_user    = if_abap_behv=>mk-on
                                                                                                      entrysheet  = if_abap_behv=>mk-on
                                                                                                      ebeln       = if_abap_behv=>mk-on
                                                                                                      ebelp       = if_abap_behv=>mk-on
                                                                                                      ext_number  = if_abap_behv=>mk-on
                                                                                                      quantity    = if_abap_behv=>mk-on
                                                                                                     " BASE_UOM    = ls_data-
                                                                                                      fin_entry   = if_abap_behv=>mk-on  ) ) ) ) ).
    READ ENTITIES OF zi_ses_parent IN LOCAL MODE
    ENTITY file
    BY \_ses_excel
    ALL FIELDS WITH
    CORRESPONDING #( keys )
    RESULT DATA(lt_excel).

** Delete already existing entries from child entity
    MODIFY ENTITIES OF zi_ses_parent IN LOCAL MODE
    ENTITY exceldata
    DELETE FROM VALUE #( FOR ls_excel IN lt_excel (  %is_draft = ls_excel-%is_draft
                                                     %key      = ls_excel-%key ) )
    MAPPED DATA(lt_mapped_delete)
    REPORTED DATA(lt_reported_delete)
    FAILED DATA(lt_failed_delete).

** Create the records from the new attached CSV file
    MODIFY ENTITIES OF zi_ses_parent IN LOCAL MODE
    ENTITY file
    CREATE BY \_ses_excel
    AUTO FILL CID
    WITH lt_att_create.

    APPEND VALUE #( %tky = lt_inv[ 1 ]-%tky ) TO mapped-file.
    APPEND VALUE #( %tky = lt_inv[ 1 ]-%tky
                    %msg = new_message_with_text( severity = if_abap_behv_message=>severity-success
                                                  text = 'Excel Data Uploaded' )
                   ) TO reported-file.

    MODIFY ENTITIES OF zi_ses_parent IN LOCAL MODE
    ENTITY file
    UPDATE FROM VALUE #( ( %is_draft = keys[ 1 ]-%is_draft
                           end_user  = 'RAM'
                           status     =  'P'
                          " %data     = VALUE #( status = 'P' )
                           %control  = VALUE #( status = if_abap_behv=>mk-on ) ) )
    MAPPED DATA(lt_mapped_update)
    REPORTED DATA(lt_reported_update)
    FAILED DATA(lt_failed_update).

    READ ENTITIES OF zi_ses_parent IN LOCAL MODE
    ENTITY file
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_file_status).

    MODIFY ENTITIES OF zi_ses_parent IN LOCAL MODE
    ENTITY file
    UPDATE FROM VALUE #( FOR ls_file_status IN lt_file_status ( %is_draft = ls_file_status-%is_draft
                                                                %tky      = ls_file_status-%tky
                                                                %data     = VALUE #( status = 'C'  )
                                                                %control  = VALUE #( status = if_abap_behv=>mk-on ) ) ).

    READ ENTITIES OF zi_ses_parent IN LOCAL MODE
       ENTITY file
       ALL FIELDS WITH
       CORRESPONDING #( keys )
       RESULT DATA(lt_file).



    result = VALUE #( FOR ls_file IN lt_file ( %tky   = ls_file-%tky
                                               %param = ls_file ) ).

  ENDMETHOD.

METHOD fields.

  MODIFY ENTITIES OF zi_ses_parent IN LOCAL MODE
  ENTITY file
  UPDATE FROM VALUE #( FOR key IN keys ( end_user        = key-end_user
                                         status          = ' ' " Accepted
                                         %control-status = if_abap_behv=>mk-on ) ).
  IF keys[ 1 ]-%is_draft = '01'.
    MODIFY ENTITIES OF zi_ses_parent IN LOCAL MODE
    ENTITY file
    EXECUTE uploadexceldata
    FROM CORRESPONDING #( keys ).
  ENDIF.
ENDMETHOD.

ENDCLASS.

CLASS lhc_ExcelData DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ExcelData RESULT result.

    METHODS createSES FOR MODIFY
      IMPORTING keys FOR ACTION ExcelData~createSES RESULT result.

ENDCLASS.

CLASS lhc_ExcelData IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD createSES.
    READ ENTITIES OF zi_ses_parent IN LOCAL MODE
        ENTITY exceldata
        ALL FIELDS WITH
        CORRESPONDING #( keys )
        RESULT DATA(lt_data).

*    DATA:
*      ls_header_data TYPE i_serviceentrysheettp_2,
*      ls_item_data   TYPE i_serviceentrysheetitemtp_2,
*
*      lt_header_crt  TYPE TABLE FOR CREATE i_serviceentrysheettp_2\\serviceentrysheet,
*      lt_item_cba    TYPE TABLE FOR CREATE i_serviceentrysheettp_2\\serviceentrysheet\_serviceentrysheetitem.
*
** Create SES with reference to a Service Purchase Order Item
*
**--- Prepare Header Data
*    ls_header_data-serviceentrysheetname  = 'Demo SES'.
*    ls_header_data-purchaseorder          = `4500000286`.
*    ls_header_data-sesoriginobjecttype    = `EX`.
*
**--- Prepare Item Data
*    ls_item_data-purchaseorderitem              = '00010'.
*    ls_item_data-confirmedquantity              = '1'.
*    ls_item_data-accountassignmentcategory      = 'K'.
*    ls_item_data-serviceperformancedate         = '20230207'.
*    ls_item_data-multipleacctassgmtdistribution = '0'.
*
*
**--- Prepare Payload
*    APPEND INITIAL LINE TO lt_header_crt ASSIGNING FIELD-SYMBOL(<ls_hdr_crt>).
*    <ls_hdr_crt> = CORRESPONDING #( ls_header_data CHANGING CONTROL ).
*    <ls_hdr_crt>-%cid     = `HEADER_1` .
*
*    APPEND INITIAL LINE TO lt_item_cba ASSIGNING FIELD-SYMBOL(<ls_itm_cba>).
*    <ls_itm_cba>-%cid_ref = 'HEADER_1'.
*
*    APPEND INITIAL LINE TO <ls_itm_cba>-%target ASSIGNING FIELD-SYMBOL(<item_data>).
*    <item_data>       = CORRESPONDING #( ls_item_data CHANGING CONTROL ).
*    <item_data>-%cid  = 'Item_1'.
*
*
*    MODIFY ENTITIES OF i_serviceentrysheettp_2
*      ENTITY serviceentrysheet
*        CREATE
*          FROM lt_header_crt
*         CREATE BY \_serviceentrysheetitem
*          FROM  lt_item_cba
*      FAILED DATA(ls_failed_crt)
*      REPORTED DATA(ls_reported_crt)
*      MAPPED DATA(ls_mapped_crt).

  ENDMETHOD.

ENDCLASS.
