funcion calculo(p,c,tot por referencia)
	tot=p*c
FinFuncion

Algoritmo sin_titulo
	definir c Como Entero
	definir p, totalLinea, totalFactura como Real
	totalLinea = 0
	totalFactura = 0
	Repetir
		escribir "Ingrese la cantidad vendida"
		leer c
		si c<>0 entonces 
			escribir "Ingrese el precio unitario"
			leer p
			calculo(c,p,totalLinea)
			totalFactura = totalFactura + totalLinea
		FinSi
	Hasta Que c=0
	Escribir "El monto total de la factura es: ", totalFactura
FinAlgoritmo
