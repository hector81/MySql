#43-OBTENER EL NOMBRE Y EL APELLIDO DE LOS CLIENTES CUYO NOMBRE EMPIEZA POR A Y CUYO DNI ES MAYOR
# QUE EL ALGUNO DE LOS CLIENTES QUE SEAN DE MADRID O MENOR QUE EL DE TODOS LOS DE VALENCIA
USE TABLASCOCHES; 
SELECT DISTINCT A.nombre, A.apellidos FROM clientes A, clientes B, clientes C
WHERE A.nombre LIKE 'A%' AND A.dni > (SELECT B.dni FROM clientes WHERE
B.ciudad LIKE 'MADRID' GROUP BY B.dni )
AND A.dni < ALL(SELECT C.dni FROM clientes WHERE
C.ciudad LIKE 'VALENCIA' GROUP BY C.dni );