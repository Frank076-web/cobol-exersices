       IDENTIFICATION DIVISION.
       PROGRAM-ID. lectura-escritura.

       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       SELECT ARCHIVO-PERSONAS
       ASSIGN TO "personas.idx"
       ORGANIZATION IS INDEXED
       ACCESS MODE IS DYNAMIC
       RECORD KEY IS DNI-PERSONA
       FILE STATUS IS ESTADO-ARCHIVO.

       DATA DIVISION.
       FILE SECTION.
       FD  ARCHIVO-PERSONAS.
       01  REGISTRO-PERSONA.
           05  NOMBRE-PERSONA PIC X(30).
           05  EDAD-PERSONA PIC 9(3).
           05  DNI-PERSONA PIC 9(8).

       WORKING-STORAGE SECTION.
       01  ESTADO-ARCHIVO PIC XX.

       PROCEDURE DIVISION.

       INICIO.
           PERFORM INICIALIZAR-ARCHIVO.

           PERFORM LEER-REGISTRO.

           PERFORM ALTA-PERSONA.

           STOP RUN.

       LEER-REGISTRO.
           DISPLAY "Buscar".
           DISPLAY "Ingrese el DNI: ".
           ACCEPT DNI-PERSONA.

           PERFORM ABRIR-ARCHIVO-LECTURA.
           
           READ ARCHIVO-PERSONAS
               KEY IS DNI-PERSONA
               INVALID KEY
                   DISPLAY "No existe registro con ese DNI."
               NOT INVALID KEY
                   DISPLAY "Persona encontrada:"
                   DISPLAY 
                   "Nombre: " NOMBRE-PERSONA
                   " Edad: " EDAD-PERSONA
                   " DNI: " DNI-PERSONA
           END-READ.

           PERFORM CERRAR-ARCHIVO.

       ALTA-PERSONA.
           DISPLAY "Ingrese su nombre: ".
           ACCEPT NOMBRE-PERSONA.
           DISPLAY "Ingrese su edad: ".
           ACCEPT EDAD-PERSONA.
           DISPLAY "Ingrese su DNI: "
           ACCEPT DNI-PERSONA.

           PERFORM ABRIR-ARCHIVO-ESCRITURA.

           WRITE REGISTRO-PERSONA
               INVALID KEY
                   DISPLAY "Ya existe una persona con ese DNI."
               NOT INVALID KEY
                   DISPLAY "Registro agregado correctamente."
           END-WRITE.

           PERFORM CERRAR-ARCHIVO.

       INICIALIZAR-ARCHIVO.
           OPEN I-O ARCHIVO-PERSONAS
               IF ESTADO-ARCHIVO = "35"
                   *> 35 = Archivo no existe
                   DISPLAY "El archivo no existe. Se va a crear..."
                   OPEN OUTPUT ARCHIVO-PERSONAS
                   CLOSE ARCHIVO-PERSONAS
               ELSE
                   CLOSE ARCHIVO-PERSONAS
               END-IF.

       ABRIR-ARCHIVO-LECTURA.
           OPEN INPUT ARCHIVO-PERSONAS.

       ABRIR-ARCHIVO-ESCRITURA.
           OPEN I-O ARCHIVO-PERSONAS.

       CERRAR-ARCHIVO.
           CLOSE ARCHIVO-PERSONAS.
       
       END PROGRAM lectura-escritura.