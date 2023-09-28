

/*pregunta 4
*a. Crear los espacios físicos (datafiles) y lógicos (tablespaces) de la BD
*b. Eliminar los espacios físicos (datafiles) y lógicos (tablespaces) de la BD.
*/
-- a
create tablespace TBLS_clientes Add DATAFILE 'DF_clientes.ibd' FILE_BLOCK_SIZE = 16384;
create tablespace TBLS_vehiculos Add DATAFILE 'DF_vehículos.ibd' FILE_BLOCK_SIZE = 16384;
create tablespace TBLS_clientes_vehiculos Add DATAFILE 'DF_cliente_vehiculos.ibd' FILE_BLOCK_SIZE = 16384;
-- b
drop tablespace TBLS_clientes;
drop tablespace TBLS_vehiculos;
drop tablespace TBLS_clientes_vehiculos;

/*Pregunta 5 y 6
*a. Crear las tablas de la BD en los espacios lógicos definidos anteriormente.
*b. Eliminar las tablas de la BD
*/
-- a
create table clientes (ClienteID int unique, DNI varchar(9) unique, Nombre varchar(20), Apellidos varchar(30), Género char(1),
 Dirección varchar(60), Localidad varchar(50), Provincia varchar(30), CodPostal varchar(5), Telefono varchar(9), Canal tinyint(1),
 FechaNacimiento date,FechaContacto date, Email varchar(60)) tablespace TBLS_clientes;
create table vehiculos (CocheID int unique, Matricula varchar(8) unique, NumBastidor varchar(16) unique, MarcaModelo varchar(32), Color varchar(20),
 Año smallint) tablespace TBLS_vehiculos;
create table clientes_vehiculos (ClienteID int, CocheID int, Comprado char(1), Comentarios varchar(500)) tablespace TBLS_clientes_vehiculos;
-- b
drop table clientes;
drop table vehiculos;
drop table clientes_vehiculos;

/*Pregunta 7 
*Anexo II
*Paso 1 para tabla clientes CAMBIAR la fecha en el excel formato aaaa-mm-dd (buscar formula(en excel) para dejarlo como string(formato general) y pasarlo a date)
*Paso 2 Hay que añadir a la tabla vehiculo -> color sino da error (habria que saber cual da 2000 o algo asi)
Problema tabla cliente formato DATE 0000-00-00 cmd lo acepta(como warning pero añade) Wizar impor no acepta (no añade la fila (peta creo a no ser que  pongas null))
Problema tabla vehiculos MarcaModelo varchar(32)<-es el maximo que se nos indico hay textos mas largos que 32 
import wizard es un coñazo mas de 25 min para importar 12000 registros (lo pare...) no vale la pena -> no se utilizarlo a lo mejor 
cmd(tablas_carga)<tiempos,warnings> clientes<34.52 sec, 18228> vehiculos<11.09 sec, 6> vehiculos_clientes<31.27 sec, 0>
No se tiene en cuenta en el anexo I (que se deberia) la nota final del anexo II '*' del comentario clientes_vehiculos
*/
-- Consultas 
show full tables;
describe clientes;

select * from clientes;
select * from vehiculos;
select * from clientes_vehiculos;


truncate table clientes;
truncate table vehiculos;
truncate table clientes_vehiculos;

-- Algunas pruebas solo sirve si la fecha es un string
set sql_safe_updates=0; -- desctivar modo seguro (para activarlo =1)
/*update clientes set FechaNacimiento = str_to_date(FechaNacimiento,"%d/%m/%y");
update clientes set FechaContacto = str_to_date(FechaContacto,"%d/%m/%y");*/

-- Cambiar el formato de la fecha (solo para consulta) 
select ClienteID,date_format(FechaNacimiento,'%d/%m/%y'),date_format(FechaContacto,'%d/%m/%y') from clientes;

/*Pregunta 8
* a. Creación de las claves primarias de cada tabla (Alter Table Add Constraint...).
* b. Creación de las claves foráneas (Alter Table Add Constraint...).
* c. Borrado de las claves foráneas de las tablas.
* d. Borrado de las claves primarias de las tablas.
*/
-- a
ALTER TABLE clientes ADD CONSTRAINT PRIMARY KEY (ClienteID);
ALTER TABLE vehiculos ADD CONSTRAINT PRIMARY KEY (CocheID);

-- b
ALTER TABLE clientes_vehiculos ADD CONSTRAINT FK_clientes_vehiculos_ClienteID FOREIGN KEY(ClienteID) REFERENCES clientes(ClienteID);
ALTER TABLE clientes_vehiculos ADD CONSTRAINT FK_clientes_vehiculos_CocheID FOREIGN KEY(CocheID) REFERENCES vehiculos(CocheID);

-- c
ALTER TABLE clientes DROP FOREIGN KEY clienteId; 
ALTER TABLE vehiculos DROP FOREIGN KEY cocheId; 

-- d
alter table clientes drop primary key ;
alter table vehiculos drop primary key ;
alter table clientes_vehiculos drop primary key ;

/*Pregunta 9
* a. Índices antes de la carga: 6, 8a, 8b, 7 load conection lost con el import wizard
* b. Índices después de la carga: 6, 7, 8a, 8b el de cleintes_vehiculos 2 horas min apro y clientes y vechiculos un minuto como mucho
*/

/*Parte 2 consultas*/
-- 1
-- a
select Email from Clientes where Nombre="Ángeles" and Apellidos="del Nido";
-- b
select count(ClienteID) from clientes where Provincia="Lugo";
-- c
select Nombre,Apellidos,Email from clientes where canal="1" and year(FechaContacto)=2019;
-- d
select clientes.nombre, clientes.apellidos, vehiculos.matricula 
from clientes_vehiculos  
join clientes on clientes_vehiculos.clienteId = clientes.clienteId  
    join vehiculos on clientes_vehiculos.cocheId = vehiculos.cocheId
where clientes_vehiculos.comprado = 1 and clientes.provincia = "Madrid" 
order by clientes.apellidos ;
-- e Cuantos coches se compraron en 1 año(Nos permite estudiar los índices sobre el campo año que es un entero).
Select count(cocheId) from vehiculos where año = 2008 ;
 
 -- 2
CREATE INDEX idx_nombre ON clientes(nombre); 
CREATE INDEX idx_apellidos ON clientes(apellidos); 
CREATE INDEX idx_nombre_apellidos ON clientes(nombre, apellidos); 
CREATE INDEX idx_apellidos_nombre ON clientes(apellidos,nombre); 
 
 
