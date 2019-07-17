 create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  domicilio varchar(30),
  seccion varchar(20),
  constraint PK_empleados primary key(documento),
 );

 insert into empleados values('22222222','Ana Acosta','Bulnes 56','Secretaria');
 insert into empleados values('23333333','Bernardo Bustos','Bulnes 188','Contaduria');
 insert into empleados values('24444444','Carlos Caseres','Caseros 364','Sistemas');
 insert into empleados values('25555555','Diana Duarte','Colon 1234','Sistemas');
 insert into empleados values('26666666','Diana Duarte','Colon 897','Sistemas');
 insert into empleados values('27777777','Matilda Morales','Colon 542','Gerencia');

 GO;

 create trigger tr_empleados_borrar
  on empleados
  for delete
 as
  if (select count(*) from deleted)>1
  begin
    raiserror('No puede eliminar más de un 1 empleado', 16, 1)
    rollback transaction
  end;

  GO;

 create trigger tr_empleados_validacion
  on empleados
  for delete
 as
  if (len(old.nombre))<0
  begin
    raiserror('No puede eliminar más de un 1 empleado', 16, 1)
    rollback transaction
  end;

 GO;


 create trigger tr_empleados_actualizar
  on empleados
  for update
 as
  if update(documento)
  begin
    raiserror('No puede modificar el documento de los empleados', 16, 1)
    rollback transaction
  end;

 GO;


 create trigger tr_empleados_insertar
  on empleados
  for insert
 as
  if (select seccion from inserted)='Gerencia'
  begin
    raiserror('No puede ingresar empleados en la sección "Gerencia".', 16, 1)
    rollback transaction
  end;

 delete from empleados where domicilio like 'Bulnes%';

  alter table empleados
  disable trigger tr_empleados_borrar;

 delete from empleados where domicilio like 'Bulnes%';

 select *from empleados;

 update empleados set documento='23030303' where documento='23333333';

 insert into empleados values('28888888','Juan Juarez','Jamaica 123','Gerencia');

 alter table empleados
  disable trigger tr_empleados_actualizar, tr_empleados_insertar;

 update empleados set documento='20000444' where documento='24444444';

 select *from empleados;

 insert into empleados values('28888888','Juan Juarez','Jamaica 123','Gerencia');

 select *from empleados;

 alter table empleados
  enable trigger all;

 update empleados set documento='30000000' where documento='28888888';