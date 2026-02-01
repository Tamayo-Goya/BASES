--Crea un índice no único que no admita nulos en la primera para el campo dnombre.

ALTER TABLE Departamentos 
MODIFY dnombre VARCHAR(15) NOT NULL;
--obligamos a NOT NULL

CREATE INDEX idx_dnombre 
ON Departamentos(dnombre);
--creamos el índice
