       IDENTIFICATION DIVISION.
       PROGRAM-ID. add-cash.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       COPY "../copylib/physic-account.cpy".

       DATA DIVISION.
       FILE SECTION.
       COPY "../copylib/logic-account.cpy".

       WORKING-STORAGE SECTION.
       01  F-ACCOUNT-STATUS PIC XX.

       01  ADDED-CASH PIC 9(6).

       PROCEDURE DIVISION.

           DISPLAY "Ingrese el número de cuenta: ".
           ACCEPT ACCOUNT-KEY.

           OPEN I-O ACCOUNTS-FILE.

           READ ACCOUNTS-FILE
               KEY IS ACCOUNT-KEY
               INVALID KEY
                   DISPLAY "El número de cuenta no existe"
               NOT INVALID KEY
                   DISPLAY "Ingrese el monto a agregar"
                   ACCEPT ADDED-CASH
                   ADD ADDED-CASH TO ACCOUNT-BILL
                   REWRITE ACCOUNT-RECORD
                       INVALID KEY
                           DISPLAY "Hubo un error al agregar saldo"
                       NOT INVALID KEY     
                           DISPLAY "Saldo agregado satisfactoriamente"
                   END-REWRITE
           END-READ.

           CLOSE ACCOUNTS-FILE.

       END PROGRAM add-cash.
