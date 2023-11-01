delimiter //
use taller //
create procedure ejemplo (inout valor int)
BEGIN
    set valor = valor + 10;
END //
set @varInout = 123 //
call ejemplo(@varInout) //
select @varInout //

