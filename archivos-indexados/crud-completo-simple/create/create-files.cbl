       IDENTIFICATION DIVISION.
       PROGRAM-ID. create-files.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       COPY "./copylib/physic-clients.cpy".
       COPY "./copylib/physic-account.cpy".

       DATA DIVISION.
       FILE SECTION.
       COPY "./copylib/logic-clients.cpy".
       COPY "./copylib/logic-account.cpy".

       WORKING-STORAGE SECTION.
       01  F-STATUS PIC XX.
       01  F-ACCOUNT-STATUS PIC XX.

       PROCEDURE DIVISION.

           PERFORM TRY-CREATE-CLIENTS-FILE.
           PERFORM TRY-CREATE-ACCOUNTS-FILE.
           GOBACK.

       TRY-CREATE-CLIENTS-FILE.
           OPEN INPUT CLIENTS-FILE.

           EVALUATE F-STATUS
               WHEN "00"
                   CLOSE CLIENTS-FILE
               WHEN "35"
                   DISPLAY "El archivo no existe, creando..."
                   OPEN OUTPUT CLIENTS-FILE
                   CLOSE CLIENTS-FILE
               WHEN OTHER
                   DISPLAY "Error: " F-STATUS               
           END-EVALUATE.          
       
       TRY-CREATE-ACCOUNTS-FILE.
           OPEN INPUT ACCOUNTS-FILE.

           EVALUATE F-ACCOUNT-STATUS
               WHEN "00"
                   CLOSE ACCOUNTS-FILE
               WHEN "35"
                   DISPLAY "El archivo no existe, creando..."
                   OPEN OUTPUT ACCOUNTS-FILE
                   CLOSE ACCOUNTS-FILE
               WHEN OTHER
                   DISPLAY "Error: " F-ACCOUNT-STATUS              
           END-EVALUATE.          

       END PROGRAM create-files.
       