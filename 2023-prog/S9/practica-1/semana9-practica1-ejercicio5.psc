Algoritmo sin_titulo
	
	Definir palabra Como caracter
	Definir TOPE, i, longitudPalabra Como Entero
	Definir esPalindromo como Logico
	
	TOPE = 20
	
	Dimensionar palabra(TOPE)
	
	i=0
	Repetir
		Escribir "Ingrese caracter:"
		Leer palabra(i)
		i=i+1
	Mientras Que i<TOPE y palabra(i-1)<>""
	
	longitudPalabra = i -1
	
	escribir "long", longitudPalabra
	
	Si longitudPalabra>0 Entonces
		esPalindromo = Verdadero
		i=0
		Mientras i < Trunc(longitudPalabra/2) y esPalindromo Hacer
			Si palabra(i) <> palabra(longitudPalabra-i-1) Entonces
				esPalindromo = Falso
			FinSi
			i = i + 1
		FinMientras
		si esPalindromo Entonces
			Escribir  "La palabra es palíndromo"
		SiNo
			Escribir  "La palabra no es palíndromo"
		FinSi
	SiNo
		Escribir "No ingresó ninguna palabra"
	FinSi
	
	
	
FinAlgoritmo

