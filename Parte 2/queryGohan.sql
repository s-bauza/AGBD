create role 'comprador';
grant select on pracabd1.* to 'comprador';
grant insert on vehiculos to 'comprador';

FLUSH PRIVILEGES;

drop role 'comprador';


create role 'vendedor';
grant select on pracabd1.* to 'vendedor';
grant insert, update on pracabd1.clientes to 'vendedor';
grant insert on clientes_vehiculos to 'vendedor';
grant update(Comprado) on clientes_vehiculos to 'vendedor';

FLUSH PRIVILEGES;

drop role 'vendedor';

CREATE USER IF NOT EXISTS 'Vegeta' DEFAULT ROLE 'comprador';
CREATE USER IF NOT EXISTS 'Bidel' DEFAULT ROLE 'comprador';

CREATE USER IF NOT EXISTS 'Bulma' DEFAULT ROLE 'vendedor';
CREATE USER IF NOT EXISTS 'Goku' DEFAULT ROLE 'vendedor';

CREATE TABLE consesionarios (
    consesonarioId INT UNIQUE NOT NULL,
    name VARCHAR(40),
    localida VARCHAR(50),
    provincia VARCHAR(30),
    codPostal VARCHAR(5)
);

alter table pracabd1.clientes_vehiculos add column consesionarioId int;

delete  from vehiculos where CocheID = '777';
delete from clientes where ClienteID=888888;

 -- El usuario Gohan dispone de todos los previlegios
 
 -- Comprador
 
 grant select on pracabd1.* to 'Goku';
 show grants for 'Goku';
 
revoke 'vendedor' from 'Goku'; 
create role 'vendedor_torpe';  
grant select on pracabd1.* to 'vendedor_torpe'; 
grant 'vendedor_torpe'  to 'Goku' ; 
FLUSH PRIVILEGES; 

drop role 'vendedor_torpe';
                                    -- Apartado 2 crear a Freezer
                                    
CREATE OR REPLACE VIEW clientes_freezer AS 
SELECT ClienteID, nombre, apellidos, provincia, Email 
FROM pracabd1.clientes; 


CREATE OR REPLACE VIEW vehiculos_freezer AS 
SELECT * 
FROM pracabd1.vehiculos 
WHERE año<2005; 

CREATE USER Freezer; 
GRANT SELECT, INSERT ON pracabd1.clientes_freezer TO 'Freezer'; 
GRANT SELECT, INSERT ON pracabd1.vehiculos_freezer TO 'Freezer'; 
