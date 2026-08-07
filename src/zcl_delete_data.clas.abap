CLASS zcl_delete_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_delete_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    " --- OPTION A: Delete SPECIFIC rows using a WHERE condition ---
*    DELETE FROM <table> WHERE Id = 'B651B026E3FF1FE1A4C07647BBC04F22'.

    " --- OPTION B: Wipe out ALL data from the table ---
*    DELETE FROM <table>.

    IF sy-subrc = 0.
      out->write( 'Data successfully deleted from the custom table!' ).
    ELSE.
      out->write( 'No records matched the criteria or table is already empty.' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
