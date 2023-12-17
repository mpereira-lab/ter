funcion cambio(p, indice)
	p[indice]=indice
FinFuncion
Algoritmo CAMBIAZO
	definir i, j Como Entero
	dimension j(5)
	j[3]=10
	para i=1 hasta 5 Hacer
		cambio(j,i)
	FinPara
	escribir j[3]
FinAlgoritmo
