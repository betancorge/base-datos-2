<div align="justify">

# Simulacro de bbdd (2) 🧪: Consultas, Índices, Vistas, Funciones y Procedimientos:


## 🧾 Contexto

Como analista de datos en una universidad, se te ha encargado la explotación de una base de datos que permita gestionar estudiantes, profesores, cursos y matrículas. Además, deberás demostrar habilidades en consultas SQL, índices, vistas, procedimientos y funciones. Si la base de datos no estuvira creada, a continuación tienes el [init.sql](docker-init/init.sql).

## Base de datos en docker

Crea una carpeta y añade el fichero **docker-compose.yml** y el directorio **docker-init**.

Ejecuta a continuación el siguiente comando:

```sql
docker compose up -d 
```

Obtendrar una salida similar a la siguiente:

```console
 docker compose up -d   
[+] Running 2/2
 ✔ Container adminer_container  Started                                                                                                             0.9s 
 ✔ Container mysql_container    Started    
```

- Nota: En mi caso, se tiene la siguiente salida:

```
    ~/Escritorio/Simulacro 2 optimizacion BBDD$ docker compose up -d
    [+] Running 17/17
    ✔ adminer Pulled                                                                                                            19.2s 
      ✔ ff558be7c662 Pull complete                                                                                               0.8s 
      ✔ 6d69de2e680c Pull complete                                                                                               0.7s 
      ✔ f18232174bc9 Pull complete                                                                                               5.8s 
      ✔ 50ec51de1f97 Pull complete                                                                                               7.5s 
      ✔ 242d92ffbbee Pull complete                                                                                               9.9s 
      ✔ e0d926e2db98 Pull complete                                                                                              15.1s 
      ✔ 18d5f8d392c5 Pull complete                                                                                              14.8s 
      ✔ 7c8a48837489 Pull complete                                                                                               9.8s 
      ✔ 3d3d2bcfdcb3 Pull complete                                                                                               0.7s 
      ✔ 301ebbeca55b Pull complete                                                                                              15.3s 
      ✔ 10b042581e15 Pull complete                                                                                              15.7s 
      ✔ 393cec7dfd4d Pull complete                                                                                               1.8s 
      ✔ 2b8d18bfad49 Pull complete                                                                                              16.1s 
      ✔ 69f347299a47 Pull complete                                                                                               7.7s 
      ✔ a33c8191db14 Pull complete                                                                                               1.3s 
      ✔ 4f4fb700ef54 Pull complete                                                                                               0.1s 
    [+] Running 4/4
    ✔ Network simulacro2optimizacionbbdd_db-network               Created                                                        0.3s 
    ✔ Volume "simulacro2optimizacionbbdd_mysql_universidad_data"  Created                                                        0.1s 
    ✔ Container mysql_container                                   Started                                                        3.8s 
    ✔ Container adminer_container                                 Started 
```

A continuación ejecuta el siguiente comando e indica que el *password* es **bae**. Tras este paso se verifica que estń disponibles las bases de datos y se opta por usar la base de datos *universidad*:

```console
docker exec -it mysql_container mysql -u root -p
```
Se muestra la siguiente salida, tras ejecutar el comando:

```sql
  docker exec -it mysql_container mysql -u root -p
  Enter password:
  Welcome to the MySQL monitor.  Commands end with ; or \g.
  Your MySQL connection id is 2
  Server version: 5.7.44 MySQL Community Server (GPL)

  Copyright (c) 2000, 2023, Oracle and/or its affiliates.

  Oracle is a registered trademark of Oracle Corporation and/or its
  affiliates. Other names may be trademarks of their respective
  owners.

  Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

  mysql> SHOW DATABASES;
  +--------------------+
  | Database           |
  +--------------------+
  | information_schema |
  | bae                |
  | mysql              |
  | performance_schema |
  | sys                |
  | universidad        |
  +--------------------+
  6 rows in set (0.00 sec)

mysql> 

```

> **NOTA IMPORTANTE**: *Para salir de la consola se debe de ejecutar* ***exit***.


```console
use universidad;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
```

También podemos acceder a través del navegador. Para ello utilizaremos **Adminer** porque *simula la línea de comandos, y nos ayuda a aprender*. Una vez que accedas a [http://localhost:8099](http://localhost:8099), Adminer te pedirá los siguientes datos:

> Puedes consultar la documentación [aquí](https://www.adminer.org/en/).

- **Sistema**: `MySQL`
- **Servidor**: `db`  
  *Es el nombre del servicio del contenedor MySQL dentro del mismo `docker-compose` (Adminer y MySQL están en la misma red `db-network`).*
- **Usuario**: `bae`
- **Contraseña**: `bae`

> ***Lee atentamente cada una de los puntos y cuestiones y realiza***.

## 🔎 Parte 1: Consultas SQL

### A. Consultas Simples

1. Mostrar todos los cursos disponibles.

```sql
    mysql> select * from cursos;
  +----+----------------------+-------------+----------+
  | id | nombre               | profesor_id | creditos |
  +----+----------------------+-------------+----------+
  |  1 | Álgebra Lineal      |           1 |        6 |
  |  2 | Programación I      |           2 |        5 |
  |  3 | Mecánica Clásica   |           3 |        6 |
  |  4 | Estructuras de Datos |           2 |        5 |
  |  5 | Cálculo I           |           1 |        6 |
  +----+----------------------+-------------+----------+
  5 rows in set (0.00 sec)

mysql> 

```

2. Mostrar el nombre de todos los profesores.

```sql
    mysql> select nombre from profesores;
  +------------------+
  | nombre           |
  +------------------+
  | Dra. Ana Torres  |
  | Dr. Luis Gómez  |
  | Dra. Marta Díaz |
  +------------------+
  3 rows in set (0.00 sec)

  mysql>

```

3. Listar todas las matrículas.

```sql

  mysql> select * from matriculas;
  +----+---------------+----------+------------+
  | id | estudiante_id | curso_id | fecha      |
  +----+---------------+----------+------------+
  |  1 |             1 |        1 | 2021-09-01 |
  |  2 |             2 |        2 | 2022-09-01 |
  |  3 |             3 |        3 | 2023-09-02 |
  |  4 |             4 |        4 | 2024-09-03 |
  |  5 |             1 |        5 | 2020-09-04 |
  |  6 |             2 |        4 | 2022-09-05 |
  |  7 |             3 |        1 | 2023-09-06 |
  |  8 |             4 |        2 | 2024-09-06 |
  +----+---------------+----------+------------+
  8 rows in set (0.00 sec)

  mysql> 
```

4. Ver los nombres y correos de los estudiantes.

```sql
    mysql> select e.nombre, e.email from estudiantes e;
  +-------------------+----------------+
  | nombre            | email          |
  +-------------------+----------------+
  | María López     | maria@uni.edu  |
  | Juan Pérez       | juan@uni.edu   |
  | Lucía Fernández | lucia@uni.edu  |
  | Carlos Ruiz       | carlos@uni.edu |
  +-------------------+----------------+
  4 rows in set (0.00 sec)

mysql> 

```

5. Ver los cursos y su número de créditos.

```sql
    mysql> select c.nombre, c.creditos from cursos c;
  +----------------------+----------+
  | nombre               | creditos |
  +----------------------+----------+
  | Álgebra Lineal      |        6 |
  | Programación I      |        5 |
  | Mecánica Clásica   |        6 |
  | Estructuras de Datos |        5 |
  | Cálculo I           |        6 |
  +----------------------+----------+
  5 rows in set (0.00 sec)

  mysql> 
```
---

### B. Consultas con `WHERE`. Obligatorio utilizar **WHERE** donde se **combine dos o más tablas**

1. Obtener los cursos impartidos por profesores del departamento de Informática.

```sql
   mysql> SELECT c.nombre FROM cursos c, profesores p WHERE c.profesor_id = p.id   AND p.departamento = 'Informatica';
+----------------------+
| nombre               |
+----------------------+
| Programación I      |
| Estructuras de Datos |
+----------------------+
2 rows in set (0.01 sec)

mysql> 
```
- NOTA: esta consulta costó realizarla porque, desde el terminal, no podía poner el acento en "Informática" así que tuve que modificarlo para usar 'Informatica'

2. Obtener los estudiantes que viven en Madrid.

```sql

  mysql> select e.ciudad, e.nombre from estudiantes e where ciudad = 'Madrid';
  +--------+---------------+
  | ciudad | nombre        |
  +--------+---------------+
  | Madrid | María López |
  +--------+---------------+
  1 row in set (0.01 sec)

  mysql> 

```

3. Mostrar los cursos con más de 5 créditos.

```sql
  mysql> select c.nombre from cursos c where creditos > 5;
  +--------------------+
  | nombre             |
  +--------------------+
  | Álgebra Lineal    |
  | Mecánica Clásica |
  | Cálculo I         |
  +--------------------+
  3 rows in set (0.00 sec)

  mysql> 

```

4. Ver las matrículas realizadas después del año 2022.

```sql

  mysql> select m.fecha, m.id from matriculas m where date(m.fecha) > '2022-12-31';
  +------------+----+
  | fecha      | id |
  +------------+----+
  | 2023-09-02 |  3 |
  | 2024-09-03 |  4 |
  | 2023-09-06 |  7 |
  | 2024-09-06 |  8 |
  +------------+----+
  4 rows in set (0.00 sec)

  mysql> 


```

5. Ver los cursos impartidos por la profesora “Dra. Ana Torres”.

```sql
      mysql> select c.nombre from cursos c where profesor_id = '1';
    +-----------------+
    | nombre          |
    +-----------------+
    | Álgebra Lineal |
    | Cálculo I      |
    +-----------------+
    2 rows in set (0.01 sec)

    mysql>
```

---

### C. Consultas con `JOIN`.  Obligatorio utilizar **JOIN** donde se **combine dos o más tablas**

> (Devuelven el mismo resultado que las anteriores, pero usando combinaciones de tablas)

1. Mostrar cursos impartidos por profesores del departamento de Informática.

```sql

    mysql> SELECT c.nombre FROM cursos c JOIN profesores p ON c.profesor_id = p.id  AND p.departamento = 'Informatica';
    +----------------------+
    | nombre               |
    +----------------------+
    | Programación I      |
    | Estructuras de Datos |
    +----------------------+
    2 rows in set (0.00 sec)

    mysql> 

```

2. Obtener estudiantes que viven en Madrid.

```sql
  mysql> SELECT e.ciudad, e.nombre FROM estudiantes e JOIN matriculas m ON e.id = m.estudiante_id AND e.ciudad = 'Madrid';
  +--------+---------------+
  | ciudad | nombre        |
  +--------+---------------+
  | Madrid | María López |
  | Madrid | María López |
  +--------+---------------+
  2 rows in set (0.00 sec)

    mysql> SELECT DISTINCT e.ciudad, e.nombre FROM estudiantes e JOIN matriculas m ON e.id = m.estudiante_id AND e.ciudad = 'Madrid';
  +--------+---------------+
  | ciudad | nombre        |
  +--------+---------------+
  | Madrid | María López |
  +--------+---------------+
  1 row in set (0.00 sec)

  mysql> 


  mysql>

```

3. Mostrar cursos con más de 5 créditos.

```sql
    mysql> select c.nombre from cursos c JOIN profesores p ON c.profesor_id = p.id where c.creditos > 5;
    +--------------------+
    | nombre             |
    +--------------------+
    | Álgebra Lineal    |
    | Mecánica Clásica |
    | Cálculo I         |
    +--------------------+
    3 rows in set (0.00 sec)

    mysql>

```

4. Listar matrículas realizadas después del año 2022.

```sql

    mysql> select m.fecha, m.id from matriculas m JOIN cursos c ON m.curso_id = c.id AND date(m.fecha) > '2022-12-31';
    +------------+----+
    | fecha      | id |
    +------------+----+
    | 2023-09-02 |  3 |
    | 2024-09-03 |  4 |
    | 2023-09-06 |  7 |
    | 2024-09-06 |  8 |
    +------------+----+
    4 rows in set (0.00 sec)

    mysql> 
```

5. Mostrar los cursos impartidos por la profesora “Dra. Ana Torres”.

```sql

  mysql> select c.nombre from cursos c JOIN profesores p ON c.profesor_id = p.id AND profesor_id = '1';
+-----------------+
| nombre          |
+-----------------+
| Álgebra Lineal |
| Cálculo I      |
+-----------------+
2 rows in set (0.00 sec)

mysql>

```
---

### D. Consultas con Subconsultas

> (Devuelven el mismo resultado que las anteriores, pero usando subconsultas)

1. Cursos impartidos por profesores del departamento de Informática.

```sql

    mysql> select nombre from cursos where profesor_id IN (select id from profesores where departamento = 'Informatica');
  +----------------------+
  | nombre               |
  +----------------------+
  | Programación I      |
  | Estructuras de Datos |
  +----------------------+
  2 rows in set (0.00 sec)

  mysql>

```

2. Estudiantes que viven en Madrid.

```sql
  mysql> select e.nombre from estudiantes e where id IN (select id from estudiantes where ciudad = 'Madrid');
  +---------------+
  | nombre        |
  +---------------+
  | María López |
  +---------------+
  1 row in set (0.01 sec)

  mysql> 

```

3. Cursos con más de 5 créditos.

```sql
    mysql> select c.nombre from cursos c where creditos IN (select creditos from cursos where creditos > 5);
  +--------------------+
  | nombre             |
  +--------------------+
  | Álgebra Lineal    |
  | Mecánica Clásica |
  | Cálculo I         |
  +--------------------+
  3 rows in set (0.00 sec)

  mysql>


```

4. Matrículas realizadas después del año 2022.

```sql
    mysql> select m.fecha from matriculas m where fecha IN (select m.fecha from matriculas m where date(m.fecha) > '2022-12-31');
  +------------+
  | fecha      |
  +------------+
  | 2023-09-02 |
  | 2024-09-03 |
  | 2023-09-06 |
  | 2024-09-06 |
  +------------+
  4 rows in set (0.00 sec)

  mysql> 


```

5. Cursos impartidos por la profesora “Dra. Ana Torres”.

```sql
    mysql> select c.nombre from cursos c where profesor_id IN (select id from profesores p where p.nombre = 'Dra. Ana Torres');
  +-----------------+
  | nombre          |
  +-----------------+
  | Álgebra Lineal |
  | Cálculo I      |
  +-----------------+
  2 rows in set (0.01 sec)

  mysql> 


```

---

## 📂 Parte 2: Índices

1. Crear un índice en la columna `ciudad` de la tabla `estudiantes`.

```sql

    mysql> create index idx_ciudad on estudiantes(ciudad);
    Query OK, 0 rows affected (0.10 sec)
    Records: 0  Duplicates: 0  Warnings: 0

    mysql> 

```

2. Crear un índice en la columna `departamento` de la tabla `profesores`.

```sql

  mysql> create index idx_ciudad on estudiantes(ciudad);
  Query OK, 0 rows affected (0.10 sec)
  Records: 0  Duplicates: 0  Warnings: 0

  mysql> 

```

3. Consultar los índices creados.

```sql
    mysql> show index from estudiantes;
  +-------------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
  | Table       | Non_unique | Key_name   | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
  +-------------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
  | estudiantes |          0 | PRIMARY    |            1 | id          | A         |           2 |     NULL | NULL   |      | BTREE      |         |               |
  | estudiantes |          1 | idx_ciudad |            1 | ciudad      | A         |           2 |     NULL | NULL   | YES  | BTREE      |         |               |
  +-------------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
  2 rows in set (0.00 sec)

  mysql>

  mysql> show index from profesores;
  +------------+------------+------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
  | Table      | Non_unique | Key_name         | Seq_in_index | Column_name  | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
  +------------+------------+------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
  | profesores |          0 | PRIMARY          |            1 | id           | A         |           3 |     NULL | NULL   |      | BTREE      |         |               |
  | profesores |          1 | idx_departamento |            1 | departamento | A         |           3 |     NULL | NULL   | YES  | BTREE      |         |               |
  +------------+------------+------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
  2 rows in set (0.00 sec)

  mysql> 

```

4. Eliminar ambos índices.

```sql

  mysql> drop index idx_ciudad on estudiantes;
  Query OK, 0 rows affected (0.06 sec)
  Records: 0  Duplicates: 0  Warnings: 0

  mysql> drop index idx_departamento on profesores;
  Query OK, 0 rows affected (0.05 sec)
  Records: 0  Duplicates: 0  Warnings: 0

  mysql> show index from estudiantes;
  +-------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
  | Table       | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
  +-------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
  | estudiantes |          0 | PRIMARY  |            1 | id          | A         |           2 |     NULL | NULL   |      | BTREE      |         |               |
  +-------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
  1 row in set (0.00 sec)

  mysql> show index from profesores;
  +------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
  | Table      | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
  +------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
  | profesores |          0 | PRIMARY  |            1 | id          | A         |           3 |     NULL | NULL   |      | BTREE      |         |               |
  +------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
  1 row in set (0.00 sec)

  mysql> 

```
---

## 🪞 Parte 3: Vistas

1. Crear una vista llamada `vista_matriculas_completas` que muestre:
   - nombre del estudiante,
   - nombre del curso,
   - fecha de la matrícula.

2. Consultar datos desde la vista, mostrando el nombre del estudiante y la fecha de matrícula.
3. Eliminar la vista.

```sql

  mysql> create view vista_matriculas_completas AS select e.nombre AS estudiante, c.nombre AS curso, m.fecha from matriculas m JOIN estudiantes e ON m.estudiante_id = e.id JOIn cursos c ON m.curso_id = c.id;
  Query OK, 0 rows affected (0.04 sec)

  mysql> select estudiante, fecha from vista_matriculas_completas;
  +-------------------+------------+
  | estudiante        | fecha      |
  +-------------------+------------+
  | María López     | 2021-09-01 |
  | Juan Pérez       | 2022-09-01 |
  | Lucía Fernández | 2023-09-02 |
  | Carlos Ruiz       | 2024-09-03 |
  | María López     | 2020-09-04 |
  | Juan Pérez       | 2022-09-05 |
  | Lucía Fernández | 2023-09-06 |
  | Carlos Ruiz       | 2024-09-06 |
  +-------------------+------------+
  8 rows in set (0.00 sec)

  mysql> drop view vista_matriculas_completas;
  Query OK, 0 rows affected (0.00 sec)

  mysql> select estudiante, fecha from vista_matriculas_completas;
  ERROR 1146 (42S02): Table 'universidad.vista_matriculas_completas' doesn't exist
  mysql> 
```
---

## ⚙ Parte 4: Procedimiento Almacenado

1. Crear un procedimiento llamado `cursos_por_profesor` que reciba el nombre del profesor como parámetro y devuelva los cursos que imparte y su número de créditos.

```sql

  mysql> DELIMITER //
  mysql> CREATE PROCEDURE cursos_por_profesor(IN profesor_nombre VARCHAR(50))
      -> BEGIN
      -> SELECT c.nombre, c.creditos
      -> FROM cursos c
      -> JOIN profesores p ON c.profesor_id = p.id 
      -> WHERE p.nombre = profesor_nombre;
      -> END //
  Query OK, 0 rows affected (0.01 sec)

  mysql> DELIMITER ;
  mysql> 
```

2. Ejecutar el procedimiento con el nombre “Dr. Luis Gómez”.

```sql
    mysql> CALL cursos_por_profesor('Dr. Luis Gomez');
```
-NOTA: existe un problema con el reconocimiento de la tilde de la manera que, al realizar la consulta la palabra 'Gómez' queda escrita como 'Gmez' de manera que no se ejecuta el procedimiento que elaboré.

3. Eliminar el procedimiento.

```sql
    mysql> drop procedure cursos_por_profesor;
    Query OK, 0 rows affected (0.01 sec)

    mysql> 
```

---

## 🔢 Parte 5: Función Definida por el Usuario

1. Crear una función llamada `total_creditos_estudiante` que reciba el ID de un estudiante y devuelva el total de créditos que ha matriculado.

```sql
    mysql> DELIMITER //
    mysql> CREATE FUNCTION total_creditos_estudiante(estudiante_id INT) RETURNS INT
        -> DETERMINISTIC
        -> BEGIN
        -> DECLARE total_creditos INT;
        -> SELECT SUM(c.creditos) INTO total_creditos
        -> FROM matriculas m
        -> JOIN cursos c ON m.curso_id = c.id
        -> WHERE m.estudiante_id = estudiante_id;
        -> RETURN total_creditos;
        -> END //
    Query OK, 0 rows affected (0.01 sec)

    mysql> DELIMITER ;

```

2. Ejecutar la función para un estudiante específico.

```sql
    mysql> select total_creditos_estudiante(3);
    +------------------------------+
    | total_creditos_estudiante(3) |
    +------------------------------+
    |                           12 |
    +------------------------------+
    1 row in set (0.00 sec)

    mysql> 

```

3. Eliminar la función.

```sql

    mysql> drop function total_creditos_estudiante;
    Query OK, 0 rows affected (0.01 sec)

    mysql> select total_creditos_estudiante(3);
    ERROR 1305 (42000): FUNCTION universidad.total_creditos_estudiante does not exist
    mysql>
    
```

</div>