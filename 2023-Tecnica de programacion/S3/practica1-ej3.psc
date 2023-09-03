Algoritmo sin_titulo
	Definir nro1, nro2, suma, resta, mult, div Como Real
	Escribir "Ingrese el primer numero: "
	Leer nro1
	Escribir "Ingrese el segundo numero:"
	Leer nro2
	suma = nro1 + nro2
	Escribir "La suma es ", suma
	resta = nro1 - nro2
	Escribir "La resta es ", resta
	mult = nro1 * nro2
	Escribir "La multiplicacion es ", mult
	Si nro2<>0 Entonces
		div = nro1 / nro2
		Escribir "La division es ", div
	SiNo
		Escribir "NO se puede ejecutar la division porque el segundo numero es cero (0) "
	FinSi
	
	
FinAlgoritmo
