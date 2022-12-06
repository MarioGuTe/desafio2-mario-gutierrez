create database "desafio2-Mario-Gutierrez-123";

CREATE TABLE IF NOT EXISTS INSCRITOS (cantidad INT, fecha DATE, fuente
VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

/* Pregunta 1: Existen 16 registros */
SELECT COUNT(*)
FROM inscritos;

/* Pregunta 2: Existen 774 inscritos en total */
SELECT SUM(cantidad)
FROM inscritos;

/* Pregunta 3: 2 registros correspondientes a 2021-01-01 */
SELECT *
FROM inscritos
WHERE fecha = (SELECT MIN(fecha) FROM inscritos);

/* Pregunta 4: cantidad por día en la query */
SELECT fecha, SUM(cantidad)
FROM inscritos
GROUP BY fecha;

/* Pregunta 5: 441 para fuente Página, 333 Para fuente Blog */
SELECT fuente, SUM(cantidad)
FROM inscritos
GROUP BY fuente;

/* Pregunta 6: Día 2021-08-01 con 182 personas inscritas */
SELECT fecha, cantidad
FROM (
	SELECT fecha, SUM(cantidad) AS cantidad
	FROM inscritos
	GROUP BY fecha
	ORDER BY cantidad DESC
) as sq
LIMIT 1;

/* Pregunta 7: el día 2021-08-01 y fueron 83 personas */
SELECT *
FROM inscritos
WHERE fuente = 'Blog'
ORDER BY cantidad DESC
LIMIT 1;

/* Pregunta 8: En promedio se inscriben aproximadamente 97 personas por día
 de inscripción (96.75) */
SELECT AVG(cantidad)
FROM (
	SELECT fecha, SUM(cantidad) as cantidad
	FROM inscritos
	GROUP BY fecha) AS sq;
	
/* Pregunta 9: query con días donde se inscribieron más de 50 personas*/
SELECT fecha, SUM(cantidad) as cantidad_dia
FROM inscritos
GROUP BY fecha
HAVING SUM(cantidad) > 50;

/* PREGUNTA 10: Se registraron en promedio 92 personas por día
 a partir del 3er día (92.3333333) */
SELECT AVG(cantidad)
FROM (
	SELECT fecha, SUM(cantidad) as cantidad
	FROM inscritos
	WHERE fecha >= '2021-03-01'
	GROUP BY fecha) AS sq;
