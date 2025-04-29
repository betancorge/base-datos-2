<div align="justify">

# Unidad-5-tarea-3 sobre Creación y manipulación en SQLite3 desde línea de comandos.


### Paso 1: Creación de la BBDD

Crea con el siguente contenido el fichero __empleados-dump.sql__.

```sql
CREATE TABLE empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    salario REAL,
    departamento TEXT
);

INSERT INTO empleados (nombre, salario, departamento) VALUES ('Juan', 50000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('María', 60000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carlos', 55000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Ana', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Pedro', 70000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Laura', 52000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Javier', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carmen', 65000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Miguel', 51000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Elena', 55000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Diego', 72000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Sofía', 49000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Andrés', 60000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Isabel', 53000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Raúl', 68000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Patricia', 47000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Alejandro', 71000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Natalia', 54000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Roberto', 49000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Beatriz', 63000, 'TI');
```

Creando el fichero empleados-dump.sql desde VSCode:

<div align="center">
<img src="images/Captura de pantalla de 2025-03-18 10-07-41.png"/>
</div>

### Paso 2 Lectura del fichero sql

Entra en sqlite a través del siguiente comando:

```sql
sqlite3 tarea3.db 
```

Haciendo un __.read__ del fichero __sql__, de nombre __empleados-db.sql__, realiza la creación e inserción de información de la __BBDD__.

```
  ~/Escritorio/BAE tareas SQLite/Unidad-5-tarea-3$ sqlite3 tarea3.db
  SQLite version 3.37.2 2022-01-06 13:25:41
  Enter ".help" for usage hints.
  sqlite> .read empleados-dump.sql
  sqlite> 

  sqlite> .mode table
  sqlite> .table
  empleados
  sqlite> SELECT * FROM empleados;
  +----+-----------+---------+------------------+
  | id |  nombre   | salario |   departamento   |
  +----+-----------+---------+------------------+
  | 1  | Juan      | 50000.0 | Ventas           |
  | 2  | María     | 60000.0 | TI               |
  | 3  | Carlos    | 55000.0 | Ventas           |
  | 4  | Ana       | 48000.0 | Recursos Humanos |
  | 5  | Pedro     | 70000.0 | TI               |
  | 6  | Laura     | 52000.0 | Ventas           |
  | 7  | Javier    | 48000.0 | Recursos Humanos |
  | 8  | Carmen    | 65000.0 | TI               |
  | 9  | Miguel    | 51000.0 | Ventas           |
  | 10 | Elena     | 55000.0 | Recursos Humanos |
  | 11 | Diego     | 72000.0 | TI               |
  | 12 | Sofía     | 49000.0 | Ventas           |
  | 13 | Andrés    | 60000.0 | Recursos Humanos |
  | 14 | Isabel    | 53000.0 | TI               |
  | 15 | Raúl      | 68000.0 | Ventas           |
  | 16 | Patricia  | 47000.0 | Recursos Humanos |
  | 17 | Alejandro | 71000.0 | TI               |
  | 18 | Natalia   | 54000.0 | Ventas           |
  | 19 | Roberto   | 49000.0 | Recursos Humanos |
  | 20 | Beatriz   | 63000.0 | TI               |
  +----+-----------+---------+------------------+
  sqlite> 
```

### Paso 3: Realización de consultas

Realiza las siguientes consultas, y muestra el resultado obtenido:

- Funciones UPPER y LOWER:
  - Muestra el nombre de todos los empleados en mayúsculas.

```
  sqlite> SELECT UPPER(nombre) FROM empleados;
  +---------------+
  | UPPER(nombre) |
  +---------------+
  | JUAN          |
  | MARíA         |
  | CARLOS        |
  | ANA           |
  | PEDRO         |
  | LAURA         |
  | JAVIER        |
  | CARMEN        |
  | MIGUEL        |
  | ELENA         |
  | DIEGO         |
  | SOFíA         |
  | ANDRéS        |
  | ISABEL        |
  | RAúL          |
  | PATRICIA      |
  | ALEJANDRO     |
  | NATALIA       |
  | ROBERTO       |
  | BEATRIZ       |
  +---------------+
  sqlite>
```

- Funciones Numéricas:
  - Calcula el valor absoluto del salario de todos los empleados.
    ```
    sqlite> SELECT nombre, ABS(salario) FROM empleados;
    +-----------+--------------+
    |  nombre   | ABS(salario) |
    +-----------+--------------+
    | Juan      | 50000.0      |
    | María     | 60000.0      |
    | Carlos    | 55000.0      |
    | Ana       | 48000.0      |
    | Pedro     | 70000.0      |
    | Laura     | 52000.0      |
    | Javier    | 48000.0      |
    | Carmen    | 65000.0      |
    | Miguel    | 51000.0      |
    | Elena     | 55000.0      |
    | Diego     | 72000.0      |
    | Sofía     | 49000.0      |
    | Andrés    | 60000.0      |
    | Isabel    | 53000.0      |
    | Raúl      | 68000.0      |
    | Patricia  | 47000.0      |
    | Alejandro | 71000.0      |
    | Natalia   | 54000.0      |
    | Roberto   | 49000.0      |
    | Beatriz   | 63000.0      |
    +-----------+--------------+
    sqlite> 
    ```
- Funciones de Fecha y Hora:
  - Muestra la fecha actual.
    ```
    sqlite> SELECT DATE('now');
    +-------------+
    | DATE('now') |
    +-------------+
    | 2025-03-18  |
    +-------------+
    sqlite>

    ```
  - Para mostrar tanto la fecha como la hora:

  ```
      sqlite> SELECT DATETIME('now');
    +---------------------+
    |   DATETIME('now')   |
    +---------------------+
    | 2025-03-19 10:58:14 |
    +---------------------+
    sqlite> 

  ```

- Funciones de Agregación:
  - Calcula el promedio de salarios de todos los empleados.
      ```
    sqlite> SELECT AVG(salario) FROM empleados;
    +--------------+
    | AVG(salario) |
    +--------------+
    | 57000.0      |
    +--------------+
    sqlite> 
    ```
  - Convierte la cadena '123' a un valor entero.
    ```
    sqlite> SELECT CAST('123' AS INTEGER);
    +------------------------+
    | CAST('123' AS INTEGER) |
    +------------------------+
    | 123                    |
    +------------------------+
    sqlite>
    ```
- Funciones de Manipulación de Cadenas:
  - Concatena el nombre y el departamento de cada empleado.
    ```
    sqlite> SELECT nombre || departamento FROM empleados;
    +--------------------------+
    |  nombre || departamento  |
    +--------------------------+
    | JuanVentas               |
    | MaríaTI                  |
    | CarlosVentas             |
    | AnaRecursos Humanos      |
    | PedroTI                  |
    | LauraVentas              |
    | JavierRecursos Humanos   |
    | CarmenTI                 |
    | MiguelVentas             |
    | ElenaRecursos Humanos    |
    | DiegoTI                  |
    | SofíaVentas              |
    | AndrésRecursos Humanos   |
    | IsabelTI                 |
    | RaúlVentas               |
    | PatriciaRecursos Humanos |
    | AlejandroTI              |
    | NataliaVentas            |
    | RobertoRecursos Humanos  |
    | BeatrizTI                |
    +--------------------------+
    sqlite> 
    ```
- Funciones de Manipulación de Cadenas (CONCAT_WS):
  - Concatena el nombre y el departamento de cada empleado con un guion como separador.
      ```
    sqlite> SELECT nombre || ' - ' || departamento FROM empleados;
    +---------------------------------+
    | nombre || ' - ' || departamento |
    +---------------------------------+
    | Juan - Ventas                   |
    | María - TI                      |
    | Carlos - Ventas                 |
    | Ana - Recursos Humanos          |
    | Pedro - TI                      |
    | Laura - Ventas                  |
    | Javier - Recursos Humanos       |
    | Carmen - TI                     |
    | Miguel - Ventas                 |
    | Elena - Recursos Humanos        |
    | Diego - TI                      |
    | Sofía - Ventas                  |
    | Andrés - Recursos Humanos       |
    | Isabel - TI                     |
    | Raúl - Ventas                   |
    | Patricia - Recursos Humanos     |
    | Alejandro - TI                  |
    | Natalia - Ventas                |
    | Roberto - Recursos Humanos      |
    | Beatriz - TI                    |
    +---------------------------------+
    sqlite>
    ```
  - Nota: Usé la forma " || ' - ' ||" porque CONCAT_WS no me funcionaba:

    ```
    sqlite> SELECT CONCAT_WS(' - ', nombre, departamento) FROM empleados;
    Error: in prepare, no such function: CONCAT_WS (1)
    sqlite> 

    ```


- Funciones de Control de Flujo (CASE):
  - Categoriza a los empleados según sus salarios.
      ```
    sqlite> SELECT nombre, salario, CASE WHEN salario < 50000 THEN 'Bajo' WHEN salario BETWEEN 50000 AND 65000 THEN 'Medio' ELSE 'Alto' END AS categoria FROM empleados;                                                                                               
    +-----------+---------+-----------+                                                                                           
    |  nombre   | salario | categoria |
    +-----------+---------+-----------+
    | Juan      | 50000.0 | Medio     |
    | María     | 60000.0 | Medio     |
    | Carlos    | 55000.0 | Medio     |
    | Ana       | 48000.0 | Bajo      |
    | Pedro     | 70000.0 | Alto      |
    | Laura     | 52000.0 | Medio     |
    | Javier    | 48000.0 | Bajo      |
    | Carmen    | 65000.0 | Medio     |
    | Miguel    | 51000.0 | Medio     |
    | Elena     | 55000.0 | Medio     |
    | Diego     | 72000.0 | Alto      |
    | Sofía     | 49000.0 | Bajo      |
    | Andrés    | 60000.0 | Medio     |
    | Isabel    | 53000.0 | Medio     |
    | Raúl      | 68000.0 | Alto      |
    | Patricia  | 47000.0 | Bajo      |
    | Alejandro | 71000.0 | Alto      |
    | Natalia   | 54000.0 | Medio     |
    | Roberto   | 49000.0 | Bajo      |
    | Beatriz   | 63000.0 | Medio     |
    +-----------+---------+-----------+
    sqlite> 
    ```
- Funciones de Agregación (SUM):
  - Calcula la suma total de salarios de todos los empleados.
      ```
    sqlite> SELECT SUM(salario) FROM empleados;
    +--------------+
    | SUM(salario) |
    +--------------+
    | 1140000.0    |
    +--------------+
    sqlite> 
    ```
- Funciones Numéricas (ROUND):
  - Redondea el salario de todos los empleados a dos decimales.
      ```
    sqlite> SELECT nombre, ROUND(salario, 2) FROM empleados;
    +-----------+-------------------+
    |  nombre   | ROUND(salario, 2) |
    +-----------+-------------------+
    | Juan      | 50000.0           |
    | María     | 60000.0           |
    | Carlos    | 55000.0           |
    | Ana       | 48000.0           |
    | Pedro     | 70000.0           |
    | Laura     | 52000.0           |
    | Javier    | 48000.0           |
    | Carmen    | 65000.0           |
    | Miguel    | 51000.0           |
    | Elena     | 55000.0           |
    | Diego     | 72000.0           |
    | Sofía     | 49000.0           |
    | Andrés    | 60000.0           |
    | Isabel    | 53000.0           |
    | Raúl      | 68000.0           |
    | Patricia  | 47000.0           |
    | Alejandro | 71000.0           |
    | Natalia   | 54000.0           |
    | Roberto   | 49000.0           |
    | Beatriz   | 63000.0           |
    +-----------+-------------------+
    sqlite> 
    ```
- Funciones de Manipulación de Cadenas (LENGTH):
  - Muestra la longitud de cada nombre de empleado.
      ```
      sqlite> SELECT nombre, LENGTH(nombre) FROM empleados;
      +-----------+----------------+
      |  nombre   | LENGTH(nombre) |
      +-----------+----------------+
      | Juan      | 4              |
      | María     | 5              |
      | Carlos    | 6              |
      | Ana       | 3              |
      | Pedro     | 5              |
      | Laura     | 5              |
      | Javier    | 6              |
      | Carmen    | 6              |
      | Miguel    | 6              |
      | Elena     | 5              |
      | Diego     | 5              |
      | Sofía     | 5              |
      | Andrés    | 6              |
      | Isabel    | 6              |
      | Raúl      | 4              |
      | Patricia  | 8              |
      | Alejandro | 9              |
      | Natalia   | 7              |
      | Roberto   | 7              |
      | Beatriz   | 7              |
      +-----------+----------------+
      sqlite> 
    ```
- Funciones de Agregación (COUNT):
  - Cuenta el número total de empleados en cada departamento.
    ```
    sqlite> SELECT departamento, COUNT(*) FROM empleados GROUP BY departamento;
    +------------------+----------+
    |   departamento   | COUNT(*) |
    +------------------+----------+
    | Recursos Humanos | 6        |
    | TI               | 7        |
    | Ventas           | 7        |
    +------------------+----------+
    sqlite>
    ```
- Funciones de Fecha y Hora (CURRENT_TIME):
  - Muestra la hora actual.
    ```
    sqlite> SELECT CURRENT_TIME;
    +--------------+
    | CURRENT_TIME |
    +--------------+
    | 10:59:08     |
    +--------------+
    sqlite> 
    ```
    - Nota: Realizando un repaso he añadido, por mi cuenta que, si se quiere poner la fecha y la hora se puede hacer uso del comando DATETIME:

    ```
    sqlite> SELECT DATETIME('now');
    +---------------------+
    |   DATETIME('now')   |
    +---------------------+
    | 2025-03-19 10:58:14 |
    +---------------------+
    sqlite> 

    ```

- Funciones de Conversión (CAST):
  - Convierte el salario a un valor de punto flotante.
      ```
      sqlite> SELECT nombre, CAST(salario AS REAL) FROM empleados;
      +-----------+-----------------------+
      |  nombre   | CAST(salario AS REAL) |
      +-----------+-----------------------+
      | Juan      | 50000.0               |
      | María     | 60000.0               |
      | Carlos    | 55000.0               |
      | Ana       | 48000.0               |
      | Pedro     | 70000.0               |
      | Laura     | 52000.0               |
      | Javier    | 48000.0               |
      | Carmen    | 65000.0               |
      | Miguel    | 51000.0               |
      | Elena     | 55000.0               |
      | Diego     | 72000.0               |
      | Sofía     | 49000.0               |
      | Andrés    | 60000.0               |
      | Isabel    | 53000.0               |
      | Raúl      | 68000.0               |
      | Patricia  | 47000.0               |
      | Alejandro | 71000.0               |
      | Natalia   | 54000.0               |
      | Roberto   | 49000.0               |
      | Beatriz   | 63000.0               |
      +-----------+-----------------------+
      sqlite>
    ```
- Funciones de Manipulación de Cadenas (SUBSTR):

  - Muestra los primeros tres caracteres de cada nombre de empleado.

    ```
    sqlite> SELECT nombre, SUBSTR(nombre, 1, 3) FROM empleados;
    +-----------+----------------------+
    |  nombre   | SUBSTR(nombre, 1, 3) |
    +-----------+----------------------+
    | Juan      | Jua                  |
    | María     | Mar                  |
    | Carlos    | Car                  |
    | Ana       | Ana                  |
    | Pedro     | Ped                  |
    | Laura     | Lau                  |
    | Javier    | Jav                  |
    | Carmen    | Car                  |
    | Miguel    | Mig                  |
    | Elena     | Ele                  |
    | Diego     | Die                  |
    | Sofía     | Sof                  |
    | Andrés    | And                  |
    | Isabel    | Isa                  |
    | Raúl      | Raú                  |
    | Patricia  | Pat                  |
    | Alejandro | Ale                  |
    | Natalia   | Nat                  |
    | Roberto   | Rob                  |
    | Beatriz   | Bea                  |
    +-----------+----------------------+
    sqlite>
    ```
<div>
-__Order By__ and __Like__.

- Empleados en el departamento de 'Ventas' con salarios superiores a 52000.
      
    ```
      sqlite> SELECT * FROM empleados WHERE departamento = 'Ventas' AND salario > 52000;
      +----+---------+---------+--------------+
      | id | nombre  | salario | departamento |
      +----+---------+---------+--------------+
      | 3  | Carlos  | 55000.0 | Ventas       |
      | 15 | Raúl    | 68000.0 | Ventas       |
      | 18 | Natalia | 54000.0 | Ventas       |
      +----+---------+---------+--------------+
      sqlite>
    ```
    
  - Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente.

      ```
      sqlite> SELECT * FROM empleados WHERE nombre LIKE '%a%' ORDER BY salario ASC;
      +----+-----------+---------+------------------+
      | id |  nombre   | salario |   departamento   |
      +----+-----------+---------+------------------+
      | 16 | Patricia  | 47000.0 | Recursos Humanos |
      | 4  | Ana       | 48000.0 | Recursos Humanos |
      | 7  | Javier    | 48000.0 | Recursos Humanos |
      | 12 | Sofía     | 49000.0 | Ventas           |
      | 1  | Juan      | 50000.0 | Ventas           |
      | 6  | Laura     | 52000.0 | Ventas           |
      | 14 | Isabel    | 53000.0 | TI               |
      | 18 | Natalia   | 54000.0 | Ventas           |
      | 3  | Carlos    | 55000.0 | Ventas           |
      | 10 | Elena     | 55000.0 | Recursos Humanos |
      | 2  | María     | 60000.0 | TI               |
      | 13 | Andrés    | 60000.0 | Recursos Humanos |
      | 20 | Beatriz   | 63000.0 | TI               |
      | 8  | Carmen    | 65000.0 | TI               |
      | 15 | Raúl      | 68000.0 | Ventas           |
      | 17 | Alejandro | 71000.0 | TI               |
      +----+-----------+---------+------------------+
      sqlite> 
      ```
      - Nota: Como estuvimos viendo en la clase de ayer (18/03/2025) es más eficiente realizar una consulta con expresión regular quedando de la siiguiente manera:

      ```
      sqlite> SELECT * FROM empleados WHERE nombre REGEXP 'a' ORDER BY salario ASC;
      +----+-----------+---------+------------------+
      | id |  nombre   | salario |   departamento   |
      +----+-----------+---------+------------------+
      | 16 | Patricia  | 47000.0 | Recursos Humanos |
      | 4  | Ana       | 48000.0 | Recursos Humanos |
      | 7  | Javier    | 48000.0 | Recursos Humanos |
      | 12 | Sofía     | 49000.0 | Ventas           |
      | 1  | Juan      | 50000.0 | Ventas           |
      | 6  | Laura     | 52000.0 | Ventas           |
      | 14 | Isabel    | 53000.0 | TI               |
      | 18 | Natalia   | 54000.0 | Ventas           |
      | 3  | Carlos    | 55000.0 | Ventas           |
      | 10 | Elena     | 55000.0 | Recursos Humanos |
      | 2  | María     | 60000.0 | TI               |
      | 20 | Beatriz   | 63000.0 | TI               |
      | 8  | Carmen    | 65000.0 | TI               |
      | 15 | Raúl      | 68000.0 | Ventas           |
      | 17 | Alejandro | 71000.0 | TI               |
      +----+-----------+---------+------------------+

      ```


- Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.

    ```
      sqlite> SELECT * FROM empleados WHERE departamento = 'Recursos Humanos' AND salario BETWEEN 45000 AND 55000;
      +----+----------+---------+------------------+
      | id |  nombre  | salario |   departamento   |
      +----+----------+---------+------------------+
      | 4  | Ana      | 48000.0 | Recursos Humanos |
      | 7  | Javier   | 48000.0 | Recursos Humanos |
      | 10 | Elena    | 55000.0 | Recursos Humanos |
      | 16 | Patricia | 47000.0 | Recursos Humanos |
      | 19 | Roberto  | 49000.0 | Recursos Humanos |
      +----+----------+---------+------------------+
      sqlite> 

    ```
- Empleados con salarios en orden descendente, limitando a los primeros 5 resultados.

    ```
    sqlite> SELECT * FROM empleados ORDER BY salario DESC LIMIT 5;
    +----+-----------+---------+--------------+
    | id |  nombre   | salario | departamento |
    +----+-----------+---------+--------------+
    | 11 | Diego     | 72000.0 | TI           |
    | 17 | Alejandro | 71000.0 | TI           |
    | 5  | Pedro     | 70000.0 | TI           |
    | 15 | Raúl      | 68000.0 | Ventas       |
    | 8  | Carmen    | 65000.0 | TI           |
    +----+-----------+---------+--------------+
    sqlite> 
    ```
- Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000.

    ```
  sqlite> SELECT * FROM empleados WHERE (nombre LIKE 'M%' OR nombre LIKE 'N%') AND salario > 50000;
  +----+---------+---------+--------------+
  | id | nombre  | salario | departamento |
  +----+---------+---------+--------------+
  | 2  | María   | 60000.0 | TI           |
  | 9  | Miguel  | 51000.0 | Ventas       |
  | 18 | Natalia | 54000.0 | Ventas       |
  +----+---------+---------+--------------+
  sqlite>
  ```

  - Nota: También se puede realizar la consulta con una expresión regular:

  ```
    sqlite> SELECT * FROM empleados WHERE nombre REGEXP 'M|N';
    +----+---------+---------+--------------+
    | id | nombre  | salario | departamento |
    +----+---------+---------+--------------+
    | 2  | María   | 60000.0 | TI           |
    | 9  | Miguel  | 51000.0 | Ventas       |
    | 18 | Natalia | 54000.0 | Ventas       |
    +----+---------+---------+--------------+

  ```

- Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre.

    ```
    sqlite> SELECT * FROM empleados WHERE departamento IN ('TI', 'Ventas') ORDER BY nombre;
    +----+-----------+---------+--------------+
    | id |  nombre   | salario | departamento |
    +----+-----------+---------+--------------+
    | 17 | Alejandro | 71000.0 | TI           |
    | 20 | Beatriz   | 63000.0 | TI           |
    | 3  | Carlos    | 55000.0 | Ventas       |
    | 8  | Carmen    | 65000.0 | TI           |
    | 11 | Diego     | 72000.0 | TI           |
    | 14 | Isabel    | 53000.0 | TI           |
    | 1  | Juan      | 50000.0 | Ventas       |
    | 6  | Laura     | 52000.0 | Ventas       |
    | 2  | María     | 60000.0 | TI           |
    | 9  | Miguel    | 51000.0 | Ventas       |
    | 18 | Natalia   | 54000.0 | Ventas       |
    | 5  | Pedro     | 70000.0 | TI           |
    | 15 | Raúl      | 68000.0 | Ventas       |
    | 12 | Sofía     | 49000.0 | Ventas       |
    +----+-----------+---------+--------------+
    sqlite>
  ```
- Empleados con salarios únicos (eliminando duplicados) en orden ascendente.

    ```
  sqlite> SELECT DISTINCT salario FROM empleados ORDER BY salario ASC;
  +---------+
  | salario |
  +---------+
  | 47000.0 |
  | 48000.0 |
  | 49000.0 |
  | 50000.0 |
  | 51000.0 |
  | 52000.0 |
  | 53000.0 |
  | 54000.0 |
  | 55000.0 |
  | 60000.0 |
  | 63000.0 |
  | 65000.0 |
  | 68000.0 |
  | 70000.0 |
  | 71000.0 |
  | 72000.0 |
  +---------+
  sqlite>
  ```
- Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'.

    ```
    sqlite> SELECT * FROM empleados WHERE departamento = 'Ventas' AND (nombre LIKE '%o' OR nombre LIKE '%a');
    +----+---------+---------+--------------+
    | id | nombre  | salario | departamento |
    +----+---------+---------+--------------+
    | 6  | Laura   | 52000.0 | Ventas       |
    | 12 | Sofía   | 49000.0 | Ventas       |
    | 18 | Natalia | 54000.0 | Ventas       |
    +----+---------+---------+--------------+
    sqlite>

  ```

  - Nota: También se puede realizar la misma consulta usando las expresiones regulares de la siguienta manera:

  ```
  sqlite> SELECT * FROM empleados WHERE departamento = 'Ventas' AND nombre REGEXP '[o,a]$';
  +----+---------+---------+--------------+
  | id | nombre  | salario | departamento |
  +----+---------+---------+--------------+
  | 6  | Laura   | 52000.0 | Ventas       |
  | 12 | Sofía   | 49000.0 | Ventas       |
  | 18 | Natalia | 54000.0 | Ventas       |
  +----+---------+---------+--------------+
  sqlite> 

  ```

- Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.
    ```
  sqlite> SELECT * FROM empleados WHERE salario NOT BETWEEN 55000 AND 70000 ORDER BY departamento;
  +----+-----------+---------+------------------+
  | id |  nombre   | salario |   departamento   |
  +----+-----------+---------+------------------+
  | 4  | Ana       | 48000.0 | Recursos Humanos |
  | 7  | Javier    | 48000.0 | Recursos Humanos |
  | 16 | Patricia  | 47000.0 | Recursos Humanos |
  | 19 | Roberto   | 49000.0 | Recursos Humanos |
  | 11 | Diego     | 72000.0 | TI               |
  | 14 | Isabel    | 53000.0 | TI               |
  | 17 | Alejandro | 71000.0 | TI               |
  | 1  | Juan      | 50000.0 | Ventas           |
  | 6  | Laura     | 52000.0 | Ventas           |
  | 9  | Miguel    | 51000.0 | Ventas           |
  | 12 | Sofía     | 49000.0 | Ventas           |
  | 18 | Natalia   | 54000.0 | Ventas           |
  +----+-----------+---------+------------------+
  sqlite> 
  ```
- Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'.
    ```
    sqlite> SELECT * FROM empleados WHERE departamento = 'Recursos Humanos' AND nombre NOT LIKE '%e%';
    +----+----------+---------+------------------+
    | id |  nombre  | salario |   departamento   |
    +----+----------+---------+------------------+
    | 4  | Ana      | 48000.0 | Recursos Humanos |
    | 13 | Andrés   | 60000.0 | Recursos Humanos |
    | 16 | Patricia | 47000.0 | Recursos Humanos |
    +----+----------+---------+------------------+
    sqlite>
    ```
  -Nota: Tamnién se puede usar una expresión regular para realizar dicha consulta de la siguiente manera:

  ```
  sqlite> SELECT * FROM empleados WHERE departamento = 'Recursos Humanos' AND nombre REGEXP '^[^e]*$';
  +----+----------+---------+------------------+
  | id |  nombre  | salario |   departamento   |
  +----+----------+---------+------------------+
  | 4  | Ana      | 48000.0 | Recursos Humanos |
  | 13 | Andrés   | 60000.0 | Recursos Humanos |
  | 16 | Patricia | 47000.0 | Recursos Humanos |
  +----+----------+---------+------------------+
  sqlite> 
  ```
</div>

</div>