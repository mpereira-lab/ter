-- 1)      Mostrar los datos de los presupuestos cuyo monto es menor a $ 10000.

SELECT * from presup where Monto<10000

-- 2)      Mostrar la cliente ingresada más joven considerando su documento (del conjunto de datos ingresados).
SELECT * from cliente where dni in (select max(dni)from cliente)

-- 3) Mostrar los repuestos que tengan la misma cantidad de stock que en el punto de pedido.
select * from repuesto where stock=PP

-- 4) Mostrar los mecánicos cuyo apellido comience con la letra C.
select * from mecanico where Apellido like 'C%'

-- 5) Mostrar nombre del repuesto junto al precio ordenado alfabéticamente.
select nombre, precio from repuesto  order by Nombre

-- 6) Mostrar la cantidad de presupuestos realizados en el taller.
select count(*) as cantidad_presupestos from presup

-- 7) Mostrar por color cuantos  vehículos registrados hay.
select color, count(*) from vehiculo group by color

-- 8) Mostrar por código de ficha la cantidad de informes que tiene.
select codf, count(*) from fichamd GROUP BY codf;

-- 9) Listar ordenado por temática  a los mecánicos que diagnostican (indicar nombre, apellido y temática).
select md.tematica, m.* from mecanico m inner join mecdiag md on m.codMec=md.codMec order by md.tematica

-- 10)  Mostrar los números de presupuesto que tengan al menos un repuesto cuyo precio oscile entre $ 1200 y $ 10000 inclusive.
select pr.Npresup from presurep pr INNER JOIN repuesto r on pr.codRep=r.codRep where r.precio BETWEEN 1200 and 10000

-- 11)  Calcular el valor promedio del costo de los repuestos del taller. El título de la columna debe decir Precio Promedio

select avg(precio) as 'Precio Promedio' from repuesto

-- 12)  Mostrar los datos de los clientes que tienen más de un vehículo.
select c.*, count(*) as cantidad_vehiculos  from cliente c inner join vehiculo v on c.codC=v.codC group by c.codC HAVING count(*)>1

-- 13)  Identificar con nombre y apellido a los mecánicos que no hicieron ningún diagnóstico.
select * from mecanico where codMec not in (select codMec from mecdiag)

-- 14)  Mostrar por vehículo el monto final que deben abonar en concepto de presupuesto.
select v.codVeh, v.Matricula, v.modelo, v.Marca, v.Color, sum(monto) as monto_final from presup p inner join ficha f on p.codF = f.codF inner join vehiculo v on v.codVEH=f.codVEH group by v.codVeh, v.Matricula, v.modelo, v.Marca, v.Color


