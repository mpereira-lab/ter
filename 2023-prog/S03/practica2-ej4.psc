Algoritmo sin_titulo
	definir yarda, pie, cm, pulgada, transformar, ml Como Real
	definir menu Como entero
	definir medidaOriginal Como Caracter
	
	yarda = 914.4
	pie = 304.8
	cm = 10
	pulgada = 25.4
	
	escribir "1-Yarda"
	escribir "2-Pies"
	escribir "3-Centímetros" 
	escribir "4-Pulgadas"
	escribir "Ingrese unidad de medida a transformar a milimetros (1-4):"
	leer menu
	
	escribir "Ingrese cantidad a transformar: "
	leer transformar
	ml = 0
	segun menu hacer
		1: 
			ml = transformar * yarda
			medidaOriginal = "yardas"
		2: 
			ml = transformar * pie
			medidaOriginal = "pies"
		3: 
			ml = transformar * cm
			medidaOriginal = "centimetros"
		4: 
			ml = transformar * pulgada
			medidaOriginal = "pulgadas"
	FinSegun
	
	si menu >=1 y menu<=4 Entonces
		escribir transformar, " ", medidaOriginal, " equivalen a ", ml
	sino
		Escribir "opcion incorrecta ", menu
	FinSi
	
FinAlgoritmo
