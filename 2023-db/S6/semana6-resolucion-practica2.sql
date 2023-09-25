//1. Mostrar los datos del primer socio de la biblioteca. “Ayuda”=>  el primer socio es el que tiene el código menor, entonces usá la función “min” y utilizá esa sentencia como subconsulta para proyectar lo requerido.

select * from socio s where s.codsocio = (select min(codsocio) from socio);

//2. Mostrar los datos de los últimos prestamos de libros “Ayuda” => los últimos préstamos corresponden a la fecha más alta, usá la función “max” y utilizá esa subconsulta.

select * from prestamo where ftope=(select max(ftope) from prestamo);

//3. Mostrar título y fecha de edición de los libros del autor Hector Arena ordenado por título, “Nota” => > utilizá una subconsulta en el from.
select l.titulo, l.fedicion 
	from libro l 
	inner join libroautor la on l.codlibro=la.codlibro 
	inner join (select codautor from autor where nombre='Hector' and apellido='Arena') a on la.codautor=a.codautor 
	order by l.titulo;

//4. Mostrar los datos de los socios que no llevaron libros prestados “Ayuda” =>  armá una consulta con los socios que tienen préstamo. Los socios que no llevaros libros son los que no están en ese conjunto (utiliza el not in).

select * from socio where codsocio not in (select codsocio from prestamo);

5. Mostrar el nombre y apellido de los autores de los ejemplares número 41 y 78.”Nota” =>  esta consulta figura en la actividad 1, en este caso utiliza subconsultas.

select distinct a.nombre, a.apellido 
	from autor a inner join libroautor la on a.codautor=la.codautor
	inner join libro l on la.codlibro=l.codlibro
	inner join (select codlibro from ejemplar where idEjem in (41, 78)) e on e.codlibro=l.codlibro;

