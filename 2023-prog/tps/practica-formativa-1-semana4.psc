Algoritmo cuento
	
	Definir pregunta Como Caracter
	Definir respuesta Como Caracter
	Definir primeraVez Como Logico
	
	pregunta = "¿ Queres que te cuente el cuento de la buena pipa ?"
	Escribir pregunta
	Leer respuesta
	respuesta = respuesta
	Mientras Mayusculas(respuesta)<>"HECHIZO" Hacer
		Escribir "Yo no dije ", respuesta
		Escribir "Yo dije si ", pregunta
		Leer respuesta
	FinMientras
	
FinAlgoritmo
