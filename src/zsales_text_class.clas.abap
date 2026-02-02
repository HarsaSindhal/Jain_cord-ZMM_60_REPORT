
CLASS zsales_text_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    TYPES : BEGIN OF  st1,
              product                 TYPE c LENGTH 40,
              productsalesorg         TYPE c LENGTH 4,
              productdistributionchnl TYPE c LENGTH 4,
              language                TYPE c LENGTH 4,
              longtext                TYPE c LENGTH 1000,

            END OF st1 .

    CLASS-DATA : it_data TYPE TABLE OF st1 .

    TYPES : BEGIN OF  st2,
              results LIKE it_data,
            END OF st2 .

   CLASS-DATA : WA_RESULT TYPE ST2 .

    TYPES  : BEGIN OF  st3,
                   d LIKE wa_result,
                 END OF st3 .
    CLASS-DATA : TEXTTT TYPE ST3 .

    CLASS-METHODS :
      read_text
        IMPORTING VALUE(zproduct)  TYPE char20
                  zproductsalesorg TYPE char4
                  zdistchnl        TYPE char4
                  zlanguage        TYPE char4

        RETURNING VALUE(mat_text)  TYPE string
        RAISING   cx_static_check .

    INTERFACES : if_sadl_exit_calc_element_read .
    INTERFACES : if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZSALES_TEXT_CLASS IMPLEMENTATION.


METHOD if_oo_adt_classrun~main .

DATA  : PRO TYPE C LENGTH 20 VALUE '8000010' .
DATA  : ORG TYPE C LENGTH 4  VALUE '1000'.
DATA  : zdistchnl TYPE C LENGTH 4 VALUE '04' .

 DATA(RES) =  me->read_text( zproduct = PRO zproductsalesorg = ORG zdistchnl = zdistchnl zlanguage = 'EN' ) .


ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~calculate.
*    DATA lt_original_data TYPE STANDARD TABLE OF ZMM_60_CDS2  .
*    lt_original_data = CORRESPONDING #( it_original_data ).


DATA  : PRO TYPE C LENGTH 20 .
DATA  : ORG TYPE C LENGTH 4 .


*    LOOP AT lt_original_data ASSIGNING FIELD-SYMBOL(<ls_original_data>).
*
*    PRO = |{ <ls_original_data>-Product ALPHA = OUT }| .
*    IF <ls_original_data>-Plant = '1100' .
*    ORG =  '1000' .
*    ELSE .
*    ORG =  '2000' .
*    ENDIF.


*      <ls_original_data>-SalesText = me->read_text( zproduct = PRO zproductsalesorg = ORG zdistchnl = '04' zlanguage = 'EN' ) .
*
*
**      dif = <ls_original_data>-OpActualExecutionEndTime - <ls_original_data>-OpActualExecutionStartTime  .
*
**      <ls_original_data>-exempted = |MOHIT| .
*    ENDLOOP.


*    ct_calculated_data = CORRESPONDING #( lt_original_data ).

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

  ENDMETHOD.


  METHOD read_text .

    DATA : get_url TYPE string .
    DATA : user TYPE string .
    DATA : pass TYPE string .
    DATA: lv_url TYPE string .


    lv_url   =  'https://' && cl_abap_context_info=>get_system_url(  ) . " https://my421262.s4hana.cloud.sap
*    get_url = |https://my421262-api.s4hana.cloud.sap:443/sap/opu/odata/sap/API_PRODUCT_SRV/A_ProductSalesText| .
    get_url = |{ lv_url }:443/sap/opu/odata/sap/API_PRODUCT_SRV/A_ProductSalesText| .

    user = 'ZMM_USER'.
    pass = 'jUnhLQ[xyqqXJHneghHJnHZGsEmjJJVt9YQipdfK'.

*    TRY.
**        DATA(client) = ztoken_authentication=>create_client( get_url ).
*      CATCH cx_static_check.
*    ENDTRY.
*
*    DATA(req) = client->get_http_request(  ).
*    req->set_header_field( i_name = 'Accept' i_value = 'application/json' ).
*    req->set_content_type( 'application/json' ).
*    req->set_authorization_basic( i_username = user i_password = pass ).
*
*    DATA: result911 TYPE string.
*    TRY.
*        result911 = client->execute( if_web_http_client=>get )->get_text( ).
*      CATCH cx_web_http_client_error cx_web_message_error INTO DATA(error).
*    ENDTRY.
*    TRY.
*        client->close(  ) .
*      CATCH cx_web_http_client_error.
*    ENDTRY.




**    xco_cp_json=>data->from_string( result911 )->write_to( REF #( wa_result ) ).
*    xco_cp_json=>data->from_string( result911 )->write_to( REF #( TEXTTT ) ).
*
*     mat_text  = VALUE #( TEXTTT-d-results[ product = zproduct ]-longtext OPTIONAL ) .

  ENDMETHOD.
ENDCLASS.
