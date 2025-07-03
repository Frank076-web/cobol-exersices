       IDENTIFICATION DIVISION.
       PROGRAM-ID. usuario-clave.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  USUARIO.
           05  NOMBRE-USUARIO PIC X(30).
           05  CLAVE-USUARIO PIC X(10).
       
       01  NOMBRE-USUARIO-1 PIC X(30) VALUE "tobiasmp123".
       01  CLAVE-USUARIO-1 PIC X(10) VALUE "134679".

       01  NOMBRE-USUARIO-2 PIC X(30) VALUE "shofrey782".
       01  CLAVE-USUARIO-2 PIC X(10) VALUE "852kafka".

       01  INTENTOS-REALIZADOS PIC 9 VALUE 0.
       01  LOGIN-STATUS PIC X VALUE 'N'.
           88  LOGIN-INCORRECTO VALUE 'N'.
           88  LOGIN-CORRECTO VALUE 'Y'.

       PROCEDURE DIVISION.
       
       INICIO.
           PERFORM PEDIR-DATOS
           PERFORM EVALUAR-DATOS.

           IF INTENTOS-REALIZADOS = 3
               DISPLAY "Límite de intentos disponibles alcanzados."
               STOP RUN
           ELSE
               IF LOGIN-INCORRECTO
                   PERFORM INICIO
               ELSE
                   DISPLAY "Ingreso al sistema satisfactorio."
                   STOP RUN
               END-IF
           END-IF.
           
       
       PEDIR-DATOS.
           DISPLAY 
           "Por favor, ingrese nombre de usuario y contraseña: ".

           ACCEPT NOMBRE-USUARIO.
           ACCEPT CLAVE-USUARIO.

       EVALUAR-DATOS.
           EVALUATE TRUE
               WHEN NOMBRE-USUARIO = NOMBRE-USUARIO-1
                   IF CLAVE-USUARIO NOT = CLAVE-USUARIO-1
                       DISPLAY 
                       "Error, la contraseña ingresada es inválida"
                       ADD 1 TO INTENTOS-REALIZADOS
                   ELSE
                       MOVE 'Y' TO LOGIN-STATUS
                   END-IF
               WHEN NOMBRE-USUARIO = NOMBRE-USUARIO-2
                   IF CLAVE-USUARIO NOT = CLAVE-USUARIO-2
                       DISPLAY 
                       "Error, la contraseña ingresada es inválida"
                       ADD 1 TO INTENTOS-REALIZADOS
                   ELSE
                       MOVE 'Y' TO LOGIN-STATUS
                   END-IF
               WHEN OTHER
                   DISPLAY "No se encontró el usuario ingresado."
                   ADD 1 TO INTENTOS-REALIZADOS
           END-EVALUATE.
           

       END PROGRAM usuario-clave.
       