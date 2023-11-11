-- Active: 1698925068633@@127.0.0.1@3306@negocio
select fecha, count(*) from balance where count(*)>1 group by fecha


select count(*) from (select 1 as numero union all select avg(num) as num from ( select 0 as num union select 2 ) x ) x 


create table cliente(id_cliente int, nombre varchar(10))
insert into cliente values (1, 'c1')
insert into cliente values (2, 'c2')

create table pedidos (id_cliente int)
insert into pedidos values (1)

select distinct c.id_cliente from pedidos p right join cliente c on c.id_cliente=p.id_cliente where p.id_cliente is null

select c.id_cliente, id_cliente from pedidos p inner join cliente c on c.id_cliente=p.id_ciente

truncate pedidos

select * from pedidos


create table test_01 (clave varchar(10), num int);
insert into test_01 select 'A', 20;
insert into test_01 select 'B', 30;
insert into test_01 select 'A', 10;

SELECT num from (select max(num) as num from test_01 group by clave) x group by num  order by num


create table customer (customerName varchar(10))

insert into customer values ('a123')
insert into customer values ('b123')
insert into customer values ('a')

select * from customer where `customerName` like 'a_%'


create procedure proc_05(x varchar(20), z varchar(20)) not DETERMINISTIC 
set z = ucase(x);

set @zz='';
call proc_05(@zz='hola');
select @zz;

select * from customer

select customername from customer group by `customerName`

select * from test_01

select max(clave), min(num) from test_01 order by 1,2

select * from test_01


select * from test_01 where num between 10 and 20

select * from test_01 where num >=10 and 20>= num


create table pedidos (id_pedido int, status int, fecha date)
insert into pedidos values (1, 1, '2023-01-01');
insert into pedidos values (1, 2, '2023-01-02');
insert into pedidos values (1, 3, '2023-01-01');


select id_pedido, count(*) from pedidos where count(*)>1



create function fun_04(x varchar(20))

returns varchar(20)

deterministic return x;


select fun_04("hola");