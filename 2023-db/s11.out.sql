delimiter //
use taller //
create procedure Cuantos(in valor float, out contador int)
BEGIN
    
    set contador = (select count(*) from repuesto
                            where precio>valor);
end //

call Cuantos(500, @resultado)//

select @resultado as "Salida"//

