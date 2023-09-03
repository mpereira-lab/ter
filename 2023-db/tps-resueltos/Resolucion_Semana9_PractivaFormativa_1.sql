-- Consultas

-- 1) Mostrar los clientes registrados que aún no tienen ingreso en el taller para un diagnóstico.
select distinct  c.codC, c.dni,c.Nombre,c.Apellido 
from cliente c
inner join vehiculo v 
	on (v.codC = c.codC)
left join ficha f 
	on (f.codVEH = v.codVEH)
where f.codveh is null
order by c.Apellido,c.nombre;

-- 2) Obtener un listado ordenado por apellido de los mecánicos y el tipo. 
-- El tipo esta definido con el atributo repara. Para mostrar el listado se pide armar dos select y aplicar la función unión.

select codMec,nombre,apellido, repara  
from mecanico m
where repara = 0 
union 
select codMec,nombre,apellido, repara  
from mecanico m
where repara = 1
order by apellido;

-- 3) Utilizando una de las combinaciones de join, 
-- mostrar los repuestos que no se mencionan en los presupuestos.
select r.*, pr.* 
from repuesto r
left join presurep pr
	on (pr.codrep = r.codRep)
where pr.Npresup is null;

-- 4) Identificar por fecha cuántas fichas se confeccionaron 
-- y cuántos mecánicos diagnosticaron. 
-- Recordá que una ficha puede tener más de un diagnostico; 
-- por esa razón existe la tabla “fichamd”.
select *, f.fecha
from mecanico m 
inner join mecdiag md 
	on (md.codMec = m.codMec)
inner join fichamd fmd 
	on (fmd.codMD = md.codMD)
inner join ficha f 
	on (fmd.codF = f.codF)
order by f.fecha;

-- 2023-03-30 3
-- 2023-04-01 2
-- 2023-04-05 1
select f.fecha, count(md.codMec) as cantidad_mecanico,count(distinct(fmd.codF)) as cantidad_ficha
from mecanico m 
inner join mecdiag md 
	on (md.codMec = m.codMec)
inner join fichamd fmd 
	on (fmd.codMD = md.codMD)
inner join ficha f 
	on (fmd.codF = f.codF)
group by f.fecha
order by f.fecha;

-- 5) Construir una consulta para cada combinación de join. 
-- Se debe redactar la consigna, identificar la combinación utilizada y proponer una alternativa de resolución.
select c.codC, c.dni,c.Nombre,c.Apellido, v.Matricula,v.modelo,v.marca
from cliente c
inner join vehiculo v 
	on (v.codC = c.codC)
order by c.Apellido;