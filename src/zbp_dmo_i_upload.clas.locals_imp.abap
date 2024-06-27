CLASS lhc_zdmo_i_upload DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zdmo_i_upload RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zdmo_i_upload.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zdmo_i_upload.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zdmo_i_upload.

    METHODS read FOR READ
      IMPORTING keys FOR READ zdmo_i_upload RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zdmo_i_upload.

    METHODS rba_Messages FOR READ
      IMPORTING keys_rba FOR READ zdmo_i_upload\_Messages FULL result_requested RESULT result LINK association_links.

    METHODS cba_Messages FOR MODIFY
      IMPORTING entities_cba FOR CREATE zdmo_i_upload\_Messages.

ENDCLASS.

CLASS lhc_zdmo_i_upload IMPLEMENTATION.

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

  METHOD cba_Messages.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZDMO_I_MESSAGES2 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zdmo_i_messages2.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zdmo_i_messages2.

    METHODS read FOR READ
      IMPORTING keys FOR READ zdmo_i_messages2 RESULT result.

    METHODS rba_Travel FOR READ
      IMPORTING keys_rba FOR READ zdmo_i_messages2\_Travel FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_ZDMO_I_MESSAGES2 IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Travel.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZDMO_I_UPLOAD DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZDMO_I_UPLOAD IMPLEMENTATION.

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
