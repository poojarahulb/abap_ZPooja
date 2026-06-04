CLASS zcl_ptravel_data_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ptravel_data_generator IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " delete existing entries in the database table
    DELETE FROM zptravel_m.
    DELETE FROM zpbooking_m.
    DELETE FROM zpbooksuppl_m.
    COMMIT WORK.
    " insert travel demo data
    INSERT zptravel_m FROM (
        SELECT *
          FROM /dmo/travel_m
      ).
    COMMIT WORK.

    " insert booking demo data
    INSERT zpbooking_m FROM (
        SELECT *
          FROM   /dmo/booking_m
*            JOIN ZPTRAVEL_M AS y
*            ON   booking~travel_id = y~travel_id

      ).
    COMMIT WORK.
    INSERT zpbooksuppl_m FROM (
        SELECT *
          FROM   /dmo/booksuppl_m
*            JOIN ZPTRAVEL_M AS y
*            ON   booking~travel_id = y~travel_id

      ).
    COMMIT WORK.

    out->write( 'Travel and booking demo data inserted.' ).


  ENDMETHOD.
ENDCLASS.
