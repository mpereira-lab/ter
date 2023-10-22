-- Active: 1697997550092@@127.0.0.1@3306@taller

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

select md.codmec, m.Apellido, m.Nombre, count(*) as cnt 
    from mecdiag md 
        inner join fichamd fmd on md.codMD=fmd.codMD
        inner join mecanico m on md.codMec = m.codMec
    group by md.codMec
    having cnt = (
select max(maxim.cant_diag) as maximo from 
    (select md.codmec, count(*) as cant_diag from mecdiag md inner join fichamd fmd on md.codMD=fmd.codMD group by md.codMec)  maxim)

-- 4) Mostrar los datos relevantes de los repuestos que fueron usados en todos los presupuestos.
SELECT distinct r.codRep, r.Nombre, r.stock, r.PP, r.precio, r.Unidad
    FROM repuesto r
    inner join presurep pr on pr.codrep = r.codRep

-- 5) El dueño del taller debe comprar los repuestos y necesita un listado que muestre el nombre, la cantidad, el precio unitario y el total. El listado debe estar ordenado por nombre.
select r.nombre, pr.cant, r.precio, (pr.cant*r.precio) as total 
    from repuesto r inner join presurep pr on r.codRep = pr.codRep
    order by r.nombre

-- 6) Obtener un listado que muestre nombre, apellido del cliente y una columna con el llamada mensaje. Esa columna debe decir Sin vehículo registrado y Con vehículo registrado. La lógica es la siguiente si el cliente no registro ningún vehículo o si el cliente registro por lo menos uno.
select c.nombre, c.apellido, if(v.codc is null, 'Sin vehículo registrado', 'Con vehículo registrado') 
    from cliente c left outer join vehiculo v on c.codc=v.codc

-- 7) Mostrar en un listado los arreglos que usan por lo menos un repuesto cuyo precio unitario es menor que el selc. El  listado debe mostrar matricula del vehículo, teléfono del cliente, y el monto a abonar en concepto de repuestos.

select v.matricula, c.tel, sum(pr.cant*r.precio) as monto_respuestos
    from cliente c
        inner join vehiculo v on c.codc=v.codc
        inner join ficha f on v.codveh=f.codveh
        inner join presup p on f.codf=p.codf
        inner join presurep pr on p.npresup=pr.npresup
        inner join repuesto r on pr.codrep=r.codrep
    where r.precio<(select avg(precio) from repuesto)
    group by v.matricula, c.tel

