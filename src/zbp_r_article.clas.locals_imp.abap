CLASS lhc_ZR_ARTICLE DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Article RESULT result.

    METHODS validateQuantity FOR VALIDATE ON SAVE
        IMPORTING keys FOR Article~validateQuantity.
    METHODS calculateAmount FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Article~calculateAmount.
ENDCLASS.

CLASS lhc_ZR_ARTICLE IMPLEMENTATION.

  METHOD get_global_authorizations.
    " Grants full permission for Create, Update, and Delete operations
    result-%create = if_abap_behv=>auth-allowed.
    result-%update = if_abap_behv=>auth-allowed.
    result-%delete = if_abap_behv=>auth-allowed.
  ENDMETHOD.

  METHOD validateQuantity.
    READ ENTITIES OF ZR_ARTICLE IN LOCAL MODE
        ENTITY Article
            FIELDS ( Quantity ) WITH CORRESPONDING #( keys )
        RESULT DATA(lt_article).

    LOOP AT lt_article INTO DATA(ls_article) WHERE Quantity <= 0.
        " blocks the save operation
        APPEND VALUE #( %tky = ls_article-%tky ) TO failed-article.

        " sends the msg and highlights the field on the Fiori UI
        APPEND VALUE #(
            %tky = ls_article-%tky
            %element-Quantity = if_abap_behv=>mk-on "highlight the "Quantity" field
            %msg = new_message_with_text(
                     severity = if_abap_behv_message=>severity-error
                     text     = 'Quantity must be greater than zero.' )
        ) TO reported-article.

    ENDLOOP.

  ENDMETHOD.

  METHOD calculateAmount.
    " Read the changing rows
    READ ENTITIES OF ZR_ARTICLE IN LOCAL MODE
        ENTITY Article
        FIELDS ( Quantity UnitPrice ) WITH CORRESPONDING #( keys )
        RESULT DATA(lt_article).

    DATA lt_update TYPE TABLE FOR UPDATE ZR_ARTICLE.

    " Calculate and prepare update
    LOOP AT lt_article ASSIGNING FIELD-SYMBOL(<lfs_article>).
        APPEND VALUE #( %tky = <lfs_article>-%tky
                        Amount = <lfs_article>-Quantity * <lfs_article>-UnitPrice
                      ) TO lt_update.

    ENDLOOP.

    " Modify the entity in local mode
    MODIFY ENTITIES OF ZR_ARTICLE IN LOCAL MODE
        ENTITY Article
        UPDATE FIELDS ( Amount ) WITH lt_update.
  ENDMETHOD.

ENDCLASS.
