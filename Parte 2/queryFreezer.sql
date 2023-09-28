-- A1. Obtener nombres y apellidos de clientes ordenados por provincia 

SELECT nombre,apellidos 
FROM pracabd1.clientes_freezer
ORDER BY provincia; 

-- A2. Obtener el número de clientes de Sevilla 

SELECT Count(provincia) 
FROM pracabd1.clientes_freezer
WHERE provincia = 'Sevilla'; 

-- A3. Obtener el email de los clientes de Barcelona 

SELECT email 
FROM pracabd1.clientes_freezer 
WHERE provincia = 'Barcelona'; 


-- B1. Obtener la información de los vehículos ordenados por color 

SELECT 
    *
FROM
    pracabd1.vehiculos_freezer
WHERE
    año < 2005
ORDER BY color; 

-- B2. Obtener el número de vehículos de color negro 

SELECT 
    COUNT(color)
FROM
    pracabd1.vehiculos_freezer
WHERE
    año < 2005 AND color = 'negro'; 

INSERT INTO clientes_freezer VALUES (888888, 'Zen-O','Sama','Madrid','Zen-O@kami.be'); 
INSERT INTO vehiculos_freezer VALUES (1,'0000-AAA','AAAAAAAAAAAAAAAA','Ford Mustang','Negro',2020); 

SELECT *
FROM vehiculos
WHERE año < 2005
ORDER BY color; 

SELECT * 
FROM clientes; 

SELECT * 
FROM clientes_vehiculos;





