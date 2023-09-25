Algoritmo sin_titulo
	
	Definir nro1, nro2, aux, res, i Como Entero
	
	Escribir "Ingrese el primer numero"
	Leer nro1
	Escribir "Ingrese el segundo numero"
	Leer nro2
	//optimizar for
	si nro1>nro2 entonces
		aux = nro1
		nro1 = nro2
		nro2  = aux
	FinSi
	res = 0
	para i = 1 Hasta nro1 Hacer
		res = res + nro2
	FinPara
	
	Escribir "El resultado es ", res
	
FinAlgoritmo
