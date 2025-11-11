--Crear la vista 
USE world;

CREATE OR REPLACE VIEW capitales AS
SELECT 
    co.Name AS Pais,
    ci.Name AS Capital,
    ci.Population AS Poblacion_Capital,
    co.Continent AS Continente,
    co.Region AS Region
FROM 
    country co
    JOIN city ci ON co.Capital = ci.ID;

-- Crear el usuario y configuracion
CREATE USER 'manager'@'192.168.1.50' IDENTIFIED BY 'abc123';
GRANT SELECT ON world.capitales TO 'manager'@'192.168.1.50';
GRANT SELECT ON mysql.user TO 'manager'@'192.168.1.50';
FLUSH PRIVILEGES;
