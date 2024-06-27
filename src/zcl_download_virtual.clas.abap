CLASS zcl_download_virtual DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_download_virtual IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

    FIELD-SYMBOLS: <fs_value> TYPE any.
    TYPES: BEGIN OF ty_excel,
             col1 TYPE string,
             col2 TYPE string,
           END OF ty_excel,
           tt_row TYPE STANDARD TABLE OF ty_excel.

    DATA lt_rows TYPE tt_row.
    DATA ls_row TYPE ty_excel.

    CHECK NOT it_original_data IS INITIAL.

    DATA lt_calculated_data TYPE STANDARD TABLE OF ZDMO_I_Flight_R WITH DEFAULT KEY.
    MOVE-CORRESPONDING it_original_data TO lt_calculated_data.

    MOVE-CORRESPONDING lt_calculated_data TO ct_calculated_data.
    LOOP AT ct_calculated_data ASSIGNING FIELD-SYMBOL(<fs_calculated_data>).

      ASSIGN COMPONENT 'DOWNLOADFILE' OF STRUCTURE <fs_calculated_data> TO <fs_value>.
      IF sy-subrc EQ 0.
*        ls_row-col1 = 'col1 row1'.
*        ls_row-col2 = 'col2 row1'.
*        APPEND ls_row TO lt_rows.
*        ls_row-col1 = 'col1 row2'.
*        ls_row-col2 = 'col2 row2'.
*        APPEND ls_row TO lt_rows.
*
*        DATA(lo_xlsx) = xco_cp_xlsx=>document->empty( )->write_access(  ).
*        DATA(lo_worksheet) = lo_xlsx->get_workbook( )->worksheet->at_position( 1 ).
*
*        DATA(lo_selection_pattern) = xco_cp_xlsx_selection=>pattern_builder->simple_from_to( )->get_pattern( ).
*
*        lo_worksheet->select( lo_selection_pattern
*          )->row_stream(
*          )->operation->write_from( REF #( lt_rows ) )->execute( ).
*
*       DATA(lv_file_content) = lo_xlsx->get_file_content( ).
*       <fs_value> = lv_file_content.

        DATA(lv_string) = |ABC,DEF|.
        DATA(lv_xstring) = xco_cp=>string( lv_string
          )->as_xstring( xco_cp_character=>code_page->utf_8 ).
        <fs_value> = lv_xstring->value.
      ENDIF.

      UNASSIGN <fs_value>.
      ASSIGN COMPONENT 'DOWNLOADMIMETYPE' OF STRUCTURE <fs_calculated_data> TO <fs_value>.
      IF sy-subrc EQ 0.
*        <fs_value> = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'.
        <fs_value> = 'text/csv'.
      ENDIF.

      UNASSIGN <fs_value>.
      ASSIGN COMPONENT 'DOWNLOADFILENAME' OF STRUCTURE <fs_calculated_data> TO <fs_value>.
      IF sy-subrc EQ 0.
        <fs_value> = 'Filename sample.txt'.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
    IF 1 = 1.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
