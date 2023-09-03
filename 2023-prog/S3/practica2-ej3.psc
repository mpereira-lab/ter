Algoritmo sin_titulo
	
	Definir cafeTipo, sandwichTipo como  entero
	Definir cafeImporte, sandwichImporte Como Real
	
	Escribir "1-Chico (85.60)"
	Escribir "2-Americano (120)"
	Escribir "3-Jarrito (135.90)"
	Escribir "Elija el tipo de cafe (1 a 3)"
	
	Leer cafeTipo
	Escribir "1-Simple Comun (170)"
	Escribir "2-Simple Especial (187.50)"
	Escribir "3-Triple Comun (250.45)"
	Escribir "4-Triple Especial (300)"
	Escribir "5-Triple Vegetariano (285.90)"
	Escribir "Elija el tipo de sandwich (1 a 5)"
	Leer sandwichTipo
	
	cafeImporte = 0
	Segun cafeTipo Hacer
		1:
			cafeImporte = 85.60
		2:
			cafeImporte = 120
		3:
			cafeImporte = 135.90
	FinSegun
	
	sandwichImporte = 0
	Segun sandwichTipo Hacer
		1:
			sandwichImporte = 170
		2:
			sandwichImporte = 187.50
		3:
			sandwichImporte = 250.45
		4:
			sandwichImporte = 300
		5:
			sandwichImporte = 285.90
	FinSegun
	
	
	Si cafeImporte == 0 Entonces
		Escribir "Tipo de cafe no válido: ", cafeTipo
	SiNo 
		Si sandwichImporte == 0 Entonces
			Escribir "Tipo de sandwich no válido: ", sandwichTipo
		SiNo
			Escribir "cafe ", cafeImporte
			Escribir "sandwich ", sandwichImporte
			Escribir "importe total es ", sandwichImporte + cafeImporte
		FinSi
	FinSi
	
FinAlgoritmo
