Algoritmo sin_titulo
	
	Definir TOPE Como Entero
	TOPE = 15
	Definir i, numeros , max Como Entero
	Dimensionar numeros(TOPE)
	
	Para i=0 Hasta TOPE-1 Hacer
		Escribir "Ingrese el número en posición ", i
		Leer numeros(i)
	FinPara
	
	max = -999999
	Para i=0 Hasta TOPE-1 Hacer
		Si numeros(i)>max Entonces
			max = numeros(i)
		FinSi
	FinPara
	
	Escribir "El número mas grande es ", max
	
FinAlgoritmo
