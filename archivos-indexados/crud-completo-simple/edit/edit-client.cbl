       IDENTIFICATION DIVISION.
       PROGRAM-ID. edit-client.

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

           DISPLAY "Ingrese el DNI del cliente a editar: ".
           ACCEPT CLIENT-DNI.

           OPEN I-O CLIENTS-FILE.
           
           READ CLIENTS-FILE
               KEY IS CLIENT-DNI
               INVALID KEY
                   DISPLAY 
                   "El numero de DNI no representa un cliente válido"
               NOT INVALID KEY
                   PERFORM EDIT-CLIENT
           END-READ.

           CLOSE CLIENTS-FILE.

           GOBACK.

       EDIT-CLIENT.
           DISPLAY "Ingrese nuevo nombre: "
           ACCEPT CLIENT-NAME.
           DISPLAY "Ingrese nueva edad: ".
           ACCEPT CLIENT-AGE.

           REWRITE CLIENT-RECORD
               INVALID KEY
                   DISPLAY "Hubo un error al intentar editar el cliente"
               NOT INVALID KEY
                   DISPLAY "Cliente editado satisfactoriamente"
           END-REWRITE.

       END PROGRAM edit-client.
