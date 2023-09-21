Algoritmo sin_titulo
	
	Definir e, v1, v2, v3,v4,v5 Como Entero
	Definir esGenerala Como Logico
	e=0
	esGenerala = Falso
	Repetir
		e = e + 1
		v1 = aleatorio(1,6)
		v2 = aleatorio(1,6)
		v3 = aleatorio(1,6)
		v4 = aleatorio(1,6)
		v5 = aleatorio(1,6)
		Escribir "Ejecución número ", e, " valores de los dados = ", v1, ", ",v2, ", ",v3, ", ",v4, ", ",v5
		
		Si v1=v2 y v2=v3 y v3=v4 y v4=v5 Entonces
			Escribir "¡Se ha obtenido GENERALA!"
			esGenerala = Verdadero
		FinSi
		
	Mientras Que no esGenerala

FinAlgoritmo
