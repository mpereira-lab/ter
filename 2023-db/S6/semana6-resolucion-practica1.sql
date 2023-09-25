//1. Usar la tabla “libro” y “libroautor” para mostrar el titulo del libro y la cantidad de autores que tiene cada uno. “Ayuda” =>  se debe agrupar por libro (usar group by) y la proyección además del título tiene la función  count.
select l.titulo, count(la.codautor) from libro l inner join libroautor la on l.codlibro=la.codlibro group by l.titulo;

//2. Mostrar el nombre, apellido y teléfono de los socios que devolvieron los libros en la fecha tope.
select distinct s.nombre, s.apellido, s.tel from socio s inner join prestamo p on s.codsocio=p.codsocio and fdevolucion<=ftope;

//3. Mostrar los títulos de los libros que tengan algún ejemplar deteriorado. “Ayuda”  => para estar deteriorado el ejemplar, el dominio del atributo deteriorado debe ser verdadero (o 1). En caso que el libro tenga más de un deteriorado se repetirá entonces usa el distinct.
select distinct l.titulo from libro l inner join ejemplar e on l.codlibro=e.codlibro where e.deteriorado=1;

//4. Mostrar el nombre y apellido de los autores de los ejemplares número 41 y 78. “Nota”  => deben usar autor, libroautor,  libro y ejemplar.
select distinct a.nombre, a.apellido 
	from autor a inner join libroautor la on a.codautor=la.codautor
	inner join libro l on la.codlibro=l.codlibro
	inner join ejemplar e on e.codlibro=l.codlibro
	where e.idEjem in (41, 78);

// 5. Mostrar un listado de los préstamos informando número de préstamo, fecha de préstamo, código de socio y teléfono del socio.

select p.nprestamo, p.fprestamo, p.codsocio, s.tel from prestamo p inner join socio s on p.codsocio=s.codsocio;

