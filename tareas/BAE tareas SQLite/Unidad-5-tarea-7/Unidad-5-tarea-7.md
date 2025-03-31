<div align="justify">

# Unidad-5-tarea-7 sobre Creación y manipulación en SQLite3 desde línea de comandos.


### Paso 1: Creación de la BBDD

Se obtiene el contenido del fichero __base-datos-clientes.sql__.

```sql
    
    -- Crear la base de datos
    --CREATE DATABASE IF NOT EXISTS concesionario;

    -- Usar la base de datos
    --USE concesionario;

    CREATE TABLE IF NOT EXISTS clientes (
        id_cliente INTEGER PRIMARY KEY,
        nombre TEXT,
        edad INTEGER,
        direccion TEXT
    );


    CREATE TABLE IF NOT EXISTS coches (
        id_coche INTEGER PRIMARY KEY,
        modelo TEXT,
        marca TEXT,
        año INTEGER,
        precio REAL
    );



    CREATE TABLE IF NOT EXISTS ventas (
        id_venta INTEGER PRIMARY KEY,
        id_cliente INTEGER,
        id_coche INTEGER,
        fecha_venta DATE,
        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
        FOREIGN KEY (id_coche) REFERENCES coches(id_coche)
    );



    INSERT INTO clientes (nombre, edad, direccion) VALUES
        ('Juan Pérez', 30, 'Calle A #123'),
        ('María Gómez', 25, 'Avenida B #456'),
        ('Carlos López', 35, 'Calle C #789'),
        ('Ana Martínez', 28, 'Avenida D #101'),
        ('Pedro Rodríguez', 40, 'Calle E #234'),
        ('Laura Sánchez', 32, 'Avenida F #567'),
        ('Miguel González', 27, 'Calle G #890'),
        ('Isabel Díaz', 38, 'Avenida H #111'),
        ('Francisco Ruiz', 33, 'Calle I #222'),
        ('Elena Torres', 29, 'Avenida J #333');


    INSERT INTO coches (modelo, marca, año, precio) VALUES
        ('Sedán 2022', 'Toyota', 2022, 25000.00),
        ('Hatchback 2021', 'Honda', 2021, 22000.00),
        ('SUV 2023', 'Ford', 2023, 30000.00),
        ('Coupé 2022', 'Chevrolet', 2022, 28000.00),
        ('Camioneta 2023', 'Nissan', 2023, 32000.00),
        ('Compacto 2021', 'Volkswagen', 2021, 20000.00),
        ('Híbrido 2022', 'Hyundai', 2022, 27000.00),
        ('Deportivo 2023', 'Mazda', 2023, 35000.00),
        ('Pickup 2022', 'Ram', 2022, 31000.00),
        ('Eléctrico 2021', 'Tesla', 2021, 40000.00);

    INSERT INTO ventas (id_cliente, id_coche, fecha_venta) VALUES
        (1, 1, '2023-01-15'),
        (2, 2, '2023-02-20'),
        (3, 3, '2023-03-25'),
        (4, 4, '2023-04-10'),
        (5, 5, '2023-05-05'),
        (6, 6, '2023-06-15'),
        (7, 7, '2023-07-20'),
        (8, 8, '2023-08-25'),
        (10, 10, '2023-10-05');

```
- NOTA: TUVE QUE DEJAR EN COMENTARIO LAS LÍNEAS 2 Y 5 DEL CÓDIGO DEL ARCHIVO.SQL PORQUE DABA ERRORES AL REALIZAR EL COMANDO .READ DESDE LA TERMINAL CON SQLITE3.
  
### Paso 2 Lectura del fichero sql (base-datos-clientes.sql).

Para trabajar con el fichero base-datos-clientes.sql, creo una base de datos (tarea7.db) para, posteriormente realizar las correspondientes consultas. Se ejecuta el siguiente comando (previa apertura de un terminal en la misma carpeta 'Unidad-5-tarea-7'):

```sql
sqlite3 tarea7.db 
```

Haciendo un __.read__ del fichero __sql__, de nombre __base-datos.clientes7.sql__, realiza la creación e inserción de información de la base de datos:

  ```
    ~/Escritorio/BAE tareas SQLite/Unidad-5-tarea-7$ sqlite3
    SQLite version 3.37.2 2022-01-06 13:25:41
    Enter ".help" for usage hints.
    Connected to a transient in-memory database.
    Use ".open FILENAME" to reopen on a persistent database.
    sqlite> .open tarea7.db
    sqlite> .mode table
    sqlite> .table
    clientes  coches    ventas  
    sqlite>
  ```

***

### Paso 3: Consultas a realizar y que aparecen en el archivo __consultas-bb-expreg.sql__.

A continuación muestro las consultas realizadas y el resultado (salida):

-- Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Qué es lo que no me han pedido?

  ```
      sqlite> SELECT (SELECT modelo FROM coches WHERE coches.id_coche = ventas.id_coche) AS MOD,(SELECT precio FROM coches WHERE coches.id_coche = ventas.id_coche) AS PVP, (SELECT nombre FROM clientes WHERE clientes.id_cliente = ventas.id_cliente) AS CLIENTE FROM ventas;
    +----------------+---------+-----------------+
    |      MOD       |   PVP   |     CLIENTE     |
    +----------------+---------+-----------------+
    | Sedán 2022     | 25000.0 | Juan Pérez      |
    | Hatchback 2021 | 22000.0 | María Gómez     |
    | SUV 2023       | 30000.0 | Carlos López    |
    | Coupé 2022     | 28000.0 | Ana Martínez    |
    | Camioneta 2023 | 32000.0 | Pedro Rodríguez |
    | Compacto 2021  | 20000.0 | Laura Sánchez   |
    | Híbrido 2022   | 27000.0 | Miguel González |
    | Deportivo 2023 | 35000.0 | Isabel Díaz     |
    | Eléctrico 2021 | 40000.0 | Elena Torres    |
    | Sedán 2022     | 25000.0 | Juan Pérez      |
    | Hatchback 2021 | 22000.0 | María Gómez     |
    | SUV 2023       | 30000.0 | Carlos López    |
    | Coupé 2022     | 28000.0 | Ana Martínez    |
    | Camioneta 2023 | 32000.0 | Pedro Rodríguez |
    | Compacto 2021  | 20000.0 | Laura Sánchez   |
    | Híbrido 2022   | 27000.0 | Miguel González |
    | Deportivo 2023 | 35000.0 | Isabel Díaz     |
    | Eléctrico 2021 | 40000.0 | Elena Torres    |
    +----------------+---------+-----------------+
    sqlite> 
  ```

-- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
  -- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio).

  ```
      sqlite> SELECT AVG(precio) AS Precio_Promedio FROM coches;
      +-----------------+
      | Precio_Promedio |
      +-----------------+
      | 29000.0         |
      +-----------------+
      sqlite> SELECT (SELECT nombre  FROM clientes WHERE clientes.id_cliente = ventas.id_cliente) AS Nombre_Cliente, (SELECT precio FROM coches WHERE coches.id_coche = ventas.id_coche) AS Precio FROM ventas WHERE (SELECT precio FROM coches WHERE coches.id_coche = ventas.id_coche) > (SELECT AVG(precio) FROM coches);
      +-----------------+---------+
      | Nombre_Cliente  | Precio  |
      +-----------------+---------+
      | Carlos López    | 30000.0 |
      | Pedro Rodríguez | 32000.0 |
      | Isabel Díaz     | 35000.0 |
      | Elena Torres    | 40000.0 |
      | Carlos López    | 30000.0 |
      | Pedro Rodríguez | 32000.0 |
      | Isabel Díaz     | 35000.0 |
      | Elena Torres    | 40000.0 |
      +-----------------+---------+
      sqlite> 
  ```
  - NOTA: Se podría mejorar, incluso, para que la salida sólo ofreciera el nombre de los clientes si duplicar datos, porque, por ejemplo 'Carlos López' realizó dos compras por encima de la media de '30000.0' cada una:

  ```
    sqlite> SELECT DISTINCT (SELECT nombre FROM clientes WHERE clientes.id_cliente = ventas.id_cliente) AS Nombre_Cliente FROM ventas WHERE (SELECT precio FROM coches WHERE coches.id_coche = ventas.id_coche) > (SELECT AVG(precio) FROM coches);
    +-----------------+
    | Nombre_Cliente  |
    +-----------------+
    | Carlos López    |
    | Pedro Rodríguez |
    | Isabel Díaz     |
    | Elena Torres    |
    +-----------------+
    sqlite> 
  ```

-- Mostrar los modelos de coches y sus precios que no han sido vendidos aún:

  -- Cosas que debo de tener en cuenta:
    -- Coches que han sido vendidos.
    -- Quiero los coches que no han sido vendidos. NOT id_coche IN ventas.

  ```
    sqlite> SELECT modelo, precio FROM coches WHERE id_coche NOT IN (SELECT id_coche FROM ventas);
    +----------------+---------+
    |     modelo     | precio  |
    +----------------+---------+
    | Pickup 2022    | 31000.0 |
    | Sedán 2022     | 25000.0 |
    | Hatchback 2021 | 22000.0 |
    | SUV 2023       | 30000.0 |
    | Coupé 2022     | 28000.0 |
    | Camioneta 2023 | 32000.0 |
    | Compacto 2021  | 20000.0 |
    | Híbrido 2022   | 27000.0 |
    | Deportivo 2023 | 35000.0 |
    | Pickup 2022    | 31000.0 |
    | Eléctrico 2021 | 40000.0 |
    +----------------+---------+
    sqlite> 
  ```

-- Calcular el total gastado por todos los clientes en coches:
  -- Cosas que debo de tener en cuenta:
    -- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.

  ```
    sqlite> SELECT SUM(precio) AS total_gastado FROM coches WHERE id_coche IN (SELECT id_coche FROM ventas);
    +---------------+
    | total_gastado |
    +---------------+
    | 259000.0      |
    +---------------+
    sqlite> 

  ```

-- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos?


  ```
  sqlite> SELECT (SELECT modelo FROM coches WHERE coches.id_coche = ventas.id_coche) AS Modelo, ventas.fecha_venta AS Fecha_Venta, (SELECT nombre FROM clientes WHERE clientes.id_cliente = ventas.id_cliente) AS Nombre_Cliente FROM ventas ORDER BY ventas.fecha_venta DESC;
  +----------------+-------------+-----------------+
  |     Modelo     | Fecha_Venta | Nombre_Cliente  |
  +----------------+-------------+-----------------+
  | Eléctrico 2021 | 2023-10-05  | Elena Torres    |
  | Eléctrico 2021 | 2023-10-05  | Elena Torres    |
  | Deportivo 2023 | 2023-08-25  | Isabel Díaz     |
  | Deportivo 2023 | 2023-08-25  | Isabel Díaz     |
  | Híbrido 2022   | 2023-07-20  | Miguel González |
  | Híbrido 2022   | 2023-07-20  | Miguel González |
  | Compacto 2021  | 2023-06-15  | Laura Sánchez   |
  | Compacto 2021  | 2023-06-15  | Laura Sánchez   |
  | Camioneta 2023 | 2023-05-05  | Pedro Rodríguez |
  | Camioneta 2023 | 2023-05-05  | Pedro Rodríguez |
  | Coupé 2022     | 2023-04-10  | Ana Martínez    |
  | Coupé 2022     | 2023-04-10  | Ana Martínez    |
  | SUV 2023       | 2023-03-25  | Carlos López    |
  | SUV 2023       | 2023-03-25  | Carlos López    |
  | Hatchback 2021 | 2023-02-20  | María Gómez     |
  | Hatchback 2021 | 2023-02-20  | María Gómez     |
  | Sedán 2022     | 2023-01-15  | Juan Pérez      |
  | Sedán 2022     | 2023-01-15  | Juan Pérez      |
  +----------------+-------------+-----------------+
  sqlite> 
  ```
  - NOTA: Se puede hacer de otra forma que, evite ver en la salida tantos elementos duplicados. Así, se podría realizar la consulta de la siguiente manera:

  ```
    sqlite> SELECT DISTINCT (SELECT modelo FROM coches WHERE coches.id_coche = ventas.id_coche) AS modelo,ventas.fecha_venta,(SELECT nombre FROM clientes WHERE clientes.id_cliente = ventas.id_cliente) AS nombre_cliente FROM ventas ORDER BY ventas.fecha_venta DESC;
    +----------------+-------------+-----------------+
    |     modelo     | fecha_venta | nombre_cliente  |
    +----------------+-------------+-----------------+
    | Eléctrico 2021 | 2023-10-05  | Elena Torres    |
    | Deportivo 2023 | 2023-08-25  | Isabel Díaz     |
    | Híbrido 2022   | 2023-07-20  | Miguel González |
    | Compacto 2021  | 2023-06-15  | Laura Sánchez   |
    | Camioneta 2023 | 2023-05-05  | Pedro Rodríguez |
    | Coupé 2022     | 2023-04-10  | Ana Martínez    |
    | SUV 2023       | 2023-03-25  | Carlos López    |
    | Hatchback 2021 | 2023-02-20  | María Gómez     |
    | Sedán 2022     | 2023-01-15  | Juan Pérez      |
    +----------------+-------------+-----------------+
    sqlite> 
  ```

-- Encontrar el modelo de coche más caro.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX

  ```
    sqlite> SELECT modelo, precio FROM coches WHERE precio = (SELECT MAX(precio) FROM coches);
    +----------------+---------+
    |     modelo     | precio  |
    +----------------+---------+
    | Eléctrico 2021 | 40000.0 |
    | Eléctrico 2021 | 40000.0 |
    +----------------+---------+
    sqlite> 
  ```
  - NOTA: Se pueden evitar registros duplicados de la siguiente forma:
  ```
    sqlite> SELECT DISTINCT modelo, precio FROM coches WHERE precio = (SELECT MAX(precio) FROM coches);
    +----------------+---------+
    |     modelo     | precio  |
    +----------------+---------+
    | Eléctrico 2021 | 40000.0 |
    +----------------+---------+
    sqlite> 
  ```

-- Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT

  ```
    sqlite> SELECT id_cliente, COUNT(id_coche) AS cantidad_coches FROM ventas GROUP BY id_cliente;
    +------------+-----------------+
    | id_cliente | cantidad_coches |
    +------------+-----------------+
    | 1          | 2               |
    | 2          | 2               |
    | 3          | 2               |
    | 4          | 2               |
    | 5          | 2               |
    | 6          | 2               |
    | 7          | 2               |
    | 8          | 2               |
    | 10         | 2               |
    +------------+-----------------+
    sqlite> 
  ```
  - NOTA: Para verlo con más claridad, en vez de usar el id_cliente, puedo usar la siguiente consulta que me muestra los nombres de los clientes resultando más claro:

  ```
  sqlite> SELECT nombre AS Nombre_Cliente, (SELECT COUNT(*) FROM ventas WHERE ventas.id_cliente = clientes.id_cliente) AS Cantidad_Coches_Comprados FROM clientes WHERE id_cliente IN (SELECT id_cliente FROM ventas);
  +-----------------+---------------------------+
  | Nombre_Cliente  | Cantidad_Coches_Comprados |
  +-----------------+---------------------------+
  | Juan Pérez      | 2                         |
  | María Gómez     | 2                         |
  | Carlos López    | 2                         |
  | Ana Martínez    | 2                         |
  | Pedro Rodríguez | 2                         |
  | Laura Sánchez   | 2                         |
  | Miguel González | 2                         |
  | Isabel Díaz     | 2                         |
  | Elena Torres    | 2                         |
  +-----------------+---------------------------+
  sqlite> 
  ```

-- Encontrar los clientes que han comprado coches de la marca 'Toyota':
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?.


  ```
    sqlite> SELECT DISTINCT id_cliente, nombre FROM clientes WHERE id_cliente IN (SELECT id_cliente FROM ventas WHERE id_coche IN (SELECT id_coche FROM coches WHERE marca REGEXP '^Toyota$'));
    +------------+------------+
    | id_cliente |   nombre   |
    +------------+------------+
    | 1          | Juan Pérez |
    +------------+------------+
    sqlite> 
  ```
  

-- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. 

  ```
    sqlite> SELECT AVG(clientes.edad) AS promedio_edad FROM clientes WHERE clientes.id_cliente IN (SELECT id_cliente FROM ventas WHERE id_coche IN (SELECT id_coche FROM coches WHERE precio > 25000));
    +------------------+
    |  promedio_edad   |
    +------------------+
    | 32.8333333333333 |
    +------------------+
    sqlite> 

  ```
-- Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

  ```
  sqlite> SELECT coches.modelo, coches.precio FROM coches WHERE coches.id_coche IN (SELECT id_coche FROM ventas WHERE id_cliente IN (SELECT id_cliente FROM clientes WHERE edad > 30));
  +----------------+---------+
  |     modelo     | precio  |
  +----------------+---------+
  | SUV 2023       | 30000.0 |
  | Camioneta 2023 | 32000.0 |
  | Compacto 2021  | 20000.0 |
  | Deportivo 2023 | 35000.0 |
  +----------------+---------+
  sqlite> 
  ```
  

-- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

  ```
    sqlite> SELECT COUNT(*) AS total_ventas FROM ventas WHERE SUBSTR(fecha_venta, 1, 4) = '2022';
    +--------------+
    | total_ventas |
    +--------------+
    | 0            |
    +--------------+
    sqlite> 
  ```
  - NOTA: En la documentación oficial de SQLite existen las [Date and Time Functions](https://www.sqlite.org/lang_datefunc.html), con ello podemos realizar una consulta también, la cual, no dará resultado porque no existen ventas en el año 2022:

  ```
    sqlite> SELECT (SELECT modelo FROM coches WHERE coches.id_coche = ventas.id_coche) AS Modelo, COUNT(ventas.id_coche) AS Cantidad_Ventas FROM ventas WHERE strftime('%Y', fecha_venta) = '2022' GROUP BY ventas.id_coche;
    sqlite> 
  ```

-- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. AVG

  ```
    sqlite> SELECT * FROM coches WHERE precio > (SELECT AVG(precio) FROM coches WHERE id_coche IN (SELECT id_coche FROM ventas WHERE id_cliente IN (SELECT id_cliente FROM clientes WHERE edad < 30)));
    +----------+----------------+--------+------+---------+
    | id_coche |     modelo     | marca  | año  | precio  |
    +----------+----------------+--------+------+---------+
    | 3        | SUV 2023       | Ford   | 2023 | 30000.0 |
    | 5        | Camioneta 2023 | Nissan | 2023 | 32000.0 |
    | 8        | Deportivo 2023 | Mazda  | 2023 | 35000.0 |
    | 9        | Pickup 2022    | Ram    | 2022 | 31000.0 |
    | 10       | Eléctrico 2021 | Tesla  | 2021 | 40000.0 |
    | 13       | SUV 2023       | Ford   | 2023 | 30000.0 |
    | 15       | Camioneta 2023 | Nissan | 2023 | 32000.0 |
    | 18       | Deportivo 2023 | Mazda  | 2023 | 35000.0 |
    | 19       | Pickup 2022    | Ram    | 2022 | 31000.0 |
    | 20       | Eléctrico 2021 | Tesla  | 2021 | 40000.0 |
    +----------+----------------+--------+------+---------+
    sqlite> 
  ```
- NOTA: Como ha ocurrido con otras consultas, puedo evitar registros duplicados en modelo, realizando la consulta de esta manera: 

  ```
  sqlite> SELECT DISTINCT modelo, precio FROM coches WHERE precio > (SELECT AVG(coches.precio) FROM coches WHERE id_coche IN (SELECT id_coche FROM ventas WHERE id_cliente IN (SELECT id_cliente FROM clientes  WHERE edad < 30 )));
  +----------------+---------+
  |     modelo     | precio  |
  +----------------+---------+
  | SUV 2023       | 30000.0 |
  | Camioneta 2023 | 32000.0 |
  | Deportivo 2023 | 35000.0 |
  | Pickup 2022    | 31000.0 |
  | Eléctrico 2021 | 40000.0 |
  +----------------+---------+
  sqlite> 

  ```


-- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio

  ```
    sqlite> SELECT (SELECT marca FROM coches WHERE coches.id_coche = ventas.id_coche) AS marca,COUNT(*) AS total_ventas FROM ventas GROUP BY ventas.id_coche ORDER BY total_ventas DESC;
    +------------+--------------+
    |   marca    | total_ventas |
    +------------+--------------+
    | Tesla      | 2            |
    | Mazda      | 2            |
    | Hyundai    | 2            |
    | Volkswagen | 2            |
    | Nissan     | 2            |
    | Chevrolet  | 2            |
    | Ford       | 2            |
    | Honda      | 2            |
    | Toyota     | 2            |
    +------------+--------------+
    sqlite>
  ```
</div>
