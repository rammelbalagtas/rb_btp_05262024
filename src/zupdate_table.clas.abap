CLASS zupdate_table DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZUPDATE_TABLE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_user type STANDARD TABLE OF zuser_db.
    DATA ls_user type zuser_db.

    ls_user-bname  = 'CB9980005871'.
    APPEND ls_user to lt_user.
    INSERT zuser_db FROM TABLE @lt_user.

*  DATA lt_file TYPE STANDARD TABLE OF zses_file_table2.
*  DATA ls_file TYPE zses_file_table2.
*
*  SELECT SINGLE @abap_true FROM zses_file_table2 WHERE end_user = 'RAM' INTO @DATA(lv_valid).
*  IF lv_valid <> abap_true.
*    ls_file-end_user = 'RAM'.
*    APPEND ls_file TO lt_file.
*    INSERT zses_file_table2 FROM TABLE @lt_file.
*  ENDIF.
  ENDMETHOD.
ENDCLASS.
