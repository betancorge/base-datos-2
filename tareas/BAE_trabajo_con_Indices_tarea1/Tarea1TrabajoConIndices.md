<div align="justify">

# Tarea 1 de trabajo con índices

Un instituto de enseñanza guarda los siguientes datos de sus alumnos:
 - número de inscripción, comienza desde 1 cada año,
 - año de inscripción,
 - nombre del alumno,
 - documento del alumno,
 - domicilio,
 - ciudad,
 - provincia,
 - clave primaria: número de inscripto y año de inscripción.

### Ejercicios:

Previamente, lo que he hecho es crear la carpete de trabajo, acceder a un terminal SQLite 3 y comenzar a crear la base de datos, en este caso, la he llamado instituto.db:

    ´´´
    ~/Escritorio/BAE_trabajo_con_Indices_tarea1$ sqlite3 instituto.db
    SQLite version 3.37.2 2022-01-06 13:25:41
    Enter ".help" for usage hints.

    ´´´
De esta forma, iré poniendo cada comando y su salida en cada apartado:

- Elimine la tabla "alumno" si existe. 
    >__Nota__:_Muestra el comando y la salida_.

    ```
    sqlite> DROP TABLE IF EXISTS alumno;
    sqlite> 
    ```

- Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de 
inscripción).
    >__Nota__:_Muestra el comando y la salida_. 

    ```
    sqlite> CREATE TABLE alumno (
    num_inscripcion INTEGER,
    anio_inscripcion INTEGER,
    nombre TEXT NOT NULL,
    documento TEXT NOT NULL,
    domicilio TEXT,
    ciudad TEXT,
    provincia TEXT,
    PRIMARY KEY (anio_inscripcion, num_inscripcion)
    );
    sqlite> .mode table
    sqlite> .table
    alumno
    sqlite> 
    ```
    - NOTA: Puede observarse que se ha creado la tabla "alumno" con sus correspodientes campos (columnas). Ahora bien, está vacía porque todavía no he insertado ningún registro (fila).

- Define los siguientes indices:
   - Un índice único por el campo "documento" y un índice común por ciudad y provincia.
        >__Nota__:_Muestra el comando y la salida. Justifica el tipo de indice en un comentario_.
                
        ```
        sqlite> CREATE UNIQUE INDEX idx_documento ON alumno(documento);
        sqlite> 
        ```

        ```
        sqlite> CREATE INDEX idx_ciudad_provincia ON alumno(ciudad, provincia);
        sqlite>
        ```
        - NOTA: Entendiendo que no se podría, en este caso, repetir ningún documento, es por ello que se crea como índice único (UNIQUE). Por otro lado, el índice común persigue que haya búsquedas más rápidas por los campos ciudad y provincia.

    - Vea los índices de la tabla.
        >__Nota__:_Muestra el comando y la salida __"show index"___.
    
        ```
        sqlite> PRAGMA index_list('alumno');
        +-----+---------------------------+--------+--------+---------+
        | seq |           name            | unique | origin | partial |
        +-----+---------------------------+--------+--------+---------+
        | 0   | idx_ciudad_provincia      | 0      | c      | 0       |
        | 1   | idx_documento             | 1      | c      | 0       |
        | 2   | sqlite_autoindex_alumno_1 | 1      | pk     | 0       |
        +-----+---------------------------+--------+--------+---------+
        sqlite> 
        ```

- Intente ingresar un alumno con clave primaria repetida.
    >__Nota__:_Muestra el comando y la salida_.

        
    ```
    sqlite> INSERT INTO alumno (num_inscripcion, anio_inscripcion, nombre, documento, domicilio, ciudad, provincia)
    VALUES (1, 2025, 'Pedro Picapiedra', '12345678', 'Calle El Chicharro 2', 'Puerto Cruz', 'Santa Cruz de Tenerife');
    sqlite> select * from alumno
    ...> ;
    +-----------------+------------------+------------------+-----------+----------------------+-------------+------------------------+
    | num_inscripcion | anio_inscripcion |      nombre      | documento |      domicilio       |   ciudad    |       provincia        |
    +-----------------+------------------+------------------+-----------+----------------------+-------------+------------------------+
    | 1               | 2025             | Pedro Picapiedra | 12345678  | Calle El Chicharro 2 | Puerto Cruz | Santa Cruz de Tenerife |
    +-----------------+------------------+------------------+-----------+----------------------+-------------+------------------------+
    sqlite> 

    sqlite> INSERT INTO alumno (num_inscripcion, anio_inscripcion, nombre, documento, domicilio, ciudad, provincia)
    VALUES (1, 2025, 'Pablo Mármol', '12345679', 'Calle El Chicharro 3', 'Puerto Cruz', 'Santa Cruz de Tenerife');
    Error: stepping, UNIQUE constraint failed: alumno.anio_inscripcion, alumno.num_inscripcion (19)
    sqlite> 

    ```
    - NOTA: Primero se inserta un registro correcto (Pedro Picapiedra) y luego el siguiente (Pablo Mármol) con el misma clave primaria dado el correspondiente error.

- Intente ingresar un alumno con documento repetido.
    >__Nota__:_Muestra el comando y la salida_.
        
    ```
    sqlite> INSERT INTO alumno (num_inscripcion, anio_inscripcion, nombre, documento, domicilio, ciudad, provincia)
    VALUES (2, 2025, 'Rita Lacantaora', '12345678', 'Calle El Chicharro 4', 'Puerto Cruz', 'Santa Cruz de Tenerife');
    Error: stepping, UNIQUE constraint failed: alumno.documento (19)
    sqlite> 
    ```
    - NOTA: No es posible insertar a "Rita Lacantaora" porque hemos dicho que cada registro de "documento" es UNIQUE, no debe haber dos iguales.

- Ingrese varios alumnos de la misma ciudad y provincia.
    >__Nota__:_Muestra el comando y la salida_.

        
    ```
    sqlite> INSERT INTO alumno (num_inscripcion, anio_inscripcion, nombre, documento, domicilio, ciudad, provincia)
    VALUES (2, 2025, 'Rita Lacantaora', '12345677', 'Calle El Chicharro 4', 'Puerto Cruz', 'Santa Cruz de Tenerife');
    sqlite> INSERT INTO alumno (num_inscripcion, anio_inscripcion, nombre, documento, domicilio, ciudad, provincia)
    VALUES (3, 2025, 'Pablo Mármol', '12345679', 'Calle El Chicharro 3', 'Puerto Cruz', 'Santa Cruz de Tenerife');
    sqlite> INSERT INTO alumno (num_inscripcion, anio_inscripcion, nombre, documento, domicilio, ciudad, provincia)
    VALUES (4, 2025, 'Filemón Pi', '12345699', 'Calle El Chicharro 5', 'Puerto Cruz', 'Santa Cruz de Tenerife');
    sqlite> select * from alumno;
    +-----------------+------------------+------------------+-----------+----------------------+-------------+------------------------+
    | num_inscripcion | anio_inscripcion |      nombre      | documento |      domicilio       |   ciudad    |       provincia        |
    +-----------------+------------------+------------------+-----------+----------------------+-------------+------------------------+
    | 1               | 2025             | Pedro Picapiedra | 12345678  | Calle El Chicharro 2 | Puerto Cruz | Santa Cruz de Tenerife |
    | 2               | 2025             | Rita Lacantaora  | 12345677  | Calle El Chicharro 4 | Puerto Cruz | Santa Cruz de Tenerife |
    | 3               | 2025             | Pablo Mármol     | 12345679  | Calle El Chicharro 3 | Puerto Cruz | Santa Cruz de Tenerife |
    | 4               | 2025             | Filemón Pi       | 12345699  | Calle El Chicharro 5 | Puerto Cruz | Santa Cruz de Tenerife |
    +-----------------+------------------+------------------+-----------+----------------------+-------------+------------------------+
    sqlite> 

    ```

- Elimina los indices creados, y muestra que ya no se encuentran.
    >__Nota__:_Muestra el comando y la salida_.

    ```
    sqlite> DROP INDEX IF EXISTS idx_documento;
    sqlite>                                   

    sqlite> DROP INDEX IF EXISTS idx_cuidad_provincia;
    sqlite> 

    sqlite> PRAGMA index_list('alumno');
    +-----+---------------------------+--------+--------+---------+
    | seq |           name            | unique | origin | partial |
    +-----+---------------------------+--------+--------+---------+
    | 0   | sqlite_autoindex_alumno_1 | 1      | pk     | 0       |
    +-----+---------------------------+--------+--------+---------+
    sqlite> 
    ```

</div>