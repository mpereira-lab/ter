Algoritmo sin_titulo
	Definir  importeSinIva, importeConIva, porcentajeIva, porcentajeDescuento Como Real
	Definir medioPago Como Entero
	Definir cantidadImpresoras Como Entero
	
	importeSinIva = 50500
	porcentajeIva = 10.50
	importeConIva = importeSinIva + (importeSinIva * porcentajeIva / 100)
	
	Escribir "1-Efectivo"
	Escribir "2-Tarjeta de credito"
	Escribir "3-MercadoPago"
	Leer medioPago
	
	porcentajeDescuento = 0
	
	Segun medioPago Hacer
		1:
			porcentajeDescuento = 10
		2:
			porcentajeDescuento = 5
		3:
			porcentajeDescuento = 15
	FinSegun
	
	si porcentajeDescuento == 0 Entonces
		Escribir "Medio de pago no es correcto", medioPago
	SiNo
		Escribir "Ingrese cantidad de impresoras"
		Leer cantidadImpresoras
		Escribir "Cantidad de impresoras ", cantidadImpresoras
		Escribir "Precio impresora (con iva) ", importeConIva
		Escribir "Total sin descuento ", cantidadImpresoras*importeConIva
		Escribir "Forma de pago ", medioPago
		Escribir "Descuento ", porcentajeDescuento, "%"
		Escribir "Total a pagar ", (cantidadImpresoras * importeConIva) - (cantidadImpresoras * importeConIva) * porcentajeDescuento/ 100
	FinSi
	
	
	
	
FinAlgoritmo
