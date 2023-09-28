SELECT 
    *
FROM
    vehiculos
WHERE
    MarcaModelo LIKE 'BMW%';
    
insert into  vehiculos values('777','1183-LFF','FFFFFFFFFFFFFFFF','Mustang shelby gt 500','Negro','2020');


CREATE TABLE saiyans (
    saiyanId INT UNIQUE NOT NULL,
    name VARCHAR(40),
	nivelPoder int,
    ozaru bool
);

insert into clientes_vehiculos values ('777','777','0','Regalo de Bulma para Vegeta');