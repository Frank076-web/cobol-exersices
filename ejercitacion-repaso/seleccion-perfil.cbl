       IDENTIFICATION DIVISION.
       PROGRAM-ID. seleccion-perfil.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  TIPO-USUARIO PIC X.
           88  ADMIN VALUE 'A'.
           88  EDITOR VALUE 'E'.
           88  LECTOR VALUE 'L'.

       PROCEDURE DIVISION.
       
       INICIO.
           PERFORM PEDIR-DATOS
           UNTIL TIPO-USUARIO = 'A'
           OR TIPO-USUARIO = 'E'
           OR TIPO-USUARIO = 'L'.

           PERFORM EVALUAR-DATO.

           GOBACK.

       PEDIR-DATOS.
           DISPLAY "INGRESE SU TIPO DE USUARIO:"
           DISPLAY "(A): ADMIN, (E): EDITOR, (L): LECTOR."
           ACCEPT TIPO-USUARIO.

           EVALUATE TRUE
               WHEN 
               TIPO-USUARIO = 'A' OR
               TIPO-USUARIO = 'E' OR
               TIPO-USUARIO = 'L'
                   CONTINUE
               WHEN OTHER
                  DISPLAY 
                  "Lo sentimos, "
                  "el tipo de usuario ingresado es inválido"
           END-EVALUATE.
           

       EVALUAR-DATO.
           EVALUATE TIPO-USUARIO
               WHEN 'A'
                   DISPLAY "Usted es un Administrador"
               WHEN 'E'
                   DISPLAY "Usted es un Editor"
               WHEN 'L'
                   DISPLAY "Usted es un Lector"
               WHEN OTHER
                  CONTINUE
           END-EVALUATE.
           
           
       END PROGRAM seleccion-perfil.