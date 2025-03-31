<div align="justify">

# Unidad-5-tarea-6 sobre Creación y manipulación en SQLite3 desde línea de comandos.


### Paso 1: Creación de la BBDD

Se obtiene el contenido del fichero __base-datos-clientes.sql__.

```sql
    -- Crear la tabla de Clientes
    CREATE TABLE IF NOT EXISTS Clientes (
        id INTEGER PRIMARY KEY,
        nombre TEXT NOT NULL,
        email TEXT UNIQUE
    );

    -- Crear la tabla de Productos
    CREATE TABLE IF NOT EXISTS Productos (
        id INTEGER PRIMARY KEY,
        nombre TEXT NOT NULL,
        precio REAL
    );

    -- Crear la tabla de Pedidos
    CREATE TABLE IF NOT EXISTS Pedidos (
        id_pedido INTEGER PRIMARY KEY,
        id_cliente INTEGER,
        id_producto INTEGER,
        cantidad INTEGER,
        fecha_pedido DATE,
        FOREIGN KEY (id_cliente) REFERENCES Clientes(id),
        FOREIGN KEY (id_producto) REFERENCES Productos(id)
    );

    INSERT INTO Clientes (nombre, email) VALUES
        ('Juan Pérez', 'juan@example.com'),
        ('María Gómez', 'maria@example.com'),
        ('Carlos López', 'carlos@example.com'),
        ('Ana Rodríguez', 'ana@example.com'),
        ('Luisa Martínez', 'luisa@example.com'),
        ('Pedro Sánchez', 'pedro@example.com'),
        ('Laura García', 'laura@example.com'),
        ('Miguel Martín', 'miguel@example.com'),
        ('Elena González', 'elena@example.com'),
        ('David Torres', 'david@example.com'),
        ('Sofía Ruiz', 'sofia@example.com'),
        ('Javier López', 'javier@example.com'),
        ('Carmen Vargas', 'carmen@example.com'),
        ('Daniel Muñoz', 'daniel@example.com'),
        ('Isabel Serrano', 'isabel@example.com'),
        ('Alejandro Muñoz', 'alejandro@example.com'),
        ('Raquel Herrera', 'raquel@example.com'),
        ('Francisco Mora', 'francisco@example.com'),
        ('Marina Díaz', 'marina@example.com'),
        ('Antonio Jiménez', 'antonio@example.com'),
        ('Beatriz Romero', 'beatriz@example.com'),
        ('Carlos Gómez', 'carlos.gomez@example.com'),
        ('Clara Sánchez', 'clara.sanchez@example.com'),
        ('Andrés Martínez', 'andres@example.com'),
        ('Lucía Díaz', 'lucia@example.com'),
        ('Mario Serrano', 'mario@example.com'),
        ('Eva Torres', 'eva.torres@example.com'),
        ('Roberto Ruiz', 'roberto@example.com'),
        ('Celia García', 'celia@example.com');

    INSERT INTO Productos (nombre, precio) VALUES
        ('Laptop', 1200.00),
        ('Smartphone', 699.99),
        ('TV LED', 799.50),
        ('Tablet', 299.99),
        ('Auriculares Bluetooth', 79.99),
        ('Impresora', 199.99),
        ('Cámara Digital', 499.99),
        ('Reproductor de Audio', 149.99),
        ('Altavoces Inalámbricos', 129.99),
        ('Reloj Inteligente', 249.99),
        ('Teclado Inalámbrico', 59.99),
        ('Ratón Óptico', 29.99),
        ('Monitor LED', 349.99),
        ('Mochila para Portátil', 49.99),
        ('Disco Duro Externo', 89.99),
        ('Router Wi-Fi', 69.99),
        ('Lámpara LED', 39.99),
        ('Batería Externa', 19.99),
        ('Estuche para Auriculares', 14.99),
        ('Tarjeta de Memoria', 24.99),
        ('Cargador Inalámbrico', 34.99),
        ('Kit de Limpieza para Computadoras', 9.99),
        ('Funda para Tablet', 19.99),
        ('Soporte para Teléfono', 14.99),
        ('Hub USB', 29.99),
        ('Webcam HD', 59.99),
        ('Funda para Laptop', 29.99),
        ('Adaptador HDMI', 12.99);
    INSERT INTO Pedidos (id_cliente, id_producto, cantidad, fecha_pedido) VALUES
        (1, 1, 2, '2024-02-01'),
        (2, 2, 1, '2024-02-02'),
        (3, 3, 3, '2024-02-03'),
        (4, 4, 1, '2024-02-04'),
        (5, 5, 2, '2024-02-05'),
        (6, 6, 1, '2024-02-06'),
        (7, 7, 3, '2024-02-07'),
        (8, 8, 2, '2024-02-08'),
        (9, 9, 1, '2024-02-09'),
        (10, 10, 2, '2024-02-10'),
        (11, 11, 1, '2024-02-11'),
        (12, 12, 3, '2024-02-12'),
        (13, 13, 1, '2024-02-13'),
        (14, 14, 2, '2024-02-14'),
        (15, 15, 1, '2024-02-15'),
        (16, 16, 3, '2024-02-16'),
        (17, 17, 2, '2024-02-17'),
        (18, 18, 1, '2024-02-18'),
        (19, 19, 2, '2024-02-19'),
        (20, 20, 1, '2024-02-20'),
        (21, 21, 3, '2024-02-21'),
        (22, 22, 1, '2024-02-22'),
        (23, 23, 2, '2024-02-23'),
        (24, 24, 1, '2024-02-24'),
        (25, 25, 3, '2024-02-25'),
        (26, 26, 2, '2024-02-26'),
        (27, 27, 1, '2024-02-27'),
        (28, 28, 2, '2024-02-28'),
        (29, 29, 1, '2024-02-29'),
        (30, 30, 3, '2024-03-01');
```
  
### Paso 2 Lectura del fichero sql (base-datos-clientes.sql).

Para trabajar con el fichero base-datos-clientes.sql, creo una base de datos (tarea6.db) para, posteriormente realizar las correspondientes consultas. Se ejecuta el siguiente comando (previa apertura de un terminal en la misma carpeta 'Unidad-5-tarea-6'):

```sql
sqlite3 tarea6.db 
```

Haciendo un __.read__ del fichero __sql__, de nombre __base-datos-libros.sql__, realiza la creación e inserción de información de la base de datos:

    ```
    ~/Escritorio/BAE tareas SQLite/Unidad-5-tarea-6$ sqlite3
    SQLite version 3.37.2 2022-01-06 13:25:41
    Enter ".help" for usage hints.
    Connected to a transient in-memory database.
    Use ".open FILENAME" to reopen on a persistent database.
    sqlite> .open tarea6.db
    sqlite> .mode table
    sqlite> .table
    Clientes   Pedidos    Productos
    sqlite> 


    ```

    ```
    sqlite> SELECT * FROM Clientes;
    +----+-----------------+---------------------------+
    | id |     nombre      |           email           |
    +----+-----------------+---------------------------+
    | 1  | Juan Pérez      | juan@example.com          |
    | 2  | María Gómez     | maria@example.com         |
    | 3  | Carlos López    | carlos@example.com        |
    | 4  | Ana Rodríguez   | ana@example.com           |
    | 5  | Luisa Martínez  | luisa@example.com         |
    | 6  | Pedro Sánchez   | pedro@example.com         |
    | 7  | Laura García    | laura@example.com         |
    | 8  | Miguel Martín   | miguel@example.com        |
    | 9  | Elena González  | elena@example.com         |
    | 10 | David Torres    | david@example.com         |
    | 11 | Sofía Ruiz      | sofia@example.com         |
    | 12 | Javier López    | javier@example.com        |
    | 13 | Carmen Vargas   | carmen@example.com        |
    | 14 | Daniel Muñoz    | daniel@example.com        |
    | 15 | Isabel Serrano  | isabel@example.com        |
    | 16 | Alejandro Muñoz | alejandro@example.com     |
    | 17 | Raquel Herrera  | raquel@example.com        |
    | 18 | Francisco Mora  | francisco@example.com     |
    | 19 | Marina Díaz     | marina@example.com        |
    | 20 | Antonio Jiménez | antonio@example.com       |
    | 21 | Beatriz Romero  | beatriz@example.com       |
    | 22 | Carlos Gómez    | carlos.gomez@example.com  |
    | 23 | Clara Sánchez   | clara.sanchez@example.com |
    | 24 | Andrés Martínez | andres@example.com        |
    | 25 | Lucía Díaz      | lucia@example.com         |
    | 26 | Mario Serrano   | mario@example.com         |
    | 27 | Eva Torres      | eva.torres@example.com    |
    | 28 | Roberto Ruiz    | roberto@example.com       |
    | 29 | Celia García    | celia@example.com         |
    +----+-----------------+---------------------------+
    sqlite> 

    sqlite> SELECT * FROM Pedidos;
    +-----------+------------+-------------+----------+--------------+
    | id_pedido | id_cliente | id_producto | cantidad | fecha_pedido |
    +-----------+------------+-------------+----------+--------------+
    | 1         | 1          | 1           | 2        | 2024-02-01   |
    | 2         | 2          | 2           | 1        | 2024-02-02   |
    | 3         | 3          | 3           | 3        | 2024-02-03   |
    | 4         | 4          | 4           | 1        | 2024-02-04   |
    | 5         | 5          | 5           | 2        | 2024-02-05   |
    | 6         | 6          | 6           | 1        | 2024-02-06   |
    | 7         | 7          | 7           | 3        | 2024-02-07   |
    | 8         | 8          | 8           | 2        | 2024-02-08   |
    | 9         | 9          | 9           | 1        | 2024-02-09   |
    | 10        | 10         | 10          | 2        | 2024-02-10   |
    | 11        | 11         | 11          | 1        | 2024-02-11   |
    | 12        | 12         | 12          | 3        | 2024-02-12   |
    | 13        | 13         | 13          | 1        | 2024-02-13   |
    | 14        | 14         | 14          | 2        | 2024-02-14   |
    | 15        | 15         | 15          | 1        | 2024-02-15   |
    | 16        | 16         | 16          | 3        | 2024-02-16   |
    | 17        | 17         | 17          | 2        | 2024-02-17   |
    | 18        | 18         | 18          | 1        | 2024-02-18   |
    | 19        | 19         | 19          | 2        | 2024-02-19   |
    | 20        | 20         | 20          | 1        | 2024-02-20   |
    | 21        | 21         | 21          | 3        | 2024-02-21   |
    | 22        | 22         | 22          | 1        | 2024-02-22   |
    | 23        | 23         | 23          | 2        | 2024-02-23   |
    | 24        | 24         | 24          | 1        | 2024-02-24   |
    | 25        | 25         | 25          | 3        | 2024-02-25   |
    | 26        | 26         | 26          | 2        | 2024-02-26   |
    | 27        | 27         | 27          | 1        | 2024-02-27   |
    | 28        | 28         | 28          | 2        | 2024-02-28   |
    | 29        | 29         | 29          | 1        | 2024-02-29   |
    | 30        | 30         | 30          | 3        | 2024-03-01   |
    +-----------+------------+-------------+----------+--------------+
    sqlite> 
    sqlite> SELECT * FROM Productos;
    +----+-----------------------------------+--------+
    | id |              nombre               | precio |
    +----+-----------------------------------+--------+
    | 1  | Laptop                            | 1200.0 |
    | 2  | Smartphone                        | 699.99 |
    | 3  | TV LED                            | 799.5  |
    | 4  | Tablet                            | 299.99 |
    | 5  | Auriculares Bluetooth             | 79.99  |
    | 6  | Impresora                         | 199.99 |
    | 7  | Cámara Digital                    | 499.99 |
    | 8  | Reproductor de Audio              | 149.99 |
    | 9  | Altavoces Inalámbricos            | 129.99 |
    | 10 | Reloj Inteligente                 | 249.99 |
    | 11 | Teclado Inalámbrico               | 59.99  |
    | 12 | Ratón Óptico                      | 29.99  |
    | 13 | Monitor LED                       | 349.99 |
    | 14 | Mochila para Portátil             | 49.99  |
    | 15 | Disco Duro Externo                | 89.99  |
    | 16 | Router Wi-Fi                      | 69.99  |
    | 17 | Lámpara LED                       | 39.99  |
    | 18 | Batería Externa                   | 19.99  |
    | 19 | Estuche para Auriculares          | 14.99  |
    | 20 | Tarjeta de Memoria                | 24.99  |
    | 21 | Cargador Inalámbrico              | 34.99  |
    | 22 | Kit de Limpieza para Computadoras | 9.99   |
    | 23 | Funda para Tablet                 | 19.99  |
    | 24 | Soporte para Teléfono             | 14.99  |
    | 25 | Hub USB                           | 29.99  |
    | 26 | Webcam HD                         | 59.99  |
    | 27 | Funda para Laptop                 | 29.99  |
    | 28 | Adaptador HDMI                    | 12.99  |
    +----+-----------------------------------+--------+
    sqlite> 

    ```

***

### Paso 3: Consultas a realizar y que aparecen en el archivo __consultas-bb-expreg.sql__.

A continuación muestro las consultas realizadas y el resultado (salida):

-- Obtener todos los clientes.
```
     sqlite> SELECT * FROM Clientes;
    +----+-----------------+---------------------------+
    | id |     nombre      |           email           |
    +----+-----------------+---------------------------+
    | 1  | Juan Pérez      | juan@example.com          |
    | 2  | María Gómez     | maria@example.com         |
    | 3  | Carlos López    | carlos@example.com        |
    | 4  | Ana Rodríguez   | ana@example.com           |
    | 5  | Luisa Martínez  | luisa@example.com         |
    | 6  | Pedro Sánchez   | pedro@example.com         |
    | 7  | Laura García    | laura@example.com         |
    | 8  | Miguel Martín   | miguel@example.com        |
    | 9  | Elena González  | elena@example.com         |
    | 10 | David Torres    | david@example.com         |
    | 11 | Sofía Ruiz      | sofia@example.com         |
    | 12 | Javier López    | javier@example.com        |
    | 13 | Carmen Vargas   | carmen@example.com        |
    | 14 | Daniel Muñoz    | daniel@example.com        |
    | 15 | Isabel Serrano  | isabel@example.com        |
    | 16 | Alejandro Muñoz | alejandro@example.com     |
    | 17 | Raquel Herrera  | raquel@example.com        |
    | 18 | Francisco Mora  | francisco@example.com     |
    | 19 | Marina Díaz     | marina@example.com        |
    | 20 | Antonio Jiménez | antonio@example.com       |
    | 21 | Beatriz Romero  | beatriz@example.com       |
    | 22 | Carlos Gómez    | carlos.gomez@example.com  |
    | 23 | Clara Sánchez   | clara.sanchez@example.com |
    | 24 | Andrés Martínez | andres@example.com        |
    | 25 | Lucía Díaz      | lucia@example.com         |
    | 26 | Mario Serrano   | mario@example.com         |
    | 27 | Eva Torres      | eva.torres@example.com    |
    | 28 | Roberto Ruiz    | roberto@example.com       |
    | 29 | Celia García    | celia@example.com         |
    +----+-----------------+---------------------------+
    sqlite> 

```

-- Obtener la cantidad total de productos en todos los pedidos

NOTA 1: Si lo entiendo como la cantidad que ha pedido cada cliente en cada producto, se podría consultar de tal forma que nos caza la columna cantaidad de la tabla Pedidos:
```
    sqlite> SELECT cantidad FROM Pedidos WHERE cantidad REGEXP '[0-9]';
        +----------+
        | cantidad |
        +----------+
        | 2        |
        | 1        |
        | 3        |
        | 1        |
        | 2        |
        | 1        |
        | 3        |
        | 2        |
        | 1        |
        | 2        |
        | 1        |
        | 3        |
        | 1        |
        | 2        |
        | 1        |
        | 3        |
        | 2        |
        | 1        |
        | 2        |
        | 1        |
        | 3        |
        | 1        |
        | 2        |
        | 1        |
        | 3        |
        | 2        |
        | 1        |
        | 2        |
        | 1        |
        | 3        |
        +----------+
    sqlite> 

```
- NOTA 2: Si, sencillamente los contamos obtendremos que son 30 cantidades de pedidos:

```
    sqlite> SELECT COUNT(*) AS cantidad_total FROM pedidos;
    +----------------+
    | cantidad_total |
    +----------------+
    | 30             |
    +----------------+
    sqlite>

```

- NOTA  3: Si, en realidad, lo que se persigue es saber cuánta cantidad de productos hay en total tiendo en cuenta todos los pedidos, entonces, lo más preciso es:

```
    sqlite> SELECT SUM(cantidad) AS total_cantidad FROM Pedidos;
    +----------------+
    | total_cantidad |
    +----------------+
    | 54             |
    +----------------+
    sqlite> 

```

-- Obtener el precio promedio de los productos:

```
    sqlite> SELECT AVG(precio) AS precio_promedio FROM Productos;
    +------------------+
    | precio_promedio  |
    +------------------+
    | 188.294285714286 |
    +------------------+

```

-- Obtener los clientes que tienen un email válido (contiene '@'):

- NOTA: De manera simple, podemos consultar buscando la '@' pero es posible comenter errores.

```
sqlite> SELECT * FROM Clientes WHERE email REGEXP '@';
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 2  | María Gómez     | maria@example.com         |
| 3  | Carlos López    | carlos@example.com        |
| 4  | Ana Rodríguez   | ana@example.com           |
| 5  | Luisa Martínez  | luisa@example.com         |
| 6  | Pedro Sánchez   | pedro@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 9  | Elena González  | elena@example.com         |
| 10 | David Torres    | david@example.com         |
| 11 | Sofía Ruiz      | sofia@example.com         |
| 12 | Javier López    | javier@example.com        |
| 13 | Carmen Vargas   | carmen@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 15 | Isabel Serrano  | isabel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 18 | Francisco Mora  | francisco@example.com     |
| 19 | Marina Díaz     | marina@example.com        |
| 20 | Antonio Jiménez | antonio@example.com       |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 24 | Andrés Martínez | andres@example.com        |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 27 | Eva Torres      | eva.torres@example.com    |
| 28 | Roberto Ruiz    | roberto@example.com       |
| 29 | Celia García    | celia@example.com         |
+----+-----------------+---------------------------+
sqlite> 

```
- NOTA 2: Para ser más precisos en la consulta y hacer que se puedan cazar, realmente, las direcciones de correo electrónico, es más eficiente la siguiente consulta:

```
    sqlite> SELECT * FROM Clientes WHERE email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';
    +----+-----------------+---------------------------+
    | id |     nombre      |           email           |
    +----+-----------------+---------------------------+
    | 1  | Juan Pérez      | juan@example.com          |
    | 2  | María Gómez     | maria@example.com         |
    | 3  | Carlos López    | carlos@example.com        |
    | 4  | Ana Rodríguez   | ana@example.com           |
    | 5  | Luisa Martínez  | luisa@example.com         |
    | 6  | Pedro Sánchez   | pedro@example.com         |
    | 7  | Laura García    | laura@example.com         |
    | 8  | Miguel Martín   | miguel@example.com        |
    | 9  | Elena González  | elena@example.com         |
    | 10 | David Torres    | david@example.com         |
    | 11 | Sofía Ruiz      | sofia@example.com         |
    | 12 | Javier López    | javier@example.com        |
    | 13 | Carmen Vargas   | carmen@example.com        |
    | 14 | Daniel Muñoz    | daniel@example.com        |
    | 15 | Isabel Serrano  | isabel@example.com        |
    | 16 | Alejandro Muñoz | alejandro@example.com     |
    | 17 | Raquel Herrera  | raquel@example.com        |
    | 18 | Francisco Mora  | francisco@example.com     |
    | 19 | Marina Díaz     | marina@example.com        |
    | 20 | Antonio Jiménez | antonio@example.com       |
    | 21 | Beatriz Romero  | beatriz@example.com       |
    | 22 | Carlos Gómez    | carlos.gomez@example.com  |
    | 23 | Clara Sánchez   | clara.sanchez@example.com |
    | 24 | Andrés Martínez | andres@example.com        |
    | 25 | Lucía Díaz      | lucia@example.com         |
    | 26 | Mario Serrano   | mario@example.com         |
    | 27 | Eva Torres      | eva.torres@example.com    |
    | 28 | Roberto Ruiz    | roberto@example.com       |
    | 29 | Celia García    | celia@example.com         |
    +----+-----------------+---------------------------+
    sqlite> 

```

-- Obtener el producto más caro.

```
    sqlite> SELECT * FROM Productos ORDER BY precio DESC LIMIT 1;
    +----+--------+--------+
    | id | nombre | precio |
    +----+--------+--------+
    | 1  | Laptop | 1200.0 |
    +----+--------+--------+
    sqlite> 

```

-- Obtener los pedidos realizados en febrero de 2024.


```
    sqlite> SELECT * FROM Pedidos WHERE fecha_pedido REGEXP '^2024-02';
    +-----------+------------+-------------+----------+--------------+
    | id_pedido | id_cliente | id_producto | cantidad | fecha_pedido |
    +-----------+------------+-------------+----------+--------------+
    | 1         | 1          | 1           | 2        | 2024-02-01   |
    | 2         | 2          | 2           | 1        | 2024-02-02   |
    | 3         | 3          | 3           | 3        | 2024-02-03   |
    | 4         | 4          | 4           | 1        | 2024-02-04   |
    | 5         | 5          | 5           | 2        | 2024-02-05   |
    | 6         | 6          | 6           | 1        | 2024-02-06   |
    | 7         | 7          | 7           | 3        | 2024-02-07   |
    | 8         | 8          | 8           | 2        | 2024-02-08   |
    | 9         | 9          | 9           | 1        | 2024-02-09   |
    | 10        | 10         | 10          | 2        | 2024-02-10   |
    | 11        | 11         | 11          | 1        | 2024-02-11   |
    | 12        | 12         | 12          | 3        | 2024-02-12   |
    | 13        | 13         | 13          | 1        | 2024-02-13   |
    | 14        | 14         | 14          | 2        | 2024-02-14   |
    | 15        | 15         | 15          | 1        | 2024-02-15   |
    | 16        | 16         | 16          | 3        | 2024-02-16   |
    | 17        | 17         | 17          | 2        | 2024-02-17   |
    | 18        | 18         | 18          | 1        | 2024-02-18   |
    | 19        | 19         | 19          | 2        | 2024-02-19   |
    | 20        | 20         | 20          | 1        | 2024-02-20   |
    | 21        | 21         | 21          | 3        | 2024-02-21   |
    | 22        | 22         | 22          | 1        | 2024-02-22   |
    | 23        | 23         | 23          | 2        | 2024-02-23   |
    | 24        | 24         | 24          | 1        | 2024-02-24   |
    | 25        | 25         | 25          | 3        | 2024-02-25   |
    | 26        | 26         | 26          | 2        | 2024-02-26   |
    | 27        | 27         | 27          | 1        | 2024-02-27   |
    | 28        | 28         | 28          | 2        | 2024-02-28   |
    | 29        | 29         | 29          | 1        | 2024-02-29   |
    +-----------+------------+-------------+----------+--------------+
    sqlite> 

```

-- Obtener la cantidad total de productos en todos los pedidos por producto.

```
    sqlite> SELECT id_producto, SUM(cantidad) AS total FROM Pedidos GROUP BY id_producto;
    +-------------+-------+
    | id_producto | total |
    +-------------+-------+
    | 1           | 2     |
    | 2           | 1     |
    | 3           | 3     |
    | 4           | 1     |
    | 5           | 2     |
    | 6           | 1     |
    | 7           | 3     |
    | 8           | 2     |
    | 9           | 1     |
    | 10          | 2     |
    | 11          | 1     |
    | 12          | 3     |
    | 13          | 1     |
    | 14          | 2     |
    | 15          | 1     |
    | 16          | 3     |
    | 17          | 2     |
    | 18          | 1     |
    | 19          | 2     |
    | 20          | 1     |
    | 21          | 3     |
    | 22          | 1     |
    | 23          | 2     |
    | 24          | 1     |
    | 25          | 3     |
    | 26          | 2     |
    | 27          | 1     |
    | 28          | 2     |
    | 29          | 1     |
    | 30          | 3     |
    +-------------+-------+
    sqlite> 

```

-- Obtener los clientes que han realizado más de un pedido.

```
    sqlite> SELECT id_cliente, COUNT(*) AS total_pedidos FROM Pedidos GROUP BY id_cliente HAVING total_pedidos > 1;
    sqlite> 
```
- NOTA: No devuelve ningún resultado entendiendo que no existe ningún cliente que haya realizado más de un pedido.

-- Obtener los productos que tienen un precio registrado.

- Si se realiza la consulta con una expresión regular, se puede hacer los siguiente, sabiendo que si existen números en precio, es que está registrado:

```
    sqlite> SELECT * FROM Productos WHERE precio REGEXP '^[0-9]+(\.[0-9]+)?$';
    +----+-----------------------------------+--------+
    | id |              nombre               | precio |
    +----+-----------------------------------+--------+
    | 1  | Laptop                            | 1200.0 |
    | 2  | Smartphone                        | 699.99 |
    | 3  | TV LED                            | 799.5  |
    | 4  | Tablet                            | 299.99 |
    | 5  | Auriculares Bluetooth             | 79.99  |
    | 6  | Impresora                         | 199.99 |
    | 7  | Cámara Digital                    | 499.99 |
    | 8  | Reproductor de Audio              | 149.99 |
    | 9  | Altavoces Inalámbricos            | 129.99 |
    | 10 | Reloj Inteligente                 | 249.99 |
    | 11 | Teclado Inalámbrico               | 59.99  |
    | 12 | Ratón Óptico                      | 29.99  |
    | 13 | Monitor LED                       | 349.99 |
    | 14 | Mochila para Portátil             | 49.99  |
    | 15 | Disco Duro Externo                | 89.99  |
    | 16 | Router Wi-Fi                      | 69.99  |
    | 17 | Lámpara LED                       | 39.99  |
    | 18 | Batería Externa                   | 19.99  |
    | 19 | Estuche para Auriculares          | 14.99  |
    | 20 | Tarjeta de Memoria                | 24.99  |
    | 21 | Cargador Inalámbrico              | 34.99  |
    | 22 | Kit de Limpieza para Computadoras | 9.99   |
    | 23 | Funda para Tablet                 | 19.99  |
    | 24 | Soporte para Teléfono             | 14.99  |
    | 25 | Hub USB                           | 29.99  |
    | 26 | Webcam HD                         | 59.99  |
    | 27 | Funda para Laptop                 | 29.99  |
    | 28 | Adaptador HDMI                    | 12.99  |
    +----+-----------------------------------+--------+
    sqlite> 

```
- NOTA: Razonando que la columna precio, está definida como REAL, se puede, de manera sencilla, seleccionar todos los precios de nombre de Productos, incluso seleccionar todo de Productos (`SELECT * FROM Productos;`) que nos dará además la columna de id de la tabla:

```
    sqlite> SELECT nombre, precio FROM Productos;
    +-----------------------------------+--------+
    |              nombre               | precio |
    +-----------------------------------+--------+
    | Laptop                            | 1200.0 |
    | Smartphone                        | 699.99 |
    | TV LED                            | 799.5  |
    | Tablet                            | 299.99 |
    | Auriculares Bluetooth             | 79.99  |
    | Impresora                         | 199.99 |
    | Cámara Digital                    | 499.99 |
    | Reproductor de Audio              | 149.99 |
    | Altavoces Inalámbricos            | 129.99 |
    | Reloj Inteligente                 | 249.99 |
    | Teclado Inalámbrico               | 59.99  |
    | Ratón Óptico                      | 29.99  |
    | Monitor LED                       | 349.99 |
    | Mochila para Portátil             | 49.99  |
    | Disco Duro Externo                | 89.99  |
    | Router Wi-Fi                      | 69.99  |
    | Lámpara LED                       | 39.99  |
    | Batería Externa                   | 19.99  |
    | Estuche para Auriculares          | 14.99  |
    | Tarjeta de Memoria                | 24.99  |
    | Cargador Inalámbrico              | 34.99  |
    | Kit de Limpieza para Computadoras | 9.99   |
    | Funda para Tablet                 | 19.99  |
    | Soporte para Teléfono             | 14.99  |
    | Hub USB                           | 29.99  |
    | Webcam HD                         | 59.99  |
    | Funda para Laptop                 | 29.99  |
    | Adaptador HDMI                    | 12.99  |
    +-----------------------------------+--------+
    sqlite>


```

-- Obtener la fecha del primer pedido realizado:

```
    sqlite> SELECT fecha_pedido FROM Pedidos ORDER BY fecha_pedido ASC LIMIT 1;
    +--------------+
    | fecha_pedido |
    +--------------+
    | 2024-02-01   |
    +--------------+
    sqlite> 
```

-- Obtener los productos cuyos nombres comienzan con 'A' o 'B':

```
    sqlite> SELECT * FROM Productos WHERE nombre REGEXP '^[A|B]';
    +----+------------------------+--------+
    | id |         nombre         | precio |
    +----+------------------------+--------+
    | 5  | Auriculares Bluetooth  | 79.99  |
    | 9  | Altavoces Inalámbricos | 129.99 |
    | 18 | Batería Externa        | 19.99  |
    | 28 | Adaptador HDMI         | 12.99  |
    +----+------------------------+--------+
    sqlite> 

```

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.

```
    sqlite> SELECT id_cliente, SUM(cantidad) AS total FROM Pedidos GROUP BY id_cliente ORDER BY id_cliente;
    +------------+-------+
    | id_cliente | total |
    +------------+-------+
    | 1          | 2     |
    | 2          | 1     |
    | 3          | 3     |
    | 4          | 1     |
    | 5          | 2     |
    | 6          | 1     |
    | 7          | 3     |
    | 8          | 2     |
    | 9          | 1     |
    | 10         | 2     |
    | 11         | 1     |
    | 12         | 3     |
    | 13         | 1     |
    | 14         | 2     |
    | 15         | 1     |
    | 16         | 3     |
    | 17         | 2     |
    | 18         | 1     |
    | 19         | 2     |
    | 20         | 1     |
    | 21         | 3     |
    | 22         | 1     |
    | 23         | 2     |
    | 24         | 1     |
    | 25         | 3     |
    | 26         | 2     |
    | 27         | 1     |
    | 28         | 2     |
    | 29         | 1     |
    | 30         | 3     |
    +------------+-------+
    sqlite> 
```

-- Obtener los clientes que han realizado más de un pedido en febrero de 2024.

```
sqlite> SELECT id_cliente, COUNT(*) AS total_pedidos FROM Pedidos WHERE fecha_pedido REGEXP '^2024-02' GROUP BY id_cliente HAVING total_pedidos > 1;
sqlite> 
```
- NOTA: No existen, en esta table, clientes que hayan realizado más de un pedido, en el mismo día. Lo que varía, en este caso, es la cantidad pedida de cada id_cliente. Por ello, la consulta no ofrece resultado.

-- Obtener los productos con precio entre 100 y 500.

```
    sqlite> SELECT * FROM Productos WHERE precio BETWEEN 100 AND 500;
    +----+------------------------+--------+
    | id |         nombre         | precio |
    +----+------------------------+--------+
    | 4  | Tablet                 | 299.99 |
    | 6  | Impresora              | 199.99 |
    | 7  | Cámara Digital         | 499.99 |
    | 8  | Reproductor de Audio   | 149.99 |
    | 9  | Altavoces Inalámbricos | 129.99 |
    | 10 | Reloj Inteligente      | 249.99 |
    | 13 | Monitor LED            | 349.99 |
    +----+------------------------+--------+
    sqlite>

```

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cantidad descendente.

```
    sqlite> SELECT id_cliente, SUM(cantidad) FROM Pedidos GROUP BY id_cliente ORDER BY SUM(cantidad) DESC;
    +------------+---------------+
    | id_cliente | SUM(cantidad) |
    +------------+---------------+
    | 30         | 3             |
    | 25         | 3             |
    | 21         | 3             |
    | 16         | 3             |
    | 12         | 3             |
    | 7          | 3             |
    | 3          | 3             |
    | 28         | 2             |
    | 26         | 2             |
    | 23         | 2             |
    | 19         | 2             |
    | 17         | 2             |
    | 14         | 2             |
    | 10         | 2             |
    | 8          | 2             |
    | 5          | 2             |
    | 1          | 2             |
    | 29         | 1             |
    | 27         | 1             |
    | 24         | 1             |
    | 22         | 1             |
    | 20         | 1             |
    | 18         | 1             |
    | 15         | 1             |
    | 13         | 1             |
    | 11         | 1             |
    | 9          | 1             |
    | 6          | 1             |
    | 4          | 1             |
    | 2          | 1             |
    +------------+---------------+
    sqlite> 

```

-- Obtener los clientes que tienen una 'a' en cualquier posición de su nombre.

```
sqlite> SELECT * FROM Clientes WHERE nombre REGEXP 'a';
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 2  | María Gómez     | maria@example.com         |
| 3  | Carlos López    | carlos@example.com        |
| 4  | Ana Rodríguez   | ana@example.com           |
| 5  | Luisa Martínez  | luisa@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 9  | Elena González  | elena@example.com         |
| 10 | David Torres    | david@example.com         |
| 11 | Sofía Ruiz      | sofia@example.com         |
| 12 | Javier López    | javier@example.com        |
| 13 | Carmen Vargas   | carmen@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 15 | Isabel Serrano  | isabel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 18 | Francisco Mora  | francisco@example.com     |
| 19 | Marina Díaz     | marina@example.com        |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 24 | Andrés Martínez | andres@example.com        |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 27 | Eva Torres      | eva.torres@example.com    |
| 29 | Celia García    | celia@example.com         |
+----+-----------------+---------------------------+
sqlite> 

```
- NOTA: Nos devuelve casi todo el listado de clientes porque el único cliente que no tiene una 'a' en su nombre es el 'id=28 de nombre Roberto Ruiz'.

-- Obtener el precio máximo de los productos.

```
    sqlite> SELECT MAX(precio) AS precio_maximo FROM Productos;
    +---------------+
    | precio_maximo |
    +---------------+
    | 1200.0        |
    +---------------+
    sqlite> 
```

-- Obtener los pedidos realizados por el cliente con ID 1 en febrero de 2024.

```
    sqlite> SELECT * FROM Pedidos WHERE id_cliente = 1 AND fecha_pedido REGEXP '^2024-02';
    +-----------+------------+-------------+----------+--------------+
    | id_pedido | id_cliente | id_producto | cantidad | fecha_pedido |
    +-----------+------------+-------------+----------+--------------+
    | 1         | 1          | 1           | 2        | 2024-02-01   |
    +-----------+------------+-------------+----------+--------------+
    sqlite>

```

-- Obtener la cantidad total de productos en todos los pedidos por producto ordenado por total de productos descendente.

```
    sqlite> SELECT id_producto, SUM(cantidad) FROM Pedidos GROUP BY id_producto ORDER BY SUM(cantidad) DESC;
    +-------------+---------------+
    | id_producto | SUM(cantidad) |
    +-------------+---------------+
    | 30          | 3             |
    | 25          | 3             |
    | 21          | 3             |
    | 16          | 3             |
    | 12          | 3             |
    | 7           | 3             |
    | 3           | 3             |
    | 28          | 2             |
    | 26          | 2             |
    | 23          | 2             |
    | 19          | 2             |
    | 17          | 2             |
    | 14          | 2             |
    | 10          | 2             |
    | 8           | 2             |
    | 5           | 2             |
    | 1           | 2             |
    | 29          | 1             |
    | 27          | 1             |
    | 24          | 1             |
    | 22          | 1             |
    | 20          | 1             |
    | 18          | 1             |
    | 15          | 1             |
    | 13          | 1             |
    | 11          | 1             |
    | 9           | 1             |
    | 6           | 1             |
    | 4           | 1             |
    | 2           | 1             |
    +-------------+---------------+
    sqlite> 
```

-- Obtener los productos que no tienen un precio registrado.
 - NOTA: Se podría consulta de varias formas. No se obtiene resultado porque todos los productos TIENEN un precio registrado o asociado.

```
    sqlite> SELECT * FROM Productos WHERE precio IS NULL OR precio = '';
    sqlite> 
    sqlite> SELECT * FROM Productos WHERE precio IS NULL || precio = '';
    sqlite> 
    sqlite> SELECT * FROM Productos WHERE precio IS NULL;
    sqlite> 
    sqlite> SELECT * FROM Productos WHERE precio = '';
    sqlite> 

```

-- Obtener la fecha del último pedido realizado.

```
    sqlite> SELECT MAX(fecha_pedido) FROM Pedidos;
    +-------------------+
    | MAX(fecha_pedido) |
    +-------------------+
    | 2024-03-01        |
    +-------------------+
    sqlite> 

```

-- Obtener los clientes cuyo nombre tiene al menos 5 caracteres.

```
    sqlite> SELECT * FROM Clientes WHERE nombre REGEXP '^.{5,}$';
    +----+-----------------+---------------------------+
    | id |     nombre      |           email           |
    +----+-----------------+---------------------------+
    | 1  | Juan Pérez      | juan@example.com          |
    | 2  | María Gómez     | maria@example.com         |
    | 3  | Carlos López    | carlos@example.com        |
    | 4  | Ana Rodríguez   | ana@example.com           |
    | 5  | Luisa Martínez  | luisa@example.com         |
    | 6  | Pedro Sánchez   | pedro@example.com         |
    | 7  | Laura García    | laura@example.com         |
    | 8  | Miguel Martín   | miguel@example.com        |
    | 9  | Elena González  | elena@example.com         |
    | 10 | David Torres    | david@example.com         |
    | 11 | Sofía Ruiz      | sofia@example.com         |
    | 12 | Javier López    | javier@example.com        |
    | 13 | Carmen Vargas   | carmen@example.com        |
    | 14 | Daniel Muñoz    | daniel@example.com        |
    | 15 | Isabel Serrano  | isabel@example.com        |
    | 16 | Alejandro Muñoz | alejandro@example.com     |
    | 17 | Raquel Herrera  | raquel@example.com        |
    | 18 | Francisco Mora  | francisco@example.com     |
    | 19 | Marina Díaz     | marina@example.com        |
    | 20 | Antonio Jiménez | antonio@example.com       |
    | 21 | Beatriz Romero  | beatriz@example.com       |
    | 22 | Carlos Gómez    | carlos.gomez@example.com  |
    | 23 | Clara Sánchez   | clara.sanchez@example.com |
    | 24 | Andrés Martínez | andres@example.com        |
    | 25 | Lucía Díaz      | lucia@example.com         |
    | 26 | Mario Serrano   | mario@example.com         |
    | 27 | Eva Torres      | eva.torres@example.com    |
    | 28 | Roberto Ruiz    | roberto@example.com       |
    | 29 | Celia García    | celia@example.com         |
    +----+-----------------+---------------------------+
    sqlite> 

```

-- Obtener los productos que tienen la letra 'o' en cualquier posición del nombre.

```
    sqlite> SELECT * FROM Productos WHERE nombre REGEXP 'o';
    +----+-----------------------------------+--------+
    | id |              nombre               | precio |
    +----+-----------------------------------+--------+
    | 1  | Laptop                            | 1200.0 |
    | 2  | Smartphone                        | 699.99 |
    | 5  | Auriculares Bluetooth             | 79.99  |
    | 6  | Impresora                         | 199.99 |
    | 8  | Reproductor de Audio              | 149.99 |
    | 9  | Altavoces Inalámbricos            | 129.99 |
    | 10 | Reloj Inteligente                 | 249.99 |
    | 11 | Teclado Inalámbrico               | 59.99  |
    | 12 | Ratón Óptico                      | 29.99  |
    | 13 | Monitor LED                       | 349.99 |
    | 14 | Mochila para Portátil             | 49.99  |
    | 15 | Disco Duro Externo                | 89.99  |
    | 16 | Router Wi-Fi                      | 69.99  |
    | 20 | Tarjeta de Memoria                | 24.99  |
    | 21 | Cargador Inalámbrico              | 34.99  |
    | 22 | Kit de Limpieza para Computadoras | 9.99   |
    | 24 | Soporte para Teléfono             | 14.99  |
    | 27 | Funda para Laptop                 | 29.99  |
    | 28 | Adaptador HDMI                    | 12.99  |
    +----+-----------------------------------+--------+
    sqlite> 

```

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.

```
    sqlite> SELECT id_cliente, SUM(cantidad) FROM Pedidos GROUP BY id_cliente ORDER BY id_cliente;
    +------------+---------------+
    | id_cliente | SUM(cantidad) |
    +------------+---------------+
    | 1          | 2             |
    | 2          | 1             |
    | 3          | 3             |
    | 4          | 1             |
    | 5          | 2             |
    | 6          | 1             |
    | 7          | 3             |
    | 8          | 2             |
    | 9          | 1             |
    | 10         | 2             |
    | 11         | 1             |
    | 12         | 3             |
    | 13         | 1             |
    | 14         | 2             |
    | 15         | 1             |
    | 16         | 3             |
    | 17         | 2             |
    | 18         | 1             |
    | 19         | 2             |
    | 20         | 1             |
    | 21         | 3             |
    | 22         | 1             |
    | 23         | 2             |
    | 24         | 1             |
    | 25         | 3             |
    | 26         | 2             |
    | 27         | 1             |
    | 28         | 2             |
    | 29         | 1             |
    | 30         | 3             |
    +------------+---------------+
    sqlite>

```

-- Obtener los clientes cuyos nombres no contienen la letra 'i':

```
sqlite> SELECT * FROM Clientes WHERE nombre REGEXP '^[^iíI]*$';
+----+-----------------+---------------------------+
| id |     nombre      |           email           |
+----+-----------------+---------------------------+
| 1  | Juan Pérez      | juan@example.com          |
| 3  | Carlos López    | carlos@example.com        |
| 6  | Pedro Sánchez   | pedro@example.com         |
| 9  | Elena González  | elena@example.com         |
| 13 | Carmen Vargas   | carmen@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 27 | Eva Torres      | eva.torres@example.com    |
+----+-----------------+---------------------------+
sqlite> 
```
- NOTA: Inicialemente la consulta la realicé  así: `sqlite> SELECT * FROM Clientes WHERE nombre REGEXP '^[^iI]*$';`, pero, al existir las 'í' (con tilde) me cazaba nombres como 'García' o 'Rodríguez'. Es por ello, que añadí en la REGEXP la 'í' minúscula con tilde.

-- Obtener los pedidos realizados por el cliente con ID 2 en febrero de 2024.

```
    sqlite> SELECT * FROM Pedidos WHERE id_cliente = 2 AND fecha_pedido REGEXP '^2024-02';
    +-----------+------------+-------------+----------+--------------+
    | id_pedido | id_cliente | id_producto | cantidad | fecha_pedido |
    +-----------+------------+-------------+----------+--------------+
    | 2         | 2          | 2           | 1        | 2024-02-02   |
    +-----------+------------+-------------+----------+--------------+
    sqlite> 
```

-- Obtener el precio mínimo de los productos.

```
    sqlite> SELECT MIN(precio) FROM Productos;
    +-------------+
    | MIN(precio) |
    +-------------+
    | 9.99        |
    +-------------+
    sqlite> 
```

-- Obtener los clientes que han realizado al menos un pedido en febrero de 2024.

```
    sqlite> SELECT DISTINCT id_cliente FROM Pedidos WHERE fecha_pedido REGEXP '^2024-02';                             
    +------------+
    | id_cliente |
    +------------+
    | 1          |
    | 2          |
    | 3          |
    | 4          |
    | 5          |
    | 6          |
    | 7          |
    | 8          |
    | 9          |
    | 10         |
    | 11         |
    | 12         |
    | 13         |
    | 14         |
    | 15         |
    | 16         |
    | 17         |
    | 18         |
    | 19         |
    | 20         |
    | 21         |
    | 22         |
    | 23         |
    | 24         |
    | 25         |
    | 26         |
    | 27         |
    | 28         |
    | 29         |
    +------------+
    sqlite>

```
 - NOTA: Podría hacerse de manera más compleja con una subconsulta para que nos diera el id_cliente y el nombre del cliente:


 ```
    sqlite> SELECT id, nombre FROM Clientes WHERE id IN (SELECT DISTINCT id_cliente FROM Pedidos WHERE fecha_pedido REGEXP '^2024-02');
    +----+-----------------+
    | id |     nombre      |
    +----+-----------------+
    | 1  | Juan Pérez      |
    | 2  | María Gómez     |
    | 3  | Carlos López    |
    | 4  | Ana Rodríguez   |
    | 5  | Luisa Martínez  |
    | 6  | Pedro Sánchez   |
    | 7  | Laura García    |
    | 8  | Miguel Martín   |
    | 9  | Elena González  |
    | 10 | David Torres    |
    | 11 | Sofía Ruiz      |
    | 12 | Javier López    |
    | 13 | Carmen Vargas   |
    | 14 | Daniel Muñoz    |
    | 15 | Isabel Serrano  |
    | 16 | Alejandro Muñoz |
    | 17 | Raquel Herrera  |
    | 18 | Francisco Mora  |
    | 19 | Marina Díaz     |
    | 20 | Antonio Jiménez |
    | 21 | Beatriz Romero  |
    | 22 | Carlos Gómez    |
    | 23 | Clara Sánchez   |
    | 24 | Andrés Martínez |
    | 25 | Lucía Díaz      |
    | 26 | Mario Serrano   |
    | 27 | Eva Torres      |
    | 28 | Roberto Ruiz    |
    | 29 | Celia García    |
    +----+-----------------+
    sqlite>
 ```


-- Obtener la fecha del último pedido realizado por el cliente con ID 3.

```
    sqlite> SELECT MAX(fecha_pedido) FROM Pedidos WHERE id_cliente = 3;
    +-------------------+
    | MAX(fecha_pedido) |
    +-------------------+
    | 2024-02-03        |
    +-------------------+
    sqlite>

```

-- Obtener los productos que tienen una 'a' al final del nombre.

```
    sqlite> SELECT * FROM Productos  WHERE nombre REGEXP 'aA$';
    sqlite>

```

-- Obtener los clientes cuyos nombres tienen al menos 4 vocales (mayúsculas|minúsculas).

```
    sqlite> SELECT * FROM Clientes WHERE nombre REGEXP '([aeiouáéíóúAEIOU].*){4,}';
    +----+-----------------+---------------------------+
    | id |     nombre      |           email           |
    +----+-----------------+---------------------------+
    | 1  | Juan Pérez      | juan@example.com          |
    | 2  | María Gómez     | maria@example.com         |
    | 3  | Carlos López    | carlos@example.com        |
    | 4  | Ana Rodríguez   | ana@example.com           |
    | 5  | Luisa Martínez  | luisa@example.com         |
    | 6  | Pedro Sánchez   | pedro@example.com         |
    | 7  | Laura García    | laura@example.com         |
    | 8  | Miguel Martín   | miguel@example.com        |
    | 9  | Elena González  | elena@example.com         |
    | 10 | David Torres    | david@example.com         |
    | 11 | Sofía Ruiz      | sofia@example.com         |
    | 12 | Javier López    | javier@example.com        |
    | 13 | Carmen Vargas   | carmen@example.com        |
    | 14 | Daniel Muñoz    | daniel@example.com        |
    | 15 | Isabel Serrano  | isabel@example.com        |
    | 16 | Alejandro Muñoz | alejandro@example.com     |
    | 17 | Raquel Herrera  | raquel@example.com        |
    | 18 | Francisco Mora  | francisco@example.com     |
    | 19 | Marina Díaz     | marina@example.com        |
    | 20 | Antonio Jiménez | antonio@example.com       |
    | 21 | Beatriz Romero  | beatriz@example.com       |
    | 22 | Carlos Gómez    | carlos.gomez@example.com  |
    | 23 | Clara Sánchez   | clara.sanchez@example.com |
    | 24 | Andrés Martínez | andres@example.com        |
    | 25 | Lucía Díaz      | lucia@example.com         |
    | 26 | Mario Serrano   | mario@example.com         |
    | 27 | Eva Torres      | eva.torres@example.com    |
    | 28 | Roberto Ruiz    | roberto@example.com       |
    | 29 | Celia García    | celia@example.com         |
    +----+-----------------+---------------------------+
    sqlite> 

```

-- Obtener los productos cuyo precio tenga al menos 4 números sin contrar los decimales.

```
    sqlite> SELECT * FROM Productos WHERE precio REGEXP '[0-9]{4,}';
    +----+--------+--------+
    | id | nombre | precio |
    +----+--------+--------+
    | 1  | Laptop | 1200.0 |
    +----+--------+--------+
    sqlite> 

```

-- Obtener los clientes cuyos nombres tienen al menos una 'a' seguida de una 'e'.

```
    sqlite> SELECT * FROM Clientes WHERE nombre REGEXP 'ae';
    sqlite>

```
- NOTA: No existe ningún cliente que tenga una 'a' seguida de una 'e', pero sí una clienta que tiene una 'e' seguida de una 'a'. Si quisiera ver esta consulta, se podría hacer de la siguiente manera:

```
    sqlite> SELECT * FROM Clientes WHERE nombre REGEXP 'ea';
    +----+----------------+---------------------+
    | id |     nombre     |        email        |
    +----+----------------+---------------------+
    | 21 | Beatriz Romero | beatriz@example.com |
    +----+----------------+---------------------+
    sqlite>

```

-- Obtener los productos cuyos nombres terminan con una consonante.

```
    sqlite> SELECT * FROM Productos WHERE nombre REGEXP '[^aeiouAEIOU]$';
    +----+-----------------------------------+--------+
    | id |              nombre               | precio |
    +----+-----------------------------------+--------+
    | 1  | Laptop                            | 1200.0 |
    | 3  | TV LED                            | 799.5  |
    | 4  | Tablet                            | 299.99 |
    | 5  | Auriculares Bluetooth             | 79.99  |
    | 7  | Cámara Digital                    | 499.99 |
    | 9  | Altavoces Inalámbricos            | 129.99 |
    | 13 | Monitor LED                       | 349.99 |
    | 14 | Mochila para Portátil             | 49.99  |
    | 17 | Lámpara LED                       | 39.99  |
    | 19 | Estuche para Auriculares          | 14.99  |
    | 22 | Kit de Limpieza para Computadoras | 9.99   |
    | 23 | Funda para Tablet                 | 19.99  |
    | 25 | Hub USB                           | 29.99  |
    | 26 | Webcam HD                         | 59.99  |
    | 27 | Funda para Laptop                 | 29.99  |
    +----+-----------------------------------+--------+
    sqlite> 

```

-- Obtener los productos cuyos nombres empiezan con una vocal.

```
    sqlite> SELECT * FROM Productos WHERE nombre REGEXP '^[aeiouAEIOU]';
    +----+--------------------------+--------+
    | id |          nombre          | precio |
    +----+--------------------------+--------+
    | 5  | Auriculares Bluetooth    | 79.99  |
    | 6  | Impresora                | 199.99 |
    | 9  | Altavoces Inalámbricos   | 129.99 |
    | 19 | Estuche para Auriculares | 14.99  |
    | 28 | Adaptador HDMI           | 12.99  |
    +----+--------------------------+--------+
    sqlite>

```


</div>