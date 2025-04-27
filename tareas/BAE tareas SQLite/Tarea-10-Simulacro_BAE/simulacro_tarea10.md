
<div align="justify">

# Simulacro. Tarea 10
-- ----------------------------------------
-- betancort_encinoso_gueton (2º DAWSemi)

    -- Consultas sobre una tabla
    -- 0,2 puntos la correcta. Total = 1,4 puntos
    -- ----------------------------------------

1. Devuelve un listado con todos las compras que se han realizado. Las compras deben estar ordenados por la fecha de realización, mostrando en primer lugar las compras más recientes.
    ```
        select * from compra order by fecha desc;
       
        +----+---------+------------+---------------+------------------+
        | id |  total  |   fecha    | id_consumidor | id_suministrador |
        +----+---------+------------+---------------+------------------+
        | 15 | 370.85  | 2022-03-11 | 1             | 5                |
        | 16 | 2389.23 | 2022-03-11 | 1             | 5                |
        | 13 | 545.75  | 2022-01-25 | 6             | 1                |
        | 8  | 1983.43 | 2020-10-10 | 4             | 6                |
        | 1  | 150.5   | 2020-10-05 | 5             | 2                |
        | 3  | 65.26   | 2020-10-05 | 2             | 1                |
        | 5  | 948.5   | 2020-09-10 | 5             | 2                |
        | 12 | 3045.6  | 2020-04-25 | 2             | 1                |
        | 14 | 145.82  | 2020-02-02 | 6             | 1                |
        | 9  | 2480.4  | 2019-10-10 | 8             | 3                |
        | 2  | 270.65  | 2019-09-10 | 1             | 5                |
        | 4  | 110.5   | 2019-08-17 | 8             | 3                |
        | 11 | 75.29   | 2019-08-17 | 3             | 7                |
        | 6  | 2400.6  | 2019-07-27 | 7             | 1                |
        | 7  | 5760.0  | 2018-09-10 | 2             | 1                |
        | 10 | 250.45  | 2018-06-27 | 8             | 2                |
        +----+---------+------------+---------------+------------------+
        sqlite>
    ```

2. Devuelve todos los datos de los dos compras de mayor valor.

    ```
    select * from compra order by total desc limit 2;
    +----+--------+------------+---------------+------------------+
    | id | total  |   fecha    | id_consumidor | id_suministrador |
    +----+--------+------------+---------------+------------------+
    | 7  | 5760.0 | 2018-09-10 | 2             | 1                |
    | 12 | 3045.6 | 2020-04-25 | 2             | 1                |
    +----+--------+------------+---------------+------------------+
    sqlite> 
    ```

3. Devuelve un listado con los identificadores de los consumidores que han realizado algún compra. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
   
   ```
    sqlite> select distinct (id_consumidor) from compra;
    /*
    * 
    +---------------+
    | id_consumidor |
    +---------------+
    | 5             |
    | 1             |
    | 2             |
    | 8             |
    | 7             |
    | 4             |
    | 3             |
    | 6             |
    +---------------+
    sqlite>
    ```

4. Devuelve un listado de todos las compras que se realizaron durante el año 2020, cuya cantidad total sea superior a 500€.
    
    ```
    select * from compra where fecha regexp '2020' AND total > 500.0;
    /*
    *
    +----+---------+------------+---------------+------------------+
    | id |  total  |   fecha    | id_consumidor | id_suministrador |
    +----+---------+------------+---------------+------------------+
    | 5  | 948.5   | 2020-09-10 | 5             | 2                |
    | 8  | 1983.43 | 2020-10-10 | 4             | 6                |
    | 12 | 3045.6  | 2020-04-25 | 2             | 1                |
    +----+---------+------------+---------------+------------------+
    sqlite> 
    ```

5. Devuelve un listado con el nombre y los apellidos de los suministradores que tienen una comisión entre 0.11 y 0.15.

    ```
    sqlite> select nombre n, apellido1 a1, apellido2 a2 from suministrador where categoria between 0.11 AND 0.15;sl

    +---------+-----------+-----------+
    |    n    |    a1     |    a2     |
    +---------+-----------+-----------+
    | Daniel  | Sáez      | Vega      |
    | Juan    | Gómez     | López     |
    | Diego   | Flores    | Salas     |
    | Marta   | Herrera   | Gil       |
    | Antonio | Carretero | Ortega    |
    | Manuel  | Domínguez | Hernández |
    | Antonio | Vega      | Hernández |
    +---------+-----------+-----------+
    sqlite> 
    ```

6. Devuelve el valor de la comisión de mayor valor que existe en la tabla suministrador.

    ```
    sqlite> select categoria mayor_valor from suministrador MAX LIMIT 1;
    +-------------+
    | mayor_valor |
    +-------------+
    | 0.15        |
    +-------------+
    sqlite> 
    ```

7. Devuelve el identificador, nombre y primer apellido de aquellos consumidores cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.

    ```
    sqlite> select apellido1, id, nombre from consumidor where apellido2 NOT 
    NULL order by apellido1 asc;
    
    +-----------+----+-----------+
    | apellido1 | id |  nombre   |
    +-----------+----+-----------+
    | Loyola    | 5  | Marcos    |
    | López     | 9  | Guillermo |
    | Rivero    | 1  | Aarón     |
    | Rubio     | 3  | Adolfo    |
    | Ruiz      | 8  | Pepe      |
    | Salas     | 2  | Adela     |
    | Santana   | 6  | María     |
    | Santana   | 10 | Daniel    |
    +-----------+----+-----------+
    sqlite> 
    ```


### (Consultas Multitabla Where)
    -- -----------------------------------------------
    -- 0,3 puntos la correcta. Total =  2,1 puntos
    -- -----------------------------------------------

1. Devuelve un listado con el identificador, nombre y los apellidos de todos los consumidores que han realizado algún compra. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
    ```
    sqlite> select distinct apellido1,id,nombre from consumidor where (select id_consumidor from compra) order by apellido1 asc;
    +-----------+----+-----------+
    | apellido1 | id |  nombre   |
    +-----------+----+-----------+
    | Loyola    | 5  | Marcos    |
    | López     | 9  | Guillermo |
    | Rivero    | 1  | Aarón     |
    | Rubio     | 3  | Adolfo    |
    | Ruiz      | 7  | Pilar     |
    | Ruiz      | 8  | Pepe      |
    | Salas     | 2  | Adela     |
    | Santana   | 6  | María     |
    | Santana   | 10 | Daniel    |
    | Suárez    | 4  | Adrián    |
    +-----------+----+-----------+
    sqlite> 
    ```
2. Devuelve un listado que muestre todos las compras que ha realizado cada consumidor. El resultado debe mostrar todos los datos de las compras y del consumidor. El listado debe mostrar los datos de los consumidores ordenados alfabéticamente.
    ```
    sqlite> SELECT c.*, co.* 
    FROM consumidor c, compra co 
    WHERE c.id = co.id_consumidor 
    ORDER BY c.apellido1, c.apellido2, c.nombre;
    +----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
    | id | nombre | apellido1 | apellido2 | ciudad  | categoria | id |  total  |   fecha    | id_consumidor | id_suministrador |
    +----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
    | 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 1  | 150.5   | 2020-10-05 | 5             | 2                |
    | 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 5  | 948.5   | 2020-09-10 | 5             | 2                |
    | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 2  | 270.65  | 2019-09-10 | 1             | 5                |
    | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 15 | 370.85  | 2022-03-11 | 1             | 5                |
    | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 16 | 2389.23 | 2022-03-11 | 1             | 5                |
    | 3  | Adolfo | Rubio     | Flores    | Sevilla |           | 11 | 75.29   | 2019-08-17 | 3             | 7                |
    | 7  | Pilar  | Ruiz      |           | Sevilla | 300       | 6  | 2400.6  | 2019-07-27 | 7             | 1                |
    | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 4  | 110.5   | 2019-08-17 | 8             | 3                |
    | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 9  | 2480.4  | 2019-10-10 | 8             | 3                |
    | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 10 | 250.45  | 2018-06-27 | 8             | 2                |
    | 2  | Adela  | Salas     | Díaz      | Granada | 200       | 3  | 65.26   | 2020-10-05 | 2             | 1                |
    | 2  | Adela  | Salas     | Díaz      | Granada | 200       | 7  | 5760.0  | 2018-09-10 | 2             | 1                |
    | 2  | Adela  | Salas     | Díaz      | Granada | 200       | 12 | 3045.6  | 2020-04-25 | 2             | 1                |
    | 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 13 | 545.75  | 2022-01-25 | 6             | 1                |
    | 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 14 | 145.82  | 2020-02-02 | 6             | 1                |
    | 4  | Adrián | Suárez    |           | Jaén    | 300       | 8  | 1983.43 | 2020-10-10 | 4             | 6                |
    +----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
    sqlite> 
    ```
 3. Devuelve un listado que muestre todos las compras en los que ha participado un suministrador. El resultado debe mostrar todos los datos de las compras y de los suministradores. El listado debe mostrar los datos de los suministradores ordenados alfabéticamente.
    ```
    sqlite> SELECT s.*, co.* 
    FROM suministrador s, compra co 
    WHERE s.id = co.id_suministrador 
    ORDER BY s.apellido1, s.apellido2, s.nombre;
    +----+---------+-----------+-----------+-----------+----+---------+------------+---------------+------------------+
    | id | nombre  | apellido1 | apellido2 | categoria | id |  total  |   fecha    | id_consumidor | id_suministrador |
    +----+---------+-----------+-----------+-----------+----+---------+------------+---------------+------------------+
    | 5  | Antonio | Carretero | Ortega    | 0.12      | 2  | 270.65  | 2019-09-10 | 1             | 5                |
    | 5  | Antonio | Carretero | Ortega    | 0.12      | 15 | 370.85  | 2022-03-11 | 1             | 5                |
    | 5  | Antonio | Carretero | Ortega    | 0.12      | 16 | 2389.23 | 2022-03-11 | 1             | 5                |
    | 6  | Manuel  | Domínguez | Hernández | 0.13      | 8  | 1983.43 | 2020-10-10 | 4             | 6                |
    | 3  | Diego   | Flores    | Salas     | 0.11      | 4  | 110.5   | 2019-08-17 | 8             | 3                |
    | 3  | Diego   | Flores    | Salas     | 0.11      | 9  | 2480.4  | 2019-10-10 | 8             | 3                |
    | 2  | Juan    | Gómez     | López     | 0.13      | 1  | 150.5   | 2020-10-05 | 5             | 2                |
    | 2  | Juan    | Gómez     | López     | 0.13      | 5  | 948.5   | 2020-09-10 | 5             | 2                |
    | 2  | Juan    | Gómez     | López     | 0.13      | 10 | 250.45  | 2018-06-27 | 8             | 2                |
    | 1  | Daniel  | Sáez      | Vega      | 0.15      | 3  | 65.26   | 2020-10-05 | 2             | 1                |
    | 1  | Daniel  | Sáez      | Vega      | 0.15      | 6  | 2400.6  | 2019-07-27 | 7             | 1                |
    | 1  | Daniel  | Sáez      | Vega      | 0.15      | 7  | 5760.0  | 2018-09-10 | 2             | 1                |
    | 1  | Daniel  | Sáez      | Vega      | 0.15      | 12 | 3045.6  | 2020-04-25 | 2             | 1                |
    | 1  | Daniel  | Sáez      | Vega      | 0.15      | 13 | 545.75  | 2022-01-25 | 6             | 1                |
    | 1  | Daniel  | Sáez      | Vega      | 0.15      | 14 | 145.82  | 2020-02-02 | 6             | 1                |
    | 7  | Antonio | Vega      | Hernández | 0.11      | 11 | 75.29   | 2019-08-17 | 3             | 7                |
    +----+---------+-----------+-----------+-----------+----+---------+------------+---------------+------------------+
    sqlite>
    ```

4. Devuelve un listado que muestre todos los consumidores, con todos las compras que han realizado y con los datos de los suministradores asociados a cada compra.
    ```
    sqlite> SELECT c.*, co.*, s.* 
    FROM consumidor c, compra co, suministrador s 
    WHERE c.id = co.id_consumidor AND s.id = co.id_suministrador;
    +----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
    | id | nombre | apellido1 | apellido2 | ciudad  | categoria | id |  total  |   fecha    | id_consumidor | id_suministrador | id | nombre  | apellido1 | apellido2 | categoria |
    +----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
    | 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 1  | 150.5   | 2020-10-05 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
    | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 2  | 270.65  | 2019-09-10 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
    | 2  | Adela  | Salas     | Díaz      | Granada | 200       | 3  | 65.26   | 2020-10-05 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
    | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 4  | 110.5   | 2019-08-17 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
    | 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 5  | 948.5   | 2020-09-10 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
    | 7  | Pilar  | Ruiz      |           | Sevilla | 300       | 6  | 2400.6  | 2019-07-27 | 7             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
    | 2  | Adela  | Salas     | Díaz      | Granada | 200       | 7  | 5760.0  | 2018-09-10 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
    | 4  | Adrián | Suárez    |           | Jaén    | 300       | 8  | 1983.43 | 2020-10-10 | 4             | 6                | 6  | Manuel  | Domínguez | Hernández | 0.13      |
    | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 9  | 2480.4  | 2019-10-10 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
    | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 10 | 250.45  | 2018-06-27 | 8             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
    | 3  | Adolfo | Rubio     | Flores    | Sevilla |           | 11 | 75.29   | 2019-08-17 | 3             | 7                | 7  | Antonio | Vega      | Hernández | 0.11      |
    | 2  | Adela  | Salas     | Díaz      | Granada | 200       | 12 | 3045.6  | 2020-04-25 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
    | 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 13 | 545.75  | 2022-01-25 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
    | 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 14 | 145.82  | 2020-02-02 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
    | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 15 | 370.85  | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
    | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 16 | 2389.23 | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
    +----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
    sqlite> 
    ```


5. Devuelve un listado de todos los consumidores que realizaron un compra durante el año 2020, cuya cantidad esté entre 300 € y 1000 €.
    ```
    sqlite> SELECT DISTINCT c.* 
    FROM consumidor c, compra co 
    WHERE c.id = co.id_consumidor 
    AND strftime('%Y', co.fecha) = '2020' 
    AND co.total BETWEEN 300 AND 1000;
    +----+--------+-----------+-----------+---------+-----------+
    | id | nombre | apellido1 | apellido2 | ciudad  | categoria |
    +----+--------+-----------+-----------+---------+-----------+
    | 5  | Marcos | Loyola    | Méndez    | Almería | 200       |
    +----+--------+-----------+-----------+---------+-----------+
    sqlite> 
    ```

6. Devuelve el nombre y los apellidos de todos los suministradores que ha participado en algún compra realizado por María Santana Moreno.
    ```
    sqlite> SELECT s.nombre, s.apellido1, s.apellido2 
    FROM suministrador s, compra co, consumidor c 
    WHERE s.id = co.id_suministrador 
    AND c.id = co.id_consumidor 
    AND c.nombre = 'María' AND c.apellido1 = 'Santana' AND c.apellido2 = 'Moreno';
    +--------+-----------+-----------+
    | nombre | apellido1 | apellido2 |
    +--------+-----------+-----------+
    | Daniel | Sáez      | Vega      |
    | Daniel | Sáez      | Vega      |
    +--------+-----------+-----------+
    sqlite> 
    ```
7. Devuelve el nombre de todos los consumidores que han realizado algún compra con el suministrador Daniel Sáez Vega.
    ```
    sqlite> SELECT DISTINCT c.nombre 
    FROM consumidor c, compra co, suministrador s 
    WHERE c.id = co.id_consumidor 
    AND s.id = co.id_suministrador 
    AND s.nombre = 'Daniel' AND s.apellido1 = 'Sáez' AND s.apellido2 = 'Vega';
    +--------+
    | nombre |
    +--------+
    | Adela  |
    | Pilar  |
    | María  |
    +--------+
    sqlite> 
    ```
### (Consultas Multitabla Join)
    -- -----------------------------------------------
    -- 0,3 puntos la correcta. Total = 2,1 puntos
    -- -----------------------------------------------

1. Devuelve un listado con el identificador, nombre y los apellidos de todos los consumidores que han realizado algún compra. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
    ```
    sqlite> SELECT DISTINCT c.id, c.nombre, c.apellido1, c.apellido2 
    FROM consumidor c JOIN compra co ON c.id = co.id_consumidor 
    ORDER BY c.apellido1, c.apellido2, c.nombre;
    +----+--------+-----------+-----------+
    | id | nombre | apellido1 | apellido2 |
    +----+--------+-----------+-----------+
    | 5  | Marcos | Loyola    | Méndez    |
    | 1  | Aarón  | Rivero    | Gómez     |
    | 3  | Adolfo | Rubio     | Flores    |
    | 7  | Pilar  | Ruiz      |           |
    | 8  | Pepe   | Ruiz      | Santana   |
    | 2  | Adela  | Salas     | Díaz      |
    | 6  | María  | Santana   | Moreno    |
    | 4  | Adrián | Suárez    |           |
    +----+--------+-----------+-----------+
    sqlite> 
    ```
2. Devuelve un listado que muestre todos las compras que ha realizado cada consumidor. El resultado debe mostrar todos los datos de las compras y del consumidor. El listado debe mostrar los datos de los consumidores ordenados alfabéticamente.
    ```
    sqlite> SELECT c.*, co.* 
    FROM consumidor c JOIN compra co ON c.id = co.id_consumidor 
    ORDER BY c.apellido1, c.apellido2, c.nombre;
    +----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
    | id | nombre | apellido1 | apellido2 | ciudad  | categoria | id |  total  |   fecha    | id_consumidor | id_suministrador |
    +----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
    | 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 1  | 150.5   | 2020-10-05 | 5             | 2                |
    | 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 5  | 948.5   | 2020-09-10 | 5             | 2                |
    | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 2  | 270.65  | 2019-09-10 | 1             | 5                |
    | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 15 | 370.85  | 2022-03-11 | 1             | 5                |
    | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 16 | 2389.23 | 2022-03-11 | 1             | 5                |
    | 3  | Adolfo | Rubio     | Flores    | Sevilla |           | 11 | 75.29   | 2019-08-17 | 3             | 7                |
    | 7  | Pilar  | Ruiz      |           | Sevilla | 300       | 6  | 2400.6  | 2019-07-27 | 7             | 1                |
    | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 4  | 110.5   | 2019-08-17 | 8             | 3                |
    | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 9  | 2480.4  | 2019-10-10 | 8             | 3                |
    | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 10 | 250.45  | 2018-06-27 | 8             | 2                |
    | 2  | Adela  | Salas     | Díaz      | Granada | 200       | 3  | 65.26   | 2020-10-05 | 2             | 1                |
    | 2  | Adela  | Salas     | Díaz      | Granada | 200       | 7  | 5760.0  | 2018-09-10 | 2             | 1                |
    | 2  | Adela  | Salas     | Díaz      | Granada | 200       | 12 | 3045.6  | 2020-04-25 | 2             | 1                |
    | 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 13 | 545.75  | 2022-01-25 | 6             | 1                |
    | 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 14 | 145.82  | 2020-02-02 | 6             | 1                |
    | 4  | Adrián | Suárez    |           | Jaén    | 300       | 8  | 1983.43 | 2020-10-10 | 4             | 6                |
    +----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
    sqlite>
    ```
3. Devuelve un listado que muestre todos las compras en los que ha participado un suministrador. El resultado debe mostrar todos los datos de las compras y de los suministradores. El listado debe mostrar los datos de los suministradores ordenados alfabéticamente.
    ```
    sqlite> SELECT s.*, co.* 
    FROM suministrador s JOIN compra co ON s.id = co.id_suministrador 
    ORDER BY s.apellido1, s.apellido2, s.nombre;
    +----+---------+-----------+-----------+-----------+----+---------+------------+---------------+------------------+
    | id | nombre  | apellido1 | apellido2 | categoria | id |  total  |   fecha    | id_consumidor | id_suministrador |
    +----+---------+-----------+-----------+-----------+----+---------+------------+---------------+------------------+
    | 5  | Antonio | Carretero | Ortega    | 0.12      | 2  | 270.65  | 2019-09-10 | 1             | 5                |
    | 5  | Antonio | Carretero | Ortega    | 0.12      | 15 | 370.85  | 2022-03-11 | 1             | 5                |
    | 5  | Antonio | Carretero | Ortega    | 0.12      | 16 | 2389.23 | 2022-03-11 | 1             | 5                |
    | 6  | Manuel  | Domínguez | Hernández | 0.13      | 8  | 1983.43 | 2020-10-10 | 4             | 6                |
    | 3  | Diego   | Flores    | Salas     | 0.11      | 4  | 110.5   | 2019-08-17 | 8             | 3                |
    | 3  | Diego   | Flores    | Salas     | 0.11      | 9  | 2480.4  | 2019-10-10 | 8             | 3                |
    | 2  | Juan    | Gómez     | López     | 0.13      | 1  | 150.5   | 2020-10-05 | 5             | 2                |
    | 2  | Juan    | Gómez     | López     | 0.13      | 5  | 948.5   | 2020-09-10 | 5             | 2                |
    | 2  | Juan    | Gómez     | López     | 0.13      | 10 | 250.45  | 2018-06-27 | 8             | 2                |
    | 1  | Daniel  | Sáez      | Vega      | 0.15      | 3  | 65.26   | 2020-10-05 | 2             | 1                |
    | 1  | Daniel  | Sáez      | Vega      | 0.15      | 6  | 2400.6  | 2019-07-27 | 7             | 1                |
    | 1  | Daniel  | Sáez      | Vega      | 0.15      | 7  | 5760.0  | 2018-09-10 | 2             | 1                |
    | 1  | Daniel  | Sáez      | Vega      | 0.15      | 12 | 3045.6  | 2020-04-25 | 2             | 1                |
    | 1  | Daniel  | Sáez      | Vega      | 0.15      | 13 | 545.75  | 2022-01-25 | 6             | 1                |
    | 1  | Daniel  | Sáez      | Vega      | 0.15      | 14 | 145.82  | 2020-02-02 | 6             | 1                |
    | 7  | Antonio | Vega      | Hernández | 0.11      | 11 | 75.29   | 2019-08-17 | 3             | 7                |
    +----+---------+-----------+-----------+-----------+----+---------+------------+---------------+------------------+
    sqlite> 
    ```
4. Devuelve un listado que muestre todos los consumidores, con todos las compras que han realizado y con los datos de los suministradores asociados a cada compra.
    ```
    sqlite> SELECT c.*, co.*, s.* 
    FROM consumidor c 
    JOIN compra co ON c.id = co.id_consumidor 
    JOIN suministrador s ON s.id = co.id_suministrador;
    +----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
    | id | nombre | apellido1 | apellido2 | ciudad  | categoria | id |  total  |   fecha    | id_consumidor | id_suministrador | id | nombre  | apellido1 | apellido2 | categoria |
    +----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
    | 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 1  | 150.5   | 2020-10-05 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
    | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 2  | 270.65  | 2019-09-10 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
    | 2  | Adela  | Salas     | Díaz      | Granada | 200       | 3  | 65.26   | 2020-10-05 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
    | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 4  | 110.5   | 2019-08-17 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
    | 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 5  | 948.5   | 2020-09-10 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
    | 7  | Pilar  | Ruiz      |           | Sevilla | 300       | 6  | 2400.6  | 2019-07-27 | 7             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
    | 2  | Adela  | Salas     | Díaz      | Granada | 200       | 7  | 5760.0  | 2018-09-10 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
    | 4  | Adrián | Suárez    |           | Jaén    | 300       | 8  | 1983.43 | 2020-10-10 | 4             | 6                | 6  | Manuel  | Domínguez | Hernández | 0.13      |
    | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 9  | 2480.4  | 2019-10-10 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
    | 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 10 | 250.45  | 2018-06-27 | 8             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
    | 3  | Adolfo | Rubio     | Flores    | Sevilla |           | 11 | 75.29   | 2019-08-17 | 3             | 7                | 7  | Antonio | Vega      | Hernández | 0.11      |
    | 2  | Adela  | Salas     | Díaz      | Granada | 200       | 12 | 3045.6  | 2020-04-25 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
    | 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 13 | 545.75  | 2022-01-25 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
    | 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 14 | 145.82  | 2020-02-02 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
    | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 15 | 370.85  | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
    | 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 16 | 2389.23 | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
    +----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
    sqlite> 
    ```

5. Devuelve un listado de todos los consumidores que realizaron un compra durante el año 2020,cuya cantidad esté entre 300 € y 1000 €.
    ```
    sqlite> SELECT DISTINCT c.* 
    FROM consumidor c JOIN compra co ON c.id = co.id_consumidor 
    WHERE strftime('%Y', co.fecha) = '2020' 
    AND co.total BETWEEN 300 AND 1000;
    +----+--------+-----------+-----------+---------+-----------+
    | id | nombre | apellido1 | apellido2 | ciudad  | categoria |
    +----+--------+-----------+-----------+---------+-----------+
    | 5  | Marcos | Loyola    | Méndez    | Almería | 200       |
    +----+--------+-----------+-----------+---------+-----------+
    sqlite> 
    ```
6. Devuelve el nombre y los apellidos de todos los suministradores que ha participado en algún compra realizado por María Santana Moreno.
    ```
    sqlite> SELECT s.nombre, s.apellido1, s.apellido2 
    FROM suministrador s 
    JOIN compra co ON s.id = co.id_suministrador 
    JOIN consumidor c ON c.id = co.id_consumidor 
    WHERE c.nombre = 'María' AND c.apellido1 = 'Santana' AND c.apellido2 = 'Moreno';
    +--------+-----------+-----------+
    | nombre | apellido1 | apellido2 |
    +--------+-----------+-----------+
    | Daniel | Sáez      | Vega      |
    | Daniel | Sáez      | Vega      |
    +--------+-----------+-----------+
    sqlite> 
    ```

7. Devuelve el nombre de todos los consumidores que han realizado algún compra con el suministrador Daniel Sáez Vega.
    ```
    sqlite> SELECT DISTINCT c.nombre 
    FROM consumidor c 
    JOIN compra co ON c.id = co.id_consumidor 
    JOIN suministrador s ON s.id = co.id_suministrador 
    WHERE s.nombre = 'Daniel' AND s.apellido1 = 'Sáez' AND s.apellido2 = 'Vega';
    +--------+
    | nombre |
    +--------+
    | Adela  |
    | Pilar  |
    | María  |
    +--------+
    sqlite> 
    ```

### Consultas resumen (funciones)
    -- -----------------------------------------------
    -- 0,2 puntos la correcta. (1-6) 1,2 puntos
    -- 0,25 puntos la correcta. (7-10) 1 punto.
    -- Total = 2,2 puntos
    -- -----------------------------------------------

1. Calcula la cantidad media de todos las compras que aparecen en la tabla compra.
    ```
    sqlite> SELECT AVG(total) FROM compra;
    +-------------+
    | AVG(total)  |
    +-------------+
    | 1312.051875 |
    +-------------+
    sqlite> 
    ```
2. Calcula el número total de suministradores distintos que aparecen en la tabla compra.
    ```
    sqlite> SELECT COUNT(DISTINCT id_suministrador) FROM compra;
    +----------------------------------+
    | COUNT(DISTINCT id_suministrador) |
    +----------------------------------+
    | 6                                |
    +----------------------------------+
    sqlite> 
    ```
3. Calcula el número total de consumidores que aparecen en la tabla consumidor.
    sqlite> SELECT COUNT(*) FROM consumidor;
    ```
    +----------+
    | COUNT(*) |
    +----------+
    | 10       |
    +----------+
    sqlite>
    ```
4. Calcula cuál es la mayor cantidad que aparece en la tabla compra.
    sqlite> SELECT MAX(total) FROM compra;
    ```
    +------------+
    | MAX(total) |
    +------------+
    | 5760.0     |
    +------------+
    sqlite>
    ```
5. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla consumidor.
    ```
    sqlite> SELECT ciudad, MAX(categoria) 
    FROM consumidor 
    GROUP BY ciudad;
    +---------+----------------+
    | ciudad  | MAX(categoria) |
    +---------+----------------+
    | Almería | 200            |
    | Cádiz   | 100            |
    | Granada | 225            |
    | Huelva  | 200            |
    | Jaén    | 300            |
    | Sevilla | 300            |
    +---------+----------------+
    sqlite>
    ```

6. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores. Es decir, el mismo consumidor puede haber realizado varios compras de diferentes cantidades el mismo día. Se pide que se calcule cuál es el compra de máximo valor para cada uno de los días en los que un consumidor ha realizado un compra. Muestra el identificador del consumidor, nombre, apellidos, la fecha y el valor de la cantidad.
    ```
    sqlite> SELECT c.id, c.nombre, c.apellido1, c.apellido2, co.fecha, MAX(co.total) 
    FROM consumidor c JOIN compra co ON c.id = co.id_consumidor 
    GROUP BY c.id, co.fecha;
    +----+--------+-----------+-----------+------------+---------------+
    | id | nombre | apellido1 | apellido2 |   fecha    | MAX(co.total) |
    +----+--------+-----------+-----------+------------+---------------+
    | 1  | Aarón  | Rivero    | Gómez     | 2019-09-10 | 270.65        |
    | 1  | Aarón  | Rivero    | Gómez     | 2022-03-11 | 2389.23       |
    | 2  | Adela  | Salas     | Díaz      | 2018-09-10 | 5760.0        |
    | 2  | Adela  | Salas     | Díaz      | 2020-04-25 | 3045.6        |
    | 2  | Adela  | Salas     | Díaz      | 2020-10-05 | 65.26         |
    | 3  | Adolfo | Rubio     | Flores    | 2019-08-17 | 75.29         |
    | 4  | Adrián | Suárez    |           | 2020-10-10 | 1983.43       |
    | 5  | Marcos | Loyola    | Méndez    | 2020-09-10 | 948.5         |
    | 5  | Marcos | Loyola    | Méndez    | 2020-10-05 | 150.5         |
    | 6  | María  | Santana   | Moreno    | 2020-02-02 | 145.82        |
    | 6  | María  | Santana   | Moreno    | 2022-01-25 | 545.75        |
    | 7  | Pilar  | Ruiz      |           | 2019-07-27 | 2400.6        |
    | 8  | Pepe   | Ruiz      | Santana   | 2018-06-27 | 250.45        |
    | 8  | Pepe   | Ruiz      | Santana   | 2019-08-17 | 110.5         |
    | 8  | Pepe   | Ruiz      | Santana   | 2019-10-10 | 2480.4        |
    +----+--------+-----------+-----------+------------+---------------+
    sqlite> 
    ```

7. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores teniendo en cuenta que sólo queremos mostrar aquellas compras que superen la cantidad de 2000 €.
    ```
    sqlite> SELECT c.id, c.nombre, c.apellido1, c.apellido2, co.fecha, MAX(co.total) 
    FROM consumidor c JOIN compra co ON c.id = co.id_consumidor 
    GROUP BY c.id, co.fecha 
    HAVING MAX(co.total) > 2000;
    +----+--------+-----------+-----------+------------+---------------+
    | id | nombre | apellido1 | apellido2 |   fecha    | MAX(co.total) |
    +----+--------+-----------+-----------+------------+---------------+
    | 1  | Aarón  | Rivero    | Gómez     | 2022-03-11 | 2389.23       |
    | 2  | Adela  | Salas     | Díaz      | 2018-09-10 | 5760.0        |
    | 2  | Adela  | Salas     | Díaz      | 2020-04-25 | 3045.6        |
    | 7  | Pilar  | Ruiz      |           | 2019-07-27 | 2400.6        |
    | 8  | Pepe   | Ruiz      | Santana   | 2019-10-10 | 2480.4        |
    +----+--------+-----------+-----------+------------+---------------+
    sqlite>
    ```
    -- 8. Calcula el máximo valor de las compras realizadas para cada uno de los suministradores durante la fecha 2020-08-17. Muestra el identificador del suministrador, nombre, apellidos y total.
    
    ```
    sqlite> SELECT s.id, s.nombre, s.apellido1, s.apellido2, MAX(co.total) 
    FROM suministrador s JOIN compra co ON s.id = co.id_suministrador 
    WHERE co.fecha = '2020-08-17' 
    GROUP BY s.id;
    sqlite>  
    ```

    - NOTA: Este resultado nulo se puede explicar porque no existen compras durante esa fecha como puede observarse en la siguiente consulta:
    ```
    sqlite> select * from compra where fecha REGEXP '2020';
    +----+---------+------------+---------------+------------------+
    | id |  total  |   fecha    | id_consumidor | id_suministrador |
    +----+---------+------------+---------------+------------------+
    | 1  | 150.5   | 2020-10-05 | 5             | 2                |
    | 3  | 65.26   | 2020-10-05 | 2             | 1                |
    | 5  | 948.5   | 2020-09-10 | 5             | 2                |
    | 8  | 1983.43 | 2020-10-10 | 4             | 6                |
    | 12 | 3045.6  | 2020-04-25 | 2             | 1                |
    | 14 | 145.82  | 2020-02-02 | 6             | 1                |
    +----+---------+------------+---------------+------------------+
    sqlite>
    ```
9. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores. Tenga en cuenta que pueden existir consumidores que no han realizado ninguna compra. Estos consumidores también deben aparecer en el listado indicando que el número de compras realizadas es 0.
    ```
    sqlite> SELECT c.id, c.nombre, c.apellido1, c.apellido2, COUNT(co.id) 
    FROM consumidor c LEFT JOIN compra co ON c.id = co.id_consumidor 
    GROUP BY c.id;
    +----+-----------+-----------+-----------+--------------+
    | id |  nombre   | apellido1 | apellido2 | COUNT(co.id) |
    +----+-----------+-----------+-----------+--------------+
    | 1  | Aarón     | Rivero    | Gómez     | 3            |
    | 2  | Adela     | Salas     | Díaz      | 3            |
    | 3  | Adolfo    | Rubio     | Flores    | 1            |
    | 4  | Adrián    | Suárez    |           | 1            |
    | 5  | Marcos    | Loyola    | Méndez    | 2            |
    | 6  | María     | Santana   | Moreno    | 2            |
    | 7  | Pilar     | Ruiz      |           | 1            |
    | 8  | Pepe      | Ruiz      | Santana   | 3            |
    | 9  | Guillermo | López     | Gómez     | 0            |
    | 10 | Daniel    | Santana   | Loyola    | 0            |
    +----+-----------+-----------+-----------+--------------+
    sqlite> 
    ```
10. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores durante el año 2020.
    ```
    sqlite> SELECT c.id, c.nombre, c.apellido1, c.apellido2, COUNT(co.id) 
    FROM consumidor c LEFT JOIN compra co ON c.id = co.id_consumidor AND strftime('%Y', co.fecha) = '2020' 
    GROUP BY c.id;
    +----+-----------+-----------+-----------+--------------+
    | id |  nombre   | apellido1 | apellido2 | COUNT(co.id) |
    +----+-----------+-----------+-----------+--------------+
    | 1  | Aarón     | Rivero    | Gómez     | 0            |
    | 2  | Adela     | Salas     | Díaz      | 2            |
    | 3  | Adolfo    | Rubio     | Flores    | 0            |
    | 4  | Adrián    | Suárez    |           | 1            |
    | 5  | Marcos    | Loyola    | Méndez    | 2            |
    | 6  | María     | Santana   | Moreno    | 1            |
    | 7  | Pilar     | Ruiz      |           | 0            |
    | 8  | Pepe      | Ruiz      | Santana   | 0            |
    | 9  | Guillermo | López     | Gómez     | 0            |
    | 10 | Daniel    | Santana   | Loyola    | 0            |
    +----+-----------+-----------+-----------+--------------+
    sqlite> 
    ```
### Subconsultas
    -- -----------------------------------------------
    -- 0,2 puntos la correcta (1-5).
    -- 0,3 puntos la correcta (6-9).
    -- Total = 2,2 puntos
    -- -----------------------------------------------

#### Con operadores básicos de comparación

1. Devuelve un listado con todos las compras que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
    ```
    sqlite> SELECT * FROM compra 
    WHERE id_consumidor = (SELECT id FROM consumidor 
    WHERE nombre = 'Adela' AND apellido1 = 'Salas' AND apellido2 = 'Díaz');
    +----+--------+------------+---------------+------------------+
    | id | total  |   fecha    | id_consumidor | id_suministrador |
    +----+--------+------------+---------------+------------------+
    | 3  | 65.26  | 2020-10-05 | 2             | 1                |
    | 7  | 5760.0 | 2018-09-10 | 2             | 1                |
    | 12 | 3045.6 | 2020-04-25 | 2             | 1                |
    +----+--------+------------+---------------+------------------+
    sqlite>
    ```

2. Devuelve la fecha y la cantidad del compra de menor valor realizado por el cliente Pepe Ruiz Santana.
    ```
    sqlite> SELECT fecha, MIN(total) FROM compra 
    WHERE id_consumidor = (SELECT id FROM consumidor 
    WHERE nombre = 'Pepe' AND apellido1 = 'Ruiz' AND apellido2 = 'Santana');
    +------------+------------+
    |   fecha    | MIN(total) |
    +------------+------------+
    | 2019-08-17 | 110.5      |
    +------------+------------+
    sqlite>
    ```
3. Devuelve el número de compras en los que ha participado el suministrador Daniel Sáez Vega. (Sin utilizar INNER JOIN)
    ```
    sqlite> SELECT COUNT(*) FROM compra 
    WHERE id_suministrador = (SELECT id FROM suministrador 
    WHERE nombre = 'Daniel' AND apellido1 = 'Sáez' AND apellido2 = 'Vega');
    +----------+
    | COUNT(*) |
    +----------+
    | 6        |
    +----------+
    sqlite>
    ```

4. Devuelve los datos del consumidor que realizó el compra más caro en el año 2021. (Sin utilizar INNER JOIN)
    ```
    sqlite> SELECT * FROM consumidor 
    WHERE id = (SELECT id_consumidor FROM compra 
            WHERE strftime('%Y', fecha) = '2021' 
            ORDER BY total DESC LIMIT 1);
    sqlite> 
    ```
    - NOTA: Nadie compŕo en 2021, o bien, no se reflejaron en la tabla compra.

5. Devuelve un listado con los datos de los consumidores y las compras, de todos los consumidores que han realizado un compra durante el año 2020 con un valor mayor o igual al valor medio de las compras realizadas durante ese mismo año.
    ```
    sqlite> SELECT c.*, co.* 
    FROM consumidor c, compra co 
    WHERE c.id = co.id_consumidor 
    AND strftime('%Y', co.fecha) = '2020' 
    AND co.total >= (SELECT AVG(total) FROM compra WHERE strftime('%Y', fecha) = '2020');
    +----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
    | id | nombre | apellido1 | apellido2 | ciudad  | categoria | id |  total  |   fecha    | id_consumidor | id_suministrador |
    +----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
    | 4  | Adrián | Suárez    |           | Jaén    | 300       | 8  | 1983.43 | 2020-10-10 | 4             | 6                |
    | 2  | Adela  | Salas     | Díaz      | Granada | 200       | 12 | 3045.6  | 2020-04-25 | 2             | 1                |
    +----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
    sqlite>
    ``` 
6. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando IN o NOT IN).
    ```
    sqlite> SELECT * FROM consumidor 
    WHERE id NOT IN (SELECT DISTINCT id_consumidor FROM compra);
    +----+-----------+-----------+-----------+---------+-----------+
    | id |  nombre   | apellido1 | apellido2 | ciudad  | categoria |
    +----+-----------+-----------+-----------+---------+-----------+
    | 9  | Guillermo | López     | Gómez     | Granada | 225       |
    | 10 | Daniel    | Santana   | Loyola    | Sevilla | 125       |
    +----+-----------+-----------+-----------+---------+-----------+
    sqlite>
    ```

7. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando IN o NOT IN).
    ```
    sqlite> SELECT * FROM suministrador s 
    WHERE NOT EXISTS (SELECT 1 FROM compra co WHERE co.id_suministrador = s.id);
    +----+---------+-----------+-----------+-----------+
    | id | nombre  | apellido1 | apellido2 | categoria |
    +----+---------+-----------+-----------+-----------+
    | 4  | Marta   | Herrera   | Gil       | 0.14      |
    | 8  | Alfredo | Ruiz      | Flores    | 0.05      |
    +----+---------+-----------+-----------+-----------+
    sqlite>
    ```

8. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).
    ```
    sqlite> SELECT * FROM consumidor c 
    WHERE NOT EXISTS (SELECT 1 FROM compra co WHERE co.id_consumidor = c.id);
    +----+-----------+-----------+-----------+---------+-----------+
    | id |  nombre   | apellido1 | apellido2 | ciudad  | categoria |
    +----+-----------+-----------+-----------+---------+-----------+
    | 9  | Guillermo | López     | Gómez     | Granada | 225       |
    | 10 | Daniel    | Santana   | Loyola    | Sevilla | 125       |
    +----+-----------+-----------+-----------+---------+-----------+
    sqlite>
    ```

9. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).
    ```
    sqlite> SELECT * FROM suministrador s 
    WHERE NOT EXISTS (SELECT 1 FROM compra co WHERE co.id_suministrador = s.id);
    +----+---------+-----------+-----------+-----------+
    | id | nombre  | apellido1 | apellido2 | categoria |
    +----+---------+-----------+-----------+-----------+
    | 4  | Marta   | Herrera   | Gil       | 0.14      |
    | 8  | Alfredo | Ruiz      | Flores    | 0.05      |
    +----+---------+-----------+-----------+-----------+
    sqlite> 
    ´´´

<div>
