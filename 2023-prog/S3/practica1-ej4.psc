Algoritmo sin_titulo
	Definir precioInicial, precioFinal, kgTotal Como Real
	Definir tipo Como Caracter
	Definir tamanio Como Entero
	Escribir  "Ingrese precio inicial del kg"
	Leer precioInicial
	Escribir  "Ingrese cantidad de kg de uvas"
	Leer kgTotal
	Escribir  "Ingrese tipo de uva (A o B)"
	Leer tipo
	tipo = Mayusculas(tipo)
	Escribir "Ingrese tamaño de uva (1 o 2)"
	Leer tamanio
	Si tipo == "A" Entonces
		Si tamanio == 1 Entonces
			precioFinal = (precioInicial + 2.80) * kgTotal
		SiNo
			precioFinal = (precioInicial + 2.30) * kgTotal
		FinSi
	SiNo
		Si tamanio == 1 Entonces
			precioFinal = (precioInicial - 1.30) * kgTotal
		SiNo
			precioFinal = (precioInicial - 1.50) * kgTotal
		FinSi
	FinSi
	
	Escribir "El precioFinal es ", precioFinal

FinAlgoritmo
