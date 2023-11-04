/*Partiendo de la consigna del ejercicio 1 del libro “Ejercicios Resueltos” se pide generar el préstamo si
 el socio y el autor del libro solicitado existen. Crear el procedimiento con parámetros.*/

delimiter ;
use biblioteca;
drop procedure if exists bookBorrow;
create procedure bookBorrow(
    in memberFirstname varchar(60),
    in mermberLastname varchar(60),
    in authorFirstname varchar(60),
    in authorLastname varchar(60))
begin
    declare memberCode int;
    declare authorCode int;
    declare copyNumber int;
    declare borrowId int;
    set memberCode = (select codsocio from socio where nombre = memberFirstname and apellido = mermberLastname);
    if memberCode is null then
        select concat("Socio no existe: ", memberFirstname, " ", mermberLastname) message;
    else
        set authorCode = (select codautor from autor a where a.nombre = authorFirstname and a.apellido = authorLastname);
        if authorCode is null THEN
            select "No existe el autor" message;
        else
            set copyNumber = (select e.idejem from ejemplar e inner join libroautor la on e.codLibro=la.codLibro where la.codAutor=authorCode and e.deteriorado=false limit 1);
            if copyNumber is null then
                select "No existen ejemplares disponibles" msg;
            else
                insert into prestamo (codsocio, fprestamo, fdevolucion, ftope) 
                    values (memberCode, curdate(), DATE_ADD(curdate(), interval 7 day), DATE_ADD(curdate(), interval 9 day));
                set borrowId = LAST_INSERT_ID();
                insert into detallepre (nprestamo, idejem) values (borrowId, copyNumber);
                select concat("Se realizó el prestamo del ejemplar ",copyNumber);
            end if;
        end if;
    end if;
end 

call bookBorrow("Oscar", "Araoz", "Jose Maria", "Martin")