       IDENTIFICATION DIVISION.
       PROGRAM-ID. init.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01  F-STATUS PIC 99.

       01  MENU-OPTION PIC 99.
           88  LIST-CLIENTS VALUE 1.
           88  LIST-ACCOUNTS VALUE 2.
           88  FIND-CLIENT VALUE 3.
           88  ADD-CLIENT VALUE 4.
           88  ADD-ACCOUNT VALUE 5.
           88  EDIT-CLIENT VALUE 6.
           88  EDIT-CASH VALUE 7.
           88  DELETE-CLIENT VALUE 8. 
           88  DELETE-ACCOUNT VALUE 9. 
           88  CLOSE-PROGRAM VALUE 10.

       PROCEDURE DIVISION.
           CALL "./create/create-files".

           PERFORM SHOW-MENU UNTIL CLOSE-PROGRAM.

           STOP RUN.
       
       SHOW-MENU.
           DISPLAY "************************".
           DISPLAY "*        MENÚ          *"
           DISPLAY "*                      *".
           DISPLAY "* LISTAR CLIENTES (1)  *".
           DISPLAY "* LISTAR CUENTAS (2)   *".
           DISPLAY "* BUSCAR CLIENTE (3)   *".
           DISPLAY "* AGREGAR CLIENTE (4)  *".
           DISPLAY "* AGREGAR CUENTA (5)   *".
           DISPLAY "* EDITAR CLIENTE (6)   *".
           DISPLAY "* EDITAR SALDO (7)     *".
           DISPLAY "* ELIMINAR CLIENTE (8) *".
           DISPLAY "* ELIMINAR CUENTA (9)  *".
           DISPLAY "* SALIR (10)           *".
           DISPLAY "************************".

           ACCEPT MENU-OPTION.

           EVALUATE TRUE
               WHEN LIST-CLIENTS
                   DISPLAY SPACE
                   CALL "./list/list-clients"
                   DISPLAY SPACE
               WHEN LIST-ACCOUNTS
                   DISPLAY SPACE
			       CALL "./list/list-accounts"				   
                   DISPLAY SPACE
               WHEN ADD-CLIENT
                   DISPLAY SPACE
                   CALL "./create/create-client"
                   DISPLAY SPACE
               WHEN ADD-ACCOUNT
                   DISPLAY SPACE
                   CALL "./create/create-account"			    				   
                   DISPLAY SPACE
               WHEN FIND-CLIENT
                   DISPLAY SPACE
                   CALL "./find/find-client"
                   DISPLAY SPACE
               WHEN EDIT-CLIENT
                   DISPLAY SPACE
                   CALL "./edit/edit-client"
                   DISPLAY SPACE
               WHEN EDIT-CASH
                   DISPLAY SPACE
                   CALL "./add-cash/add-cash"			    				   
                   DISPLAY SPACE
               WHEN DELETE-CLIENT
                   DISPLAY SPACE
                   CALL "./delete/delete-client"
                   DISPLAY SPACE
               WHEN DELETE-ACCOUNT
                   DISPLAY SPACE
                   CALL "./delete/delete-account"			    				   
                   DISPLAY SPACE
               WHEN CLOSE-PROGRAM
                   DISPLAY SPACE
                   DISPLAY "Cerrando..."
                   DISPLAY SPACE
               WHEN OTHER 
                   DISPLAY "Opción inválida"
           END-EVALUATE.

       END PROGRAM init.
       