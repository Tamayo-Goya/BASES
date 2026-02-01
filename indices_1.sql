--Crea las dos tablas anteriores en mariadb/mysql. 
--La base de datos debe de llamarse empresa. Las claves primarias están marcadas. 
--En la segunda tabla hay una clave foranea que enlaza los campos dept_no de ambas tablas

CREATE DATABASE empresa;
USE empresa;

CREATE TABLE Departamentos (
    dept_no INT(2) NOT NULL,
    dnombre VARCHAR(15),
    loc VARCHAR(15),
    PRIMARY KEY (dept_no)
);

CREATE TABLE Empleados (
    emp_no INT(4) NOT NULL,
    apellido VARCHAR(10),
    oficio VARCHAR(10),
    dir INT(6),
    fecha_alt DATE,
    salario FLOAT(6,2),
    comision FLOAT(6,2),
    dept_no INT(2) NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departamentos(dept_no)
);
