       IDENTIFICATION DIVISION.
       PROGRAM-ID. create-account.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       COPY "../copylib/physic-clients.cpy".
       COPY "../copylib/physic-account.cpy".

       DATA DIVISION.
       FILE SECTION.
       COPY "../copylib/logic-clients.cpy".
       COPY "../copylib/logic-account.cpy".

       WORKING-STORAGE SECTION.
       01  F-STATUS PIC XX.
       01  F-ACCOUNT-STATUS PIC XX.

       01  CLIENT-VALIDATION PIC X.
           88  VALID-CLIENT VALUE 'Y'.
           88  INVALID-CLIENT VALUE 'N'.

       PROCEDURE DIVISION.

           DISPLAY "Ingrese el DNI del usuario para crear una cuenta: ".
           ACCEPT CLIENT-DNI.

           PERFORM SEARCH-VALID-CLIENT.

           IF VALID-CLIENT
               PERFORM CREATE-ACCOUNT
           ELSE
               DISPLAY 
               "El DNI " CLIENT-DNI
               " no representa a un usuario válido"
           END-IF.

           GOBACK.

       CREATE-ACCOUNT.
           DISPLAY "Ingrese un número de cuenta: ".
           ACCEPT ACCOUNT-KEY.

           MOVE CLIENT-DNI TO ACCOUNT-CLIENT-DNI.
           MOVE ZERO TO ACCOUNT-BILL.

           OPEN I-O ACCOUNTS-FILE.
           
           WRITE ACCOUNT-RECORD
               INVALID KEY
                   DISPLAY "La cuenta ya existe"
               NOT INVALID KEY
                   DISPLAY "Cuenta creada satisfactoriamente"
           END-WRITE.

           CLOSE ACCOUNTS-FILE.

       SEARCH-VALID-CLIENT.
           SET INVALID-CLIENT TO TRUE.

           OPEN INPUT CLIENTS-FILE.
           
           READ CLIENTS-FILE
               KEY IS CLIENT-DNI
               INVALID KEY
                   SET INVALID-CLIENT TO TRUE
               NOT INVALID KEY
                   SET VALID-CLIENT TO TRUE
           END-READ.
       
           CLOSE CLIENTS-FILE.

       END PROGRAM create-account.
