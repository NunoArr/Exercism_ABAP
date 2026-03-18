CLASS zcl_scrabble_score DEFINITION PUBLIC .

  PUBLIC SECTION.
    METHODS score
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

  types: begin of ty_letters_values,
  letters type string,
  value type i,
  end of ty_letters_values.
  data mt_letters type standard table of ty_letters_values.

ENDCLASS.


CLASS zcl_scrabble_score IMPLEMENTATION.
  METHOD score.
  check strlen( input ) > 0.
  mt_letters = value #( ( letters = 'A, E, I, O, U, L, N, R, S, T' value = '1' )
                        ( letters = 'D, G' value = '2' )
                        ( letters = 'B, C, M, P' value = '3' )
                        ( letters = 'F, H, V, W, Y' value = '4' )
                        ( letters = 'K' value = '5' )
                        ( letters = 'J, X' value = '8' )
                        ( letters = 'Q, Z' value = '10' ) ).
    
    data(upper_case_input) = to_upper( input ).
    DATA(chars) = VALUE string_table( FOR i = 0 UNTIL i = strlen( upper_case_input ) ( upper_case_input+i(1) ) ).
    do strlen( upper_case_input ) times.
    loop at mt_letters reference into data(lr_letter) where letters CS chars[ sy-index ].
      result += lr_letter->value.
    endloop.  
    enddo.
  
    
  ENDMETHOD.

ENDCLASS.
