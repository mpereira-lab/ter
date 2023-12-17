Algoritmo sin_titulo
	
	Definir entradas, cantVendida Como Entero
	
	entradas = 60
	
	cantVendida = -1
	mientras entradas>0 y cantVendida<>0 Hacer
		
		Escribir "Ingrese cantidad de entradas"
		Leer cantVendida
		
		si (cantVendida>entradas) entonces
			Escribir "Solo hay disponibles ", entradas
		SiNo
			entradas = entradas - cantVendida
		FinSi
		
	FinMientras
	
	Escribir "Aun quedan disponibles ", entradas
	
	
FinAlgoritmo
