       IDENTIFICATION DIVISION.
       PROGRAM-ID. archivo-secuencial.

       ENVIRONMENT DIVISION.
       
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT OPTIONAL PERSONAS-ARCHIVO
       ASSIGN TO "personas.dat"
       ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  PERSONAS-ARCHIVO.
       01  PERSONA-REGISTRO.
           05  NOMBRE-PERSONA PIC X(30).
           05  EDAD-PERSONA PIC 9(3).
           05  DNI-PERSONA PIC 9(10).

       01  OPCIONES-MENU PIC 99.
           88  INGRESAR-DATOS VALUE 1.
           88  LEER-REGISTROS VALUE 2.
           88  SALIR VALUE 3.

       01  EOF-FLAG PIC X VALUE 'N'.
           88  FIN-ARCHIVO VALUE 'S'.
       
       PROCEDURE DIVISION.
       
       INICIO.
           PERFORM MOSTRAR-MENU UNTIL SALIR.

           STOP RUN.
               
       MOSTRAR-MENU.
           DISPLAY "Seleccione una opción".
           DISPLAY "Ingresar datos: (1)".
           DISPLAY "Leer registros: (2)".
           DISPLAY "Salir: (3)".

           ACCEPT OPCIONES-MENU.

           EVALUATE TRUE
               WHEN INGRESAR-DATOS
                   PERFORM ALTA-PERSONA
               WHEN LEER-REGISTROS
                   PERFORM MOSTRAR-DATOS
               WHEN SALIR
                   DISPLAY "Saliendo..."
               WHEN OTHER
                   DISPLAY "Opción inválida."
           END-EVALUATE.

       ALTA-PERSONA.
           DISPLAY "Ingresar nombre: ".
           ACCEPT NOMBRE-PERSONA.
           DISPLAY "Ingresar edad: ".
           ACCEPT EDAD-PERSONA.
           DISPLAY "Ingresar DNI: ".
           ACCEPT DNI-PERSONA.

           PERFORM ABRIR-ARCHIVO-ESCRITURA.
           WRITE PERSONA-REGISTRO.
           PERFORM CERRAR-ARCHIVO.

       MOSTRAR-DATOS.
           DISPLAY SPACE.
           DISPLAY "Registros".

           PERFORM ABRIR-ARCHIVO-LECTURA.

           PERFORM UNTIL FIN-ARCHIVO
               READ PERSONAS-ARCHIVO
                   AT END
                       SET FIN-ARCHIVO TO TRUE
                   NOT AT END
                       DISPLAY 
                       "Nombre: " NOMBRE-PERSONA
                       " Edad: " EDAD-PERSONA
                       " DNI: " DNI-PERSONA
               END-READ
           END-PERFORM.

           DISPLAY SPACE.

           PERFORM CERRAR-ARCHIVO.

       ABRIR-ARCHIVO-LECTURA.
           OPEN INPUT PERSONAS-ARCHIVO.

       ABRIR-ARCHIVO-ESCRITURA.
           OPEN EXTEND PERSONAS-ARCHIVO.

       CERRAR-ARCHIVO.
           CLOSE PERSONAS-ARCHIVO.

       END PROGRAM archivo-secuencial.
       