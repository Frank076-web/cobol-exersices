       IDENTIFICATION DIVISION.
       PROGRAM-ID. delete-client.

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

       01  DELET-FLAG PIC X.
           88  DEL-YES VALUE 'Y'.
           88  DEL-NO VALUE 'N'.

       01  F-ACCOUNT PIC X.
           88  HAS-ACCOUNT VALUE 'Y'.
           88  HAS-NOT-ACCOUNT VALUE 'N'.

       01  EOF-FLAG PIC X.
           88  F-ENDED VALUE 'Y'.
           88  F-NOT-ENDED VALUE 'N'.
           
       
       PROCEDURE DIVISION.
           SET DEL-NO TO TRUE.
           
           DISPLAY "Ingresar el documento del cliente a eliminar".
           ACCEPT CLIENT-DNI.

           OPEN I-O CLIENTS-FILE.
               
           READ CLIENTS-FILE
               KEY IS CLIENT-DNI
               INVALID KEY
                   DISPLAY "Cliente no encontrado"
               NOT INVALID KEY
                   PERFORM SEARCH-IF-HAS-ACCOUNT-AND-DELETE
                   IF HAS-ACCOUNT
                       DISPLAY 
                       "El cliente tiene cuentas asociadas"
                       " no es posible eliminar."
                   ELSE
                       PERFORM DELETE-CLIENT
                   END-IF
           END-READ.

           CLOSE CLIENTS-FILE.

           GOBACK.

       SEARCH-IF-HAS-ACCOUNT-AND-DELETE.
           SET HAS-NOT-ACCOUNT TO TRUE.
           SET F-NOT-ENDED TO TRUE.

           OPEN INPUT ACCOUNTS-FILE.

           PERFORM UNTIL F-ENDED OR HAS-ACCOUNT
               READ ACCOUNTS-FILE NEXT RECORD
                   AT END
                       SET F-ENDED TO TRUE
                   NOT AT END
                       IF ACCOUNT-CLIENT-DNI = CLIENT-DNI
                           SET HAS-ACCOUNT TO TRUE
                       END-IF
               END-READ
           END-PERFORM.

           CLOSE ACCOUNTS-FILE.
                      

       DELETE-CLIENT.
           DISPLAY "¿Estás seguro que deseas eliminar? (Y) | (N)"
           ACCEPT DELET-FLAG.
       
           IF DEL-YES
               DELETE CLIENTS-FILE
                   INVALID KEY
                       DISPLAY "No se pudo eliminar el cliente"
                   NOT INVALID KEY
                       DISPLAY "Cliente eliminado satisfactoriamente"
               END-DELETE
           END-IF.

       END PROGRAM delete-client.
