-- Active: 1698830613848@@127.0.0.1@3306@canamigo
/*1) Una vez por mes se le entrega a los dueños de los perros la rutina, 
la frecuencia semanal y el adiestrador que tendrá su mascota. 
Para ello debe construir un procedimiento que dado el nombre del dueño 
muestre la información mencionada de cada uno de sus perros.
*/

use canamigo;
drop procedure if EXISTS  mostrarRutina;
delimiter //
create procedure mostrarRutina (nombreDuenio varchar(50))
begin

    select ad.rutinaEjercicios, ad.frecuenciaSemanal,ad.a_nroLegajo, a.a_nombre, d.D_nombre 
        from adiestramiento ad
        inner join adiestrador a on ad.A_nroLegajo=a.A_nroLegajo
        inner join perro p on ad.P_codigo = p.p_codigo
        inner join duenio d on p.d_dni = d.d_dni
        where d.d_nombre like CONCAT('%', nombreDuenio, '%');
end //

call mostrarRutina('Rossi');


/*
2) La veterinaria cuenta con adiestradores especializados en cada raza. 
	Por esa razón necesita saber cuántos adiestradores y cuantos perros tiene según sea la raza 
    Para ello debe crear una Función que permita ingresar una raza e informe lo solicitado 
    y en el caso de no contar con perros de esa raza le muestre un mensaje al usuario “No hay perros de la raza xxxxxx.”
*/
/*
ACLARACIÓN: según la especificación mySql una función solo puede retornar 1 valor, en el enunciado se piden 2. A fines de cumplir con la ADD
parte del enunciado que pide crear una función, voy a retornar la cantidad de perros de una raza y no retornaré la cantidad
de adiestradores de la misma
*/

use canamigo;
drop function if EXISTS  mostrarCantidadPorRaza;
delimiter //
create function mostrarCantidadPorRaza (raza varchar(20)) returns int
begin
    declare cantidad int;
    set cantidad = (select count(*) from perro p where p.P_raza = raza);
    return cantidad;
end 
//

select if(mostrarCantidadPorRaza('BOXER')>0, mostrarCantidadPorRaza('BOXER'), 'No hay raza BOXER') as cantidad;
select if(mostrarCantidadPorRaza('BOXER---')>0, mostrarCantidadPorRaza('BOXER'), 'No hay raza BOXER---') as cantidad;

/*3) En los próximos meses cada perro que ingrese a la veterinaria se le 
asignará al adiestrador que tenga menos perros a su cargo para que adquiera práctica. 
Para ello debe construir un procedimiento que permita ingresar código, nombre, 
raza, peso y Dni del dueño en la estructura perros, y la tupla correspondiente de 
adiestramiento sabiendo que la PK de adiestramiento debe ser el correlativo al último ingresado. 
Los datos que no se cuenta con información deben ser nulos. 
Se debe controlar que el Dni del dueño sea válido para realizar el insert en la estructura. 
En caso de NO existir el Dni en la estructura “Dueño” se debe CANCELAR la operación 
de alta hasta que se solucione el problema, obviamente se debe informar de dicha
situación al usuario mediante un mensaje.
*/


drop procedure if EXISTS  altaPerro;
delimiter //
create procedure altaPerro (
        perroCodigo varchar(8), 
        perroNombre varchar(30), 
        perroRaza varchar(20), 
        perroPeso decimal(5,2),
        duenioDni varchar(10)
        )
begin
    declare adiestradorId int;
    declare existePerro int;
    declare existeDni int;
    set existeDni = (select count(*) from duenio where d_dni=duenioDni);
    IF existeDni=0 THEN
        select 'Dni de dueño no existe' as mensaje;
    ELSE
        set adiestradorId = (select t.a_nrolegajo from (select a_nrolegajo, count(*) as cantidad from adiestramiento a  group by a_nrolegajo order by cantidad limit 1) as t);
        set existePerro = (select count(*) from perro where p_codigo=perroCodigo);
        if (existePerro>0) then
            select concat('Perro ya existe: ', perroCodigo) as mensaje;
        ELSE
            insert into perro (D_DNI, P_codigo, P_nombre, P_peso, P_raza)
                values (duenioDni, perroCodigo,perroNombre, perroPeso, perroRaza);
            insert into adiestramiento (A_nroLegajo, p_codigo) values (adiestradorId, perroCodigo);
            select concat('El adiestrador asignado es ', adiestradorId) ;

        end if;
    END IF;
end //

call altaPerro('CAN11', 'PERRO1', 'RAZA1', 5.5, '18753469');

/*
4) La veterinaria cuenta con un Club de perros abandonados.
  Esta situación fue comentada a todos los clientes de la veterinaria y decidieron adoptarlos entre ellos.
  Los perros abandonados están en la estructura “Abandono” y a medida que son adoptados se eliminan de dicha estructura.
  Para asegurarle una buena atención solo podrán adoptar aquellos que tengan UN solo perro.
  Debe crear un procedimiento que permita la adopción de los perros. Informar si fueron adoptados todos,
  en caso contrario cuantos quedaron sin adoptar.
*/


drop procedure if EXISTS  adoptarTodosLosPerros;
delimiter //
create procedure adoptarTodosLosPerros ()
BEGIN

    declare adoptanteDni VARCHAR(10);
    declare abandonoId int;
    declare perroCodigo varchar(8);
    declare perroNombre varchar(30);
    declare perroRaza varchar(20);
    declare _eof boolean;
    declare cur cursor for select id, codigo, nombre, raza from abandono;
    declare continue handler for not found set _eof = true;
    set _eof = false;
    open cur;
    fetch cur into abandonoId, perroCodigo, perroNombre, perroRaza;
    while _eof = false do
        set adoptanteDni = (select t.d_dni from (select d.d_dni, count(*) from duenio d inner join perro p on d.D_DNI = p.D_DNI group by d.d_dni having count(*)=1) t limit 1);
        if adoptanteDni is not null THEN
            insert into perro (D_DNI, P_codigo, P_nombre, P_raza) values (adoptanteDni, perroCodigo, perroNombre, perroRaza);
            delete from abandono where id = abandonoId;
        ELSE
            set _eof = true;
        end if;
        fetch cur into abandonoId, perroCodigo, perroNombre, perroRaza;
    end while;
    close cur;

    select concat('quedan ', count(*), ' perros sin adoptar') from abandono;

END 

call adoptarTodosLosPerros ();


