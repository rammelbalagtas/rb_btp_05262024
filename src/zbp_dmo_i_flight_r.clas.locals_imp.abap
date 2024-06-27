CLASS lhc_Flight DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Flight RESULT result.

    METHODS send FOR MODIFY
      IMPORTING keys FOR ACTION Flight~send.

ENDCLASS.

CLASS lhc_Flight IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD send.
*         READ ENTITIES OF zdmo_i_flight_r IN LOCAL MODE
*      ENTITY flight
*       ALL FIELDS WITH CORRESPONDING #( keys )
**       ALL FIELDS WITH VALUE #( ( %key-carrier_id = 'AA' ) )
*      RESULT DATA(travels).
*
*    IF 1 = 1.
*    ENDIF.

     READ ENTITIES OF zdmo_i_flight_r
     ENTITY flight
    ALL FIELDS WITH VALUE #( ( %key-carrier_id = 'AA'
                               %key-connection_id = '0018'
                               %key-flight_date = '20240301' ) )
    RESULT DATA(travels).


    IF 1 = 1.
    ENDIF.


  ENDMETHOD.

ENDCLASS.
