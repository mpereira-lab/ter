-- Active: 1702674427970@@127.0.0.1@3306@taller
select * from cliente

create table tab1 (id int, name varchar(20))
insert into tab1 values (1, 'n1');
insert into tab1 values (2, 'n2');


create table tab2 (id int, name varchar(20))
insert into tab2 values (2, 'n2')
insert into tab2 values (33, 'n33')

select * from tab1 left OUTER join tab2 on tab1.id=tab2.id where tab2.id is null

select max(id) from tab2

create procedure ejemplo (inout valor int)
BEGIN
    set valor = valor + 10;
END


set @varInout = 123 ;
call ejemplo(@varInout) ;
select @varInout ;


create or replace view v1 


drop function if EXISTS fun_04;
create function fun_04(x varchar(20)) returns   varchar(20)
DETERMINISTIC return x


select fun_04("123")

select fun_04(123)

call fun_04("123")

alter table agrupador add column x varchar(1)

ALTER TABLE agrupador DROP COLUMN x

select ucase('as')