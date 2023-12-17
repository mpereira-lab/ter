Algoritmo sin_titulo
	Definir nombreLibro, genero, nombreLibroConMasPaginas Como Caracter
	definir cantPaginasDelLibro, estante, cantPaginasLibroConMasPaginas, cantInfantil, cantNovela, cantHistoria Como Entero
	
	nombreLibro = ""
	cantInfantil = 0
	cantHistoria = 0
	cantNovela = 0
	Para estante=1 Hasta 5 Hacer
		
		Escribir "Ingresos para el estante ", estante
		
		cantPaginasLibroConMasPaginas = 0
		
		Repetir
			Escribir "Nombre de libro (FIN para finalizar)"
			Leer nombreLibro
		Mientras que nombreLibro==""
		
		Mientras Mayusculas(nombreLibro)<>"FIN" Hacer
			
			Repetir
				Escribir "Ingrese género (I=Infantil, N=Novela, H=Historia)"
				leer genero
			Mientras Que Mayusculas(genero)<>"I" y Mayusculas(genero)<>"N" y Mayusculas(genero)<>"H"
			
			Segun Mayusculas(genero) Hacer
				"I":
					cantInfantil = cantInfantil + 1
				"N":
					cantNovela = cantNovela + 1
				"H":
					cantHistoria = cantHistoria + 1
			FinSegun
			
			Repetir
				Escribir "Ingrese cantidad de páginas"
				leer cantPaginasDelLibro
			Mientras Que Mayusculas(genero)<>"I" y Mayusculas(genero)<>"N" y Mayusculas(genero)<>"H"
			
			Si cantPaginasDelLibro>cantPaginasLibroConMasPaginas Entonces
				cantPaginasLibroConMasPaginas = cantPaginasDelLibro
				nombreLibroConMasPaginas = nombreLibro
			FinSi
			
			Repetir
				Escribir "Nombre de libro (FIN para finalizar)"
				Leer nombreLibro
			Mientras que nombreLibro==""			
		FinMientras
		
		si cantPaginasLibroConMasPaginas>0 Entonces
			Escribir "El libro con más páginas del estante ", estante, " es ", nombreLibroConMasPaginas, " y contiene ", cantPaginasLibroConMasPaginas, " páginas"
		SiNo
			escribir "No se han ingresado libros en el estante ",estante
		FinSi
		
		
	FinPara
	
	Escribir "Cantidad de libros infantil:", cantInfantil
	Escribir "Cantidad de libros novela:", cantNovela
	Escribir "Cantidad de libros historia:", cantHistoria
	Escribir "Promedio de libros por estate:", TRUNC((cantInfantil + cantNovela + cantHistoria) / 5)
FinAlgoritmo
