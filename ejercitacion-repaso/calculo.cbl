       IDENTIFICATION DIVISION.
       PROGRAM-ID. calculo.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  PRODUCTOS.
           05 PRODUCTO OCCURS 3 TIMES.
               10  CODIGO-PRODUCTO PIC X(10).
               10  DESCRIPCION-PRODUCTO PIC X(100).
               10  PRECIO-PRODUCTO PIC 9(4) VALUE 0.
               10  CANTIDAD-PRODUCTO PIC 9(4) VALUE 0.

       01  I PIC 9 VALUE 0.

       01  SUBTOTAL-PRODUCTOS OCCURS 3 TIMES.
           05 SUBTOTAL-PRODUCTO PIC 9(6) VALUE 0.

       01  TOTAL-FINAL PIC 9(6) VALUE 0.

       PROCEDURE DIVISION.
       INICIO.
           PERFORM INGRESAR-PRODUCTOS.
           PERFORM CALCULOS-TOTAL-SUBTOTAL.
           PERFORM MOSTRAR-FACTURA.

           STOP RUN.

       INGRESAR-PRODUCTOS.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 3
               DISPLAY "Ingrese el código del producto " I
               ACCEPT CODIGO-PRODUCTO(I)
               DISPLAY "Ingrese la descripcion del producto " I
               ACCEPT DESCRIPCION-PRODUCTO(I)
               DISPLAY "Ingrese el precio del producto" I
               ACCEPT PRECIO-PRODUCTO(I)
               DISPLAY "Ingrese la cantidad del producto " I
               ACCEPT CANTIDAD-PRODUCTO(I)
           END-PERFORM.

       CALCULOS-TOTAL-SUBTOTAL.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 3
               COMPUTE SUBTOTAL-PRODUCTO(I) = 
               PRECIO-PRODUCTO(I) * CANTIDAD-PRODUCTO(I)

               ADD SUBTOTAL-PRODUCTO(I) TO TOTAL-FINAL
           END-PERFORM.

       MOSTRAR-FACTURA.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 3
               DISPLAY "Producto: " I
               " Código: " CODIGO-PRODUCTO(I)
               " Descripción: " DESCRIPCION-PRODUCTO(I)
               " Precio: " PRECIO-PRODUCTO(I)
               " Cantidad: " CANTIDAD-PRODUCTO(I)
               " Subtotal del producto: " SUBTOTAL-PRODUCTO(I)
           END-PERFORM.

           DISPLAY "Total final: " TOTAL-FINAL.

       END PROGRAM calculo.
       