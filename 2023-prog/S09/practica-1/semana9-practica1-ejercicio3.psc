Algoritmo sin_titulo
	
	Definir peso, tarifa Como Real
	Definir TOPE, i Como Entero
	
	TOPE = 20
	
	Dimensionar peso(TOPE), tarifa(tope)
	
	Para i=0 Hasta TOPE-1 Hacer
		Escribir "Ingrese peso "
		Leer peso(i)
	FinPara
	
	Para i=0 Hasta TOPE-1 Hacer
		Si peso(i)<2 Entonces
			tarifa(i) = 500.50 * peso(i)
		SiNo
			tarifa(i) = 400 * peso(i)
		FinSi
	FinPara
	
	Para i=0 Hasta TOPE-1 Hacer
		Escribir "Paquete con ", peso(i), " tiene tarifa ", tarifa(i)
	FinPara
	
FinAlgoritmo
