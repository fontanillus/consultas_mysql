-- =====================================================
-- UF04 - EJERCICIO 11: CONSULTAS DE DATOS AGRUPADOS
-- Base de datos: nomina4
-- =====================================================

USE nomina4;

CREATE DATABASE IF NOT EXISTS nomina4
    DEFAULT CHARACTER SET utf8mb4;

USE nomina4;

-- tabla departamento
CREATE TABLE departamento(
  pk_departamento int primary key,
  departamento varchar(50) unique
);

INSERT INTO departamento (pk_departamento, departamento) VALUES (1, 'Administración');
INSERT INTO departamento (pk_departamento, departamento) VALUES (2, 'Compras');
INSERT INTO departamento (pk_departamento, departamento) VALUES (3, 'Contabilidad');
INSERT INTO departamento (pk_departamento, departamento) VALUES (4, 'Informática');
INSERT INTO departamento (pk_departamento, departamento) VALUES (5, 'Recursos Humanos');
INSERT INTO departamento (pk_departamento, departamento) VALUES (6, 'Ventas');
INSERT INTO departamento (pk_departamento, departamento) VALUES (7, 'Marketing');
INSERT INTO departamento (pk_departamento, departamento) VALUES (8, 'Finanzas');
INSERT INTO departamento (pk_departamento, departamento) VALUES (9, 'Recepción');

-- tabla cargo
CREATE TABLE cargo(
  pk_cargo int primary key,
  cargo varchar(50) unique
);

 INSERT INTO cargo (pk_cargo, cargo) VALUES (1, 'Analista');
 INSERT INTO cargo (pk_cargo, cargo) VALUES (2, 'Asistente');
 INSERT INTO cargo (pk_cargo, cargo) VALUES (3, 'Ejecutivo');
 INSERT INTO cargo (pk_cargo, cargo) VALUES (4, 'Gerente');
 INSERT INTO cargo (pk_cargo, cargo) VALUES (5, 'Oficinista');
 INSERT INTO cargo (pk_cargo, cargo) VALUES (6, 'Programador');
 INSERT INTO cargo (pk_cargo, cargo) VALUES (7, 'Secretaria');
 INSERT INTO cargo (pk_cargo, cargo) VALUES (8, 'Vice Presidente');
 INSERT INTO cargo (pk_cargo, cargo) VALUES (9, 'Técnico');
 INSERT INTO cargo (pk_cargo, cargo) VALUES (10, 'Especialista');

 -- tabla empleado
 CREATE TABLE empleado (
  pk_empleado int primary key,
  apellido varchar(25) not null,
  nombre varchar(25) not null,
  sexo char(6) not null,
  fecha_nacimiento date not null,
  estado_civil varchar(15),
  hijos int,
  fk_cargo integer,
  fk_departamento integer,
  fecha_contrato date not null,
  sueldo numeric(10,2) not null
);

-- foreign keys

ALTER TABLE empleado 
ADD CONSTRAINT cargos_empleados
FOREIGN KEY (fk_cargo) REFERENCES cargo(pk_cargo)
ON UPDATE CASCADE -- si un padre se cambia se cambian sus hijos en la tabla empleado
ON DELETE RESTRICT; -- si un padre se intenta borrar y tiene hijos, no se permite la operación

-- ALTER TABLE empleado DROP CONSTRAINT estados_civiles; -- (borrar una restricción: DROP)
ALTER TABLE empleado ADD CONSTRAINT estados_civiles CHECK ( estado_civil IN ('Soltero', 'Casado', 'Divorciado', 'Viudo', 'Otro'));

ALTER TABLE empleado ADD CONSTRAINT sexos CHECK ( sexo IN ('Hombre', 'Mujer'));

 INSERT INTO EMPLEADO VALUES (1, 'Sánchez', 'Federico', 'Hombre', '1961-7-3', 'Casado', 0, 6, 4, '1990-9-27', 25674);
 INSERT INTO EMPLEADO VALUES (2, 'Jiménez', 'Joaquín', 'Hombre', '1963-4-1', 'Divorciado', 1, 5, 1, '1990-11-11', 18050);
 INSERT INTO EMPLEADO VALUES (3, 'Cantón', 'Eduardo', 'Hombre', '1962-7-19', 'Soltero', 1, 2, 1, '1990-12-31', 16128);
 INSERT INTO EMPLEADO VALUES (4, 'Sosa', 'Carla', 'Mujer', '1961-8-7', 'Divorciado', 0, 1, 5, '1991-2-15', 16350);
 INSERT INTO EMPLEADO VALUES (5, 'Lara', 'Patricia', 'Mujer', '1967-2-16', 'Casado', 0, 4, 1, '1991-11-21', 29723);
 INSERT INTO EMPLEADO VALUES (6, 'Carrasco', 'Ricardo', 'Hombre', '1963-11-20', 'Otro', 0, 3, 1, '1992-5-12', 40000);
 INSERT INTO EMPLEADO VALUES (7, 'Campos', 'Silvana', 'Mujer', '1967-3-14', 'Divorciado', 1, 2, 2, '1993-1-30', 16395);
 INSERT INTO EMPLEADO VALUES (8, 'Albano', 'Laura', 'Mujer', '1967-2-15', 'Casado', 2, 7, 1, '1993-3-24', 18000);
 INSERT INTO EMPLEADO VALUES (9, 'Dávila', 'David', 'Hombre', '1968-3-28', 'Casado', 2, 6, 4, '1994-3-1', 25000);
 INSERT INTO EMPLEADO VALUES (10, 'Jiménez', 'Rebeca', 'Mujer', '1969-1-29', 'Soltero', 0, 2, 2, '1994-7-28', 19530);
 INSERT INTO EMPLEADO VALUES (11, 'Montes', 'Alonso', 'Hombre', '1970-3-25', 'Casado', 1, 7, 3, '1995-6-23', 15000);
 INSERT INTO EMPLEADO VALUES (12, 'Blanco', 'Beatriz', 'Mujer', '1969-10-1', 'Divorciado', 1, 2, 1, '1996-4-30', 13260);
 INSERT INTO EMPLEADO VALUES (13, 'Briceño', 'Marcelo', 'Hombre', '1971-5-1', 'Casado', 2, 2, 1, '1997-4-2', 22312);
 INSERT INTO EMPLEADO VALUES (14, 'Dávila', 'José', 'Hombre', '1968-9-24', 'Casado', 3, 6, 4, '1999-1-17', 27000);
 INSERT INTO EMPLEADO VALUES (15, 'Cepeda', 'Guillermo', 'Hombre', '1975-8-22', 'Divorciado', 1, 4, 2, '1999-2-22', 30000);
 INSERT INTO EMPLEADO VALUES (16, 'Sánchez', 'Raúl', 'Hombre', '1974-7-8', 'Soltero', 0, 2, 3, '1999-2-23', 14644);
 INSERT INTO EMPLEADO VALUES (17, 'Santos', 'Eliana', 'Mujer', '1975-7-13', 'Divorciado', 1, 1, 5, '1999-3-31', 18060);
 INSERT INTO EMPLEADO VALUES (18, 'Landa', 'Carolina', 'Mujer', '1973-6-23', 'Casado', 1, 2, 6, '1999-6-2', 12000);
 INSERT INTO EMPLEADO VALUES (19, 'Marín', 'Lucía', 'Mujer', '1975-8-19', 'Casado', 1, 3, 1, '1999-12-17', 24164);
 INSERT INTO EMPLEADO VALUES (20, 'Porras', 'Martín', 'Hombre', '1978-11-10', 'Soltero', 0, 6, 4, '2000-1-6', 22000);
 INSERT INTO EMPLEADO VALUES (21, 'Stagnone', 'José', 'Hombre', '1975-2-9', 'Casado', 2, 8, 5, '2000-7-2', 50940);
 INSERT INTO EMPLEADO VALUES (22, 'Marín', 'Victoria', 'Mujer', '1978-12-15', 'Soltero', 1, 1, 4, '2001-2-2', 23256);
 INSERT INTO EMPLEADO VALUES (23, 'López', 'Miguel', 'Hombre', '1979-4-17', 'Casado', 1, 2, 3, '2001-3-17', 17248);
 INSERT INTO EMPLEADO VALUES (24, 'Wallis', 'Miguel', 'Hombre', '1962-10-15', 'Divorciado', 0, 1, 5, '2002-4-15', 18820);
 INSERT INTO EMPLEADO VALUES (25, 'Amador', 'Jorge', 'Hombre', '1982-6-18', 'Viudo', 2, 2, 3, '2003-9-20', 14964);
 INSERT INTO EMPLEADO VALUES (26, 'Abad', 'Palmira', 'Mujer', '1982-9-10', 'Soltero', 1, 2, 6, '2005-4-24', 13650);
 INSERT INTO EMPLEADO VALUES (27, 'Sánchez', 'Luis', 'Hombre', '1982-11-6', 'Soltero', 0, 2, 6, '2005-8-24', 18000);
 INSERT INTO EMPLEADO VALUES (28, 'De Botto', 'Julio', 'Hombre', '1983-5-18', 'Soltero', 0, 1, 4, '2005-9-13', 20328);
 INSERT INTO EMPLEADO VALUES (29, 'Lorenzo', 'Casalta', 'Hombre', '1984-9-3', 'Divorciado', 0, 2, 6, '2012-8-13', 17000);
 INSERT INTO EMPLEADO VALUES (30, 'Pérez', 'Eduardo', 'Hombre', '1983-9-15', 'Soltero', 1, 1, 4, '2012-11-2', 20964);
 INSERT INTO EMPLEADO VALUES (31, 'Beuermann', 'Celia', 'Mujer', '1984-11-19', 'Soltero', 1, 2, 3, '2013-1-15', 14700);
 INSERT INTO EMPLEADO VALUES (32, 'Pietri', 'Juan Carlos', 'Hombre', '1984-6-1', 'Otro', 0, 2, 3, '2013-4-20', 18000);
 INSERT INTO EMPLEADO VALUES (33, 'Álvarez', 'Antonia', 'Mujer', '1984-1-1', 'Soltero', 1, 3, 3, '2013-5-22', 22952);
 INSERT INTO EMPLEADO VALUES (34, 'Gallo', 'Juan Antonio', 'Hombre', '1988-9-11', 'Casado', 1, 2, 6, '2013-7-15', 13800);
 INSERT INTO EMPLEADO VALUES (35, 'Capriles', 'Alfredo', 'Hombre', '1986-1-4', 'Soltero', 0, 2, 2, '2013-8-27', 15912);
 INSERT INTO EMPLEADO VALUES (36, 'Rodríguez', 'José Ignacio', 'Hombre', '1988-12-20', 'Otro', 0, 2, 3, '2013-12-11', 14412);
 INSERT INTO EMPLEADO VALUES (37, 'Juárez', 'Rubén', 'Hombre', '1987-5-16', 'Divorciado', 3, 4, 6, '2013-12-13', 32516);
 INSERT INTO EMPLEADO VALUES (38, 'Pérez', 'Carlos', 'Hombre', '1987-9-9', 'Soltero', 0, 7, 5, '2013-12-14', 12975);
 INSERT INTO EMPLEADO VALUES (39, 'Gutiérrez', 'Raúl', 'Hombre', '1988-10-28', 'Divorciado', 3, 2, 2, '2014-1-15', 14560);
 INSERT INTO EMPLEADO VALUES (40, 'Da Silva', 'Ariana', 'Mujer', '1985-11-8', 'Casado', 2, 7, 1, '2014-2-7', 12810);
 INSERT INTO EMPLEADO VALUES (41, 'Calissano', 'Alicia', 'Mujer', '1986-2-25', 'Divorciado', 1, 3, 1, '2014-7-1', 22292);
 INSERT INTO EMPLEADO VALUES (42, 'Camacho', 'Antonio', 'Hombre', '1988-5-22', 'Casado', 2, 4, 5, '2014-7-2', 30000);
 INSERT INTO EMPLEADO VALUES (43, 'Galindo', 'Darío', 'Hombre', '1994-5-1', 'Divorciado', 2, 3, 1, '2015-3-30', 23612);
 INSERT INTO EMPLEADO VALUES (44, 'Hernández', 'Javier', 'Hombre', '1990-12-13', 'Casado', 1, 5, 5, '2015-5-16', 15000);
 INSERT INTO EMPLEADO VALUES (45, 'Albanés', 'Pablo', 'Hombre', '1992-4-29', 'Soltero', 1, 3, 1, '2015-6-14', 29945);
 INSERT INTO EMPLEADO VALUES (46, 'Gambacorta', 'Omar', 'Hombre', '1991-5-18', 'Soltero', 1, 4, 3, '2015-6-27', 26852);
 INSERT INTO EMPLEADO VALUES (47, 'Milton', 'Liliana', 'Mujer', '1995-11-7', 'Casado', 0, 3, 1, '2015-12-28', 24464);
 INSERT INTO EMPLEADO VALUES (48, 'Fuentes', 'Gloria', 'Mujer', '1996-4-5', 'Soltero', 1, 3, 6, '2016-5-20', 23512);
 INSERT INTO EMPLEADO VALUES (49, 'Wells', 'Oriana', 'Mujer', '1998-3-5', 'Casado', 1, 3, 1, '2017-6-6', 29495);
 INSERT INTO EMPLEADO VALUES (50, 'Krauss', 'Eduardo', 'Hombre', '1992-7-8', 'Soltero', 1, 2, 6, '2017-7-21', 12558);
 INSERT INTO EMPLEADO VALUES (51, 'Jiménez', 'Juan', 'Hombre', '2000-5-24', 'Soltero', 0, 1, 4, '2017-10-7', 20532);
 INSERT INTO EMPLEADO VALUES (52, 'Márquez', 'Jaime', 'Hombre', '1991-12-21', 'Otro', 0, 4, 4, '2017-11-7', 35911);
 INSERT INTO EMPLEADO VALUES (53, 'García', 'Francisco', 'Hombre', '2000-2-9', 'Soltero', 0, 5, 4, '2018-5-11', 12500);
 INSERT INTO EMPLEADO VALUES (54, 'Manrique', 'Gonzálo', 'Hombre', '2000-6-3', 'Divorciado', 1, 2, 2, '2018-8-1', 14157);
 INSERT INTO EMPLEADO VALUES (55, 'Acevedo', 'Matilde', 'Mujer', '1968-5-16', 'Viudo', 1, 7, 6, '2018-8-21', 12850);
 INSERT INTO EMPLEADO VALUES (56, 'Ramírez', 'Mariana', 'Mujer', '2000-6-17', 'Soltero', 1, 3, 6, '2018-10-13', 32846);
 INSERT INTO EMPLEADO VALUES (57, 'Chacón', 'Emeterio', 'Hombre', '1999-2-25', 'Soltero', 1, 2, 1, '2018-11-2', 12252);
 INSERT INTO EMPLEADO VALUES (58, 'Colón', 'William', 'Hombre', '1990-5-23', 'Divorciado', 2, 2, 2, '2019-2-27', 15132);
 INSERT INTO EMPLEADO VALUES (59, 'Rodríguez', 'Manuel', 'Hombre', '1990-1-28', 'Soltero', 0, 8, 1, '2019-4-1', 45000);
 INSERT INTO EMPLEADO VALUES (60, 'Bonalde', 'Roberta', 'Mujer', '1997-2-19', 'Soltero', 0, 7, 2, '2019-4-5', 15000);

 USE nomina4;

-- EJERCICIO 1. Calcula el número total de empleados que hay en la tabla empleado. 

SELECT COUNT(*) AS total_empleados
FROM empleado;

-- EJERCICIO 2. Calcula el número total de departamentos que hay en la tabla departamento.

SELECT
COUNT(*) AS num_departamentos
FROM departamento;

-- EJERCICIO 3. Calcula la media de sueldo de todos los empleados.

SELECT

FROM empleado;

-- EJERCICIO 4. Indica quién es el empleado más joven.

SELECT
    nombre,
    apellido
FROM empleado
WHERE fecha_nacimiento = (
    SELECT MAX(fecha_nacimiento)
    FROM empleado
);

-- EJERCICIO 5. Indica quién es el empleado menos joven.

SELECT
    nombre,
    apellido
FROM empleado
WHERE fecha_nacimiento = (
    SELECT MIN(fecha_nacimiento)
    FROM empleado
);

-- EJERCICIO 6. Calcula el número total de empleados por estado civil.

SELECT
    estado_civil,
    COUNT(*) AS total_empleados
FROM empleado
GROUP BY estado_civil;

-- EJERCICIO 7. Muestra el número de empleados que han ingresado cada año a la empresa.

SELECT
    YEAR(fecha_contrato) AS anio,
    COUNT(*) AS total_empleados
FROM empleado
GROUP BY YEAR(fecha_contrato);

-- EJERCICIO 8. Lista el nombre y el precio del producto más caro.
-- Este ejercicio corresponde a la base de datos jardineria3.

-- USE jardineria;

-- DESCRIBE producto;

-- SELECT
    -- nombre,
    -- precio_venta
-- FROM producto
-- WHERE precio_venta = (
    -- SELECT MAX(precio_venta)
    -- FROM producto
-- );

USE nomina4;

-- EJERCICIO 9. Calcula la suma de los salarios de los empleados por departamento.

SELECT
    d.departamento,
    SUM(e.sueldo) AS total_sueldos
FROM empleado AS e
INNER JOIN departamento AS d
    ON e.fk_departamento = d.pk_departamento
GROUP BY d.departamento;

-- EJERCICIO 10. Calcula la suma de los salarios de los empleados por sexo.

SELECT
    sexo,
    SUM(sueldo) AS total_sueldos
FROM empleado
GROUP BY sexo;

-- EJERCICIO 11. Calcula el número de empleados que son Asistentes.

SELECT
    COUNT(*) AS total_empleados
FROM empleado AS e
INNER JOIN cargo AS c
    ON e.fk_cargo = c.pk_cargo
WHERE c.cargo = 'Asistente';

-- EJERCICIO 12. Calcula la media de hijos de los empleados por sexo y estado civil.

SELECT
    sexo,
    estado_civil,
    AVG(hijos) AS media_hijos
FROM empleado
GROUP BY sexo, estado_civil;

-- EJERCICIO 13. Calcula el sueldo más bajo de los Analistas.

SELECT
    MIN(e.sueldo) AS sueldo_menor
FROM empleado AS e
INNER JOIN cargo AS c
    ON e.fk_cargo = c.pk_cargo
WHERE c.cargo = 'Analista';

-- EJERCICIO 14. Calcula el sueldo más alto de los Analistas.

SELECT
    MAX(e.sueldo) AS sueldo_mayor
FROM empleado AS e
INNER JOIN cargo AS c
    ON e.fk_cargo = c.pk_cargo
WHERE c.cargo = 'Analista';

-- EJERCICIO 15. Muestra el sueldo máximo, sueldo mínimo, sueldo promedio y el número total de empleados por cargo.

SELECT 
c.cargo,
MAX(e.sueldo) AS sueldo_mayor,
MIN(e.sueldo) AS sueldo_menor,
AVG(e.sueldo) AS sueldo_promedio,
COUNT(*) AS total_empleados
FROM empleado AS e
INNER JOIN cargo AS C
ON e.fk_cargo = c.pk_cargo
GROUP BY cargo;

-- EJERCICIO 16. Muestra el sueldo máximo, sueldo mínimo, sueldo promedio y el número total de empleados por departamento, ordenando de forma descendente por el sueldo promedio.

SELECT 
d.departamento,
MAX(e.sueldo) AS sueldo_mayor,
MIN(e.sueldo) AS sueldo_menor,
AVG(e.sueldo) AS sueldo_promedio,
COUNT(*) AS total_empleados
FROM empleado AS e
INNER JOIN departamento AS d
ON e.fk_departamento = d.pk_departamento
GROUP BY d.departamento
ORDER BY sueldo_promedio DESC;

-- EJERCICIO 17. Muestra la edad máxima, edad mínima, edad promedio y el número total de empleados de los departamentos que tienen una edad promedio superior a los 45 años.

SELECT
d.departamento,
MAX(TIMESTAMPDIFF(YEAR, e.fecha_nacimiento, CURDATE())) AS edad_maxima,
MIN(TIMESTAMPDIFF(YEAR, e.fecha_nacimiento, CURDATE())) AS edad_minima,
AVG(TIMESTAMPDIFF(YEAR, e.fecha_nacimiento, CURDATE())) AS edad_promedio,
COUNT(*) AS total_empleados
 FROM empleado AS e
 INNER JOIN departamento AS d
ON e.fk_departamento = d.pk_departamento
GROUP BY d.departamento
HAVING edad_promedio > 45;

-- EJERCICIO 18. Calcula el número de empleados que tienen un sueldo mayor o igual a 1800€.

SELECT
COUNT(*) AS total_empleados
 FROM empleado 
 WHERE sueldo >= 1800;

-- EJERCICIO 19 Calcula el número de empleados que tienen una edad menor o igual a 28 años.

SELECT
COUNT(*) AS total_empleados
 FROM empleado AS e
 WHERE (TIMESTAMPDIFF(YEAR, e.fecha_nacimiento, CURDATE())) <= 28;

-- EJERCICIO 20 Lista los nombres de los departamentos cuyos empleados tienen una edad promedio mayor o igual a 35 años.

SELECT
    d.departamento,
    AVG(TIMESTAMPDIFF(YEAR, e.fecha_nacimiento, CURDATE())) AS edad_promedio
FROM empleado AS e
INNER JOIN departamento AS d
    ON e.fk_departamento = d.pk_departamento
GROUP BY d.departamento
HAVING edad_promedio >= 35;

-- EJERCICIO 21 Devuelve un listado con los nombres de los cargos que tienen 5 o más empleados.

SELECT
    c.cargo
FROM cargo AS c
INNER JOIN empleado AS e
    ON e.fk_cargo = c.pk_cargo
GROUP BY c.cargo
HAVING COUNT(*) >= 5;

-- EJERCICIO 22 Devuelve un listado con los nombres de los departamentos donde el promedio de edad sea superior a 40 años.

SELECT
    d.departamento,
    AVG(TIMESTAMPDIFF(YEAR, e.fecha_nacimiento, CURDATE())) AS edad_promedio
FROM empleado AS e
INNER JOIN departamento AS d
ON e.fk_departamento = d.pk_departamento
GROUP BY d.departamento
HAVING edad_promedio > 40;

-- EJERCICIO 23 Muestra el número total de empleados que tiene cada departamento, incluyendo los departamentos que no tienen ningún empleado.
-- El resultado mostrará dos columnas: nombre del departamento y número de empleados, ordenadas descendentemente por el número de empleados.

SELECT
    d.departamento,
    COUNT(e.pk_empleado) AS total_empleados
FROM departamento AS d
LEFT JOIN empleado AS e
    ON e.fk_departamento = d.pk_departamento
GROUP BY d.departamento
ORDER BY total_empleados DESC;

-- EJERCICIO 24 Explica las diferencias entre las cláusulas WHERE y HAVING, y cuándo utilizar cada una de ellas.

-- WHERE filtra registros individuales antes de la agrupación.
-- HAVING filtra los resultados agrupados después de la agrupación.
