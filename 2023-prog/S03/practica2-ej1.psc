Algoritmo sin_titulo
	Definir sueldo, aumento Como Real
	Definir categoria Como Caracter
	Escribir "Sueldo: "
	Leer sueldo
	Escribir "Categoria: "
	Leer categoria
	
	aumento = 0
	Segun categoria Hacer
		"A":
			aumento = sueldo * 18 / 100
		"B":
			aumento = sueldo * 12 / 100
		"C":
			aumento = sueldo * 9 / 100
		"D":
			aumento = sueldo * 6 / 100
	FinSegun
	
	Si aumento = 0 Entonces
		Escribir "Categoría no encontrada: ", categoria
	SiNo
		Escribir "Sueldo incrementado es ", sueldo + aumento
	FinSi
	
FinAlgoritmo
