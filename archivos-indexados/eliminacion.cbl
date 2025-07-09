       IDENTIFICATION DIVISION.
       PROGRAM-ID. eliminacion.

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

       01  CONFIRMAR-ELIMINACION PIC X.

       PROCEDURE DIVISION.
       
       INICIO.
           PERFORM BUSCAR-ELIMINAR-REGISTRO.
           
           STOP RUN.

       BUSCAR-ELIMINAR-REGISTRO.
           MOVE 0 TO DNI-PERSONA.

           DISPLAY "Ingrese el DNI:".
           ACCEPT DNI-PERSONA.
           
           OPEN I-O ARCHIVO-PERSONAS.
               READ ARCHIVO-PERSONAS
                   KEY IS DNI-PERSONA
                   INVALID KEY
                       DISPLAY "Registro no encontrado"
                   NOT INVALID KEY
                       PERFORM BORRAR-REGISTRO
               END-READ    
           CLOSE ARCHIVO-PERSONAS.


       BORRAR-REGISTRO.
           DISPLAY 
           "¿Estás seguro que deseas eliminar el registro? (S) | (N)".
           ACCEPT CONFIRMAR-ELIMINACION.
           
           IF CONFIRMAR-ELIMINACION = 'S'
               DELETE ARCHIVO-PERSONAS
                   INVALID KEY
                       DISPLAY "Error al intentar eliminar el registro"
                   NOT INVALID KEY
                       DISPLAY "Registro eliminado correctamente"
               END-DELETE.
       
       END PROGRAM eliminacion.
       