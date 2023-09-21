Algoritmo sin_titulo
	Definir nro1, nro2, nro3 Como Entero
	Escribir "Ingrese el primer numero: "
	Leer nro1
	Escribir "Ingrese el segundo numero:"
	leer nro2
	Escribir "Ingrese el tercer numero:"
	leer nro3
	Si nro1<>nro2  Entonces
		Si nro2<>nro3 Entonces
			si nro1>nro2 Entonces
				si nro1>nro3 Entonces
					Escribir "El mayor es ", nro1
				SiNo
					Escribir "El mayor es ", nro3
				FinSi
			SiNo
				Si nro2>nro3 Entonces
					Escribir "El mayor es ", nro2
				SiNo
					Escribir "El mayor es ", nro3
				FinSi
			FinSi
		SiNo
			Escribir "Los numeros no pueden ser iguales"
		FinSi
	SiNo
			Escribir "Los numeros no pueden ser iguales"
	FinSi
		
FinAlgoritmo
