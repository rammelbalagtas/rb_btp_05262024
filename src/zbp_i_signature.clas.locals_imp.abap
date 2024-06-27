CLASS lhc_Signature DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Signature RESULT result.

    METHODS sendMail FOR MODIFY
      IMPORTING keys FOR ACTION Signature~sendMail.

ENDCLASS.

CLASS lhc_Signature IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD sendMail.
      READ ENTITIES OF z_i_signature IN LOCAL MODE
      ENTITY Signature
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(lt_signature).

    IF 1 = 1.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
