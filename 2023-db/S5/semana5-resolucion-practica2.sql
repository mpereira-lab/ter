//1. Listar a todos los socios registrados en la biblioteca.
select * from socio;

//2. Mostrar los números de ejemplares de los libros deteriorados.
select nejemplar from ejemplar where Deteriorado;

//3. Listar los títulos de libros de la editorial McGRAW-HILL
select titulo from libro where Editorial="McGRAW-HILL"; 

//4. Contar la cantidad de ejemplares del libro con código 120
select count(*) from ejemplar where CodLibro=120;

//5. Listar los títulos y editoriales de los libros ordenados alfabéticamente
select titulo, editorial from libro order by titulo, editorial; 

//6. Mostrar los datos del último autor ingresado
SELECT * FROM AUTOR ORDER BY CODAUTOR DESC LIMIT 1;
