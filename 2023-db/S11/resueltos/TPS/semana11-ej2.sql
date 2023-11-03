-- Active: 1698925068633@@127.0.0.1@3306@negocio
use negocio;
drop function if exists balanceNextId;

 /* Construir un procedimiento que permita, obtener a la fecha de hoy los cur que realizaron la mayor venta. 
 El resultado obtenido deberá ser almacenado en la estructura Balance. */

create function balanceNextId() returns int 
delimiter //
BEGIN
    declare nextId int;
    set nextId = (select max(idbalan)+1 from balance);
    if nextId is null THEN
        set nextId = 1;
    end if ;
    return nextId;
END //

drop procedure if exists balanceCreate//
create procedure balanceCreate()
begin
   declare localId int;
    declare amount float;
    declare _eof boolean default false;
    declare cur cursor for select idLocal, monto from ventas where monto = (select max(monto) from ventas);
    declare continue handler for not found set _eof = true;
    open cur;
    fetch cur into localId, amount;
    while _eof = false do
        insert into balance (idbalan, fecha, montomax, idLocal)
            values (balanceNextId(), curdate(), amount, localId);
        fetch cur into localId, amount;
    end while;
    close cur;
end//

call balanceCreate()//
