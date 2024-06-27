CLASS zcl_signature_read DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SIGNATURE_READ IMPLEMENTATION.


  METHOD if_rap_query_provider~select.

    DATA: lt_signature TYPE TABLE OF z_c_signature_MAINTAIN,
          ls_signature LIKE LINE OF lt_signature.

    DATA(lo_paging) = io_request->get_paging( ).
    TRY.
        "Filter not needed, because we all calculate fields in Backend
        DATA(lo_filter) = io_request->get_filter( )->get_as_ranges( ).
      CATCH cx_rap_query_filter_no_range.
    ENDTRY.

    IF io_request->is_data_requested( ).
**paging
      DATA(lv_offset) = io_request->get_paging( )->get_offset( ).
      DATA(lv_page_size) = io_request->get_paging( )->get_page_size( ).
      DATA(lv_max_rows) = COND #( WHEN lv_page_size = if_rap_query_paging=>page_size_unlimited
                                  THEN 0 ELSE lv_page_size ).
**sorting
      DATA(sort_elements) = io_request->get_sort_elements( ).
      DATA(lt_sort_criteria) = VALUE string_table( FOR sort_element IN sort_elements
                                                 ( sort_element-element_name && COND #( WHEN sort_element-descending = abap_true THEN ` descending`
                                                                                                                                 ELSE ` ascending` ) ) ).
      DATA(lv_sort_string)  = COND #( WHEN lt_sort_criteria IS INITIAL THEN `primary key`
                                                                       ELSE concat_lines_of( table = lt_sort_criteria sep = `, ` ) ).
**requested elements
      DATA(lt_req_elements) = io_request->get_requested_elements( ).
**aggregate
      DATA(lt_aggr_element) = io_request->get_aggregation( )->get_aggregated_elements( ).

      IF lt_aggr_element IS NOT INITIAL.
        LOOP AT lt_aggr_element ASSIGNING FIELD-SYMBOL(<fs_aggr_element>).
          DELETE lt_req_elements WHERE table_line = <fs_aggr_element>-result_element.
          DATA(lv_aggregation) = |{ <fs_aggr_element>-aggregation_method }( { <fs_aggr_element>-input_element } ) as { <fs_aggr_element>-result_element }|.
          APPEND lv_aggregation TO lt_req_elements.
        ENDLOOP.
      ENDIF.
      DATA(lv_req_elements)  = concat_lines_of( table = lt_req_elements sep = `, ` ).
****grouping
      DATA(lt_grouped_element) = io_request->get_aggregation( )->get_grouped_elements( ).
      DATA(lv_grouping) = concat_lines_of(  table = lt_grouped_element sep = `, ` ).

    ENDIF.
**request count
    IF io_request->is_total_numb_of_rec_requested( ).

    ENDIF.

    APPEND VALUE #( Organisation = 'ORG1' Pos = 'POS1' Username = 'USER1' Col1 = 'VALUE1' Col2 = 'VALUE2' Count1 = 2 signature = 'Signature1' ) TO lt_signature.
    APPEND VALUE #( Organisation = 'ORG2' Pos = 'POS2' Username = 'USER2' Col1 = 'VALUE1' Col2 = 'VALUE2' Count1 = 2 signature = 'Signature2' ) TO lt_signature.

    io_response->set_total_number_of_records( 2 ).
    io_response->set_data( lt_signature ).

  ENDMETHOD.
ENDCLASS.
