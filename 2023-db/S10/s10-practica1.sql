-- Active: 1697837619431@@127.0.0.1@3306@taller

-- 1) El dueño del taller quiere saber cual es el monto total que cada cliente debe abonar al asistir al taller. El informe debe mostrar nombre, apellido, teléfono y monto

select c.nombre, c.apellido, c.tel, sum (p.`Monto`) as monto
    from cliente c
        inner join vehiculo v on c.codc=v.codc
        inner join ficha f on v.codveh = f.codveh
        inner join presup p on f.codf = p.codf
    group by c.nombre, c.apellido, c.tel

-- 2) Tomando la consulta del punto 1, se pide mostrar al cliente o clientes que abona el monto menor.

select c.nombre, c.apellido, c.tel, sum (p.Monto) as monto
    from cliente c
        inner join vehiculo v on c.codc=v.codc
        inner join ficha f on v.codveh = f.codveh
        inner join presup p on f.codf = p.codf
    group by c.nombre, c.apellido, c.tel
    having sum (p.Monto) = (select min(t1.monto) as min from (
                                select sum (p.`Monto`) as monto
                                from cliente c
                                    inner join vehiculo v on c.codc=v.codc
                                    inner join ficha f on v.codveh = f.codveh
                                    inner join presup p on f.codf = p.codf
                                group by c.nombre, c.apellido, c.tel) t1)

    
-- 3) Identificar cual o cuales fueron los mecánicos que diagnostican que realizaron  la mayor cantidad de revisiones.

-- 4) Mostrar los datos relevantes de los repuestos que fueron usados en todos los presupuestos.

-- 5) El dueño del taller debe comprar los repuestos y necesita un listado que muestre el nombre, la cantidad, el precio unitario y el total. El listado debe estar ordenado por nombre.

-- 6) Obtener un listado que muestre nombre, apellido del cliente y una columna con el llamada mensaje. Esa columna debe decir Sin vehículo registrado y Con vehículo registrado. La lógica es la siguiente si el cliente no registro ningún vehículo o si el cliente registro por lo menos uno.

-- 7) Mostrar en un listado los arreglos que usan por lo menos un repuesto cuyo precio unitario es menor que el promedio de precios de todos los repuestos. El  listado debe mostrar matricula del vehículo, teléfono del cliente, y el monto a abonar en concepto de repuestos.
