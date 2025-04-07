<div align="justify">

# Unidad-5-tarea-9 sobre Creación y manipulación en SQLite3 desde línea de comandos. <br> Funciones matemáticas, subconsultas y JOIN.

### Paso 1: Creación de la BBDD

Se obtiene el contenido del fichero __base-datos-alumnos.sql__.

```sql
    
  CREATE TABLE IF NOT EXISTS Alumnos (
      id INTEGER PRIMARY KEY,
      nombre TEXT,
      edad INTEGER,
      direccion TEXT
  );

  INSERT INTO Alumnos (nombre, edad, direccion) VALUES
      ('Juan', 20, 'Calle A'),
      ('María', 21, 'Calle B'),
      ('Pedro', 19, 'Calle C'),
      ('Laura', 22, 'Calle D'),
      ('Carlos', 20, 'Calle E'),
      ('Ana', 19, 'Calle F'),
      ('Sofía', 21, 'Calle G'),
      ('Diego', 20, 'Calle H'),
      ('Lucía', 22, 'Calle I'),
      ('Miguel', 19, 'Calle J');

  -- Crear tabla para las clases
  CREATE TABLE IF NOT EXISTS Clases (
      id INTEGER PRIMARY KEY,
      nombre TEXT,
      materia TEXT,
      profesor TEXT
  );

  INSERT INTO Clases (nombre, materia, profesor) VALUES
      ('Matemáticas 101', 'Matemáticas', 'Profesor X'),
      ('Historia Antigua', 'Historia', 'Profesor Y'),
      ('Literatura Moderna', 'Literatura', 'Profesor Z'),
      ('Biología Avanzada', 'Biología', 'Profesor W'),
      ('Química Orgánica', 'Química', 'Profesor V'),
      ('Física Cuántica', 'Física', 'Profesor U'),
      ('Arte Contemporáneo', 'Arte', 'Profesor T'),
      ('Inglés Avanzado', 'Idiomas', 'Profesor S'),
      ('Economía Internacional', 'Economía', 'Profesor R'),
      ('Derecho Penal', 'Derecho', 'Profesor Q');


  CREATE TABLE IF NOT EXISTS Inscripciones (
      id INTEGER PRIMARY KEY,
      id_alumno INTEGER,
      id_clase INTEGER,
      FOREIGN KEY (id_alumno) REFERENCES Alumnos(id),
      FOREIGN KEY (id_clase) REFERENCES Clases(id)
  );

  INSERT INTO Inscripciones (id_alumno, id_clase) VALUES
      (1, 1), 
      (1, 2), 
      (2, 3), 
      (2, 4), 
      (3, 5), 
      (3, 6), 
      (4, 7), 
      (4, 8), 
      (5, 9), 
      (6, 10);

```

***

### Paso 2 Lectura del fichero sql (base-datos-alumnos.sql).

Para trabajar con el fichero base-datos-clientes.sql, creo una base de datos (tarea9.db) para, posteriormente realizar las correspondientes consultas. Se ejecuta el siguiente comando (previa apertura de un terminal en la misma carpeta 'Unidad-5-tarea-9'):

```sql
sqlite3 tarea9.db 
```

Haciendo un __.read__ del fichero __sql__, de nombre __base-datos-alumnos.sql__, realiza la creación e inserción de información de la base de datos &#x1F4DA;:

  ```
  ~/Escritorio/BAE tareas SQLite/Unidad-5-tarea-9$ sqlite3 tarea9.db
  SQLite version 3.37.2 2022-01-06 13:25:41
  Enter ".help" for usage hints.
  sqlite> .mode table
  sqlite> .read base-datos-alumnos.sql
  sqlite> .table
  Alumnos        Clases         Inscripciones
  sqlite>
  ```


  ```
  sqlite> select * from Alumnos;
  +----+--------+------+-----------+
  | id | nombre | edad | direccion |
  +----+--------+------+-----------+
  | 1  | Juan   | 20   | Calle A   |
  | 2  | María  | 21   | Calle B   |
  | 3  | Pedro  | 19   | Calle C   |
  | 4  | Laura  | 22   | Calle D   |
  | 5  | Carlos | 20   | Calle E   |
  | 6  | Ana    | 19   | Calle F   |
  | 7  | Sofía  | 21   | Calle G   |
  | 8  | Diego  | 20   | Calle H   |
  | 9  | Lucía  | 22   | Calle I   |
  | 10 | Miguel | 19   | Calle J   |
  +----+--------+------+-----------+
  sqlite> select * from Clases;
  +----+------------------------+-------------+------------+
  | id |         nombre         |   materia   |  profesor  |
  +----+------------------------+-------------+------------+
  | 1  | Matemáticas 101        | Matemáticas | Profesor X |
  | 2  | Historia Antigua       | Historia    | Profesor Y |
  | 3  | Literatura Moderna     | Literatura  | Profesor Z |
  | 4  | Biología Avanzada      | Biología    | Profesor W |
  | 5  | Química Orgánica       | Química     | Profesor V |
  | 6  | Física Cuántica        | Física      | Profesor U |
  | 7  | Arte Contemporáneo     | Arte        | Profesor T |
  | 8  | Inglés Avanzado        | Idiomas     | Profesor S |
  | 9  | Economía Internacional | Economía    | Profesor R |
  | 10 | Derecho Penal          | Derecho     | Profesor Q |
  +----+------------------------+-------------+------------+
  sqlite> select * from Inscripciones;
  +----+-----------+----------+
  | id | id_alumno | id_clase |
  +----+-----------+----------+
  | 1  | 1         | 1        |
  | 2  | 1         | 2        |
  | 3  | 2         | 3        |
  | 4  | 2         | 4        |
  | 5  | 3         | 5        |
  | 6  | 3         | 6        |
  | 7  | 4         | 7        |
  | 8  | 4         | 8        |
  | 9  | 5         | 9        |
  | 10 | 6         | 10       |
  +----+-----------+----------+
  sqlite> 

  ```

***

### Paso 3: Consultas a realizar y que aparecen en el archivo __consultas-bbdd.sql__.

A continuación muestro las consultas realizadas y el resultado (salida), recordando que &#x1F9D0; el uso del JOIN es posible debido a la presencia de FK, las cuales, en este caso, se encuentran en la tabla de Inscripciones:

-- Obtener el nombre del alumno y el nombre de la clase en la que está inscrito.

  ```
  sqlite> SELECT Alumnos.nombre AS alumnos, Clases.nombre AS clase
  FROM Inscripciones I
  JOIN Alumnos ON I.id_alumno = Alumnos.id
  JOIN Clases ON I.id_clase = Clases.id;
  +---------+------------------------+
  | alumnos |         clase          |
  +---------+------------------------+
  | Juan    | Matemáticas 101        |
  | Juan    | Historia Antigua       |
  | María   | Literatura Moderna     |
  | María   | Biología Avanzada      |
  | Pedro   | Química Orgánica       |
  | Pedro   | Física Cuántica        |
  | Laura   | Arte Contemporáneo     |
  | Laura   | Inglés Avanzado        |
  | Carlos  | Economía Internacional |
  | Ana     | Derecho Penal          |
  +---------+------------------------+
  sqlite> 
 
  ```
  - &#x1F4DD; Si se realiza con una subconsulta, el resultado puede ser el siguiente:

    ```
    sqlite> SELECT (SELECT nombre FROM Alumnos WHERE Alumnos.id = I.id_alumno) AS NombreAlumnos, (SELECT nombre FROM Clases WHERE Clases.id = I.id_clase) AS NombreClase FROM Inscripciones AS I;
    +---------------+------------------------+
    | NombreAlumnos |      NombreClase       |
    +---------------+------------------------+
    | Juan          | Matemáticas 101        |
    | Juan          | Historia Antigua       |
    | María         | Literatura Moderna     |
    | María         | Biología Avanzada      |
    | Pedro         | Química Orgánica       |
    | Pedro         | Física Cuántica        |
    | Laura         | Arte Contemporáneo     |
    | Laura         | Inglés Avanzado        |
    | Carlos        | Economía Internacional |
    | Ana           | Derecho Penal          |
    +---------------+------------------------+
    sqlite>

    ```

-- Obtener el nombre del alumno y la materia de las clases en las que está inscrito.

```
  sqlite> SELECT Alumnos.nombre AS NombreAlumno, Clases.materia AS Materia
  FROM Inscripciones AS I
  JOIN Alumnos ON I.id_alumno = Alumnos.id
  JOIN Clases ON I.id_clase = Clases.id;
  +--------------+-------------+
  | NombreAlumno |   Materia   |
  +--------------+-------------+
  | Juan         | Matemáticas |
  | Juan         | Historia    |
  | María        | Literatura  |
  | María        | Biología    |
  | Pedro        | Química     |
  | Pedro        | Física      |
  | Laura        | Arte        |
  | Laura        | Idiomas     |
  | Carlos       | Economía    |
  | Ana          | Derecho     |
  +--------------+-------------+
  sqlite>

```

- &#x1F4DD; Podría usar una subconsulta para obtener la misma salida:

```
  sqlite> SELECT (SELECT nombre FROM Alumnos WHERE Alumnos.id = I.id_alumno) AS NombreAlumno, (SELECT materia FROM Clases WHERE Clases.id = I.id_clase) AS Materia FROM Inscripciones AS I;
  +--------------+-------------+
  | NombreAlumno |   Materia   |
  +--------------+-------------+
  | Juan         | Matemáticas |
  | Juan         | Historia    |
  | María        | Literatura  |
  | María        | Biología    |
  | Pedro        | Química     |
  | Pedro        | Física      |
  | Laura        | Arte        |
  | Laura        | Idiomas     |
  | Carlos       | Economía    |
  | Ana          | Derecho     |
  +--------------+-------------+
  sqlite>

```

-- Obtener el nombre del alumno, la edad y el nombre del profesor de las clases en las que está inscrito.

```
  sqlite> SELECT Alumnos.nombre AS NombreAlumno, Alumnos.edad AS Edad, Clases.profesor AS Profesor
  FROM Inscripciones AS I
  JOIN Alumnos ON I.id_alumno = Alumnos.id
  JOIN Clases ON I.id_clase = Clases.id;
  +--------------+------+------------+
  | NombreAlumno | Edad |  Profesor  |
  +--------------+------+------------+
  | Juan         | 20   | Profesor X |
  | Juan         | 20   | Profesor Y |
  | María        | 21   | Profesor Z |
  | María        | 21   | Profesor W |
  | Pedro        | 19   | Profesor V |
  | Pedro        | 19   | Profesor U |
  | Laura        | 22   | Profesor T |
  | Laura        | 22   | Profesor S |
  | Carlos       | 20   | Profesor R |
  | Ana          | 19   | Profesor Q |
  +--------------+------+------------+
  sqlite> 

```
- &#x1F4DD; De otra forma, mediante el uso de una subconsulta, se puede cazar el mismo resultado:

```
  sqlite> SELECT (SELECT nombre FROM Alumnos WHERE Alumnos.id = I.id_alumno) AS NombreAlumno, (SELECT edad FROM Alumnos WHERE Alumnos.id = I.id_alumno) AS Edad, (SELECT profesor FROM Clases WHERE Clases.id = I.id_clase) AS Profesor FROM Inscripciones AS I;
  +--------------+------+------------+
  | NombreAlumno | Edad |  Profesor  |
  +--------------+------+------------+
  | Juan         | 20   | Profesor X |
  | Juan         | 20   | Profesor Y |
  | María        | 21   | Profesor Z |
  | María        | 21   | Profesor W |
  | Pedro        | 19   | Profesor V |
  | Pedro        | 19   | Profesor U |
  | Laura        | 22   | Profesor T |
  | Laura        | 22   | Profesor S |
  | Carlos       | 20   | Profesor R |
  | Ana          | 19   | Profesor Q |
  +--------------+------+------------+
  sqlite> 
```

-- Obtener el nombre del alumno y la dirección de las clases en las que está inscrito.

```
sqlite> SELECT Alumnos.nombre AS NombreAlumno, Alumnos.direccion AS Direccion
FROM Inscripciones AS I
JOIN Alumnos ON I.id_alumno = Alumnos.id;
+--------------+-----------+
| NombreAlumno | Direccion |
+--------------+-----------+
| Juan         | Calle A   |
| Juan         | Calle A   |
| María        | Calle B   |
| María        | Calle B   |
| Pedro        | Calle C   |
| Pedro        | Calle C   |
| Laura        | Calle D   |
| Laura        | Calle D   |
| Carlos       | Calle E   |
| Ana          | Calle F   |
+--------------+-----------+
sqlite> 
```
- &#x1F4DD; Se puede realizar la misma salida con la siguiente subconsulta:

```
  sqlite> SELECT (SELECT nombre FROM Alumnos WHERE Alumnos.id = I.id_alumno) AS NombreAlumno, (SELECT direccion FROM Alumnos WHERE Alumnos.id = I.id_alumno) AS Direccion FROM Inscripciones AS I;
  +--------------+-----------+
  | NombreAlumno | Direccion |
  +--------------+-----------+
  | Juan         | Calle A   |
  | Juan         | Calle A   |
  | María        | Calle B   |
  | María        | Calle B   |
  | Pedro        | Calle C   |
  | Pedro        | Calle C   |
  | Laura        | Calle D   |
  | Laura        | Calle D   |
  | Carlos       | Calle E   |
  | Ana          | Calle F   |
  +--------------+-----------+
  sqlite>

```
-- Obtener el nombre del alumno y el nombre de la clase junto con el profesor.

```
  sqlite> SELECT Alumnos.nombre AS NombreAlumno, Clases.nombre AS NombreClase, Clases.profesor AS Profesor
  FROM Inscripciones AS I
  JOIN Alumnos ON I.id_alumno = Alumnos.id
  JOIN Clases ON I.id_clase = Clases.id;
  +--------------+------------------------+------------+
  | NombreAlumno |      NombreClase       |  Profesor  |
  +--------------+------------------------+------------+
  | Juan         | Matemáticas 101        | Profesor X |
  | Juan         | Historia Antigua       | Profesor Y |
  | María        | Literatura Moderna     | Profesor Z |
  | María        | Biología Avanzada      | Profesor W |
  | Pedro        | Química Orgánica       | Profesor V |
  | Pedro        | Física Cuántica        | Profesor U |
  | Laura        | Arte Contemporáneo     | Profesor T |
  | Laura        | Inglés Avanzado        | Profesor S |
  | Carlos       | Economía Internacional | Profesor R |
  | Ana          | Derecho Penal          | Profesor Q |
  +--------------+------------------------+------------+
  sqlite> 
```
- &#x1F4DD; Se podria usar una subconsulta como la siguiente para cazar el mismo resultado:

```
  sqlite> SELECT (SELECT nombre FROM Alumnos WHERE Alumnos.id = I.id_alumno) AS NombreAlumno, (SELECT nombre FROM Clases WHERE Clases.id = I.id_clase) AS NombreClase, (SELECT profesor FROM Clases WHERE Clases.id = I.id_clase) AS Profesor FROM Inscripciones AS I;
  +--------------+------------------------+------------+
  | NombreAlumno |      NombreClase       |  Profesor  |
  +--------------+------------------------+------------+
  | Juan         | Matemáticas 101        | Profesor X |
  | Juan         | Historia Antigua       | Profesor Y |
  | María        | Literatura Moderna     | Profesor Z |
  | María        | Biología Avanzada      | Profesor W |
  | Pedro        | Química Orgánica       | Profesor V |
  | Pedro        | Física Cuántica        | Profesor U |
  | Laura        | Arte Contemporáneo     | Profesor T |
  | Laura        | Inglés Avanzado        | Profesor S |
  | Carlos       | Economía Internacional | Profesor R |
  | Ana          | Derecho Penal          | Profesor Q |
  +--------------+------------------------+------------+
  sqlite>

```

-- Obtener el nombre del alumno, la materia y el nombre del profesor de las clases en las que está inscrito.

```
  sqlite> SELECT Alumnos.nombre AS NombreAlumno, Clases.materia AS Materia, Clases.profesor AS Profesor
  FROM Inscripciones AS I
  JOIN Alumnos ON I.id_alumno = Alumnos.id
  JOIN Clases ON I.id_clase = Clases.id;
  +--------------+-------------+------------+
  | NombreAlumno |   Materia   |  Profesor  |
  +--------------+-------------+------------+
  | Juan         | Matemáticas | Profesor X |
  | Juan         | Historia    | Profesor Y |
  | María        | Literatura  | Profesor Z |
  | María        | Biología    | Profesor W |
  | Pedro        | Química     | Profesor V |
  | Pedro        | Física      | Profesor U |
  | Laura        | Arte        | Profesor T |
  | Laura        | Idiomas     | Profesor S |
  | Carlos       | Economía    | Profesor R |
  | Ana          | Derecho     | Profesor Q |
  +--------------+-------------+------------+
  sqlite>
```
- &#x1F4DD; También se puede realizar mediante una subconsulta como la siguiente:

```
  sqlite> SELECT (SELECT nombre FROM Alumnos WHERE Alumnos.id = I.id_alumno) AS NombreAlumno, (SELECT materia FROM Clases WHERE Clases.id = I.id_clase) AS Materia, (SELECT profesor FROM Clases WHERE Clases.id = I.id_clase) AS Profesor FROM Inscripciones AS I;
  +--------------+-------------+------------+
  | NombreAlumno |   Materia   |  Profesor  |
  +--------------+-------------+------------+
  | Juan         | Matemáticas | Profesor X |
  | Juan         | Historia    | Profesor Y |
  | María        | Literatura  | Profesor Z |
  | María        | Biología    | Profesor W |
  | Pedro        | Química     | Profesor V |
  | Pedro        | Física      | Profesor U |
  | Laura        | Arte        | Profesor T |
  | Laura        | Idiomas     | Profesor S |
  | Carlos       | Economía    | Profesor R |
  | Ana          | Derecho     | Profesor Q |
  +--------------+-------------+------------+
  sqlite> 

```

-- Obtener el nombre del alumno, la edad y la materia de las clases en las que está inscrito.

```
  sqlite> SELECT Alumnos.nombre AS NombreAlumno, Alumnos.edad AS Edad, Clases.materia AS Materia
  FROM Inscripciones AS I
  JOIN Alumnos ON I.id_alumno = Alumnos.id
  JOIN Clases ON I.id_clase = Clases.id;
  +--------------+------+-------------+
  | NombreAlumno | Edad |   Materia   |
  +--------------+------+-------------+
  | Juan         | 20   | Matemáticas |
  | Juan         | 20   | Historia    |
  | María        | 21   | Literatura  |
  | María        | 21   | Biología    |
  | Pedro        | 19   | Química     |
  | Pedro        | 19   | Física      |
  | Laura        | 22   | Arte        |
  | Laura        | 22   | Idiomas     |
  | Carlos       | 20   | Economía    |
  | Ana          | 19   | Derecho     |
  +--------------+------+-------------+
  sqlite> 
```
- &#x1F4DD; Se podría realizar en una subconsulta de la siguiente forma:

```
  sqlite> SELECT (SELECT nombre FROM Alumnos WHERE Alumnos.id = I.id_alumno) AS NombreAlumno, (SELECT edad FROM Alumnos WHERE Alumnos.id = I.id_alumno) AS Edad, (SELECT materia FROM Clases WHERE Clases.id = I.id_clase) AS Materia FROM Inscripciones AS I;
  +--------------+------+-------------+
  | NombreAlumno | Edad |   Materia   |
  +--------------+------+-------------+
  | Juan         | 20   | Matemáticas |
  | Juan         | 20   | Historia    |
  | María        | 21   | Literatura  |
  | María        | 21   | Biología    |
  | Pedro        | 19   | Química     |
  | Pedro        | 19   | Física      |
  | Laura        | 22   | Arte        |
  | Laura        | 22   | Idiomas     |
  | Carlos       | 20   | Economía    |
  | Ana          | 19   | Derecho     |
  +--------------+------+-------------+
  sqlite>
```

-- Obtener el nombre del alumno, la dirección y el profesor de las clases en las que está inscrito.


```
  sqlite> SELECT Alumnos.nombre AS NombreAlumno, Alumnos.direccion AS Direccion, Clases.profesor AS Profesor
  FROM Inscripciones AS I
  JOIN Alumnos ON I.id_alumno = Alumnos.id
  JOIN Clases ON I.id_clase = Clases.id;
  +--------------+-----------+------------+
  | NombreAlumno | Direccion |  Profesor  |
  +--------------+-----------+------------+
  | Juan         | Calle A   | Profesor X |
  | Juan         | Calle A   | Profesor Y |
  | María        | Calle B   | Profesor Z |
  | María        | Calle B   | Profesor W |
  | Pedro        | Calle C   | Profesor V |
  | Pedro        | Calle C   | Profesor U |
  | Laura        | Calle D   | Profesor T |
  | Laura        | Calle D   | Profesor S |
  | Carlos       | Calle E   | Profesor R |
  | Ana          | Calle F   | Profesor Q |
  +--------------+-----------+------------+
  sqlite>
```
- &#x1F4DD; Se puede modificar la consuta para hacerlo mediante una subconsulta con la siguiente forma:

```
  sqlite> SELECT (SELECT nombre FROM Alumnos WHERE Alumnos.id = I.id_alumno) AS NombreAlumno, (SELECT direccion FROM Alumnos WHERE Alumnos.id = I.id_alumno) AS Direccion, (SELECT profesor FROM Clases WHERE Clases.id = I id_clase) AS Profesor FROM Inscripciones AS I;
  +--------------+-----------+------------+
  | NombreAlumno | Direccion |  Profesor  |
  +--------------+-----------+------------+
  | Juan         | Calle A   | Profesor X |
  | Juan         | Calle A   | Profesor Y |
  | María        | Calle B   | Profesor Z |
  | María        | Calle B   | Profesor W |
  | Pedro        | Calle C   | Profesor V |
  | Pedro        | Calle C   | Profesor U |
  | Laura        | Calle D   | Profesor T |
  | Laura        | Calle D   | Profesor S |
  | Carlos       | Calle E   | Profesor R |
  | Ana          | Calle F   | Profesor Q |
  +--------------+-----------+------------+
  sqlite> 
```

-- Obtener el nombre del alumno y la materia de las clases en las que está inscrito, ordenado por el nombre del alumno.

```
  sqlite> SELECT Alumnos.nombre AS NombreAlumno, Clases.materia AS Materia
  FROM Inscripciones AS I
  JOIN Alumnos ON I.id_alumno = Alumnos.id
  JOIN Clases ON I.id_clase = Clases.id
  ORDER BY Alumnos.nombre;
  +--------------+-------------+
  | NombreAlumno |   Materia   |
  +--------------+-------------+
  | Ana          | Derecho     |
  | Carlos       | Economía    |
  | Juan         | Matemáticas |
  | Juan         | Historia    |
  | Laura        | Arte        |
  | Laura        | Idiomas     |
  | María        | Literatura  |
  | María        | Biología    |
  | Pedro        | Química     |
  | Pedro        | Física      |
  +--------------+-------------+
  sqlite>

```
- &#x1F4DD; O bien se puede realizar mediante una subconsulta:

```
  sqlite> SELECT (SELECT nombre FROM Alumnos WHERE Alumnos.id = I.id_alumno) AS NombreAlumno,
  (SELECT materia FROM Clases WHERE Clases.id = I.id_clase) AS Materia FROM Inscripciones AS I ORDER BY NombreAlumno;
  +--------------+-------------+
  | NombreAlumno |   Materia   |
  +--------------+-------------+
  | Ana          | Derecho     |
  | Carlos       | Economía    |
  | Juan         | Matemáticas |
  | Juan         | Historia    |
  | Laura        | Arte        |
  | Laura        | Idiomas     |
  | María        | Literatura  |
  | María        | Biología    |
  | Pedro        | Química     |
  | Pedro        | Física      |
  +--------------+-------------+
  sqlite> 
```

-- Contar cuántos alumnos están inscritos en cada clase.

```
  sqlite> SELECT Clases.nombre AS NombreClase, COUNT(I.id_alumno) AS AlumnosInscritos
  FROM Inscripciones AS I
  JOIN Clases ON I.id_clase = Clases.id
  GROUP BY Clases.id;
  +------------------------+------------------+
  |      NombreClase       | AlumnosInscritos |
  +------------------------+------------------+
  | Matemáticas 101        | 1                |
  | Historia Antigua       | 1                |
  | Literatura Moderna     | 1                |
  | Biología Avanzada      | 1                |
  | Química Orgánica       | 1                |
  | Física Cuántica        | 1                |
  | Arte Contemporáneo     | 1                |
  | Inglés Avanzado        | 1                |
  | Economía Internacional | 1                |
  | Derecho Penal          | 1                |
  +------------------------+------------------+
  sqlite>
```
- &#x1F4DD; O, también se puede realizar en forma de subconsulta:

```
  sqlite> SELECT (SELECT nombre FROM Clases WHERE Clases.id = I.id_clase) AS NombreClase, COUNT(*) AS AlumnosInscritos FROM Inscripciones AS I GROUP BY I.id_clase;
  +------------------------+------------------+
  |      NombreClase       | AlumnosInscritos |
  +------------------------+------------------+
  | Matemáticas 101        | 1                |
  | Historia Antigua       | 1                |
  | Literatura Moderna     | 1                |
  | Biología Avanzada      | 1                |
  | Química Orgánica       | 1                |
  | Física Cuántica        | 1                |
  | Arte Contemporáneo     | 1                |
  | Inglés Avanzado        | 1                |
  | Economía Internacional | 1                |
  | Derecho Penal          | 1                |
  +------------------------+------------------+
  sqlite> 


```

</div>
