insert into clientes values ('666666','88888888A','Beerus','Sama','H','Templo de Beerus','Alcorcon','Madrid','28023','1','1','0-0-0','2018-11-14','beerusSama@kami.be');

set sql_safe_updates =0;  -- Explicar porque utilizamos delate
update clientes set Apellidos = 'Senpai' where Nombre = 'Beerus';


delete from clientes where Nombre='Beerus';
drop table vehiculos;

-- previlegios revocados

insert into clientes values ('777777','88888888B','Beerus','Sama','H','Templo de Beerus','Alcorcon','Madrid','28023','1','1','0-0-0','2018-11-14','beerusSama@kami.be');
update clientes set Apellidos = 'Senpai' where Nombre = 'Beerus';
 
 
 select * from cleintes;