Algoritmo sin_titulo
	definir numero, numeroOpuesto Como Entero
	escribir "Introduzca n�mero del dado: "
	Leer  numero
	
	numeroOpuesto = 0
	Segun numero Hacer
		1:
			numeroOpuesto = 6
		2:
			numeroOpuesto = 5
		3:
			numeroOpuesto = 4
		4:
			numeroOpuesto = 3
		5:
			numeroOpuesto = 2
		6:
			numeroOpuesto = 1
	FinSegun
	si numeroOpuesto > 0 Entonces
		Escribir "El n�mero opuesto es ", numeroOpuesto
	SiNo
		Escribir"N�mero incorrecto"
	FinSi
	
FinAlgoritmo
