-- 1. Listar a todos los socios registrados en la biblioteca.

SELECT * FROM socio;

-- 2. Mostrar los números de ejemplares de los libros deteriorados.

SELECT NEjemplar 
FROM ejemplar
WHERE Deteriorado = 1;

-- 3.  Listar los títulos de libros de la editorial McGRAW-HILL

SELECT Titulo FROM libro
WHERE Editorial = 'McGRAW-HILL';

-- 4.  Contar la cantidad de ejemplares del libro con código 120.

SELECT COUNT(*) as cantidad
FROM ejemplar
WHERE CodLibro = 120;

-- 5.  Listar los títulos y editoriales de los libros ordenados alfabéticamente.

SELECT Titulo, Editorial
FROM libro
ORDER  BY Titulo, Editorial;

-- 6. Mostrar los datos del último autor ingresado

SELECT * FROM autor
WHERE codautor = (SELECT max(codautor) FROM autor);

SELECT * FROM AUTOR ORDER BY CODAUTOR DESC LIMIT 1;