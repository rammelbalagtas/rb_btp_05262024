CLASS zdmo_test_upload DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zdmo_test_upload IMPLEMENTATION.


  METHOD if_rap_query_provider~select.

    TRY.
        CASE io_request->get_entity_id( ).

          WHEN 'ZDMO_I_MESSAGES' OR 'ZDMO_I_MESSAGES2'.
**filter
            DATA(lv_sql_filter) = io_request->get_filter( )->get_as_sql_string( ).
            TRY.
                DATA(lt_filter) = io_request->get_filter( )->get_as_ranges( ).
              CATCH cx_rap_query_filter_no_range.
                "handle exception
            ENDTRY.
**parameters
            DATA(lt_parameters) = io_request->get_parameters( ).

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
**select data
              DATA lt_response TYPE STANDARD TABLE OF ZDMO_I_MESSAGES.
**fill response
              io_response->set_data( lt_response ).
              IF io_request->is_total_numb_of_rec_requested( ).
**select count
                io_response->set_total_number_of_records( 0 ).
              ENDIF.
            ENDIF.
**request count
          WHEN `ZI_TEST_UPLOAD_DATA`.
**query implementation for booking entity
        ENDCASE.
      CATCH cx_rap_query_provider.
*        io_response->set_data( lt_travel_response ).
*        io_response->set_total_number_of_records( lv_travel_count ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
