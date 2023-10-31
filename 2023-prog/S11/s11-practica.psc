
Funcion area = CalcularAreaCirculo (radio)
	Definir  area Como Real
	area = PI * radio ^2
FinFuncion

Funcion perimetro = CalcularPerimetroRectangulo (base, altura)
	definir perimetro Como Real
	perimetro = 2*(base+altura)
FinFuncion

Funcion menu = LeerMenu
	definir menu Como Entero
	menu = 0
	Repetir 
		
		Escribir "1-Calcular area de circulo"
		Escribir "2-Calcular perímetro de rectángulo"
		Escribir "0-Salir"
		Escribir "Elija opcion: "
		leer menu
	Mientras Que  menu<0 o menu>2 
FinFuncion

Funcion LeerDatosCirculo(radio Por Referencia)
	Repetir 
		Escribir "Ingrese radio:"
		leer radio
	Mientras Que  radio<=0
FinFuncion

Funcion LeerDatosRectangulo(base Por Referencia, altura Por Referencia)
	Repetir 
		Escribir "Ingrese base:"
		leer base
		Escribir "Ingrese altura:"
		leer altura
	Mientras Que  base<=0 o altura<=0
FinFuncion

Algoritmo sin_titulo
	
	Definir menu Como Entero
	definir radio, base, altura  Como Real
	
	menu = LeerMenu()
	
	mientras menu<>0 Hacer
		si menu=1 Entonces
			LeerDatosCirculo(radio)
			Escribir "El area del circulo es ", CalcularAreaCirculo(radio)
		SiNo
			LeerDatosRectangulo(base, altura)
			Escribir "El perimetro del rectangulo es ", CalcularPerimetroRectangulo(base, altura)
		FinSi
		menu = LeerMenu()
	FinMientras
FinAlgoritmo
