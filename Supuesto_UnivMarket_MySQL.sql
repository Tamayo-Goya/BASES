CREATE DATABASE IF NOT EXISTS alquiler_coches;
USE alquiler_coches;

-- agencias
CREATE TABLE agencias (
    id_agencia INT AUTO_INCREMENT PRIMARY KEY,
    calle VARCHAR(100) NOT NULL,
    numero VARCHAR(10),
    codigo_postal VARCHAR(10),
    localidad VARCHAR(50),
    provincia VARCHAR(50),
    telefono VARCHAR(20)
);

-- coches
CREATE TABLE coches (
    matricula VARCHAR(15) PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    fecha_matriculacion DATE,
    precio_dia DECIMAL(10,2),
    kilometros INT,
    id_agencia INT,
    FOREIGN KEY (id_agencia) REFERENCES agencias(id_agencia)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- clientes
CREATE TABLE clientes (
    nif VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    telefono VARCHAR(20)
);

-- reservas
CREATE TABLE reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    matricula_coche VARCHAR(15),
    nif_cliente VARCHAR(15),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    FOREIGN KEY (matricula_coche) REFERENCES coches(matricula)
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (nif_cliente) REFERENCES clientes(nif)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- vista
CREATE OR REPLACE VIEW vista_agencias_coches AS
SELECT 
    a.id_agencia,
    a.localidad,
    a.provincia,
    a.telefono,
    c.matricula,
    c.marca,
    c.modelo,
    c.precio_dia
FROM agencias a
LEFT JOIN coches c ON a.id_agencia = c.id_agencia;

-- vista
CREATE OR REPLACE VIEW vista_reservas_detalle AS
SELECT 
    r.id_reserva,
    r.fecha_inicio,
    r.fecha_fin,
    c.matricula,
    c.marca,
    c.modelo,
    cl.nif,
    cl.nombre,
    cl.apellido1,
    cl.apellido2
FROM reservas r
INNER JOIN coches c ON r.matricula_coche = c.matricula
INNER JOIN clientes cl ON r.nif_cliente = cl.nif;

-- usuarios
CREATE USER 'avis'@'localhost' IDENTIFIED BY 'avis123';
GRANT ALL PRIVILEGES ON alquiler_coches.* TO 'avis'@'localhost';

CREATE USER 'visor'@'localhost' IDENTIFIED BY 'visor123';
GRANT SELECT ON alquiler_coches.vista_agencias_coches TO 'visor'@'localhost';

CREATE USER 'gestor'@'localhost' IDENTIFIED BY 'gestor123';
GRANT SELECT, INSERT ON alquiler_coches.reservas TO 'gestor'@'localhost';
GRANT SELECT, UPDATE, DELETE, INSERT ON alquiler_coches.clientes TO 'gestor'@'localhost';
GRANT SELECT ON alquiler_coches.vista_reservas_detalle TO 'gestor'@'localhost';

FLUSH PRIVILEGES;
