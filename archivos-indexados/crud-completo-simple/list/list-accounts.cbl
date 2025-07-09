       IDENTIFICATION DIVISION.
       PROGRAM-ID. list-accounts.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       COPY "../copylib/physic-account.cpy".

       DATA DIVISION.
       FILE SECTION.
       COPY "../copylib/logic-account.cpy".

       WORKING-STORAGE SECTION.
       01  F-ACCOUNT-STATUS PIC XX.

       01  EOF-FLAG PIC X.
           88  F-ENDED VALUE 'Y'.
           88  F-NOT-ENDED VALUE 'N'.

       PROCEDURE DIVISION.
           
           SET F-NOT-ENDED TO TRUE.

           OPEN INPUT ACCOUNTS-FILE.

           PERFORM UNTIL F-ENDED
               READ ACCOUNTS-FILE NEXT RECORD
                   AT END
                       SET F-ENDED TO TRUE
                   NOT AT END
                       DISPLAY 
                       "N° de cuenta: " ACCOUNT-KEY
                       ", DNI cliente: " ACCOUNT-CLIENT-DNI
                       ", saldo: " ACCOUNT-BILL
               END-READ
           END-PERFORM.

           CLOSE ACCOUNTS-FILE.

       END PROGRAM list-accounts.
