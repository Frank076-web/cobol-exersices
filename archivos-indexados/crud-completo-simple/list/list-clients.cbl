       IDENTIFICATION DIVISION.
       PROGRAM-ID. list-clients.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       COPY "./copylib/physic-clients.cpy".

       DATA DIVISION.
       FILE SECTION.
       COPY "./copylib/logic-clients.cpy".

       WORKING-STORAGE SECTION.
       01  F-STATUS PIC 99.
       
       01  EOF-FLAG PIC X.
           88  F-END VALUE 'Y'.
           88  F-N-ENDED VALUE 'N'.

       PROCEDURE DIVISION.
           SET F-N-ENDED TO TRUE.
           MOVE SPACES TO CLIENT-RECORD.

           PERFORM READ-RECORDS.

           GOBACK.
           
       
       READ-RECORDS.
           OPEN INPUT CLIENTS-FILE.
           
           PERFORM UNTIL F-END
               READ CLIENTS-FILE NEXT RECORD
                   AT END
                       SET F-END TO TRUE
                   NOT AT END
                       PERFORM SHOW-RECORD
           END-PERFORM.

           CLOSE CLIENTS-FILE.

           IF CLIENT-RECORD = SPACES
               DISPLAY "No hay registros"
           END-IF.

       SHOW-RECORD.
           DISPLAY 
           "Nombre: " CLIENT-NAME
           " Edad: " CLIENT-AGE
           " DNI: " CLIENT-DNI.

       END PROGRAM list-clients.
       