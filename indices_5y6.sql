--Inserta al menos 5 registros en cada una de las tablas

ALTER TABLE Empleados 
MODIFY oficio VARCHAR(10) NOT NULL;
--Forzamos el not null

CREATE UNIQUE INDEX idx_compuesto
ON Empleados(apellido, oficio, dept_no);
--Creamos el índice compuesto

--Crea un tablespace que se llama empresa. Elige tu el datafile. 
--Basta con 1. La única diferencia con lo anterior es
--que el índice compuesto ha de ser comprimido

INSERT INTO Departamentos VALUES
(10,'CONTABILIDAD','MADRID'),
(20,'INVESTIGACION','SEVILLA'),
(30,'VENTAS','BARCELONA'),
(40,'PRODUCCION','BILBAO'),
(50,'MARKETING','VALENCIA');

INSERT INTO Empleados VALUES
(1001,'GOMEZ','ADMIN',7902,'2020-01-10',1500,200,10),
(1002,'PEREZ','VENDEDOR',7902,'2019-03-15',1800,300,30),
(1003,'LOPEZ','ANALISTA',7566,'2021-06-20',2200,NULL,20),
(1004,'MARTIN','VENDEDOR',7698,'2018-11-01',1600,150,30),
(1005,'SANCHEZ','PROGRAM',7782,'2022-02-05',2000,NULL,20);
