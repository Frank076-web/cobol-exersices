       IDENTIFICATION DIVISION.
       PROGRAM-ID. find-client.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       COPY "./copylib/physic-clients.cpy".

       DATA DIVISION.
       FILE SECTION.
       COPY "./copylib/logic-clients.cpy".

       WORKING-STORAGE SECTION.
       01  F-STATUS PIC XX.

       PROCEDURE DIVISION.
           
           DISPLAY "Ingrese su dni para buscar el registro: ".
           ACCEPT CLIENT-DNI.

           OPEN INPUT CLIENTS-FILE.
           
           READ CLIENTS-FILE
               KEY IS CLIENT-DNI
               INVALID KEY
                   DISPLAY "No se encontró registro con ese DNI"
               NOT INVALID KEY
                   DISPLAY 
                   "Nombre: " CLIENT-NAME
                   " Edad: " CLIENT-AGE
                   " DNI: " CLIENT-DNI
           END-READ
       
           CLOSE CLIENTS-FILE.

           GOBACK.

       END PROGRAM find-client.
