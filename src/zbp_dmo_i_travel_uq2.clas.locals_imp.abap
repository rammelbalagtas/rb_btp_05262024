CLASS lhc_ZDMO_I_TRAVEL_UQ2 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zdmo_i_travel_uq2 RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zdmo_i_travel_uq2.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zdmo_i_travel_uq2.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zdmo_i_travel_uq2.

    METHODS read FOR READ
      IMPORTING keys FOR READ zdmo_i_travel_uq2 RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zdmo_i_travel_uq2.

    METHODS rba_Messages FOR READ
      IMPORTING keys_rba FOR READ zdmo_i_travel_uq2\_Messages FULL result_requested RESULT result LINK association_links.
    METHODS cba_Messages FOR MODIFY
      IMPORTING entities_cba FOR CREATE ZDMO_I_TRAVEL_UQ2\_Messages.
    METHODS uploadExcelData FOR MODIFY
      IMPORTING keys FOR ACTION ZDMO_I_TRAVEL_UQ2~uploadExcelData RESULT result.

*    METHODS cba_Messages FOR MODIFY
*      IMPORTING entities_cba FOR CREATE zdmo_i_travel_uq2\_Messages.

ENDCLASS.

CLASS lhc_ZDMO_I_TRAVEL_UQ2 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Messages.
  ENDMETHOD.

*  METHOD cba_Messages.
*  ENDMETHOD.

  METHOD cba_Messages.
  ENDMETHOD.

  METHOD uploadExcelData.
    IF 1 = 1.
        READ ENTITIES OF ZDMO_I_TRAVEL_UQ2 IN LOCAL MODE
      ENTITY ZDMO_I_TRAVEL_UQ2
      ALL FIELDS WITH
      CORRESPONDING #( keys )
      RESULT DATA(lt_travel).
      IF 1 = 1.
      ENDIF.
    ENDIF.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZDMO_I_MESSAGES DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

*    METHODS update FOR MODIFY
*      IMPORTING entities FOR UPDATE zdmo_i_messages.
*
*    METHODS delete FOR MODIFY
*      IMPORTING keys FOR DELETE zdmo_i_messages.

    METHODS read FOR READ
      IMPORTING keys FOR READ zdmo_i_messages RESULT result.

    METHODS rba_Travel FOR READ
      IMPORTING keys_rba FOR READ zdmo_i_messages\_Travel FULL result_requested RESULT result LINK association_links.
    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE ZDMO_I_MESSAGES.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE ZDMO_I_MESSAGES.

ENDCLASS.

CLASS lhc_ZDMO_I_MESSAGES IMPLEMENTATION.

*  METHOD update.
*  ENDMETHOD.
*
*  METHOD delete.
*  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Travel.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZDMO_I_TRAVEL_UQ2 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZDMO_I_TRAVEL_UQ2 IMPLEMENTATION.

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
