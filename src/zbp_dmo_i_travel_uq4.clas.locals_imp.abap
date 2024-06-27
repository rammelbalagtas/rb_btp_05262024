CLASS lhc_ZDMO_I_TRAVEL_UQ4 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zdmo_i_travel_uq4 RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zdmo_i_travel_uq4.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zdmo_i_travel_uq4.

*    METHODS delete FOR MODIFY
*      IMPORTING keys FOR DELETE zdmo_i_travel_uq4.

    METHODS read FOR READ
      IMPORTING keys FOR READ zdmo_i_travel_uq4 RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zdmo_i_travel_uq4.
    METHODS createfile FOR MODIFY
      IMPORTING keys FOR ACTION zdmo_i_travel_uq4~createfile RESULT result.

ENDCLASS.

CLASS lhc_ZDMO_I_TRAVEL_UQ4 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
    DATA: messages   TYPE /dmo/t_message,
          data_in    TYPE zdmo_i_travel_uq4,
          travel_out TYPE /dmo/travel.

    DATA(lv_string) = |ABC,DEF|.
    DATA(lv_xstring) = xco_cp=>string( lv_string
      )->as_xstring( xco_cp_character=>code_page->utf_8 ).
    DATA(lv_content) = lv_xstring->value.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<data_create>).
      MOVE-CORRESPONDING <data_create> TO data_in.
      data_in-Attachment = lv_content.
      data_in-mimetype = 'text/csv'.
      data_in-filename = 'Filename sample.txt'.
      INSERT VALUE #(
            %cid     = <data_create>-%cid
            travel_id = ' ' )
          INTO TABLE mapped-zdmo_i_travel_uq4.
    ENDLOOP.
  ENDMETHOD.

  METHOD update.

    DATA: messages   TYPE /dmo/t_message,
          data_in    TYPE zdmo_i_travel_uq4,
          travel_out TYPE /dmo/travel.

    DATA(lv_string) = |ABC,DEF|.
    DATA(lv_xstring) = xco_cp=>string( lv_string
      )->as_xstring( xco_cp_character=>code_page->utf_8 ).
    DATA(lv_content) = lv_xstring->value.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<data_create>).
*      MOVE-CORRESPONDING <data_create> TO data_in.
*      data_in-Attachment = lv_content.
*      data_in-mimetype = 'text/csv'.
*      data_in-filename = 'Filename sample.txt'.
*      INSERT VALUE #(
*            %cid     = <data_create>-%cid
*            travel_id = ' ' )
*          INTO TABLE mapped-zdmo_i_travel_uq4.
    ENDLOOP.
  ENDMETHOD.

*  METHOD delete.
*  ENDMETHOD.

  METHOD read.
    IF 1 = 1.
    ENDIF.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD createFile.
    READ ENTITIES OF zdmo_i_travel_uq4 IN LOCAL MODE
         ENTITY zdmo_i_travel_uq4
         ALL FIELDS WITH
         CORRESPONDING #( keys )
         RESULT DATA(lt_data).
    IF sy-subrc EQ 0.

    ENDIF.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZDMO_I_TRAVEL_UQ4 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZDMO_I_TRAVEL_UQ4 IMPLEMENTATION.

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
