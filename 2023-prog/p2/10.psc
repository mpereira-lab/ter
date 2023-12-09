funcion s = incremento(v, i)
	definir s, a Como Entero;
	s = v[0] + i;
FinFuncion

Algoritmo sin_titulo
	definir v , i, suma Como Entero
	Dimension v[1];
	v[0] = 0;
	para i = 1 hasta 3 Hacer
		v[0] = v[0] + incremento(v, i)
	FinPara
	escribir "El valor final es:", v[0]
FinAlgoritmo
