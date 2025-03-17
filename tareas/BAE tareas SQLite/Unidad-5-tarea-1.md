<div align="justify">

# Unidad-5-tarea-1 sobre Creación y manipulación en SQLite3 desde línea de comandos.


### Paso 1: Crear una tabla con un campo de cada tipo

1. En primer lugar, abro un terminal y ejecuto el comando para comprobar si está instalada SQLite3 y su versión

    ```bash
    sqlite3 --version
    ```
    Con ello, se obtiene la siguiente salida:
    ```bash
    3.37.2 2022-01-06 13:25:41 872ba256cbf61d9290b571c0e6d82a20c224ca3ad82971edc46b29818d5dalt1
    ```

2. Una vez ubicado en el lugar en donde crearé la base de datos, utilizo  el comando correspondiente para crear la base de datos "tarea1.db":

    ```bash
    sqlite3 tarea1.db
    ```
    Con ello, se obtiene la siguiente salida:
    ```bash
    SQLite version 3.37.2 2022-01-06 13:25:41
    Enter ".help" for usage hints.
    sqlite> 
    ```
3. Dentro de SQLite3, crea una tabla llamada `Ejemplo` con el siguiente comando:
    ```bash
    sqlite> CREATE TABLE Ejemplo (id INTEGER NOT NULL PRIMARY KEY, texto TEXT NOT NULL, entero INTEGER NOT NULL, decimal REAL NOT NULL, fecha DATE NO NULL, booleano BOOLEAN NOT NULL);
    ```
    Con ello, se obtiene la siguiente salida:
    ```bash
    sqlite> 
    ```
    Para asegurarme de que se ha creado la tabla "Ejemplo" utilizo el comando .table:
    ```bash
    sqlite> .table
    ```
    Con ello, se obtiene la siguiente salida:
    ```bash
    Ejemplo
    sqlite> 

### Paso 2: Insertar 50 entradas

Dado el siguiente conjunto de información:

| id |   texto    | entero | decimal |    fecha    | booleano |
|----|------------|--------|---------|-------------|----------|
| 1  | Ejemplo1    | 25     | 10.5    | 2022-05-15  | 0        |
| 2  | Ejemplo2    | 63     | 45.7    | 2022-06-22  | 1        |
| 3  | Ejemplo3    | 12     | 30.0    | 2022-07-10  | 0        |
| 4  | Ejemplo4    | 78     | 75.2    | 2022-08-05  | 1        |
| 5  | Ejemplo5    | 42     | 18.9    | 2022-09-12  | 0        |
| 6  | Ejemplo6    | 55     | 60.3    | 2022-10-08  | 1        |
| 7  | Ejemplo7    | 10     | 40.1    | 2022-11-17  | 0        |
| 8  | Ejemplo8    | 87     | 22.6    | 2022-12-03  | 1        |
| 9  | Ejemplo9    | 31     | 55.0    | 2023-01-20  | 0        |
| 10 | Ejemplo10   | 68     | 90.4    | 2023-02-14  | 1        |
| 11 | Ejemplo11   | 15     | 12.8    | 2023-03-22  | 0        |
| 12 | Ejemplo12   | 72     | 48.6    | 2023-04-09  | 1        |
| 13 | Ejemplo13   | 22     | 33.7    | 2023-05-01  | 0        |
| 14 | Ejemplo14   | 93     | 70.2    | 2023-06-18  | 1        |
| 15 | Ejemplo15   | 37     | 15.4    | 2023-07-05  | 0        |
| 16 | Ejemplo16   | 81     | 82.9    | 2023-08-11  | 1        |
| 17 | Ejemplo17   | 45     | 28.3    | 2023-09-27  | 0        |
| 18 | Ejemplo18   | 60     | 50.6    | 2023-10-15  | 1        |
| 19 | Ejemplo19   | 5      | 8.7     | 2023-11-22  | 0        |
| 20 | Ejemplo20   | 76     | 65.1    | 2023-12-08  | 1        |
| 21 | Ejemplo21   | 33     | 20.3    | 2024-01-14  | 0        |
| 22 | Ejemplo22   | 70     | 55.8    | 2024-02-29  | 1        |
| 23 | Ejemplo23   | 13     | 42.7    | 2024-03-18  | 0        |
| 24 | Ejemplo24   | 89     | 78.4    | 2024-04-25  | 1        |
| 25 | Ejemplo25   | 49     | 15.9    | 2024-05-12  | 0        |
| 26 | Ejemplo26   | 62     | 60.7    | 2024-06-20  | 1        |
| 27 | Ejemplo27   | 8      | 35.2    | 2024-07-07  | 0        |
| 28 | Ejemplo28   | 95     | 25.6    | 2024-08-23  | 1        |
| 29 | Ejemplo29   | 27     | 50.0    | 2024-09-10  | 0        |
| 30 | Ejemplo30   | 74     | 85.3    | 2024-10-05  | 1        |
| 31 | Ejemplo31   | 18     | 11.8    | 2024-11-12  | 0        |
| 32 | Ejemplo32   | 83     | 47.6    | 2024-12-28  | 1        |
| 33 | Ejemplo33   | 38     | 32.7    | 2025-01-15  | 0        |
| 34 | Ejemplo34   | 101    | 70.2    | 2025-02-01  | 1        |
| 35 | Ejemplo35   | 52     | 18.4    | 2025-03-20  | 0        |
| 36 | Ejemplo36   | 67     | 83.9    | 2025-04-06  | 1        |
| 37 | Ejemplo37   | 43     | 28.3    | 2025-05-13  | 0        |
| 38 | Ejemplo38   | 58     | 50.6    | 2025-06-30  | 1        |
| 39 | Ejemplo39   | 9      | 8.7     | 2025-07-17  | 0        |
| 40 | Ejemplo40   | 82     | 65.1    | 2025-08-23  | 1        |
| 41 | Ejemplo41   | 26     | 20.3    | 2025-09-09  | 0        |
| 42 | Ejemplo42   | 73     | 55.8    | 2025-10-26  | 1        |
| 43 | Ejemplo43   | 14     | 42.7    | 2025-11-13  | 0        |
| 44 | Ejemplo44   | 90     | 78.4    | 2025-12-30  | 1        |
| 45 | Ejemplo45   | 50     | 15.9    | 2026-01-16  | 0        |
| 46 | Ejemplo46   | 63     | 60.7    | 2026-02-03  | 1        |
| 47 | Ejemplo47   | 7      | 35.2    | 2026-03-22  | 0        |
| 48 | Ejemplo48   | 96     | 25.6    | 2026-04-08  | 1        |
| 49 | Ejemplo49   | 28     | 50.0    | 2026-05-25  | 0        |
| 50 | Ejemplo50   | 75     | 85.3    | 2026-06-11  | 1        |

Realiza la inserción en la tabla `Ejemplo` de las __50 entradas__.

1. Para insertar cada entrada, se realiza mediante el comando siguiente:

    ```bash
    INSERT INTO Ejemplo (id, texto, entero, decimal, fecha, booleano) VALUES ('1', 'Ejemplo 1', '25', '10.5','2022-05-15','0');
    ```
    Con ello, se obtiene la siguiente salida:
    ```bash
    sqlite> 
    ```
    Para asegurarme de que los resultados se mostrarán en el forma de tabla, uso el comando .show para cambiar la opción de list por table mediante el siguiente proceso:
    ```bash
    sqlite> .show
        echo: off
         eqp: off
        explain: auto
        headers: off
        mode: list
        nullvalue: ""
        output: stdout
        colseparator: "|"
        rowseparator: "\n"
        stats: off
        width: 
        filename: tarea1.db
    sqlite> .mode table
    sqlite> .show
        echo: off
         eqp: off
        explain: auto
        headers: off
        mode: table
        nullvalue: ""
        output: stdout
        colseparator: "|"
        rowseparator: "\n"
        stats: off
        width: 
        filename: tarea1.db
    sqlite>  
    ```


### Paso 3: Realizar 5 consultas de datos

1. Obtén todas las entradas de la tabla `Ejemplo`.

    ```bash
    sqlite> SELECT * FROM Ejemplo;
    ```
    Con ello, se obtiene la siguiente salida:
    ```bash 
        +----+------------+--------+---------+------------+----------+
        | id |   texto    | entero | decimal |   fecha    | booleano |
        +----+------------+--------+---------+------------+----------+
        | 1  | Ejemplo 1  | 25     | 10.5    | 2022-05-15 | 0        |
        | 2  | Ejemplo 2  | 63     | 45.7    | 2022-06-22 | 1        |
        | 3  | Ejemplo 3  | 12     | 30.0    | 2022-07-10 | 0        |
        | 4  | Ejemplo 4  | 78     | 75.2    | 2022-08-05 | 1        |
        | 5  | Ejemplo 5  | 42     | 18.9    | 2022-09-12 | 0        |
        | 6  | Ejemplo 6  | 55     | 60.3    | 2022-10-08 | 1        |
        | 7  | Ejemplo 7  | 10     | 40.1    | 2022-11-17 | 0        |
        | 8  | Ejemplo 8  | 87     | 22.6    | 2022-12-03 | 1        |
        | 9  | Ejemplo 9  | 31     | 55.0    | 2022-01-20 | 0        |
        | 10 | Ejemplo 10 | 68     | 90.4    | 2023-02-14 | 1        |
        | 11 | Ejemplo 11 | 15     | 12.8    | 2023-03-22 | 0        |
        | 12 | Ejemplo 12 | 72     | 48.6    | 2023-04-09 | 1        |
        | 13 | Ejemplo 13 | 22     | 33.7    | 2023-05-01 | 0        |
        | 14 | Ejemplo 14 | 93     | 70.2    | 2023-06-18 | 1        |
        | 15 | Ejemplo 15 | 37     | 15.4    | 2023-07-05 | 0        |
        | 16 | Ejemplo 16 | 81     | 82.9    | 2023-08-11 | 1        |
        | 17 | Ejemplo 17 | 45     | 28.3    | 2023-09-27 | 0        |
        | 18 | Ejemplo 18 | 60     | 50.6    | 2023-10-15 | 1        |
        | 19 | Ejemplo 19 | 5      | 8.7     | 2023-11-22 | 0        |
        | 20 | Ejemplo 20 | 76     | 65.1    | 2023-12-08 | 1        |
        | 21 | Ejemplo 21 | 33     | 20.3    | 2024-01-14 | 0        |
        | 22 | Ejemplo 22 | 70     | 55.8    | 2024-02-29 | 1        |
        | 23 | Ejemplo 23 | 13     | 42.7    | 2024-03-18 | 0        |
        | 24 | Ejemplo 24 | 89     | 78.4    | 2024-04-25 | 1        |
        | 25 | Ejemplo 25 | 49     | 15.9    | 2024-12-05 | 0        |
        | 26 | Ejemplo 26 | 62     | 60.7    | 2024-06-20 | 1        |
        | 27 | Ejemplo 27 | 8      | 35.2    | 2024-07-07 | 0        |
        | 28 | Ejemplo 28 | 95     | 25.6    | 2024-08-23 | 1        |
        | 29 | Ejemplo 29 | 27     | 50.0    | 2024-09-10 | 0        |
        | 30 | Ejemplo 30 | 74     | 85.3    | 2024-10-05 | 1        |
        | 31 | Ejemplo 31 | 18     | 11.8    | 2024-11-12 | 0        |
        | 32 | Ejemplo 32 | 83     | 47.6    | 2024-12-28 | 1        |
        | 33 | Ejemplo 33 | 38     | 32.7    | 2025-01-15 | 0        |
        | 34 | Ejemplo 34 | 101    | 70.2    | 2025-02-01 | 1        |
        | 35 | Ejemplo 35 | 52     | 18.4    | 2025-03-20 | 0        |
        | 36 | Ejemplo 36 | 67     | 83.9    | 2025-04-06 | 1        |
        | 37 | Ejemplo 37 | 43     | 28.3    | 2025-05-13 | 0        |
        | 38 | Ejemplo 38 | 58     | 50.6    | 2025-06-30 | 1        |
        | 39 | Ejemplo 39 | 9      | 8.7     | 2025-07-17 | 0        |
        | 40 | Ejemplo 40 | 82     | 65.1    | 2025-08-23 | 1        |
        | 41 | Ejemplo 41 | 26     | 20.3    | 2025-09-09 | 0        |
        | 42 | Ejemplo 42 | 73     | 55.8    | 2025-10-26 | 1        |
        | 43 | Ejemplo 43 | 14     | 42.7    | 2025-11-13 | 0        |
        | 44 | Ejemplo 44 | 90     | 78.4    | 2025-12-30 | 1        |
        | 45 | Ejemplo 45 | 50     | 15.9    | 2025-01-16 | 0        |
        | 46 | Ejemplo 46 | 63     | 60.7    | 2026-02-03 | 1        |
        | 47 | Ejemplo 47 | 7      | 35.2    | 2026-03-22 | 0        |
        | 48 | Ejemplo 48 | 96     | 25.6    | 2026-03-22 | 1        |
        | 49 | Ejemplo 49 | 28     | 50.0    | 2026-05-25 | 0        |
        | 50 | Ejemplo 50 | 75     | 85.3    | 2026-06-11 | 1        |
        +----+------------+--------+---------+------------+----------+
        sqlite> 
    ```
    >__Nota__: Podemos observar con detenimiento que los registros de id 45 e id 48 tienen mal insertada la fecha. Para arreglarlo, ejecutando los siguientes comandos de manera consecutiva:

    ```bash
    UPDATE Ejemplo SET fecha = '2026-01-16' WHERE id =         +----+------------+--------+---------+------------+----------+
        | id |   texto    | entero | decimal |   fecha    | booleano |
        +----+------------+--------+---------+------------+----------+
        | 9  | Ejemplo 9  | 41     | 55.0    | 2025-03-17 | 0        |
        | 29 | Modificado | 37     | 50.0    | 2025-03-17 | 0        |
        | 49 | Modificado | 38     | 50.0    | 2025-03-17 | 0        |
        +----+------------+--------+---------+------------+----------+
        sqlite> 
    ```bash
        sqlite> SELECT *FROM Ejemplo;
        +----+------------+--------+---------+------------+----------+
        | id |   texto    | entero | decimal |   fecha    | booleano |
        +----+------------+--------+---------+------------+----------+
        | 1  | Ejemplo 1  | 25     | 10.5    | 2022-05-15 | 0        |
        | 2  | Ejemplo 2  | 63     | 45.7    | 2022-06-22 | 1        |
        | 3  | Ejemplo 3  | 12     | 30.0    | 2022-07-10 | 0        |
        | 4  | Ejemplo 4  | 78     | 75.2    | 2022-08-05 | 1        |
        | 5  | Ejemplo 5  | 42     | 18.9    | 2022-09-12 | 0        |
        | 6  | Ejemplo 6  | 55     | 60.3    | 2022-10-08 | 1        |
        | 7  | Ejemplo 7  | 10     | 40.1    | 2022-11-17 | 0        |
        | 8  | Ejemplo 8  | 87     | 22.6    | 2022-12-03 | 1        |
        | 9  | Ejemplo 9  | 31     | 55.0    | 2022-01-20 | 0        |
        | 10 | Ejemplo 10 | 68     | 90.4    | 2023-02-14 | 1        |
        | 11 | Ejemplo 11 | 15     | 12.8    | 2023-03-22 | 0        |
        | 12 | Ejemplo 12 | 72     | 48.6    | 2023-04-09 | 1        |
        | 13 | Ejemplo 13 | 22     | 33.7    | 2023-05-01 | 0        |
        | 14 | Ejemplo 14 | 93     | 70.2    | 2023-06-18 | 1        |
        | 15 | Ejemplo 15 | 37     | 15.4    | 2023-07-05 | 0        |
        | 16 | Ejemplo 16 | 81     | 82.9    | 2023-08-11 | 1        |
        | 17 | Ejemplo 17 | 45     | 28.3    | 2023-09-27 | 0        |
        | 18 | Ejemplo 18 | 60     | 50.6    | 2023-10-15 | 1        |
        | 19 | Ejemplo 19 | 5      | 8.7     | 2023-11-22 | 0        |
        | 20 | Ejemplo 20 | 76     | 65.1    | 2023-12-08 | 1        |
        | 21 | Ejemplo 21 | 33     | 20.3    | 2024-01-14 | 0        |
        | 22 | Ejemplo 22 | 70     | 55.8    | 2024-02-29 | 1        |
        | 23 | Ejemplo 23 | 13     | 42.7    | 2024-03-18 | 0        |
        | 24 | Ejemplo 24 | 89     | 78.4    | 2024-04-25 | 1        |
        | 25 | Ejemplo 25 | 49     | 15.9    | 2024-12-05 | 0        |
        | 26 | Ejemplo 26 | 62     | 60.7    | 2024-06-20 | 1        |
        | 27 | Ejemplo 27 | 8      | 35.2    | 2024-07-07 | 0        |
        | 28 | Ejemplo 28 | 95     | 25.6    | 2024-08-23 | 1        |
        | 29 | Ejemplo 29 | 27     | 50.0    | 2024-09-10 | 0        |
        | 30 | Ejemplo 30 | 74     | 85.3    | 2024-10-05 | 1        |
        | 31 | Ejemplo 31 | 18     | 11.8    | 2024-11-12 | 0        |
        | 32 | Ejemplo 32 | 83     | 47.6    | 2024-12-28 | 1        |
        | 33 | Ejemplo 33 | 38     | 32.7    | 2025-01-15 | 0        |
        | 34 | Ejemplo 34 | 101    | 70.2    | 2025-02-01 | 1        |
        | 35 | Ejemplo 35 | 52     | 18.4    | 2025-03-20 | 0        |
        | 36 | Ejemplo 36 | 67     | 83.9    | 2025-04-06 | 1        |
        | 37 | Ejemplo 37 | 43     | 28.3    | 2025-05-13 | 0        |
        | 38 | Ejemplo 38 | 58     | 50.6    | 2025-06-30 | 1        |
        | 39 | Ejemplo 39 | 9      | 8.7     | 2025-07-17 | 0        |
        | 40 | Ejemplo 40 | 82     | 65.1    | 2025-08-23 | 1        |
        | 41 | Ejemplo 41 | 26     | 20.3    | 2025-09-09 | 0        |
        | 42 | Ejemplo 42 | 73     | 55.8    | 2025-10-26 | 1        |
        | 43 | Ejemplo 43 | 14     | 42.7    | 2025-11-13 | 0        |
        | 44 | Ejemplo 44 | 90     | 78.4    | 2025-12-30 | 1        |
        | 45 | Ejemplo 45 | 50     | 15.9    | 2026-01-16 | 0        |
        | 46 | Ejemplo 46 | 63     | 60.7    | 2026-02-03 | 1        |
        | 47 | Ejemplo 47 | 7      | 35.2    | 2026-03-22 | 0        |
        | 48 | Ejemplo 48 | 96     | 25.6    | 2026-04-08 | 1        |
        | 49 | Ejemplo 49 | 28     | 50.0    | 2026-05-25 | 0        |
        | 50 | Ejemplo 50 | 75     | 85.3    | 2026-06-11 | 1        |
        +----+------------+--------+---------+------------+----------+
        sqlite>  
    ```    
    >__Nota__: Ahora puede observarse que las fechas del id 45 y del id 48 se han modificado.

2. Obtén las entradas con el campo `entero` mayor a 50.

    ```bash
    SELECT * FROM Ejemplo WHERE entero > 50;
    ```
    Con ello, se obtiene la siguiente salida:
    ```bash
        +----+------------+--------+---------+------------+----------+
        | id |   texto    | entero | decimal |   fecha    | booleano |
        +----+------------+--------+---------+------------+----------+
        | 2  | Ejemplo 2  | 63     | 45.7    | 2022-06-22 | 1        |
        | 4  | Ejemplo 4  | 78     | 75.2    | 2022-08-05 | 1        |
        | 6  | Ejemplo 6  | 55     | 60.3    | 2022-10-08 | 1        |
        | 8  | Ejemplo 8  | 87     | 22.6    | 2022-12-03 | 1        |
        | 10 | Ejemplo 10 | 68     | 90.4    | 2023-02-14 | 1        |
        | 12 | Ejemplo 12 | 72     | 48.6    | 2023-04-09 | 1        |
        | 14 | Ejemplo 14 | 93     | 70.2    | 2023-06-18 | 1        |
        | 16 | Ejemplo 16 | 81     | 82.9    | 2023-08-11 | 1        |
        | 18 | Ejemplo 18 | 60     | 50.6    | 2023-10-15 | 1        |
        | 20 | Ejemplo 20 | 76     | 65.1    | 2023-12-08 | 1        |
        | 22 | Ejemplo 22 | 70     | 55.8    | 2024-02-29 | 1        |
        | 24 | Ejemplo 24 | 89     | 78.4    | 2024-04-25 | 1        |
        | 26 | Ejemplo 26 | 62     | 60.7    | 2024-06-20 | 1        |
        | 28 | Ejemplo 28 | 95     | 25.6    | 2024-08-23 | 1        |
        | 30 | Ejemplo 30 | 74     | 85.3    | 2024-10-05 | 1        |
        | 32 | Ejemplo 32 | 83     | 47.6    | 2024-12-28 | 1        |
        | 34 | Ejemplo 34 | 101    | 70.2    | 2025-02-01 | 1        |
        | 35 | Ejemplo 35 | 52     | 18.4    | 2025-03-20 | 0        |
        | 36 | Ejemplo 36 | 67     | 83.9    | 2025-04-06 | 1        |
        | 38 | Ejemplo 38 | 58     | 50.6    | 2025-06-30 | 1        |
        | 40 | Ejemplo 40 | 82     | 65.1    | 2025-08-23 | 1        |
        | 42 | Ejemplo 42 | 73     | 55.8    | 2025-10-26 | 1        |
        | 44 | Ejemplo 44 | 90     | 78.4    | 2025-12-30 | 1        |
        | 46 | Ejemplo 46 | 63     | 60.7    | 2026-02-03 | 1        |
        | 48 | Ejemplo 48 | 96     | 25.6    | 2026-04-08 | 1        |
        | 50 | Ejemplo 50 | 75     | 85.3    | 2026-06-11 | 1        |
        +----+------------+--------+---------+------------+----------+
        sqlite> 
    ```

### Paso 4: Realizar 3 eliminaciones y 3 modificaciones

1. Elimina las entradas donde el campo `booleano` es igual a `True`.

    ```bash
    DELETE FROM Ejemplo WHERE booleano = 1;
    ```
    Con ello, se obtiene la siguiente salida:
    ```bash
    sqlite> SELECT *FROM Ejemplo;
    +----+------------+--------+---------+------------+----------+
    | id |   texto    | entero | decimal |   fecha    | booleano |
    +----+------------+--------+---------+------------+----------+
    | 1  | Ejemplo 1  | 25     | 10.5    | 2022-05-15 | 0        |
    | 3  | Ejemplo 3  | 12     | 30.0    | 2022-07-10 | 0        |
    | 5  | Ejemplo 5  | 42     | 18.9    | 2022-09-12 | 0        |
    | 7  | Ejemplo 7  | 10     | 40.1    | 2022-11-17 | 0        |
    | 9  | Ejemplo 9  | 31     | 55.0    | 2022-01-20 | 0        |
    | 11 | Ejemplo 11 | 15     | 12.8    | 2023-03-22 | 0        |
    | 13 | Ejemplo 13 | 22     | 33.7    | 2023-05-01 | 0        |
    | 15 | Ejemplo 15 | 37     | 15.4    | 2023-07-05 | 0        |
    | 17 | Ejemplo 17 | 45     | 28.3    | 2023-09-27 | 0        |
    | 19 | Ejemplo 19 | 5      | 8.7     | 2023-11-22 | 0        |
    | 21 | Ejemplo 21 | 33     | 20.3    | 2024-01-14 | 0        |
    | 23 | Ejemplo 23 | 13     | 42.7    | 2024-03-18 | 0        |
    | 25 | Ejemplo 25 | 49     | 15.9    | 2024-12-05 | 0        |
    | 27 | Ejemplo 27 | 8      | 35.2    | 2024-07-07 | 0        |
    | 29 | Ejemplo 29 | 27     | 50.0    | 2024-09-10 | 0        |
    | 31 | Ejemplo 31 | 18     | 11.8    | 2024-11-12 | 0        |
    | 33 | Ejemplo 33 | 38     | 32.7    | 2025-01-15 | 0        |
    | 35 | Ejemplo 35 | 52     | 18.4    | 2025-03-20 | 0        |
    | 37 | Ejemplo 37 | 43     | 28.3    | 2025-05-13 | 0        |
    | 39 | Ejemplo 39 | 9      | 8.7     | 2025-07-17 | 0        |
    | 41 | Ejemplo 41 | 26     | 20.3    | 2025-09-09 | 0        |
    | 43 | Ejemplo 43 | 14     | 42.7    | 2025-11-13 | 0        |
    | 45 | Ejemplo 45 | 50     | 15.9    | 2026-01-16 | 0        |
    | 47 | Ejemplo 47 | 7      | 35.2    | 2026-03-22 | 0        |
    | 49 | Ejemplo 49 | 28     | 50.0    | 2026-05-25 | 0        |
    +----+------------+--------+---------+------------+----------+
    sqlite> 
    ```

2. Modifica el campo `texto` de las entradas donde el campo `entero` es menor a 30 y establece el texto como "Modificado".

    ```bash
    UPDATE Ejemplo SET texto = 'Modificado' WHERE entero < 30;
    ```
    Con ello, se obtiene la siguiente salida:
    ```bash
        sqlite> SELECT *FROM Ejemplo;
        +----+------------+--------+---------+------------+----------+
        | id |   texto    | entero | decimal |   fecha    | booleano |
        +----+------------+--------+---------+------------+----------+
        | 1  | Modificado | 25     | 10.5    | 2022-05-15 | 0        |
        | 3  | Modificado | 12     | 30.0    | 2022-07-10 | 0        |
        | 5  | Ejemplo 5  | 42     | 18.9    | 2022-09-12 | 0        |
        | 7  | Modificado | 10     | 40.1    | 2022-11-17 | 0        |
        | 9  | Ejemplo 9  | 31     | 55.0    | 2022-01-20 | 0        |
        | 11 | Modificado | 15     | 12.8    | 2023-03-22 | 0        |
        | 13 | Modificado | 22     | 33.7    | 2023-05-01 | 0        |
        | 15 | Ejemplo 15 | 37     | 15.4    | 2023-07-05 | 0        |
        | 17 | Ejemplo 17 | 45     | 28.3    | 2023-09-27 | 0        |
        | 19 | Modificado | 5      | 8.7     | 2023-11-22 | 0        |
        | 21 | Ejemplo 21 | 33     | 20.3    | 2024-01-14 | 0        |
        | 23 | Modificado | 13     | 42.7    | 2024-03-18 | 0        |
        | 25 | Ejemplo 25 | 49     | 15.9    | 2024-12-05 | 0        |
        | 27 | Modificado | 8      | 35.2    | 2024-07-07 | 0        |
        | 29 | Modificado | 27     | 50.0    | 2024-09-10 | 0        |
        | 31 | Modificado | 18     | 11.8    | 2024-11-12 | 0        |
        | 33 | Ejemplo 33 | 38     | 32.7    | 2025-01-15 | 0        |
        | 35 | Ejemplo 35 | 52     | 18.4    | 2025-03-20 | 0        |
        | 37 | Ejemplo 37 | 43     | 28.3    | 2025-05-13 | 0        |
        | 39 | Modificado | 9      | 8.7     | 2025-07-17 | 0        |
        | 41 | Modificado | 26     | 20.3    | 2025-09-09 | 0        |
        | 43 | Modificado | 14     | 42.7    | 2025-11-13 | 0        |
        | 45 | Ejemplo 45 | 50     | 15.9    | 2026-01-16 | 0        |
        | 47 | Modificado | 7      | 35.2    | 2026-03-22 | 0        |
        | 49 | Modificado | 28     | 50.0    | 2026-05-25 | 0        |
        +----+------------+--------+---------+------------+----------+
        sqlite> 
    ```
3. Elimina las entradas donde el campo `entero` es igual a 50.
 
    ```bash
    DELETE FROM Ejemplo WHERE entero = 50;
    ```
    Con ello, se obtiene la siguiente salida:
    ```bash
        +----+------------+--------+---------+------------+----------+
        | id |   texto    | entero | decimal |   fecha    | booleano |
        +----+------------+--------+---------+------------+----------+
        | 1  | Modificado | 25     | 10.5    | 2022-05-15 | 0        |
        | 3  | Modificado | 12     | 30.0    | 2022-07-10 | 0        |
        | 5  | Ejemplo 5  | 42     | 18.9    | 2022-09-12 | 0        |
        | 7  | Modificado | 10     | 40.1    | 2022-11-17 | 0        |
        | 9  | Ejemplo 9  | 31     | 55.0    | 2022-01-20 | 0        |
        | 11 | Modificado | 15     | 12.8    | 2023-03-22 | 0        |
        | 13 | Modificado | 22     | 33.7    | 2023-05-01 | 0        |
        | 15 | Ejemplo 15 | 37     | 15.4    | 2023-07-05 | 0        |
        | 17 | Ejemplo 17 | 45     | 28.3    | 2023-09-27 | 0        |
        | 19 | Modificado | 5      | 8.7     | 2023-11-22 | 0        |
        | 21 | Ejemplo 21 | 33     | 20.3    | 2024-01-14 | 0        |
        | 23 | Modificado | 13     | 42.7    | 2024-03-18 | 0        |
        | 25 | Ejemplo 25 | 49     | 15.9    | 2024-12-05 | 0        |
        | 27 | Modificado | 8      | 35.2    | 2024-07-07 | 0        |
        | 29 | Modificado | 27     | 50.0    | 2024-09-10 | 0        |
        | 31 | Modificado | 18     | 11.8    | 2024-11-12 | 0        |
        | 33 | Ejemplo 33 | 38     | 32.7    | 2025-01-15 | 0        |
        | 35 | Ejemplo 35 | 52     | 18.4    | 2025-03-20 | 0        |
        | 37 | Ejemplo 37 | 43     | 28.3    | 2025-05-13 | 0        |
        | 39 | Modificado | 9      | 8.7     | 2025-07-17 | 0        |
        | 41 | Modificado | 26     | 20.3    | 2025-09-09 | 0        |
        | 43 | Modificado | 14     | 42.7    | 2025-11-13 | 0        |
        | 47 | Modificado | 7      | 35.2    | 2026-03-22 | 0        |
        | 49 | Modificado | 28     | 50.0    | 2026-05-25 | 0        |
        +----+------------+--------+---------+------------+----------+
        sqlite> 
    ```
    >__Nota__: Se ha eliminado el registro con id 45 que era el único que, actualmente, tenía el valor de 50 en el campo 'entero'.

4. Incrementa en 10 el valor del campo `entero` para las entradas donde el campo `booleano` es igual a `False`.

   ```bash
    UPDATE Ejemplo SET entero = entero + 10 WHERE booleano = 0;
    ```
    Con ello, se obtiene la siguiente salida:
    ```bash
        sqlite> SELECT * FROM Ejemplo;
        +----+------------+--------+---------+------------+----------+
        | id |   texto    | entero | decimal |   fecha    | booleano |
        +----+------------+--------+---------+------------+----------+
        | 1  | Modificado | 35     | 10.5    | 2022-05-15 | 0        |
        | 3  | Modificado | 22     | 30.0    | 2022-07-10 | 0        |
        | 5  | Ejemplo 5  | 52     | 18.9    | 2022-09-12 | 0        |
        | 7  | Modificado | 20     | 40.1    | 2022-11-17 | 0        |
        | 9  | Ejemplo 9  | 41     | 55.0    | 2022-01-20 | 0        |
        | 11 | Modificado | 25     | 12.8    | 2023-03-22 | 0        |
        | 13 | Modificado | 32     | 33.7    | 2023-05-01 | 0        |
        | 15 | Ejemplo 15 | 47     | 15.4    | 2023-07-05 | 0        |
        | 17 | Ejemplo 17 | 55     | 28.3    | 2023-09-27 | 0        |
        | 19 | Modificado | 15     | 8.7     | 2023-11-22 | 0        |
        | 21 | Ejemplo 21 | 43     | 20.3    | 2024-01-14 | 0        |
        | 23 | Modificado | 23     | 42.7    | 2024-03-18 | 0        |
        | 25 | Ejemplo 25 | 59     | 15.9    | 2024-12-05 | 0        |
        | 27 | Modificado | 18     | 35.2    | 2024-07-07 | 0        |
        | 29 | Modificado | 37     | 50.0    | 2024-09-10 | 0        |
        | 31 | Modificado | 28     | 11.8    | 2024-11-12 | 0        |
        | 33 | Ejemplo 33 | 48     | 32.7    | 2025-01-15 | 0        |
        | 35 | Ejemplo 35 | 62     | 18.4    | 2025-03-20 | 0        |
        | 37 | Ejemplo 37 | 53     | 28.3    | 2025-05-13 | 0        |
        | 39 | Modificado | 19     | 8.7     | 2025-07-17 | 0        |
        | 41 | Modificado | 36     | 20.3    | 2025-09-09 | 0        |
        | 43 | Modificado | 24     | 42.7    | 2025-11-13 | 0        |
        | 47 | Modificado | 17     | 35.2    | 2026-03-22 | 0        |
        | 49 | Modificado | 38     | 50.0    | 2026-05-25 | 0        |
        +----+------------+--------+---------+------------+----------+
        sqlite>
    ```

5. Elimina las entradas donde el campo `decimal` es menor a 50.

   ```bash
    DELETE FROM Ejemplo WHERE  decimal < 50;
    ```
    Con ello, se obtiene la siguiente salida:
    ```bash
        sqlite> SELECT * FROM Ejemplo;
        +----+------------+--------+---------+------------+----------+
        | id |   texto    | entero | decimal |   fecha    | booleano |
        +----+------------+--------+---------+------------+----------+
        | 9  | Ejemplo 9  | 41     | 55.0    | 2022-01-20 | 0        |
        | 29 | Modificado | 37     | 50.0    | 2024-09-10 | 0        |
        | 49 | Modificado | 38     | 50.0    | 2026-05-25 | 0        |
        +----+------------+--------+---------+------------+----------+
        sqlite> 
    ```

6. Actualiza el campo `fecha` de todas las entradas a la fecha actual.
  
   ```bash
    UPDATE Ejemplo SET fecha = DATE('now');
    ```
    Con ello, se obtiene la siguiente salida:
    ```bash
        sqlite> SELECT * FROM Ejemplo;
        +----+------------+--------+---------+------------+----------+
        | id |   texto    | entero | decimal |   fecha    | booleano |
        +----+------------+--------+---------+------------+----------+
        | 9  | Ejemplo 9  | 41     | 55.0    | 2025-03-17 | 0        |
        | 29 | Modificado | 37     | 50.0    | 2025-03-17 | 0        |
        | 49 | Modificado | 38     | 50.0    | 2025-03-17 | 0        |
        +----+------------+--------+---------+------------+----------+
        sqlite> 
    ```
</div>