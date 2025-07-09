       IDENTIFICATION DIVISION.
       PROGRAM-ID. create-client.

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
           
           PERFORM ACCEPT-CLIENT-DATA.

           GOBACK.

       ACCEPT-CLIENT-DATA.
           DISPLAY "Ingrese el nombre: ".
           ACCEPT CLIENT-NAME.
           DISPLAY "Ingrese la edad: ".
           ACCEPT CLIENT-AGE.
           DISPLAY "Ingrese el DNI: ".
           ACCEPT CLIENT-DNI.

           PERFORM ADD-CLIENT.

       ADD-CLIENT.
           OPEN I-O CLIENTS-FILE.
           
           WRITE CLIENT-RECORD
               INVALID KEY
                   DISPLAY 
                   "Hubo un error, el registro ya existe con dicho DNI"
               NOT INVALID KEY
                   DISPLAY "Cliente creado satisfactoriamente"
           END-WRITE.

           CLOSE CLIENTS-FILE.

       END PROGRAM create-client.
