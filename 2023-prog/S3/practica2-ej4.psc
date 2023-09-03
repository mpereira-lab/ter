Algoritmo sin_titulo
	Definir  importeUnitario, iva, descuento, importe Como Real
	Definir medioPago Como Entero
	Definir cantidadImpresoras Como Entero
	
	importeUnitario = 50500
	iva = 10.50
	importe = importeUnitario + (importeUnitario * iva / 100)
	
	Escribir "1-Efectivo"
	Escribir "2-Tarjeta de credito"
	Escribir "3-MercadoPago"
	Leer medioPago
	
	descuento = 0
	
	Segun medioPago Hacer
		1:
			descuento = 10
		2:
			descuento = 5
		3:
			descuento = 15
	FinSegun
	
	si descuento == 0 Entonces
		Escribir "Medio de pago no es correcto", medioPago
	SiNo
		Escribir "Ingrese cantidad de impresoras"
		Leer cantidadImpresoras
		Escribir "Cantidad de impresoras ", cantidadImpresoras
		Escribir "Precio impresora (con iva) ", importe
		Escribir "Total sin descuento ", cantidadImpresoras*importe
		Escribir "Forma de pago ", medioPago
		Escribir "Descuento ", descuento, "%"
		Escribir "Total a pagar ", (cantidadImpresoras * importe) - (cantidadImpresoras * importe) * descuento / 100
	FinSi
	
	
	
	
FinAlgoritmo
