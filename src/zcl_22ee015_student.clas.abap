CLASS zcl_22ee015_student DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS zcl_22ee015_student IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_student,
             id TYPE i,
             name TYPE string,
             marks TYPE i,
           END OF ty_student.

    DATA: gt_students TYPE STANDARD TABLE OF ty_student,
          gs_student TYPE ty_student.

* Insert student 1
    gs_student-id = 1.
    gs_student-name = 'Aravindh'.
    gs_student-marks = 85.
    APPEND gs_student TO gt_students.

* Insert student 2
    gs_student-id = 2.
    gs_student-name = 'Rahul'.
    gs_student-marks = 45.
    APPEND gs_student TO gt_students.

* Display table
    LOOP AT gt_students INTO gs_student.
      out->write( |{ gs_student-id } { gs_student-name } { gs_student-marks }| ).
    ENDLOOP.

* Read table
    READ TABLE gt_students INTO gs_student WITH KEY id = 2.

* Check result
    IF sy-subrc = 0.
      out->write( |Student Found: { gs_student-name }| ).
    ELSE.
      out->write( |Student Not Found| ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
