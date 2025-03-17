<div align="justify">

# Unidad-5-tarea-2 sobre Creación y manipulación en SQLite3 desde línea de comandos.

### Paso 1: Crear una tabla con un campo de cada tipo

1. Utilizando la terminal o línea de comandos, abre SQLite3 y crea una base de datos llamada `tarea2.db`.

    ```bash
    sqlite3 tarea2.db
    ```
    Con ello, se obtiene la siguiente salida:
    ```bash
    SQLite version 3.37.2 2022-01-06 13:25:41
    Enter ".help" for usage hints.
    sqlite> 
    ```

2. Dentro de SQLite3, crea las siguientes tablas

- __Propietarios__: Almacena información de los propietarios.
  - __id__ INTEGER ENTERO clave primaria y AUTOINCREMENT.
  - __nombre__ TEXT no nulo.
  - __apellido__ TEXT no nulo.
  - __dni__ TEXT Valor único. 
  - __Vehiculos__: Almacena información sobre los propietarios de los vehículos.
  - __id__ INTEGER ENTERO clave primaria y AUTOINCREMENT.
  - __marca__ TEXT no nulo.
  - __modelo__ TEXT no nulo.
  - __anio__ INTEGER no nulo.
  - __id_propietario__ INTEGER, FK propietarios(id_propietario). 

>__Nota__: Un propietario puede tener varios vehículos, pero un vehículo pertenece a un único propietario.

  Para crear las dos tablas en la base de datos tarea2.db, ejecuto los siguientes comandos de manera consecutiva:

  ```
  CREATE TABLE Propietarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT NOT NULL, apellido TEXT NOT NULL, dni TEXT UNIQUE NOT NULL;

  ```
Una vez creada la tabla Propietarios, ahora creo la tabla Vehiculos:

  ```
  CREATE TABLE Vehiculos (id INTEGER PRIMARY KEY AUTOINCREMENT, marca TEXT NOT NULL, modelo TEXTO NOT NULL, anio TEXT NOT NULL, id_propietario INTEGER NOT NULL, FOREIGN KEY (id_propietario) REFERENCES Propietarios(id));
  ```
A continuacón, con el comando .table compruebo que se han creado las dos tablas:

  ```
  sqlite> .table
  Propietarios  Vehiculos   
  sqlite> 
  ```


### Paso 2: Insertar 20 entradas

Dado el siguiente conjunto de información:

| id_propietario | nombre      | apellido    | dni       | marca      | modelo     | anio |
|----------------|-------------|-------------|-----------|------------|------------|------|
| 1              | Juan        | Perez       | 12345678A | Ford       | Fiesta     | 2019 |
| 2              | Maria       | Lopez       | 87654321B | Toyota     | Corolla    | 2018 |
| 3              | Carlos      | Ruiz        | 11111111C | Nissan     | Sentra     | 2020 |
| 4              | Laura       | Gomez       | 22222222D | Chevrolet  | Spark      | 2017 |
| 5              | Pedro       | Martinez    | 33333333E | Honda      | Civic      | 2016 |
| 6              | Ana         | Fernandez   | 44444444F | Ford       | Mustang    | 2021 |
| 7              | Diego       | Sanchez     | 55555555G | Toyota     | RAV4       | 2019 |
| 8              | Sofia       | Torres      | 66666666H | Volkswagen | Golf       | 2020 |
| 9              | Javier      | Leon        | 77777777I | Honda      | CR-V       | 2018 |
| 10             | Lucia       | Castillo    | 88888888J | Nissan     | Altima     | 2017 |
| 11             | Luis        | Gonzalez    | 99999999K | Chevrolet  | Malibu     | 2019 |
| 12             | Marta       | Diaz        | 10101010L | Toyota     | Camry      | 2020 |
| 13             | Victor      | Vargas      | 11111112M | Honda      | Accord     | 2018 |
| 14             | Elena       | Castro      | 12121212N | Ford       | Explorer   | 2021 |
| 15             | Roberto     | Blanco      | 13131313O | Nissan     | Rogue      | 2017 |
| 16             | Natalia     | Paredes     | 14141414P | Volkswagen | Jetta      | 2019 |
| 17             | Fernando    | Herrera     | 15151515Q | Chevrolet  | Equinox    | 2018 |
| 18             | Clara       | Soto        | 16161616R | Toyota     | Highlander | 2020 |
| 19             | Sergio      | Mendoza     | 17171717S | Honda      | Odyssey    | 2016 |
| 20             | Patricia    | Navarro     | 18181818T | Nissan     | Murano     | 2019 |

Realiza la inserción en la tablas de modo que la información quede almacenada.

Se realizan las inserciones mediante el comando INSERT INTO de la siguiente manera en cada tabla de forma que las columnas de id_propietario, nombre, apellido y dni se coresponden con la tabla Propietarios mientras que marca, modelo y anio se corresponden con la tabla Vehiculos:

  ```bash
    INSERT INTO Propietarios (nombre, apellido, dni) VALUES ('Juan', 'Perez', '12345678A');
  ```

  ```bash
    INSERT INTO Vehiculos (id_propietario, marca, modelo, anio) VALUES (1, 'Ford', 'Fiesta', '2019');
  ```

### Paso 3: Realizar las siguientes 10 consultas de datos

- Seleccionar todos los propietarios

  ```bash
  sqlite> SELECT * FROM Propietarios;
  +----+----------+-----------+-----------+
  | id |  nombre  | apellido  |    dni    |
  +----+----------+-----------+-----------+
  | 1  | Juan     | Perez     | 12345678A |
  | 2  | Maria    | Ruiz      | 87654321B |
  | 3  | Carlos   | Lopez     | 11111111C |
  | 4  | Laura    | Gomez     | 22222222D |
  | 5  | Pedro    | Martinez  | 33333333E |
  | 6  | Ana      | Fernandez | 44444444F |
  | 7  | Diego    | Sanchez   | 55555555G |
  | 8  | Sofia    | Torres    | 66666666H |
  | 9  | Javier   | Leon      | 77777777I |
  | 10 | Lucía    | Castillo  | 88888888J |
  | 11 | Luis     | Gonzalez  | 99999999K |
  | 12 | Marta    | Diaz      | 10101010L |
  | 13 | Victor   | Vargas    | 11111112M |
  | 14 | Elena    | Castro    | 12121212N |
  | 15 | Roberto  | Blanco    | 13131313O |
  | 16 | Natalia  | Paredes   | 14141414P |
  | 17 | Fernando | Herrera   | 15151515Q |
  | 18 | Clara    | Soto      | 16161616R |
  | 19 | Sergio   | Mendoza   | 17171717S |
  | 20 | Patricia | Navarro   | 18181818T |
  +----+----------+-----------+-----------+
  sqlite>
  ```

- Listar todos los vehículos.

```bash
  sqlite> SELECT *FROM Vehiculos;
  +----+------------+------------+------+----------------+
  | id |   marca    |   modelo   | anio | id_propietario |
  +----+------------+------------+------+----------------+
  | 1  | Ford       | Fiesta     | 2019 | 1              |
  | 2  | Toyota     | Corolla    | 2018 | 2              |
  | 3  | Nissan     | Sentra     | 2020 | 3              |
  | 7  | Chevrolet  | Spark      | 2017 | 4              |
  | 8  | Honda      | Civic      | 2016 | 5              |
  | 9  | Ford       | Mustang    | 2021 | 6              |
  | 10 | Toyota     | RAV4       | 2019 | 7              |
  | 12 | Honda      | CR-V       | 2018 | 9              |
  | 13 | Nissan     | Altima     | 2017 | 10             |
  | 14 | Chevrolet  | Malibu     | 2019 | 11             |
  | 15 | Toyota     | Camry      | 2020 | 11             |
  | 16 | Chevrolet  | Malibu     | 2019 | 11             |
  | 17 | Toyota     | Camry      | 2020 | 12             |
  | 18 | Honda      | Accord     | 2018 | 13             |
  | 19 | Ford       | Explorer   | 2021 | 14             |
  | 20 | Nissan     | Rogue      | 2017 | 15             |
  | 21 | Volkswagen | Jetta      | 2019 | 16             |
  | 22 | Chevrolet  | Equinox    | 2018 | 17             |
  | 23 | Toyota     | Highlander | 2020 | 18             |
  | 24 | Honda      | Odyssey    | 2016 | 19             |
  | 25 | Nissan     | Murano     | 2019 | 20             |
  +----+------------+------------+------+----------------+
  sqlite>
  ```
- Seleccionar solo los nombres y apellidos de los propietarios.

  ```
  sqlite> SELECT nombre, apellido FROM Propietarios;
  +----------+-----------+
  |  nombre  | apellido  |
  +----------+-----------+
  | Juan     | Perez     |
  | Maria    | Ruiz      |
  | Carlos   | Lopez     |
  | Laura    | Gomez     |
  | Pedro    | Martinez  |
  | Ana      | Fernandez |
  | Diego    | Sanchez   |
  | Sofia    | Torres    |
  | Javier   | Leon      |
  | Lucía    | Castillo  |
  | Luis     | Gonzalez  |
  | Marta    | Diaz      |
  | Victor   | Vargas    |
  | Elena    | Castro    |
  | Roberto  | Blanco    |
  | Natalia  | Paredes   |
  | Fernando | Herrera   |
  | Clara    | Soto      |
  | Sergio   | Mendoza   |
  | Patricia | Navarro   |
  +----------+-----------+
  sqlite>
  ```
- Listar todas las marcas y modelos de los vehículos.

  ```
  sqlite> SELECT marca, modelo FROM Vehiculos;
  +------------+------------+
  |   marca    |   modelo   |
  +------------+------------+
  | Ford       | Fiesta     |
  | Toyota     | Corolla    |
  | Nissan     | Sentra     |
  | Chevrolet  | Spark      |
  | Honda      | Civic      |
  | Ford       | Mustang    |
  | Toyota     | RAV4       |
  | Honda      | CR-V       |
  | Nissan     | Altima     |
  | Chevrolet  | Malibu     |
  | Toyota     | Camry      |
  | Chevrolet  | Malibu     |
  | Toyota     | Camry      |
  | Honda      | Accord     |
  | Ford       | Explorer   |
  | Nissan     | Rogue      |
  | Volkswagen | Jetta      |
  | Chevrolet  | Equinox    |
  | Toyota     | Highlander |
  | Honda      | Odyssey    |
  | Nissan     | Murano     |
  +------------+------------+
  sqlite> 
  ```

- Seleccionar solo los propietarios con apellido "Perez".

  ```
  sqlite> SELECT * FROM Propietarios WHERE apellido = 'Perez';
  +----+--------+----------+-----------+
  | id | nombre | apellido |    dni    |
  +----+--------+----------+-----------+
  | 1  | Juan   | Perez    | 12345678A |
  +----+--------+----------+-----------+
  sqlite>
  ```

- Listar todos los vehículos con año 2019.

  ```
  sqlite> SELECT * FROM Vehiculos WHERE anio = 2019;
  +----+------------+--------+------+----------------+
  | id |   marca    | modelo | anio | id_propietario |
  +----+------------+--------+------+----------------+
  | 1  | Ford       | Fiesta | 2019 | 1              |
  | 10 | Toyota     | RAV4   | 2019 | 7              |
  | 14 | Chevrolet  | Malibu | 2019 | 11             |
  | 16 | Chevrolet  | Malibu | 2019 | 11             |
  | 21 | Volkswagen | Jetta  | 2019 | 16             |
  | 25 | Nissan     | Murano | 2019 | 20             |
  +----+------------+--------+------+----------------+
  sqlite>
  ```

- Seleccionar propietarios que tienen vehículos de la marca "Toyota".

  ```
  sqlite> SELECT * FROM Propietarios WHERE id IN (SELECT id_propietario FROM Vehiculos WHERE marca = 'Toyota');
  +----+--------+----------+-----------+
  | id | nombre | apellido |    dni    |
  +----+--------+----------+-----------+
  | 2  | Maria  | Ruiz     | 87654321B |
  | 7  | Diego  | Sanchez  | 55555555G |
  | 11 | Luis   | Gonzalez | 99999999K |
  | 12 | Marta  | Diaz     | 10101010L |
  | 18 | Clara  | Soto     | 16161616R |
  +----+--------+----------+-----------+
  sqlite>
  ```

- Listar vehículos con marca "Ford" y modelo "Fiesta".

   ```
  sqlite> SELECT * FROM Vehiculos WHERE marca = 'Ford' AND modelo = 'Fiesta';
  +----+-------+--------+------+----------------+
  | id | marca | modelo | anio | id_propietario |
  +----+-------+--------+------+----------------+
  | 1  | Ford  | Fiesta | 2019 | 1              |
  +----+-------+--------+------+----------------+
  sqlite> 
  ```

- Seleccionar propietarios con DNI "12345678A".

  ```
  sqlite> SELECT * FROM Propietarios WHERE dni = '12345678A';
  +----+--------+----------+-----------+
  | id | nombre | apellido |    dni    |
  +----+--------+----------+-----------+
  | 1  | Juan   | Perez    | 12345678A |
  +----+--------+----------+-----------+
  sqlite> 
  ```
- Listar vehículos que pertenecen al propietario con ID 5.

  ```
  sqlite> SELECT * FROM Vehiculos WHERE id_propietario = 5;
  +----+-------+--------+------+----------------+
  | id | marca | modelo | anio | id_propietario |
  +----+-------+--------+------+----------------+
  | 8  | Honda | Civic  | 2016 | 5              |
  +----+-------+--------+------+----------------+
  sqlite> 
  ```

### Paso 4: Realiza los siguientes updates

- Actualizar el nombre de un propietario con DNI "12345678A".

  ```
  sqlite> UPDATE Propietarios SET nombre = 'Vitto' WHERE dni = '12345678A';
  sqlite> SELECT * FROM Propietarios WHERE dni = '12345678A';
  +----+--------+----------+-----------+
  | id | nombre | apellido |    dni    |
  +----+--------+----------+-----------+
  | 1  | Vitto  | Perez    | 12345678A |
  +----+--------+----------+-----------+
  sqlite> 

  ```
- Modificar el año de un vehículo con ID 3 a 2022.

 ```
  sqlite> UPDATE Vehiculos SET anio = 2022 WHERE id = 3;
  sqlite> SELECT * FROM Vehiculos WHERE id = 3;
  +----+--------+--------+------+----------------+
  | id | marca  | modelo | anio | id_propietario |
  +----+--------+--------+------+----------------+
  | 3  | Nissan | Sentra | 2022 | 3              |
  +----+--------+--------+------+----------------+
  sqlite> 

  ```
- Cambiar el modelo de todos los vehículos Nissan a "Micra".

 ```
  sqlite> UPDATE Vehiculos SET modelo = 'Micra'  WHERE marca ='Nissan';
  sqlite> SELECT * FROM Vehiculos WHERE marca = 'Nissan';
  +----+--------+--------+------+----------------+
  | id | marca  | modelo | anio | id_propietario |
  +----+--------+--------+------+----------------+
  | 3  | Nissan | Micra  | 2022 | 3              |
  | 13 | Nissan | Micra  | 2017 | 10             |
  | 20 | Nissan | Micra  | 2017 | 15             |
  | 25 | Nissan | Micra  | 2019 | 20             |
  +----+--------+--------+------+----------------+
  sqlite>
  ```
- Actualizar el apellido de un propietario con ID 7 a "Gomez".

 ```
  sqlite> UPDATE Propietarios SET apellido = 'Gomez' WHERE id = 7;
  sqlite> SELECT * FROM Propietarios WHERE id = 7;
  +----+--------+----------+-----------+
  | id | nombre | apellido |    dni    |
  +----+--------+----------+-----------+
  | 7  | Diego  | Gomez    | 55555555G |
  +----+--------+----------+-----------+
  sqlite> 
  ```
- Modificar la marca de un vehículo con modelo "Fiesta" a "Renault".

 ```
  sqlite> UPDATE Vehiculos SET marca = 'Renault'  WHERE modelo ='Fiesta';
  sqlite> SELECT * FROM Vehiculos WHERE marca = 'Renault';
  +----+---------+--------+------+----------------+
  | id |  marca  | modelo | anio | id_propietario |
  +----+---------+--------+------+----------------+
  | 1  | Renault | Fiesta | 2019 | 1              |
  +----+---------+--------+------+----------------+
  sqlite>
  ```

</div>