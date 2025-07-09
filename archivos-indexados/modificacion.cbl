       IDENTIFICATION DIVISION.
       PROGRAM-ID. modificacion.

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
           05  EDAD-PERSONA PIC X(3).
           05  DNI-PERSONA PIC 9(8).

       WORKING-STORAGE SECTION.
       01  ESTADO-ARCHIVO PIC XX.

       01  REGISTRO-ENCONTRADO PIC X.
           88 R-ENCONTRADO VALUE 'Y'.
           88 R-NO-ENCONTRADO VALUE 'N'.

       PROCEDURE DIVISION.
       
       INICIO.
           PERFORM BUSCAR-REGISTRO.
           
           IF R-ENCONTRADO
               PERFORM ACTUALIZAR-REGISTRO
           END-IF.

           STOP RUN.

       ACTUALIZAR-REGISTRO.
           DISPLAY "Ingrese el nuevo nombre: ".
           ACCEPT NOMBRE-PERSONA.
           DISPLAY "Ingrese la nueva edad: ".
           ACCEPT EDAD-PERSONA.

           OPEN I-O ARCHIVO-PERSONAS.
               REWRITE REGISTRO-PERSONA
                   INVALID KEY
                       DISPLAY 
                       "Error al actualizar"
                       " status: "  ESTADO-ARCHIVO

                   NOT INVALID KEY
                       DISPLAY "Registro actualizado correctamente"
               END-REWRITE
           CLOSE ARCHIVO-PERSONAS.

       BUSCAR-REGISTRO.
           DISPLAY "Ingrese el DNI".
           MOVE 0 TO DNI-PERSONA.
           SET R-NO-ENCONTRADO TO TRUE.
           ACCEPT DNI-PERSONA.

           OPEN INPUT ARCHIVO-PERSONAS.

           READ ARCHIVO-PERSONAS
               KEY IS DNI-PERSONA
               INVALID KEY
                   DISPLAY "El registro no existe"
               NOT INVALID KEY
                   SET R-ENCONTRADO TO TRUE
           END-READ.

           CLOSE ARCHIVO-PERSONAS.
           
       INICIALIZAR-ARCHIVO.
           OPEN I-O ARCHIVO-PERSONAS.

           IF ESTADO-ARCHIVO = "35"
               OPEN OUTPUT ARCHIVO-PERSONAS
           ELSE
               CLOSE ARCHIVO-PERSONAS
           END-IF.

       END PROGRAM modificacion.
       