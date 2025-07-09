       IDENTIFICATION DIVISION.
       PROGRAM-ID. lectura-completa.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT ARCHIVO-PERSONAS
       ASSIGN TO "personas.idx"
       ORGANIZATION IS INDEXED
       ACCESS MODE IS DYNAMIC
       RECORD KEY IS DNI-PERSONA
       FILE STATUS IS ESTADO-ARCHIVO.

       DATA DIVISION.
       FILE SECTION.
       FD  ARCHIVO-PERSONAS.
       01  REGISTRO-PERSONA.
           05  NOMBRE-PERSONA PIC X(30).
           05  EDAD-PERSONA PIC 9(3).
           05  DNI-PERSONA PIC 9(8).

       WORKING-STORAGE SECTION.
       01  ESTADO-ARCHIVO PIC 99.

       01  EOF-FLAG PIC X.
           88  F-END VALUE 'Y'.
           88  F-NOT-END VALUE 'N'.

       PROCEDURE DIVISION.
       
       INICIO.
           PERFORM LEER-REGISTROS.

           STOP RUN.

       LEER-REGISTROS.
           SET F-NOT-END TO TRUE.
           OPEN INPUT ARCHIVO-PERSONAS.
           
           PERFORM UNTIL F-END
               READ ARCHIVO-PERSONAS NEXT RECORD
                   AT END
                       SET F-END TO TRUE
                   NOT AT END
                       DISPLAY 
                       "Nombre: " NOMBRE-PERSONA
                       " Edad: " EDAD-PERSONA
                       " DNI: " DNI-PERSONA
               END-READ
           END-PERFORM.
           CLOSE ARCHIVO-PERSONAS.

       END PROGRAM lectura-completa.
       