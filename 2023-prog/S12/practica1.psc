Algoritmo sin_titulo
	definir A, TOPE_F, TOPE_C como entero
	
	TOPE_F = 5
	TOPE_C = 10
	Dimension A(TOPE_F, TOPE_C)
	
	ingresarMatriz(A, TOPE_F, TOPE_C)
	ordenarMatriz(A, TOPE_F, TOPE_C)
	mostrarMatriz(A, TOPE_F, TOPE_C)
	
FinAlgoritmo

Funcion ingresarMatriz(matriz, cantFilas, cantCols)
	definir i,j Como Entero
	para i=0 hasta cantFilas - 1 hacer
		para j=0 hasta cantCols -1 Hacer
			matriz(i, j) = Aleatorio(10, 99)
		FinPara
	FinPara
FinFuncion

Funcion ordenarMatriz(matriz, cantFilas, cantCols)
	definir fila Como Entero
	Dimension fila(cantCols)

	definir i,j Como Entero
	para i=0 hasta cantFilas - 1 hacer
		para j=0 hasta cantCols -1 Hacer
			fila(j) = matriz(i, j)
		FinPara
		ordenarVector(fila, cantCols)
		para j=0 hasta cantCols -1 Hacer
			matriz(i, j) = fila(j)
		FinPara
	FinPara
FinFuncion

Funcion mostrarMatriz(matriz, cantFilas, cantCols)
	definir i,j Como Entero
	para i=0 hasta cantFilas - 1 hacer
		para j=0 hasta cantCols -1 Hacer
			escribir sin saltar matriz(i, j) , " "
		FinPara
		escribir ""
	FinPara
FinFuncion

Funcion ordenarVector(vector, cantElementos)
	definir i, aux, posMenor Como Entero
	para i=0 hasta cantElementos -2  Hacer
		posMenor = menor(vector, i, cantElementos)
		aux = vector(posMenor)
		vector(posMenor) = vector(i)
		vector(i) = aux
	FinPara

FinFuncion

Funcion pos=menor(v, ini, tope)
	definir pos, i Como Entero
	pos = ini
	Para i=pos hasta tope-1 Hacer
		Si v(i)<v(pos) Entonces
			pos = i
		FinSi
	FinPara
FinFuncion
