CREATE USER 'ABDDBA'@'localhost' IDENTIFIED BY 'abddba'; -- crea el usuario 
GRANT ALL PRIVILEGES ON *.* TO 'gestor' WITH GRANT OPTION; -- asignarle todos los privilegios
FLUSH PRIVILEGES; -- refrescar/actualizar los privilegios 

CREATE ROLE 'gestor';
GRANT ALL ON pracabd1.* TO 'gestor' WITH GRANT OPTION;
grant create role,create user on pracabd1 to 'gestor';
DROP ROLE 	'gestor';

CREATE USER IF NOT EXISTS 'Gohan' DEFAULT ROLE 'gestor';



show grants for 'gestor';
show grants for 'comprador';
show grants for 'vendedor';

select * from mysql.user;
SELECT * FROM INFORMATION_SCHEMA.TABLE_PRIVILEGES;
-- Administration ->users and privileges->sleccionamos 'usuario' -> schemas privileges


                                                                       -- Parte 2 consultas y vistas

-- A1. Obtener nombres y apellidos de clientes ordenados por provincia 

SELECT nombre,apellidos 
FROM pracabd1.clientes 
ORDER BY provincia; 

-- A2. Obtener el número de clientes de Sevilla 

SELECT Count(provincia) 
FROM pracabd1.clientes 
WHERE provincia = 'Sevilla'; 

-- A3. Obtener el email de los clientes de Barcelona 

SELECT email 
FROM pracabd1.clientes 
WHERE provincia = 'Barcelona'; 

-- A4. Insertar nuevos clientes 

INSERT INTO clientes VALUES (888888,'88888888Z','Zen-O','Sama','H','Palacete del rey del todo','Vallecas','Madrid','28023','1','1',DATE('0000-00-00'),DATE('2018-11-14'),'Zen-O@kami.be');   

-- B1. Obtener la información de los vehículos ordenados por color 

SELECT * 
FROM pracabd1.vehiculos 
WHERE año<2005 
ORDER BY color; 

-- B2. Obtener el número de vehículos de color negro 

SELECT count(color) 
FROM pracabd1.vehiculos 
WHERE año<2005 and color='negro'; 

-- B3. Insertar nuevos vehículos 

INSERT INTO vehiculos VALUES (1,'0000-AAA','AAAAAAAAAAAAAAAA','Ford Mustang','Negro',2020); 
