-- Active: 1697837619431@@127.0.0.1@3306@vestuario

/*
Ejercicio 2:

Consigna:
 Para cada estreno de una obra de teatro los vestuaristas seleccionan los trajes de cada uno de los personajes con bastante anticipación por las dudas que deban esperar a que sean confeccionadas por no estar disponibles.
 El vestuario está informatizado por esa razón hacen el encargo y luego les avisan en el caso de no contar con stock y deban esperar la confección de la prenda.
 Todos los encargos quedan almacenados (estén disponibles en el momento o no), para incorporar las nuevas tendencias en la moda teatral. Los encargos se encuentran temporalmente en la tabla Movimiento.

Realizar:
Ingresar el encargo que hace cada vestuarista, es decir procesar los datos de Movimiento y cargar la tabla Encargo . Cada ingreso debe desencadenar la lógica que se detalla a continuación:
La estructura de encargo tiene los siguientes datos:

------
idEncargo, codTraje, Cantidad, Fecha, Estado {Estado=es nulo en el momento del insert y cambia cuando se descuenta de stock
-----

Descontar de stock el “Traje” o “Trajes” solicitado/s, sabiendo que cada uno está constituido por varias prendas. 
Por ejemplo
    Futbolista:   
        Camiseta
        Short
        Medias futboleras
        Botines  
    Mujer1: 
        Vestido corto
        Medias largas
        Tacones bajos. 

Importante: TODOS LAS PRENDAS DEBEN ESTAR DISPONIBLES.
Cambiar el “Estado” de Encargo a “False” si NO hay stock o a “True” si SI hay stock para TODO el pedido.
*/

drop procedure if exists encargoProcess;
create procedure encargoProcess()
BEGIN
    declare movId int;
    declare suitId int;
    declare suitQuantity int;
    declare _eof boolean default false;
    declare clothingId int;
    declare clothingStock int;
    declare state boolean;

    declare curMov cursor for select idM, codtraje, cantidad from movimiento;
    declare curCloth cursor for 
        select p.codprenda, p.stock
            from prenda p 
            inner join trapre tp on p.codprenda = tp.codprenda
            where tp.codTraje = suitId ;

    declare continue handler for not found set _eof = true;

    open curMov;

    fetch curMov into movId, suitId, suitQuantity;
    while not _eof DO
        set state=true;
        open curCloth;
        fetch curCloth into clothingId, clothingStock;
        --verificar que todas las prendas tengan stock por cantidad de pedidos de trajes
        while not _eof do  
            --select clothingId, clothingStock;
            --asumiendo que cada traje lleva 1 sola prenda...
            if clothingStock<suitQuantity then
                set state=false;
                set _eof=true;
            else
                fetch curCloth into clothingId, clothingStock;
            end if;
        end while;
        close curCloth;
        set _eof = false;
        if state then
            --si todas las prendas tienen stock suficiente para la cantidad de tajes pedidos, se descuentan las prendas del stock
            open curCloth;
            fetch curCloth into clothingId, clothingStock;
            while not _eof do
                update prenda set stock=stock-suitQuantity where codprenda=clothingId;
                fetch curCloth into clothingId, clothingStock;
            end while;
            close curCloth;
            set _eof = false;
        end if;
        insert into encargo (codtraje, cantidad, fecha, estado) values (suitId, suitQuantity, curdate(), state);
        delete from movimiento where idM=movId;
        fetch curMov into movId, suitId, suitQuantity;
    end WHILE;
    close curMov;
END

call encargoProcess();

select p.* from prenda p inner join trapre tp on p.codprenda = tp.codprenda where tp.codtraje=120

/*Ejercicio 3:
Modificar el ejercicio 2 usando Transacciones.
*/

drop procedure if exists encargoProcess;
create procedure encargoProcess()
BEGIN
    declare movId int;
    declare suitId int;
    declare suitQuantity int;
    declare _eof boolean default false;
    declare clothingId int;
    declare clothingStock int;
    declare state boolean;

    declare curMov cursor for select idM, codtraje, cantidad from movimiento;
    declare curCloth cursor for 
        select p.codprenda, p.stock
            from prenda p 
            inner join trapre tp on p.codprenda = tp.codprenda
            where tp.codTraje = suitId ;

    declare continue handler for not found set _eof = true;

    open curMov;

    fetch curMov into movId, suitId, suitQuantity;
    while not _eof DO
        set state=true;
        open curCloth;
        start transaction;
        fetch curCloth into clothingId, clothingStock;
        while not _eof do  
            --select clothingId, clothingStock;
            --asumiendo que cada traje lleva 1 sola prenda...
            if clothingStock<suitQuantity then
                set state=false;
                set _eof=true;
            ELSE
                update prenda set stock=stock-suitQuantity where codprenda=clothingId;
            end if;
            fetch curCloth into clothingId, clothingStock;
        end while;
        close curCloth;
        set _eof = false;
        if state then
            commit;
        ELSE
            rollback;
        end if;
        insert into encargo (codtraje, cantidad, fecha, estado) values (suitId, suitQuantity, curdate(), state);
        delete from movimiento where idM=movId;
        fetch curMov into movId, suitId, suitQuantity;
    end WHILE;
    close curMov;
END



call encargoProcess();
select p.* from prenda p inner join trapre tp on p.codprenda = tp.codprenda where tp.codtraje=120

/*
Ejercicio 4
Consigna:
Crear una “VISTA", que le permita visualizar cada obra, con el traje y la cantidad de prendas que contiene
*/

create or replace view playSuit as 
    select o.nombre as obra_nombre, t.nombre as traje_nombre, count(*) as cantidad_prendas 
        from obra o 
            inner join obratraje ot on o.idobra=ot.idobra 
            inner join traje t on ot.idtraje=t.idtraje 
            inner join trapre tp on t.idtraje=tp.codtraje 
            group by o.nombre, t.nombre order by o.nombre, t.nombre
    with read only constraint ro;

select * from playSuit;