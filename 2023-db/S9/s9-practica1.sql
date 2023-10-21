-- Active: 1697837619431@@127.0.0.1@3306@taller

--1) Mostrar los clientes registrados que aún no tienen ingreso en el taller para un diagnóstico.
select c.* from cliente c inner join vehiculo v on c.codC = v.codC left outer join ficha f on v.codVEH=f.codVEH where f.codVEH is null

--2)Obtener un listado ordenado por apellido de los mecánicos y el tipo. El tipo esta definido con el atributo repara. Para mostrar el listado se pide armar dos select y aplicar la función unión.
select m.* from mecanico m where m.repara=0 union select m.* from mecanico m where m.repara=1 order by Apellido, Nombre

--3) Utilizando una de las combinaciones de join, mostrar los repuestos que no se mencionan en los presupuestos.
select r.* from presurep p RIGHT outer join repuesto r on p.codRep=r.codRep  where p.codRep is null

--4) Identificar por fecha cuántas fichas se confeccionaron y cuántos mecánicos diagnosticaron. Recordá que una ficha puede tener más de un diagnostico; por esa razón existe la tabla “fichamd”.

-- query cantidad fichas select f.fecha, count(`codF`) from ficha f group by fecha;
-- query cantidad mecanicos select f.fecha, count(`codMD`) from ficha f inner join fichamd m on f.`codF`=m.`codF` group by f.fecha;
select f.fecha, count(`codF`) as cantidad_fichas, r.cantidad_mecanicos
 from ficha f 
    inner join (select f2.fecha, count(`codMD`)  as cantidad_mecanicos
                    from ficha f2 
                        inner join fichamd m on f2.codF=m.codF 
                    group by f2.fecha) r on f.fecha=r.fecha
  group by fecha, cantidad_mecanicos

-- 5) Construir una consulta para cada combinación de join. Se debe redactar la consigna, identificar la combinación utilizada y proponer una alternativa de resolución.

--5.1 inner join: obtener apellido y nombre de clientes  y el la matrícula, marca y modelo de auto
Select c.apellido, c.nombre, v.matricula, v.marca, v.modelo from cliente c inner join vehiculo v on c.`codC`=v.`codC`

--5.2 right outer join: obtener los codigos de mecanicos de diagnostico que no hicieron diagnostico el 2023-04-05
select distinct m.`codMD` from fichamd f INNER JOIN ficha fi on f.`codF`=fi.`codF` and fi.fecha='2023-04-05' RIGHT OUTER JOIN mecdiag m on f.codMD = m.codMD where f.codmd is null

--5.3 left outer join: generar mismo query que 5.2 con left join
select * from mecdiag m LEFT OUTER JOIN 
    (select f.codMD from fichamd f INNER JOIN ficha fi on f.codF=fi.codF and fi.fecha='2023-04-05') r on m.`codMD`=r.codmd where r.codmd is null







