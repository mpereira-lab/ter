Algoritmo sin_titulo
	
	Definir TOPE Como Entero
	TOPE = 3
	Definir i, numeros , max, maxi Como Entero
	Dimensionar numeros(TOPE)
	
	Para i=0 Hasta TOPE-1 Hacer
		Escribir "Ingrese el n�mero en posici�n ", i
		Leer numeros(i)
	FinPara
	
	max = -999999
	Para i=0 Hasta TOPE-1 Hacer
		Si numeros(i)>max Entonces
			max = numeros(i)
			maxi=i
		FinSi
	FinPara
	
	Escribir "El n�mero mas grande es ", max, " y se encuentra en la posici�n ", maxi
	
FinAlgoritmo
