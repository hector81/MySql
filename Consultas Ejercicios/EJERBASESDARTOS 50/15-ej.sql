#15-OBTENER TODAS LAS PAREJAS DE DNI DE CLIENTES Y CIFM DE MARCAS QUE NO SEAN DE LA MISMA CIUDAD
USE TABLASCOCHES;
USE TABLASCOCHES;
SELECT c.dni, m.cifm FROM Marcas m
JOIN Clientes c ON c.ciudad != m.ciudad;