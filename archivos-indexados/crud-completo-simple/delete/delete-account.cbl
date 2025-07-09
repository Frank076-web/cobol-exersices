       IDENTIFICATION DIVISION.
       PROGRAM-ID. delete-account.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       COPY "../copylib/physic-account.cpy".

       DATA DIVISION.
       FILE SECTION.
       COPY "../copylib/logic-account.cpy".

       WORKING-STORAGE SECTION.
       01  F-ACCOUNT-STATUS PIC XX.

       01  CONFIRM-DELETE PIC X.

       PROCEDURE DIVISION.

           DISPLAY "Ingrese el número de cuenta a eliminar: ".
           ACCEPT ACCOUNT-KEY.

           OPEN I-O ACCOUNTS-FILE.

           READ ACCOUNTS-FILE
               KEY IS ACCOUNT-KEY
               INVALID KEY
                   DISPLAY "El número de cuenta ingresado no existe"
               NOT INVALID KEY
                   PERFORM DELETE-ACCOUNT
           END-READ.
           
           CLOSE ACCOUNTS-FILE.

           GOBACK.

       DELETE-ACCOUNT.
           DISPLAY 
           "¿Estás seguro que deseas eliminar la cuenta? (Y) | (N)"
           ACCEPT CONFIRM-DELETE.
           
           IF CONFIRM-DELETE = 'Y'
               DELETE ACCOUNTS-FILE
                   INVALID KEY
                       DISPLAY "No fue posible eliminar la cuenta"
                   NOT INVALID KEY
                       DISPLAY "Cuenta eliminada satisfactoriamente"
               END-DELETE
           END-IF.

       END PROGRAM delete-account.
