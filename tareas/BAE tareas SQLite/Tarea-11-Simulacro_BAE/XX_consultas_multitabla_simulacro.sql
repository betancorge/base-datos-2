p-- 1. Consultas Básicas (8 consultas - 1.6 puntos)
-- Listar todos los libros disponibles

sqlite> SELECT * FROM libro;
+----+-----------------------------------+------------------------+-----------------+-----------------+------------+
| id |              titulo               |         autor          |     genero      | año_publicacion | disponible |
+----+-----------------------------------+------------------------+-----------------+-----------------+------------+
| 1  | El Quijote                        | Miguel de Cervantes    | Clásico         | 1605            | 1          |
| 2  | Cien años de soledad              | Gabriel García Márquez | Realismo mágico | 1967            | 0          |
| 3  | 1984                              | George Orwell          | Ciencia ficción | 1949            | 1          |
| 4  | Orgullo y prejuicio               | Jane Austen            | Romance         | 1813            | 0          |
| 5  | La sombra del viento              | Carlos Ruiz Zafón      | Misterio        | 2001            | 1          |
| 6  | Rayuela                           | Julio Cortázar         | Experimental    | 1963            | 0          |
| 7  | Ficciones                         | Jorge Luis Borges      | Cuentos         | 1944            | 1          |
| 8  | Los pilares de la Tierra          | Ken Follett            | Histórica       | 1989            | 0          |
| 9  | El amor en los tiempos del cólera | Gabriel García Márquez | Romance         | 1985            | 1          |
| 10 | La casa de los espíritus          | Isabel Allende         | Realismo mágico | 1982            | 0          |
+----+-----------------------------------+------------------------+-----------------+-----------------+------------+
sqlite> 

-- Mostrar socios de Madrid ordenados por apellido

sqlite> select * from socio where ciudad = 'Madrid' order by apellido1;
+----+--------+-----------+-----------+--------+------------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad | fecha_alta | categoria |
+----+--------+-----------+-----------+--------+------------+-----------+
| 1  | Laura  | García    | Martínez  | Madrid | 2020-03-15 | A         |
| 5  | Elena  | Martín    | Díaz      | Madrid | 2023-02-18 | B         |
+----+--------+-----------+-----------+--------+------------+-----------+


-- Libros publicados después de 1950

sqlite> select * from libro where año_publicacion > 1950;
+----+-----------------------------------+------------------------+-----------------+-----------------+------------+
| id |              titulo               |         autor          |     genero      | año_publicacion | disponible |
+----+-----------------------------------+------------------------+-----------------+-----------------+------------+
| 2  | Cien años de soledad              | Gabriel García Márquez | Realismo mágico | 1967            | 0          |
| 5  | La sombra del viento              | Carlos Ruiz Zafón      | Misterio        | 2001            | 1          |
| 6  | Rayuela                           | Julio Cortázar         | Experimental    | 1963            | 0          |
| 8  | Los pilares de la Tierra          | Ken Follett            | Histórica       | 1989            | 0          |
| 9  | El amor en los tiempos del cólera | Gabriel García Márquez | Romance         | 1985            | 1          |
| 10 | La casa de los espíritus          | Isabel Allende         | Realismo mágico | 1982            | 0          |
+----+-----------------------------------+------------------------+-----------------+-----------------+------------+
sqlite> 

-- Bibliotecarios con más de 3 años de antigüedad

sqlite> select * from bibliotecario where antiguedad > 3;
+----+-----------+-----------+-----------+------------+
| id |  nombre   | apellido1 | apellido2 | antiguedad |
+----+-----------+-----------+-----------+------------+
| 1  | Daniel    | Vázquez   | Gil       | 5          |
| 4  | Lucía     | Reyes     | Martín    | 7          |
| 6  | Isabel    | Morales   | Iglesias  | 4          |
| 7  | Francisco | Santana   | Méndez    | 6          |
+----+-----------+-----------+-----------+------------+
sqlite> 

-- Préstamos realizados en 2023

sqlite> select fecha_prestamo from prestamo where fecha_prestamo REGEXP '2023';
+----------------+
| fecha_prestamo |
+----------------+
| 2023-01-10     |
| 2023-02-15     |
| 2023-03-20     |
| 2023-04-05     |
| 2023-05-12     |
| 2023-01-22     |
| 2023-02-18     |
| 2023-03-25     |
| 2023-04-10     |
| 2023-05-15     |
| 2023-01-05     |
| 2023-02-10     |
| 2023-03-15     |
| 2023-04-20     |
| 2023-05-25     |
+----------------+
-- Si queremos obtener todos las columnas pero sólo con los registros de los préstamos realizados en 2023

sqlite> select * from prestamo where fecha_prestamo REGEXP '2023';
+----+----------------+------------------+----------+----------+
| id | fecha_prestamo | fecha_devolucion | id_socio | id_libro |
+----+----------------+------------------+----------+----------+
| 1  | 2023-01-10     | 2023-01-24       | 1        | 2        |
| 2  | 2023-02-15     | 2023-03-01       | 3        | 4        |
| 3  | 2023-03-20     |                  | 5        | 6        |
| 4  | 2023-04-05     | 2023-04-19       | 2        | 8        |
| 5  | 2023-05-12     |                  | 4        | 10       |
| 6  | 2023-01-22     | 2023-02-05       | 6        | 2        |
| 7  | 2023-02-18     | 2023-03-04       | 7        | 4        |
| 8  | 2023-03-25     |                  | 8        | 6        |
| 9  | 2023-04-10     | 2023-04-24       | 9        | 8        |
| 10 | 2023-05-15     |                  | 10       | 10       |
| 11 | 2023-01-05     | 2023-01-19       | 1        | 1        |
| 12 | 2023-02-10     | 2023-02-24       | 2        | 3        |
| 13 | 2023-03-15     |                  | 3        | 5        |
| 14 | 2023-04-20     | 2023-05-04       | 4        | 7        |
| 15 | 2023-05-25     |                  | 5        | 9        |
+----+----------------+------------------+----------+----------+
sqlite> 

-- Socios sin segundo apellido

sqlite> select * from socio where apellido2 IS NULL;
+----+----------+-----------+-----------+-----------+------------+-----------+
| id |  nombre  | apellido1 | apellido2 |  ciudad   | fecha_alta | categoria |
+----+----------+-----------+-----------+-----------+------------+-----------+
| 3  | Ana      | Sánchez   |           | Valencia  | 2022-01-10 | C         |
| 9  | Patricia | Romero    |           | Barcelona | 2023-01-15 | A         |
+----+----------+-----------+-----------+-----------+------------+-----------+
sqlite> 

-- Libros del género "Realismo mágico"

sqlite> select * from libro where genero REGEXP 'Realismo mágico';
+----+--------------------------+------------------------+-----------------+-----------------+------------+
| id |          titulo          |         autor          |     genero      | año_publicacion | disponible |
+----+--------------------------+------------------------+-----------------+-----------------+------------+
| 2  | Cien años de soledad     | Gabriel García Márquez | Realismo mágico | 1967            | 0          |
| 10 | La casa de los espíritus | Isabel Allende         | Realismo mágico | 1982            | 0          |
+----+--------------------------+------------------------+-----------------+-----------------+------------+
sqlite> 

-- Préstamos no devueltos (fecha_devolucion IS NULL)

sqlite> select * from prestamo where fecha_devolucion IS NULL;
+----+----------------+------------------+----------+----------+
| id | fecha_prestamo | fecha_devolucion | id_socio | id_libro |
+----+----------------+------------------+----------+----------+
| 3  | 2023-03-20     |                  | 5        | 6        |
| 5  | 2023-05-12     |                  | 4        | 10       |
| 8  | 2023-03-25     |                  | 8        | 6        |
| 10 | 2023-05-15     |                  | 10       | 10       |
| 13 | 2023-03-15     |                  | 3        | 5        |
| 15 | 2023-05-25     |                  | 5        | 9        |
+----+----------------+------------------+----------+----------+
sqlite> 


-- 2. Consultas Multitabla (WHERE) (8 consultas - 2.4 puntos)
-- Préstamos con nombres de socio y libro (sin JOIN)

sqlite> select s.nombre, s.apellido1, l.titulo from prestamo p, socio s, libro l where p.id_socio = s.id AND p.id_libro = l.id;
+----------+-----------+-----------------------------------+
|  nombre  | apellido1 |              titulo               |
+----------+-----------+-----------------------------------+
| Laura    | García    | Cien años de soledad              |
| Ana      | Sánchez   | Orgullo y prejuicio               |
| Elena    | Martín    | Rayuela                           |
| Carlos   | López     | Los pilares de la Tierra          |
| David    | Pérez     | La casa de los espíritus          |
| Javier   | Ruiz      | Cien años de soledad              |
| Sofía    | Hernández | Orgullo y prejuicio               |
| Miguel   | Navarro   | Rayuela                           |
| Patricia | Romero    | Los pilares de la Tierra          |
| Antonio  | Domingo   | La casa de los espíritus          |
| Laura    | García    | El Quijote                        |
| Carlos   | López     | 1984                              |
| Ana      | Sánchez   | La sombra del viento              |
| David    | Pérez     | Ficciones                         |
| Elena    | Martín    | El amor en los tiempos del cólera |
+----------+-----------+-----------------------------------+
sqlite> 

-- Libros prestados a socios de Barcelona (sin JOIN)
sqlite> select s.nombre, s.apellido1, s.ciudad, l.titulo from prestamo p, socio s, libro l where p.id_socio = s.id AND p.id_libro = l.id AND ciudad = 'Barcelona';
+----------+-----------+-----------+--------------------------+
|  nombre  | apellido1 |  ciudad   |          titulo          |
+----------+-----------+-----------+--------------------------+
| Carlos   | López     | Barcelona | Los pilares de la Tierra |
| Patricia | Romero    | Barcelona | Los pilares de la Tierra |
| Carlos   | López     | Barcelona | 1984                     |
+-------

-- Socios que han tomado prestado "Cien años de soledad" (sin JOIN)
sqlite> select s.apellido1, s.nombre, l.titulo from prestamo p, socio s, libro l where p.id_socio = s.id AND p.id_libro = l.id AND titulo = 'Cien años de soledad';
+-----------+--------+----------------------+
| apellido1 | nombre |        titulo        |
+-----------+--------+----------------------+
| García    | Laura  | Cien años de soledad |
| Ruiz      | Javier | Cien años de soledad |
+-----------+--------+----------------------+
sqlite> 

-- Bibliotecarios que han gestionado préstamos (sin JOIN)

No se puede realizar porque no existe id_bibliotecario

-- Préstamos con retraso (fecha_devolucion > fecha_prestamo + 14 días)
sqlite> SELECT p.id, l.titulo FROM prestamo p, libro l WHERE p.id_libro = l.id AND DATE(p.fecha_devolucion) > DATE(p.fecha_prestamo, '+14 days');
sqlite> 
-- las consultas anteriores no ofrecen resultados debido a que no existe ningún prestámo que haya superado los catorce días de retraso.

-- Socios con sus préstamos activos (SIN JOIN)
sqlite> select s.apellido1, s.nombre, l.titulo from prestamo p, socio s, libro l where p.id_socio = s.id AND p.id_libro = l.id AND DATE (p.fecha_devolucion) IS NULL;
+-----------+---------+-----------------------------------+
| apellido1 | nombre  |              titulo               |
+-----------+---------+-----------------------------------+
| Martín    | Elena   | Rayuela                           |
| Pérez     | David   | La casa de los espíritus          |
| Navarro   | Miguel  | Rayuela                           |
| Domingo   | Antonio | La casa de los espíritus          |
| Sánchez   | Ana     | La sombra del viento              |
| Martín    | Elena   | El amor en los tiempos del cólera |
+-----------+---------+-----------------------------------+
sqlite> 

-- Préstamos con datos completos (socio, libro, bibliotecario)


-- Socios que nunca han tomado prestado un libro (sin LEFT JOIN)

-- Libros más prestados (sin JOIN)

-- Autores cuyos libros han sido prestados (sin JOIN)



-- 3. Consultas Multitabla (JOIN) (8 consultas - 2.4 puntos)
-- Préstamos con nombres de socio y libro (JOIN)
sqlite> select s.nombre, s.apellido1, l.titulo from prestamo p JOIN socio s ON p.id_socio = s.id JOIN libro l ON p.id_libro = l.id;
+----------+-----------+-----------------------------------+
|  nombre  | apellido1 |              titulo               |
+----------+-----------+-----------------------------------+
| Laura    | García    | Cien años de soledad              |
| Ana      | Sánchez   | Orgullo y prejuicio               |
| Elena    | Martín    | Rayuela                           |
| Carlos   | López     | Los pilares de la Tierra          |
| David    | Pérez     | La casa de los espíritus          |
| Javier   | Ruiz      | Cien años de soledad              |
| Sofía    | Hernández | Orgullo y prejuicio               |
| Miguel   | Navarro   | Rayuela                           |
| Patricia | Romero    | Los pilares de la Tierra          |
| Antonio  | Domingo   | La casa de los espíritus          |
| Laura    | García    | El Quijote                        |
| Carlos   | López     | 1984                              |
| Ana      | Sánchez   | La sombra del viento              |
| David    | Pérez     | Ficciones                         |
| Elena    | Martín    | El amor en los tiempos del cólera |
+----------+-----------+-----------------------------------+
sqlite>

-- Libros prestados a socios de Barcelona (JOIN)
sqlite> select s.nombre, s.apellido1, s.ciudad, l.titulo from prestamo p JOIN socio s ON p.id_socio = s.id JOIN libro l ON p.id_libro = l.id AND ciudad = 'Barcelona';
+----------+-----------+-----------+--------------------------+
|  nombre  | apellido1 |  ciudad   |          titulo          |
+----------+-----------+-----------+--------------------------+
| Carlos   | López     | Barcelona | Los pilares de la Tierra |
| Patricia | Romero    | Barcelona | Los pilares de la Tierra |
| Carlos   | López     | Barcelona | 1984                     |
+----------+-----------+-----------+--------------------------+
sqlite> 

-- Socios que han tomado prestado "Cien años de soledad" (JOIN)
sqlite> select s.apellido1, s.nombre, l.titulo from prestamo p JOIN socio s ON p.id_socio = s.id JOIN libro l ON p.id_libro = l.id AND titulo = 'Cien años de soledad';
+-----------+--------+----------------------+
| apellido1 | nombre |        titulo        |
+-----------+--------+----------------------+
| García    | Laura  | Cien años de soledad |
| Ruiz      | Javier | Cien años de soledad |
+-----------+--------+----------------------+
sqlite> 

-- Bibliotecarios que han gestionado préstamos (JOIN)
No se puede realizar porque no existe id_bibliotecario

-- Préstamos con retraso (fecha_devolucion > fecha_prestamo + 14 días)
sqlite> SELECT p.id, l.titulo
FROM prestamo p JOIN libro l ON p.id_libro = l.id AND DATE(p.fecha_devolucion) > DATE(p.fecha_prestamo, '+14 days');
sqlite> 
-- las consultas anteriores no ofrecen resultados debido a que no existe ningún prestámo que haya superado los catorce días de retraso.

-- Préstamos con datos completos (socio, libro, bibliotecario)



-- Socios con sus préstamos activos (JOIN)
sqlite> select s.apellido1, s.nombre, l.titulo from prestamo p JOIN socio s ON p.id_socio = s.id JOIN libro l ON p.id_libro = l.id AND DATE (p.fecha_devolucion) IS NULL;
+-----------+---------+-----------------------------------+
| apellido1 | nombre  |              titulo               |
+-----------+---------+-----------------------------------+
| Martín    | Elena   | Rayuela                           |
| Pérez     | David   | La casa de los espíritus          |
| Navarro   | Miguel  | Rayuela                           |
| Domingo   | Antonio | La casa de los espíritus          |
| Sánchez   | Ana     | La sombra del viento              |
| Martín    | Elena   | El amor en los tiempos del cólera |
+-----------+---------+-----------------------------------+
sqlite> 

-- Libros nunca prestados (LEFT JOIN)

-- Autores con número de libros prestados (JOIN + GROUP BY)



-- 4. Consultas Resumen (8 consultas - 2.4 puntos)
-- Número de socios por ciudad

-- Promedio de antigüedad de bibliotecarios

-- Cantidad de préstamos por mes en 2023

-- Libros más populares (por veces prestados)

-- Socios más activos (por préstamos realizados)

-- Porcentaje de libros disponibles

-- Días promedio de préstamo

-- Número de préstamos por categoría de socio


-- 5. Subconsultas (8 consultas - 1.2 puntos)

-- Socios que han prestado libros de Gabriel García Márquez

-- Libros con préstamos superiores al promedio

-- Socios con todos los préstamos devueltos a tiempo

-- Bibliotecarios que no han gestionado préstamos

-- Socios que han prestado más libros que el promedio

-- Libros disponibles que nunca han sido prestados

-- Socios con préstamos en todas las categorías de libros

-- Bibliotecarios que han gestionado préstamos de todos los socios de Madrid
