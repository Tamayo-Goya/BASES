--Crea un índice compuesto único que no admita nulos para los campos apellido, oficio y dept_no

ALTER TABLE Empleados 
MODIFY apellido VARCHAR(10) NOT NULL;
--hacemos not null

ALTER TABLE Empleados 
MODIFY apellido VARCHAR(10) NOT NULL;
--creamos indice
