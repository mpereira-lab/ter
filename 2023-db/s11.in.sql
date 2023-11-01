delimiter //
use taller //
create procedure Muestra(in codigo int)
BEGIN
    select nombre, precio, stock from taller.repuesto where codrep = codigo;
end //

call Muestra(123)//

