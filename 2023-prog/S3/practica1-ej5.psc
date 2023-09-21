Algoritmo sin_titulo
	Definir importe, descuento, importeFinal Como Real
	Escribir  "Ingrese importe final"
	Leer importe
	descuento = 0
	
	Si importe>500 Entonces
		descuento = 5
	SiNo
		Si importe>1000 Entonces
			descuento = 11
		SiNo
			Si importe>7000 Entonces
				descuento = 18
			SiNo
				Si importe>15000 Entonces
					descuento = 25
				FinSi
			FinSi
		FinSi
	FinSi
	
	importeFinal = importe - (importe * descuento /100)
	
	Escribir "El importe final es ", importeFinal
	
FinAlgoritmo
