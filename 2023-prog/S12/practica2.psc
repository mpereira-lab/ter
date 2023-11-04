Algoritmo sin_titulo
	
	definir num, factorial como entero
	
	
	num  = ingresarNumero()
	escribir "El factorial de ", num, " es ", calcularFactorial(num)
	
FinAlgoritmo

Funcion factorial = calcularFactorial(num)
	Definir factorial, i Como Entero
	factorial = 1
	
	Para i = 1 Hasta num hacer
		factorial = factorial * i
	FinPara
	
FinFuncion

Funcion num = ingresarNumero
	definir num como entero
	escribir "Ingrese número para calcular su factorial: "
	leer num
	mientras num<0 Hacer
		escribir "Ingrese número para calcular su factorial: "
		leer num
	FinMientras
FinFuncion
