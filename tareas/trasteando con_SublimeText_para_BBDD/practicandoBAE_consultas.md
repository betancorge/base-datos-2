CREATE TABLE clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    email TEXT UNIQUE,
    telefono TEXT,
    ciudad TEXT,
    fecha_registro DATE,
    total_compras REAL DEFAULT 0
);

-- Tabla Productos
CREATE TABLE productos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    categoria TEXT,
    precio REAL NOT NULL,
    stock INTEGER DEFAULT 0,
    proveedor TEXT
);

-- Tabla Pedidos
CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER,
    producto_id INTEGER,
    cantidad INTEGER,
    fecha_pedido DATE,
    estado TEXT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

 select c.id, c.nombre, c.apellido from clientes c where id IN (select p.cliente_id from pedidos p where cantidad > (select AVG(cantidad) from pedidos p));
SELECT nombre, apellido 
FROM clientes 
WHERE id IN (
    SELECT cliente_id 
    FROM pedidos 
    WHERE cantidad > (SELECT AVG(cantidad) FROM pedidos)
);

SELECT nombre 
FROM productos 
WHERE id NOT IN (
    SELECT DISTINCT producto_id 
    FROM pedidos 
    WHERE producto_id IS NOT NULL
);

SELECT nombre
FROM productos pr
JOIN pedidos p ON p.producto_id = pr.id
AND
(SELECT DISTINCT producto_id
FROM pedidos p WHERE p.producto_id IS NULL);

select c.id, c.nombre, c.total_compras
from clientes c
where total_compras >
(select AVG(c.total_compras) from clientes c);

SELECT nombre, apellido, total_compras 
FROM clientes 
WHERE total_compras > (
    SELECT AVG(total_compras) 
    FROM clientes
);

select p.nombre, p.categoría
FROM productos p
where precio > (
    SELECT AVG(p.precio)
    from productos p
);

select p.id, p.fecha_pedido
from pedidos p
where id IN (
    select c.id, c.nombre
    from clientes
    where ciudad = 'Barcelona')
);

select p.*
from pedidos p
where p.cliente_id IN (
    select c.id
    from clientes c
    where ciudad = 'Barcelona'
);

z SELECT p1.nombre, p1.precio, p1.categoria 
FROM productos p1 
WHERE p1.precio > (
    SELECT AVG(p2.precio) 
    FROM productos p2 
    WHERE p2.categoria = p1.categoria
);

SELECT p.nombre, p.precio, p.categoria 
FROM productos p
WHERE p.precio > (
    SELECT AVG(p.precio) 
    FROM productos p 
    WHERE p.categoria = p.categoria
);

SELECT p1.nombre, p1

SELECT p.nombre, p.stock
FROM producto p
    WHERE id IN (select p.stock from productos p
    WHERE p.stock < (SELECT AVG(pd.cantidad) from pedidos pd)
);


SELECT c.id, c.nombre, c.apellido 
FROM clientes c
WHERE  (
    SELECT COUNT(*)
    FROM pedidos pe
    WHERE pe.cliente_id = c.id
) > (
    SELECT AVG(pedidos_por_cliente)
    FROM (
        SELECT COUNT(*) AS pedidos_por_cliente
        FROM pedidos
        GROUP BY cliente_id
    )
);

SELECT p.nombre, p.precio
FROM productos p
WHERE p.categoria != 'Accesorios' AND precio > (
    SELECT MAX(p.precio)
    FROM productos p
    WHERE categoria = 'Accesorios'
        AND precio IS NOT NULL
);

SELECT c.id, c.nombre, c.apellido
FROM cliente c
WHERE  EXISTS (
    SELECT 1
    FROM pedidos p
    JOIN ON productos pr ON p.producto_id = pr.id
    WHERE p.cliente_id = c.id AND pr.categoria = 'Electrónica'

);

SELECT c.id, c.nombre, c.apellido 
FROM clientes c
WHERE  c.total_compras > (
    SELECT AVG(total_compras)
    FROM clientes    
);

SELECT p.*
FROM pedidos p
WHERE p.fecha_pedido = (
    SELECT MAX(p2.fecha_pedido)
    FROM pedidos p2
    JOIN clientes c ON p2.cliente_id = c.id
    WHERE c.nombre = 'Juan' AND c.apellido = 'Pérez'
);  

SELECT p.*
FROM pedidos p
WHERE p.fecha_pedido = (
    SELECT MAX(p.fecha_pedido)
    FROM pedidos p
    JOIN clientes c ON p.cliente_id = c.id
    WHERE c.nombre = 'Juan' AND c.apellido = 'Pérez'
);

select * from employees e , orders o
where e.employees.id = o.employees.id;

select * from employees e
cross join orders o;

select * from employees e
INNER JOIN orders o
ON e.employees_id = o.employees_id;
--Esta devuelve todo, pero podemos
filtar por lo queremos ver.

select name, lastname, orderID from employees e
INNER JOIN orders o 
ON e.employees_id = o.employees_id;


CREATE TABLE "REWARDS" (
    "RewardID" INTEGER,
    "EmployeeID" INTEGER,
    "Reward" INTEGER,
    "Month" TEXT,
    PRIMARY KEY ("RewardID" AUTOINCREMENT)
);

--insertar datos

INSERT INTO Rewards (EmployeeID, Reward, Month) VALUES

(1, 200, Enero),
(2, 400, Febrero),
(3, 500, Marzo),
(4, 700, Abril),
(null, null, Mayo),

select firstName, Reward, Month from employees e
INNER JOIN rewards r
ON e.employeeID = r.EmployeeID;

select firstName, Reward, Month from employees e
LEFT JOIN rewards r
ON e.employeeID = r.EmployeeID;

select firstName, Reward, Month from rewards r
RIGHT JOIN employees e
ON e.employeeID = r.EmployeeID;



Mostrar las columnas de una tabla:

SELECT * FROM estudiantes;

Mostrar cada estudiante con la cantidad de cursos en los que 
está matriculado:

SELECT e.nombre, COUNT (m.curso_id) AS cantidad_cursos
FROM estudiantes e
LEFT JOIN matriculas m 
ON e.id = m.estudiantes_id
GROUP BY e.id;

Mostrar cada estudiante con el total de créditos acumulados:

SELECT e.nombre, COALESCE(SUM(c.creditos), 0) AS total_creditos
FROM estudiantes e
LEFT JOIN matriculas m ON e.id = m.estudiante_id
LEFT JOIN cursos c ON m.curso_id = c.id
GROUP BY e.id;

Mostrar los cursos con la cantidad de estudiantes matriculados, ordenados
de mayor a menor:

SELECT c.nombre, COUNT(m.estudiante_id) AS total_estudiantes
FROM cursos c
LEFT JOIN matriculas m
ON c.id = m.curso_id
GROUP BY c.id
ORDER BY m.cursos DESC;

Mostrar la media de créditos por curso

SELECT AVG(creditos) AS media_creditos
FROM cursos;

Listar los cursos que no tienen estudiantes matriculados:

SELECT c.nombre
FROM cursos c
LEFT JOIN matriculas m
ON c.id = m.curso_id
WHERE m.id IS NULL;

Mostrar el nombre del profesor y cuántos cursos imparte

SELECT p.nombre, COUNT(c.id)
FROM profesores p
LEFT JOIN cursos c
ON p.id = c.profesor_id
GROUP BY p.id

Mostrar profesores que no imparten ningún curso.

SELECT p.nombre
FROM profesores p
LEFT JOIN cursos c
ON p.id = c.profesor_id
WHERE c.id IS NULL;

Muestra la ciudad con mayor número de estudiantes registrados.

SELECT m.ciudad, COUNT (*) AS total
FROM estudiantes e
GROUP BY ciudad
ORDER BY total DESC
LIMIT 1;

Mostrar los estudiantes que están matriculados en más de un
curso.

SELECT e.nombre, COUNT (m.id) AS total_matriculas
FROM estudiantes e
LEFT JOIN matriculas m
ON e.id = m.estudiante_id
GROUP BY e.id
HAVING total_matriculas > 1 --HAVING es parecido a un WHERE en este caso.

Listar los cursos junto a su clasificación según los créditos: 6 o más serían con 'Alta carga' y menos de 6 'Carga estándar':

SELECT c.nombre
    IF (creditos >=, 'Alta carga', 'Carga estándar') AS clasificación
FROM cursos c;

Listar estudiantes y clasificar su carga académica:
    - Más de 12 créditos: "Carga Alta"
    - 6 a 12 créditos: "Carga Media"
    - Menos de 6 créditos: "Carga Baja"

--En este caso se debe unir tres tablas:
la de estudiantes, la de cursos y la de matrícula

SELECT e.nombre 
    SUM(c.creditos) AS total_creditos,
    IF (SUM(c.creditos) > 12, 'Carga Alta',
        IF (SUM(c.creditos) >= 6 'Carga Media', 'Carga Baja')) AS clasificacion
FROM estudiantes e;
LEFT JOIN matriculas m
ON e.id = m.estudiante_id
LEFT JOIN cursos c
ON m.curso_id = c.id
GROUP BY e.id
ORDER BY total_creditos DESC;

15. Mostrar cursos en los que se haya matriculado al menos un estudiante de Sevilla.

SELECT DISTINCT c.nombre
FROM cursos c
INNER JOIN matriculas m
ON c.id = m.curso_id
INNER JOIN estudiantes e
ON m.estudiante_id = e.id
WHERE e.ciudad = 'Sevilla';

--o en lugar del WHERE:
GROUP BY c.id
HAVING e.ciudad = 'Sevilla' --HAVING es parecido a un WHERE en este caso.
16. Listar los cursos impartidos por profesores del departamento de Matemáticas.

SELECT c.nombre
FROM cursos c
INNER JOIN profesores p
ON c.id = p.curso_id
WHERE p.departamento = 'Matemáticas';

--o en lugar del WHERE:
GROUP BY c.id
HAVING p.departamento = 'Matemáticas' --HAVING es parecido a un WHERE en este caso.

17. Mostrar los cursos en los que se haya inscrito algún estudiante antes del año 2022.

SELECT DISTINCT c.nombre
FROM cursos c
JOIN matriculas m
ON c.id = m.curso_id
WHERE YEAR(m.fecha) < 2022;

18. Mostrar estudiantes que han cursado materias impartidas por el profesor “Dr. Luis Gómez”.

SELECT DISTINCT e.nombre
FROM estudiantes e
--uniendo tablas
INNER JOIN matriculas m ON e.id = m.estudiante_id
INNER JOIN cursos c ON m.curso_id = c.id
INNER JOIN profesores p ON p.id = c.profesor_id
--poniendo condición con WHERE
WHERE p.nombre = 'Luis Gómez';


19. Mostrar los cursos más recientes (última matrícula por curso).

SELECT c.nombre, MAX(m.fecha) as ultima_matricula
FROM cursos c
--uniendo tablas
INNER JOIN matriculas m ON c.id = m.curso_id
GROUP BY c.id
ORDER BY ultima_matricula DESC;

20. Mostrar el número total de estudiantes por departamento del profesor que imparte el curso

SELECT p.departamento, COUNT(DISTINCT m.estudiante_id) AS total_estudiantes
FROM profesores p
INNER JOIN cursos c ON p.id = c.profesor_id
INNER JOIN matriculas m ON c.id = m.curso_id
GROUP BY p.departamento;


PROCEDIMIENTOS:
Ejercicio 1. Crear un procedimiento llamado `inscribir_estudiante` que reciba:
   - ID del estudiante
   - ID del curso
   - Fecha de inscripción  
   El procedimiento debe:
   - Verificar que el estudiante no esté ya matriculado en ese curso.
   - Si no lo está, insertarlo en `matriculas`; si ya lo está, lanzar un error.

--ESTRUCTURA DE UN PROCEDIMIENTO

DROP PROCEDURE IF EXISTS inscribir_estudiante;
    --para asegurarme de que no existe.

DELIMITER // -- comienzo del delimitador
CREATE PROCEDURE nombre_procedimiento
BEGIN
  /* CODIGO EN SQL A EJECUTAR */
END //  -- fin del delimitador del PROCEDURE

DELIMITER ;


--EJERCICIO 1:

DROP PROCEDURE IF EXISTS inscribir_estudiante;
    --para asegurarme de que no existe.

DELIMITER //

CREATE PROCEDURE inscribir_estudiante(IN est_id INT, IN curs_id INT, IN fecha DATE)
BEGIN
    DECLARE existe INT;
    SELECT COUNT(*) INTO existe FROM matriculas
    WHERE estudiante_id = est_id
    AND curso_id = curs_id;
    IF existe = 0 THEN
        INSERT INTO matriculas(estudiante_id, curso_id, fecha)
        VALUES (est_id, curs_id, fecha);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Estudiante ya está matriculado en este curso';
    END IF;
END;
//

DELIMITER ;


--Para llamar al procedimiento, se hace así:

CALL nombre_procedimiento (parámetros de IN o de IN/OUT);
    
    CALL inscribir_estudiante(1, 2, '2025-05-03');

--Para eliminar el procedimiento, se hace así:

DROP PROCEDURE IF EXISTS nombre_procedimiento;
    
    DROP PROCEDURE IF EXISTS incribir_estudiante;

VISTAS:
1. Crear una vista llamada `resumen_matriculas` que muestre:
   - Nombre del estudiante
   - Nombre del curso
   - Nombre del profesor
   - Fecha de matrícula


CREATE VIEW resumen_matriculas AS
SELECT e.nombre AS estudiante, c.nombre AS curso,
p.nombre AS profesor, m.fecha AS fecha_matricula
FROM matriculas m
--uniendo tablas--
JOIN estudiantes e ON e.id = m.estudiantes_id
JOIN cursos c ON c.id = m.curso_id
JOIN profesores p ON p.id = m.profesor_id;

--Para consultar la vista:

SELECT * FROM resumen_matriculas;
    
    --si queremos ver sólo el estudiante y el curso:
        SELECT estudiante, curso FROM resumen_matriculas;

--Para eliminar la vista:

DROP VIEW IF EXISTS nombre_de_la_vista;

    --DROP VIEW IF EXISTS resumen_matriculas;    


FUNCIONES:
Función Definida por el Usuario

1. Crear una función llamada `promedio_creditos_por_anio` que reciba un año como parámetro y devuelva el promedio de créditos matriculados por estudiante ese año.

--estructura básica de Funciones:

    DROP FUNCTION IF EXISTS nombre_función;

    DELIMITER //

    CREATE FUNCTION promedio_creditos_por_anio(anio INT)

    RETURNS DECIMAL(5,2)

    DETERMINISTIC

    BEGIN

        DECLARE nombre_Variable TIPO();

        -función propiamente dicha-

        RETURN nombre_variable;
    END;
    //
    DELIMITER ;

--Ejercicio de Función 'promedio_creditos_por anio':

  DROP FUNCTION IF EXISTS promedio_creditos_por anio;

    DELIMITER //

    CREATE FUNCTION promedio_creditos_por_anio(anio INT)
    RETURNS DECIMAL(5,2)
    DETERMINISTIC
    BEGIN
        DECLARE promedio DECIMAL(5,2);
        --consulta
        SELECT AVG(c.creditos) INTO promedio
        FROM matriculas m
        JOIN cursos c
        ON c.id = m.curso_id
        WHERE YEAR(m.fecha) = anio;
        --qué retorna
        RETURN promedio;
    END;
    //
    DELIMITER ;

  --Se ejecuta la función
    SELECT promedio_creditos_por_anio(2023);
    --recuerda que, como necesita un parámetro de entrada, se pone el año entre los ().
  --Se borra la función
    DROP FUNCTION IF EXISTS promedio_creditos_por_anio;

 

ÍNDICES:

--crear

    CREATE INDEX nombre_idx ON tabla(columna);
                    o
    CREATE INDEX idx_nombre ON tabla(columna);

1. Crear un índice en la columna `fecha` de la tabla `matriculas`.

    CREATE INDEX fecha_idx ON matriculas(fecha);

2. Crear un índice compuesto en la tabla `matriculas` sobre `estudiante_id` y `curso_id`.

    CREATE INDEX estud_curso_idx ON matriculas(estudiante_id, curso_id);

3. Consultar los índices de la tabla `matriculas`.
    
    SHOW INDEX FROM matriculas;

4. Eliminar los índices creados:
    
    --con DROP INDEX nombre_idx ON tabla;

    DROP INDEX estud_curso_idx ON matriculas;
    DROP INDEZ fecha_idx ON matriculas;

    --Luego se comprueba con un SHOW INDEX y se ve que los índices han sido borrados.


TRIGGERS de auditoría:
/*Recuerda que primero se crea la tabla en la que
se almacenarán los triggers*/

2. Crear un trigger `AFTER INSERT` sobre `matriculas` que inserte un registro en `auditoria_matriculas` al realizar una matrícula.

--PRIMERO LA TABLA EN LA QUE ALMACENAR NOS TRIGGERS:
    
    CREATE TABLE auditoria_matriculas (
        operacion VARCHAR(10),
        estudiante_id INT,
        curso_id INT,
        fecha_hora DATETIME,
        usuario VARCHAR(100)
    );


DROP TRIGGER IF EXIST after_insert_matricula;

DELIMITER //
CREATE TRIGGER perico_el_de_los_palotes
AFTER INSERT ON tabla --en este caso, matriculas
FOR EACH ROW --para cada registro/fila
BEGIN
    --CONSULTA DENTRO DEL TRIGGER--
    INSERT INTO auditoria_matriculas (operacion, estudiante_id, curso_id, fecha_hora, usuario) VALUES ('INSERT', NEW.estudiante_id, NEW.curso_id, NOW(), CURRENT_USER());
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER after_insert_matricula
AFTER INSERT ON matriculas
FOR EACH ROW
BEGIN
  INSERT INTO auditoria_matriculas(operacion, estudiante_id, curso_id, fecha_hora, usuario)
  VALUES ('INSERT', NEW.estudiante_id, NEW.curso_id, NOW(), CURRENT_USER());
END;
//
DELIMITER ;


3. Consultar los registros de la auditoría.


SELECT * FROM auditoria_matriculas;


4. Eliminar el trigger y la tabla de auditoría.


DROP TRIGGER IF EXISTS after_insert_matricula;
DROP TABLE IF EXISTS auditoria_matriculas;

