Algoritmo sin_titulo
	Definir importe, descuento, importeFinal Como Real
	Escribir  "Ingrese importe final"
	Leer importe
	descuento = 0
	
	Si importe>500 Entonces
		descuento = 5
	FinSi
	Si importe>1000 Entonces
		descuento = 11
	FinSi
	Si importe>7000 Entonces
		descuento = 18
	FinSi
	Si importe>15000 Entonces
		descuento = 25
	FinSi
	importeFinal = importe - (importe * descuento /100)
	
	Escribir "El importe final es ", importeFinal

FinAlgoritmo
