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
