<div align="justify">

# Tarea 2 de trabajo con índices

Una empresa guarda los siguientes datos de sus clientes, con los siguientes campos:
- documento char (8) not null,
- nombre varchar(30) not null,
- domicilio varchar(30),
- ciudad varchar(20),
- provincia varchar (20),
- telefono varchar(11)

# Ejercicios:

Mediante el terminal de SQLite 3 creo la base de datos que, en este caso, la he llamado empresa.db:

    ```
    ~/Escritorio/BAE_trabajo_con_Indices_tarea2$ sqlite3 empresa.db
    SQLite version 3.37.2 2022-01-06 13:25:41
    Enter ".help" for usage hints.
    sqlite> 

    ```

- Elimine la tabla "cliente" si existe. 
    >__Nota__:_Muestra el comando y la salida_.

    ```
    sqlite> DROP TABLE IF EXISTS cliente;
    sqlite> 
    ```

- Cree la tabla si clave primaria y incluye a posteriori esta.
    >__Nota__:_Muestra el comando y la salida_. 

    ```
    sqlite> CREATE TABLE cliente (
    documento CHAR(8) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    domicilio VARCHAR(30),
    ciudad VARCHAR(20),
    provincia VARCHAR(20),
    telefono VARCHAR(11)
    );
    sqlite>

    sqlite> ALTER TABLE cliente ADD PRIMARY KEY (documento);
    Error: in prepare, near "PRIMARY": syntax error (1)
    sqlite> 

    ```
    - NOTA: SQLite 3 lo que permite es definir la PK desde el principio, no a posteriori. Es por ello, que repetiré el proceso nuevamente de la siguiente manera:

    ```
    sqlite> DROP TABLE IF EXISTS cliente;
    sqlite> 

    sqlite> CREATE TABLE cliente (
    documento CHAR(8) NOT NULL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    domicilio VARCHAR(30),
    ciudad VARCHAR(20),
    provincia VARCHAR(20),
    telefono VARCHAR(11)
    );                      
    sqlite> PRAGMA index_list('cliente');
    +-----+----------------------------+--------+--------+---------+
    | seq |            name            | unique | origin | partial |
    +-----+----------------------------+--------+--------+---------+
    | 0   | sqlite_autoindex_cliente_1 | 1      | pk     | 0       |
    +-----+----------------------------+--------+--------+---------+
    sqlite> 

    ```

    
- Define los siguientes indices:
  - Un índice único por el campo "documento" y un índice común por ciudad y provincia.
        >__Nota__:_Muestra el comando y la salida. Justifica el tipo de indice en un comentario_.

    ```
    sqlite> PRAGMA index_list('cliente');
    +-----+----------------------------+--------+--------+---------+
    | seq |            name            | unique | origin | partial |
    +-----+----------------------------+--------+--------+---------+
    | 0   | sqlite_autoindex_cliente_1 | 1      | pk     | 0       |
    +-----+----------------------------+--------+--------+---------+
    sqlite> CREATE UNIQUE INDEX idx_documento ON cliente(documento);
    sqlite> PRAGMA index_list('cliente');
    +-----+----------------------------+--------+--------+---------+
    | seq |            name            | unique | origin | partial |
    +-----+----------------------------+--------+--------+---------+
    | 0   | idx_documento              | 1      | c      | 0       |
    | 1   | sqlite_autoindex_cliente_1 | 1      | pk     | 0       |
    +-----+----------------------------+--------+--------+---------+
    sqlite> CREATE UNIQUE INDEX idx_documento ON cliente(documento);
    Error: in prepare, index idx_documento already exists (1)
    sqlite> 

    ```
    - NOTA: En mi caso, parece que existe un índice que, por defecto, "sqlite_autoindex_cliente_1", actúa como PK. Entonces idx_documento aparece como índice común.

    ```
    sqlite> CREATE INDEX idx_ciudad_provincia ON cliente(ciudad, provincia);
    sqlite> PRAGMA index_list('cliente');
    +-----+----------------------------+--------+--------+---------+
    | seq |            name            | unique | origin | partial |
    +-----+----------------------------+--------+--------+---------+
    | 0   | idx_ciudad_provincia       | 0      | c      | 0       |
    | 1   | sqlite_autoindex_cliente_1 | 1      | pk     | 0       |
    +-----+----------------------------+--------+--------+---------+
    sqlite> CREATE UNIQUE INDEX idx_documento ON cliente(documento);
    sqlite> PRAGMA index_list('cliente');
    +-----+----------------------------+--------+--------+---------+
    | seq |            name            | unique | origin | partial |
    +-----+----------------------------+--------+--------+---------+
    | 0   | idx_documento              | 1      | c      | 0       |
    | 1   | idx_ciudad_provincia       | 0      | c      | 0       |
    | 2   | sqlite_autoindex_cliente_1 | 1      | pk     | 0       |
    +-----+----------------------------+--------+--------+---------+
    sqlite>

    sqlite> DROP INDEX idx_documento;
    sqlite> PRAGMA index_list('cliente');
    +-----+----------------------------+--------+--------+---------+
    | seq |            name            | unique | origin | partial |
    +-----+----------------------------+--------+--------+---------+
    | 0   | idx_ciudad_provincia       | 0      | c      | 0       |
    | 1   | sqlite_autoindex_cliente_1 | 1      | pk     | 0       |
    +-----+----------------------------+--------+--------+---------+
    sqlite> 
    ```
            
    - Vea los índices de la tabla.
        >__Nota__:_Muestra el comando y la salida __"show index"___.


    ```
    sqlite> show index from cliente;
    Error: in prepare, near "show": syntax error (1)
    sqlite> 

    sqlite> PRAGMA index_list('cliente');
    +-----+----------------------------+--------+--------+---------+
    | seq |            name            | unique | origin | partial |
    +-----+----------------------------+--------+--------+---------+
    | 0   | idx_ciudad_provincia       | 0      | c      | 0       |
    | 1   | sqlite_autoindex_cliente_1 | 1      | pk     | 0       |
    +-----+----------------------------+--------+--------+---------+
    sqlite> 
    ```
    - NOTA: El comando SHOW INDEX no existe en SQLite y sí en MySQL. Para ver los índices he usado el comando PRAGMA index_list ('nombreDeTabla);
        
- Agregue un índice único por el campo "telefono".
    >__Nota__:_Muestra el comando y la salida_.


    ```
    sqlite> CREATE UNIQUE INDEX idx_telefono ON cliente(telefono);
    sqlite> PRAGMA index_list('cliente');
    +-----+----------------------------+--------+--------+---------+
    | seq |            name            | unique | origin | partial |
    +-----+----------------------------+--------+--------+---------+
    | 0   | idx_telefono               | 1      | c      | 0       |
    | 1   | idx_ciudad_provincia       | 0      | c      | 0       |
    | 2   | sqlite_autoindex_cliente_1 | 1      | pk     | 0       |
    +-----+----------------------------+--------+--------+---------+
    sqlite> 

    ```
- Elimina los índices.
    >__Nota__:_Muestra el comando y la salida_.

    ```
    sqlite> DROP INDEX idx_ciudad_provincia;
    sqlite> DROP INDEX idx_telefono;
    sqlite> PRAGMA index_list('cliente');
    +-----+----------------------------+--------+--------+---------+
    | seq |            name            | unique | origin | partial |
    +-----+----------------------------+--------+--------+---------+
    | 0   | sqlite_autoindex_cliente_1 | 1      | pk     | 0       |
    +-----+----------------------------+--------+--------+---------+
    sqlite> 
    ```
</div>