drop database inventario;
create database inventario;
use inventario;
create table categorias(
id_categoria int auto_increment not null Primary key,
Nombre varchar(60) not null,
Activo bool  not null,
id_departamento int not null references departamentos(id_departamento)on delete cascade on update cascade
);
insert into categorias (Nombre,Activo,id_departamento) values('Celulares',true,1);
insert into categorias (Nombre,Activo,id_departamento) values('Audifonos',true,2);
insert into categorias (Nombre,Activo,id_departamento) values('Cargadores',true,3);
insert into categorias (Nombre,Activo,id_departamento) values ('protectores',true,4);
insert into categorias (Nombre,Activo,id_departamento) values ('baterias',false,5);

create table chip ( id_chip int not null auto_increment primary key,
					ICCID varchar (30) not null ,
                    activo bool not null
);
 
 insert into chip (ICCID, activo) values ('123456789012345678', true);
 
create table Departamentos(
id_departamento int  auto_increment  not null primary key,
Nombre varchar(60) not null,
Activo bool not null,
id_colocacion int not null references colocacion(id) on delete  cascade on update cascade
);
insert into Departamentos(Nombre,Activo,id_colocacion) values('Zaragoza',true,1);
insert into Departamentos(Nombre,Activo,id_colocacion) values('Juarez',true,1);
insert into Departamentos(Nombre,Activo,id_colocacion) values('Coopel',true,1);
insert into Departamentos(Nombre,Activo,id_colocacion) values('rutas',true,2);
insert into Departamentos(Nombre,Activo,id_colocacion) values('Oficina',true,4);

create table  Productos(
id_producto int auto_increment not null primary key,
id_categoria int not null,
id_departamento int not null,
Activo bool not null,
foreign key (id_categoria) references categorias (id_categoria) on delete cascade on update cascade,
foreign key (id_departamento) references departamentos (id_departamento) on delete cascade on update cascade
);
insert into Productos(id_categoria,id_departamento,Activo) values(1,1,True);
insert into Productos(id_categoria,id_departamento,Activo) values(2,2,True);
insert into Productos(id_categoria,id_departamento,Activo) values(3,3,True);
insert into Productos(id_categoria,id_departamento,Activo) values(4,4,True);
insert into Productos(id_categoria,id_departamento,Activo) values(5,5,True);

create table Marca(
id_marca int auto_increment not null primary key,
Nombre varchar(60) not null,
Activo bool not null,
id_modelo int  not null references Modelo(id_modelo)on delete cascade on update cascade
);
insert into marca(Nombre,Activo,id_modelo) values('sony',true,1);
insert into marca(Nombre,Activo,id_modelo) values('Motorola',false,2);
insert into marca(Nombre,Activo,id_modelo) values('Samsung',true,3);
insert into marca(Nombre,Activo,id_modelo) values('Alcatel',true,4);
insert into marca(Nombre,Activo,id_modelo) values('bla',false,5);

create table Modelo(
id_modelo int auto_increment not null primary key,
Nombre varchar(60) not null,
Activo bool not null
);
insert into modelo(Nombre,Activo) values('Xperia',true);
insert into modelo(Nombre,Activo) values('G3',true);
insert into modelo(Nombre,Activo) values('Gran Prime',true);
insert into modelo(Nombre,Activo) values('OneTouch',true);
insert into modelo (Nombre,Activo) values('Moto',true);

create table articulos(
id_articulos int auto_increment not null primary key,
Codigo varchar (30) not null,
id_modelo int not null,
id_marca int not null,
Precio double not null,
Color varchar(60) not null,
Activo bool,
id_categoria int not null,
Fecha Datetime not null,
foreign key (id_modelo) references modelo(id_modelo) on delete cascade on update cascade,
foreign key(id_marca) references marca(id_marca) on delete cascade on update cascade

);
insert into articulos(Codigo, id_modelo,id_marca,Precio,Color,Activo,id_categoria,Fecha) values('12345',1,1,100,'azul',true,1,now());
insert into articulos(Codigo, id_modelo,id_marca,Precio,Color,Activo,id_categoria,Fecha) values('67890',2,2,100,'verde',true,2,now());
insert into articulos(Codigo, id_modelo,id_marca,Precio,Color,Activo,id_categoria,Fecha) values('78901',3,3,100,'rojo',true,3,now());
insert into articulos(Codigo, id_modelo,id_marca,Precio,Color,Activo,id_categoria,Fecha) values('45678',4,3,100,'azul',true,4,now());
insert into articulos(Codigo, id_modelo,id_marca,Precio,Color,Activo,id_categoria,Fecha) values('56783',5,5,200,'negro',true,5,now());


create table caracteristicas(
	id_caracteristicas int auto_increment not null primary key,
	IMEI varchar(30) not null,
    id_chip int, 
	id_articulo int not null,
	foreign key (id_chip) references chip(id_chip) on delete cascade on update cascade,
    foreign key (id_articulo) references articulos(id_articulos) on delete cascade on update cascade
);

insert into caracteristicas(IMEI, id_chip, id_articulo) values ('123456789045678901',1 , 1);


create table cantidad(
id_cantidad int auto_increment not null primary key,
cantidad int (20) ,
id_departamento int not null,
id_articulos int not null,
foreign key (id_articulos) references articulos(id_articulos) on delete cascade on update cascade,
foreign key(id_departamento) references departamentos(id_departamento) on delete cascade on update cascade
);

insert into cantidad(cantidad,id_departamento,id_articulos) values(2,1,1);


create table refacciones(
id_refaccion int auto_increment not null primary key,
tipo varchar(60) not null,
activo bool not null,
id_categoria int not null references categorias(id_categoria)
);
insert into refacciones(tipo,activo,id_categoria) values('Pantalla',true,1);
insert into refacciones(tipo,activo,id_categoria) values('Bateria',true,2);
insert into refacciones(tipo,activo,id_categoria) values('Microfono',true,3);
insert into refacciones(tipo,activo,id_categoria) values('Bocina',true,4);
insert into refacciones(tipo,activo,id_categoria) values('Puerto',true,5);

create table colocacion(
	id int not null auto_increment primary key,
    tipo varchar(50) not null,
    activo bool not null
);

INSERT INTO colocacion (tipo, activo) VALUES ('Local', true);
INSERT INTO colocacion (tipo, activo) VALUES ('Ruta', true);
INSERT INTO colocacion (tipo, activo) VALUES ('Tienda', true);
INSERT INTO colocacion (tipo, activo) VALUES ('Oficina', true);
INSERT INTO colocacion (tipo, activo) VALUES ('Otro', true);

select * from cantidad;
         
