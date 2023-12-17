Algoritmo sin_titulo
	
	Definir nroOrden, cantProductos, cantVentas Como Entero
	Definir precioUnitario, importeTotal, importeVenta Como Real
	
	nroOrden = -1
	importeTotal=0
	cantVentas = 0
	
	Mientras nroOrden<>0 Hacer
		
		Escribir "Ingrese nro de orden"
		Leer nroOrden
		
		cantProductos = -1
		importeVenta = 0
		Mientras nroOrden<>0 y cantProductos<>0 Hacer
			Escribir "Ingrese cantidad de productos"
			Leer  cantProductos
			Si cantProductos<>0 Entonces
				Escribir "Ingrese importe unitario"
				Leer precioUnitario
				importeVenta=importeVenta+(cantProductos * precioUnitario)
			FinSi
		FinMientras
		
		si nroOrden<>0 entonces
			Escribir "Importe de la venta ", nroOrden, " es ", importeVenta
			importeTotal=importeTotal+importeVenta
			cantVentas=cantVentas+1
		FinSi
		
	FinMientras
	
	Escribir "Importe del dia ", importeTotal
	Escribir "Cantidad de ventas del dia ", cantVentas
	
	si cantVentas>0 Entonces
		escribir "Promedio es ", importeTotal/cantVentas
	SiNo
		Escribir "El promedio no se puede calcular porque no hubo ventas"
	FinSi
	
	
		

FinAlgoritmo
