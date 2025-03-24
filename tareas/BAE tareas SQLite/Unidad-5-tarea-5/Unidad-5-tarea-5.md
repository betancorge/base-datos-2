<div align="justify">

# Unidad-5-tarea-5 sobre Creación y manipulación en SQLite3 desde línea de comandos.


### Paso 1: Creación de la BBDD

Se obtiene el contenido del fichero __base-datos-libros.sql__.

```sql
-- Elimino la tabla autor si exite
DROP TABLE if EXISTS autor;
CREATE TABLE IF NOT EXISTS autor (
    id INTEGER PRIMARY KEY,
    nombre TEXT
);
-- Elimino la tabla libro si existe
DROP table if EXISTS libro;
CREATE TABLE IF NOT EXISTS libro (
    codigo INTEGER PRIMARY KEY,
    titulo TEXT,
    autor_id INTEGER,
    editorial TEXT,
    precio REAL,
    FOREIGN KEY (autor_id) REFERENCES autor(id)
);

INSERT INTO autor (nombre) VALUES
    ('J.K. Rowling'),
    ('Stephen King'),
    ('George Orwell'),
    ('Jane Austen'),
    ('Agatha Christie');

INSERT INTO libro (titulo, autor_id, editorial, precio) VALUES
    ('The Great Gatsby', 6, 'Charles Scribner''s Sons', 20.99),
    ('To Kill a Mockingbird', 7, 'J.B. Lippincott & Co.', 15.95),
    ('The Catcher in the Rye', 8, 'Little, Brown and Company', 18.75),
    ('One Hundred Years of Solitude', 9, 'Harper & Row', 22.50),
    ('Brave New World', 3, 'Chatto & Windus', 17.99),
    ('The Hobbit', 10, 'George Allen & Unwin', 24.99),
    ('The Lord of the Rings', 10, 'George Allen & Unwin', 35.50),
    ('The Chronicles of Narnia', 11, 'Geoffrey Bles', 28.99),
    ('The Odyssey', 12, 'Homer', 14.95),
    ('The Iliad', 12, 'Homer', 14.95),
    ('Moby-Dick', 13, 'Harper & Brothers', 19.99),
    ('The Road', 14, 'Alfred A. Knopf', 16.75),
    ('The Grapes of Wrath', 15, 'The Viking Press', 21.50),
    ('Wuthering Heights', 16, 'Emily Brontë', 12.99),
    ('The Old Man and the Sea', 17, 'Charles Scribner''s Sons', 18.95),
    ('The Count of Monte Cristo', 18, 'Pétion', 27.99),
    ('The Picture of Dorian Gray', 19, 'Ward, Lock, and Company', 14.50),
    ('The Adventures of Sherlock Holmes', 20, 'George Newnes', 16.99),
    ('Frankenstein', 21, 'Lackington, Hughes, Harding, Mavor, & Jones', 13.25),
    ('Alice''s Adventures in Wonderland', 22, 'Macmillan', 11.50),
    ('The Prince', 23, 'Niccolò Machiavelli', 10.99),
    ('Don Quixote', 24, 'Francisco de Robles', 26.75),
    ('The Divine Comedy', 25, 'Dante Alighieri', 20.50),
    ('Anna Karenina', 26, 'The Russian Messenger', 23.99),
    ('Les Misérables', 27, 'A. Lacroix, Verboeckhoven & Cie.', 29.75),
    ('The Jungle Book', 28, 'Macmillan Publishers', 14.99),
    ('The Wind in the Willows', 29, 'Methuen & Co.', 17.50),
    ('War and Peace', 26, 'The Russian Messenger', 33.25),
    ('Crime and Punishment', 30, 'The Russian Messenger', 19.99);
```
  
### Paso 2 Lectura del fichero sql (base-datos-libros.sql).

Para trabajar con el fichero base-datos-libros.sql, creo una base de datos (tarea5.db) para, posteriormente realizar las correspondientes consultas. Se ejecuta el siguiente comando (previa apertura de un terminal en la misma carpeta 'Unidad-5-tarea-5'):

```sql
sqlite3 tarea5.db 
```

Haciendo un __.read__ del fichero __sql__, de nombre __base-datos-libros.sql__, realiza la creación e inserción de información de la base de datos:

    ```
    ~/Escritorio/BAE tareas SQLite/Unidad-5-tarea-5$ sqlite3 tarea5.db
    SQLite version 3.37.2 2022-01-06 13:25:41
    Enter ".help" for usage hints.
    sqlite> .mode table
    sqlite> .read base-datos-libros.sql
    sqlite> .table
    autor  libro
    sqlite> 
    ```

    ```
    sqlite> SELECT * FROM libro;
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | codigo |              titulo               | autor_id |                  editorial                  | precio |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
    | 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
    | 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
    | 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
    | 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
    | 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
    | 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
    | 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
    | 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
    | 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
    | 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
    | 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
    | 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
    | 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
    | 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
    | 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
    | 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
    | 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
    | 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
    | 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
    | 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
    | 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
    | 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
    | 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
    | 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
    | 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
    | 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
    | 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
    | 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    sqlite> SELECT * FROM autor;
    +----+-----------------+
    | id |     nombre      |
    +----+-----------------+
    | 1  | J.K. Rowling    |
    | 2  | Stephen King    |
    | 3  | George Orwell   |
    | 4  | Jane Austen     |
    | 5  | Agatha Christie |
    +----+-----------------+
    sqlite> 

    ```

***

### Paso 3: Consultas a realizar y que aparecen en el archivo __consultas-bb-expreg.sql__.

A continuación muestro las consultas realizadas y el resultado (salida):

- Selección de libros cuyo título comienza con "H".

```
    sqlite> SELECT * FROM libro WHERE titulo REGEXP '^H';
    sqlite> 
```
- NOTA: No existe ningún título que comience por la letra H mayúscula.

- Libros escritos por autores cuyos nombres terminan con "ing".

```
    sqlite> SELECT a.* FROM autor AS a WHERE a.nombre REGEXP 'ing$';
    +----+--------------+
    | id |    nombre    |
    +----+--------------+
    | 1  | J.K. Rowling |
    | 2  | Stephen King |
    +----+--------------+
    sqlite> 

```

- Libros con títulos que contienen la palabra "and" en cualquier posición.

```
    sqlite> SELECT titulo FROM libro WHERE titulo REGEXP 'and';
    +----------------------------------+
    |              titulo              |
    +----------------------------------+
    | The Old Man and the Sea          |
    | Alice's Adventures in Wonderland |
    | War and Peace                    |
    | Crime and Punishment             |
    +----------------------------------+
    sqlite> 

```
- NOTA: Esta consulta caza 'and' dentro de la palabra 'Wonderland' en el título de los libros.

- Libros cuyo título comienza con una vocal.

```
    sqlite> SELECT l.* FROM libro AS l WHERE l.titulo REGEXP '^[AEIOUaeiou]';
    +--------+----------------------------------+----------+-----------------------+--------+
    | codigo |              titulo              | autor_id |       editorial       | precio |
    +--------+----------------------------------+----------+-----------------------+--------+
    | 4      | One Hundred Years of Solitude    | 9        | Harper & Row          | 22.5   |
    | 20     | Alice's Adventures in Wonderland | 22       | Macmillan             | 11.5   |
    | 24     | Anna Karenina                    | 26       | The Russian Messenger | 23.99  |
    +--------+----------------------------------+----------+-----------------------+--------+
    sqlite>

```

- Libros cuyo autor tiene al menos una vocal repetida.

```
    sqlite> SELECT l.* FROM libro AS l JOIN autor AS a ON l.autor_id = a.id WHERE a.nombre REGEXP '([AEIOUaeiou]){2,}';
    +--------+-----------------+----------+-----------------+--------+
    | codigo |     titulo      | autor_id |    editorial    | precio |
    +--------+-----------------+----------+-----------------+--------+
    | 5      | Brave New World | 3        | Chatto & Windus | 17.99  |
    +--------+-----------------+----------+-----------------+--------+
    sqlite> 

```

- Libros con precios que tienen dos dígitos decimales exactos.

```
    sqlite> SELECT * FROM libro WHERE precio REGEXP '\\.[0-9]{2}$';
    sqlite> 

```

- Libros cuyos títulos tienen al menos tres palabras.

```
    sqlite> SELECT * FROM libro WHERE titulo REGEXP '^[^ ]+ [^ ]+ [^ ]+';
    +--------+-----------------------------------+----------+---------------------------+--------+
    | codigo |              titulo               | autor_id |         editorial         | precio |
    +--------+-----------------------------------+----------+---------------------------+--------+
    | 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons   | 20.99  |
    | 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.     | 15.95  |
    | 3      | The Catcher in the Rye            | 8        | Little, Brown and Company | 18.75  |
    | 4      | One Hundred Years of Solitude     | 9        | Harper & Row              | 22.5   |
    | 5      | Brave New World                   | 3        | Chatto & Windus           | 17.99  |
    | 7      | The Lord of the Rings             | 10       | George Allen & Unwin      | 35.5   |
    | 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles             | 28.99  |
    | 13     | The Grapes of Wrath               | 15       | The Viking Press          | 21.5   |
    | 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons   | 18.95  |
    | 16     | The Count of Monte Cristo         | 18       | Pétion                    | 27.99  |
    | 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company   | 14.5   |
    | 18     | The Adventures of Sherlock Holmes | 20       | George Newnes             | 16.99  |
    | 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                 | 11.5   |
    | 23     | The Divine Comedy                 | 25       | Dante Alighieri           | 20.5   |
    | 26     | The Jungle Book                   | 28       | Macmillan Publishers      | 14.99  |
    | 27     | The Wind in the Willows           | 29       | Methuen & Co.             | 17.5   |
    | 28     | War and Peace                     | 26       | The Russian Messenger     | 33.25  |
    | 29     | Crime and Punishment              | 30       | The Russian Messenger     | 19.99  |
    +--------+-----------------------------------+----------+---------------------------+--------+
    sqlite> 


```

- Obtener todos los autores cuyo nombre empieza con la letra "A":

```
    sqlite> SELECT * FROM autor WHERE nombre REGEXP '^A';
    +----+-----------------+
    | id |     nombre      |
    +----+-----------------+
    | 5  | Agatha Christie |
    +----+-----------------+
    sqlite> 

```

- Seleccionar los libros cuyo título contiene la palabra "SQL":

```
    sqlite> SELECT * FROM libro WHERE titulo REGEXP 'SQL';
    sqlite> 


```

- Obtener todos los autores cuyo nombre termina con "ez":

```
    sqlite> SELECT * FROM autor WHERE nombre REGEXP 'ez$';
    sqlite> 

```

- Obtener todos los autores cuyo nombre tiene al menos 5 caracteres:

```
    sqlite> SELECT * FROM autor WHERE nombre REGEXP '^.{5,}$';
    +----+-----------------+
    | id |     nombre      |
    +----+-----------------+
    | 1  | J.K. Rowling    |
    | 2  | Stephen King    |
    | 3  | George Orwell   |
    | 4  | Jane Austen     |
    | 5  | Agatha Christie |
    +----+-----------------+
    sqlite> 
```
- NOTA: Si, por ejemplo, quisiera obtener que "cuyo nombre tiene al menos 5 caracteres pero no más de 12", se podría hacer así:

```
    sqlite> SELECT * FROM autor WHERE nombre REGEXP '^.{5,12}$';
    +----+--------------+
    | id |    nombre    |
    +----+--------------+
    | 1  | J.K. Rowling |
    | 2  | Stephen King |
    | 4  | Jane Austen  |
    +----+--------------+
    sqlite> 

```

- Seleccionar los libros cuya editorial es diferente de "EditorialX":

    - Si somos literales, la consulta sería así:
```
    sqlite> SELECT * FROM libro WHERE editorial REGEXP '[^EditorialX]';
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | codigo |              titulo               | autor_id |                  editorial                  | precio |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
    | 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
    | 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
    | 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
    | 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
    | 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
    | 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
    | 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
    | 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
    | 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
    | 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
    | 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
    | 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
    | 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
    | 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
    | 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
    | 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
    | 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
    | 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
    | 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
    | 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
    | 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
    | 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
    | 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
    | 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
    | 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
    | 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
    | 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
    | 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    sqlite>

```

- Si ponemos otro ejemplo, podría ser así " Escoger todos los libros cuya editorial es diferente de "The Russian Messenger" o de "George Allen & Unwin":

```
    sqlite> SELECT * FROM libro WHERE editorial REGEXP '[^The Russian Messenger | George Allen & Unwin]';
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | codigo |              titulo               | autor_id |                  editorial                  | precio |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
    | 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
    | 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
    | 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
    | 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
    | 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
    | 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
    | 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
    | 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
    | 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
    | 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
    | 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
    | 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
    | 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
    | 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
    | 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
    | 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
    | 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
    | 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
    | 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
    | 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
    | 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
    | 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
    | 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    sqlite>

```

- Obtener todos los autores cuyo nombre contiene al menos una vocal:

```
    sqlite> SELECT * FROM autor WHERE nombre REGEXP '([aeiouAEIOU].*){1,}';
    +----+-----------------+
    | id |     nombre      |
    +----+-----------------+
    | 1  | J.K. Rowling    |
    | 2  | Stephen King    |
    | 3  | George Orwell   |
    | 4  | Jane Austen     |
    | 5  | Agatha Christie |
    +----+-----------------+
    sqlite>

```

- Seleccionar los libros cuyo título comienza con una letra mayúscula:

```
    sqlite> SELECT titulo FROM libro WHERE titulo REGEXP '^[A-Z].*';
    +-----------------------------------+
    |              titulo               |
    +-----------------------------------+
    | The Great Gatsby                  |
    | To Kill a Mockingbird             |
    | The Catcher in the Rye            |
    | One Hundred Years of Solitude     |
    | Brave New World                   |
    | The Hobbit                        |
    | The Lord of the Rings             |
    | The Chronicles of Narnia          |
    | The Odyssey                       |
    | The Iliad                         |
    | Moby-Dick                         |
    | The Road                          |
    | The Grapes of Wrath               |
    | Wuthering Heights                 |
    | The Old Man and the Sea           |
    | The Count of Monte Cristo         |
    | The Picture of Dorian Gray        |
    | The Adventures of Sherlock Holmes |
    | Frankenstein                      |
    | Alice's Adventures in Wonderland  |
    | The Prince                        |
    | Don Quixote                       |
    | The Divine Comedy                 |
    | Anna Karenina                     |
    | Les Misérables                    |
    | The Jungle Book                   |
    | The Wind in the Willows           |
    | War and Peace                     |
    | Crime and Punishment              |
    +-----------------------------------+
    sqlite> 

```

- Obtener todos los autores cuyo nombre no contiene la letra "r":

```
    sqlite> SELECT * FROM autor WHERE nombre REGEXP '^[^rR]*$';
    +----+--------------+
    | id |    nombre    |
    +----+--------------+
    | 2  | Stephen King |
    | 4  | Jane Austen  |
    +----+--------------+
    sqlite>

```

- Seleccionar los libros cuya editorial empieza con la letra "P":

```
    sqlite> SELECT * FROM libro WHERE editorial REGEXP '^P';
    +--------+---------------------------+----------+-----------+--------+
    | codigo |          titulo           | autor_id | editorial | precio |
    +--------+---------------------------+----------+-----------+--------+
    | 16     | The Count of Monte Cristo | 18       | Pétion    | 27.99  |
    +--------+---------------------------+----------+-----------+--------+
    sqlite>

```

- Obtener todos los autores cuyo nombre tiene exactamente 6 caracteres:

```
    sqlite> SELECT * FROM autor WHERE nombre REGEXP '^.{6}$';
    sqlite> 

```

- Seleccionar los libros cuyo título contiene al menos un número:

```
    sqlite> SELECT * FROM libro WHERE titulo REGEXP '[0-9]';
    sqlite> 


```

- Obtener todos los autores cuyo nombre inicia con una vocal:

```
    sqlite> SELECT * FROM autor WHERE nombre REGEXP '^[AEIOUaeiou]';
    +----+-----------------+
    | id |     nombre      |
    +----+-----------------+
    | 5  | Agatha Christie |
    +----+-----------------+
    sqlite> 

```

- Obtener todos los autores cuyo nombre no contiene espacios en blanco:

```
    sqlite> SELECT * FROM autor WHERE nombre REGEXP '^[^ ]*$';
    sqlite>

```

- Seleccionar los libros cuyo título termina con una vocal:

```
    sqlite> SELECT * FROM libro WHERE titulo REGEXP '[AEIOUaeiou]$';
    +--------+-------------------------------+----------+---------------------------+--------+
    | codigo |            titulo             | autor_id |         editorial         | precio |
    +--------+-------------------------------+----------+---------------------------+--------+
    | 3      | The Catcher in the Rye        | 8        | Little, Brown and Company | 18.75  |
    | 4      | One Hundred Years of Solitude | 9        | Harper & Row              | 22.5   |
    | 8      | The Chronicles of Narnia      | 11       | Geoffrey Bles             | 28.99  |
    | 15     | The Old Man and the Sea       | 17       | Charles Scribner's Sons   | 18.95  |
    | 16     | The Count of Monte Cristo     | 18       | Pétion                    | 27.99  |
    | 21     | The Prince                    | 23       | Niccolò Machiavelli       | 10.99  |
    | 22     | Don Quixote                   | 24       | Francisco de Robles       | 26.75  |
    | 24     | Anna Karenina                 | 26       | The Russian Messenger     | 23.99  |
    | 28     | War and Peace                 | 26       | The Russian Messenger     | 33.25  |
    +--------+-------------------------------+----------+---------------------------+--------+
    sqlite> 

```

- Obtener todos los autores cuyo nombre contiene la secuencia "er":

```
    sqlite> SELECT * FROM autor WHERE nombre REGEXP 'er';
    sqlite> 

```

- Seleccionar los libros cuyo título empieza con la palabra "The":

```
    sqlite> SELECT * FROM libro WHERE titulo REGEXP '^The';
    +--------+-----------------------------------+----------+---------------------------+--------+
    | codigo |              titulo               | autor_id |         editorial         | precio |
    +--------+-----------------------------------+----------+---------------------------+--------+
    | 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons   | 20.99  |
    | 3      | The Catcher in the Rye            | 8        | Little, Brown and Company | 18.75  |
    | 6      | The Hobbit                        | 10       | George Allen & Unwin      | 24.99  |
    | 7      | The Lord of the Rings             | 10       | George Allen & Unwin      | 35.5   |
    | 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles             | 28.99  |
    | 9      | The Odyssey                       | 12       | Homer                     | 14.95  |
    | 10     | The Iliad                         | 12       | Homer                     | 14.95  |
    | 12     | The Road                          | 14       | Alfred A. Knopf           | 16.75  |
    | 13     | The Grapes of Wrath               | 15       | The Viking Press          | 21.5   |
    | 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons   | 18.95  |
    | 16     | The Count of Monte Cristo         | 18       | Pétion                    | 27.99  |
    | 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company   | 14.5   |
    | 18     | The Adventures of Sherlock Holmes | 20       | George Newnes             | 16.99  |
    | 21     | The Prince                        | 23       | Niccolò Machiavelli       | 10.99  |
    | 23     | The Divine Comedy                 | 25       | Dante Alighieri           | 20.5   |
    | 26     | The Jungle Book                   | 28       | Macmillan Publishers      | 14.99  |
    | 27     | The Wind in the Willows           | 29       | Methuen & Co.             | 17.5   |
    +--------+-----------------------------------+----------+---------------------------+--------+
    sqlite> 

```

- Obtener todos los autores cuyo nombre tiene al menos una letra mayúscula:

```
    sqlite> SELECT * FROM autor WHERE nombre REGEXP '[A-Z]';
    +----+-----------------+
    | id |     nombre      |
    +----+-----------------+
    | 1  | J.K. Rowling    |
    | 2  | Stephen King    |
    | 3  | George Orwell   |
    | 4  | Jane Austen     |
    | 5  | Agatha Christie |
    +----+-----------------+
    sqlite>
```

- Seleccionar los libros cuyo precio es un número decimal con exactamente dos decimales:

```
    sqlite> SELECT * FROM libro WHERE precio REGEXP '^\d+\.\d{2}$';
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | codigo |              titulo               | autor_id |                  editorial                  | precio |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
    | 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
    | 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
    | 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
    | 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
    | 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
    | 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
    | 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
    | 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
    | 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
    | 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
    | 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
    | 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
    | 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
    | 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
    | 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
    | 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
    | 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
    | 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
    | 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
    | 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
    | 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    sqlite> 

```

- Obtener todos los autores cuyo nombre no contiene números:

```
    sqlite> SELECT * FROM autor WHERE nombre REGEXP '^[^0-9]*$';
    +----+-----------------+
    | id |     nombre      |
    +----+-----------------+
    | 1  | J.K. Rowling    |
    | 2  | Stephen King    |
    | 3  | George Orwell   |
    | 4  | Jane Austen     |
    | 5  | Agatha Christie |
    +----+-----------------+
    sqlite> 

```

- Seleccionar los libros cuyo título contiene al menos tres vocales:

```
    sqlite> SELECT * FROM libro WHERE titulo REGEXP '^(.*[AEIOUaeiou]){3,}.*$';
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | codigo |              titulo               | autor_id |                  editorial                  | precio |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
    | 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
    | 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
    | 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
    | 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
    | 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
    | 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
    | 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
    | 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
    | 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
    | 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
    | 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
    | 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
    | 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
    | 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
    | 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
    | 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
    | 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
    | 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
    | 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
    | 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
    | 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
    | 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
    | 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
    | 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
    | 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
    | 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
    | 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    sqlite> 

```

- Obtener todos los autores cuyo nombre inicia con una consonante:

```
    sqlite> SELECT * FROM autor WHERE nombre REGEXP '^[^AEIOUaeiou]';
    +----+---------------+
    | id |    nombre     |
    +----+---------------+
    | 1  | J.K. Rowling  |
    | 2  | Stephen King  |
    | 3  | George Orwell |
    | 4  | Jane Austen   |
    +----+---------------+
    sqlite> 

```

- Seleccionar los libros cuyo título no contiene la palabra "Science":

```
    sqlite> SELECT * FROM libro WHERE titulo REGEXP '[^Science]';
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | codigo |              titulo               | autor_id |                  editorial                  | precio |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
    | 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
    | 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
    | 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
    | 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
    | 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
    | 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
    | 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
    | 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
    | 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
    | 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
    | 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
    | 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
    | 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
    | 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
    | 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
    | 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
    | 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
    | 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
    | 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
    | 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
    | 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
    | 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
    | 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
    | 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
    | 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
    | 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
    | 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
    | 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    sqlite> 

```

- Obtener todos los autores cuyo nombre tiene al menos una letra repetida consecutivamente:

```
    sqlite> SELECT * FROM autor WHERE nombre REGEXP '([a-zA-Z])\\1';
    sqlite> 

```

- Obtener todos los autores cuyo nombre empieza con "M" o termina con "n":

```
    sqlite> SELECT * FROM autor WHERE nombre REGEXP '^(M|.*n)$';
    +----+-------------+
    | id |   nombre    |
    +----+-------------+
    | 4  | Jane Austen |
    +----+-------------+
    sqlite> 


```

- Obtener todos los autores cuyo nombre no contiene caracteres especiales:

```
    sqlite> SELECT * FROM autor WHERE nombre REGEXP '^[a-zA-Z ]*$';
    +----+-----------------+
    | id |     nombre      |
    +----+-----------------+
    | 2  | Stephen King    |
    | 3  | George Orwell   |
    | 4  | Jane Austen     |
    | 5  | Agatha Christie |
    +----+-----------------+
    sqlite>

```

</div>