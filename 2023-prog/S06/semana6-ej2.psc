Algoritmo sin_titulo
	
	
	Definir aciertos, numeroAnterior, numeroActual Como Entero
	Definir opcion Como Caracter
	Definir continua como Logico
	
	Escribir "La computadora generar� un n�mero aleatorio y ser� mostrado por pantalla. Usted deber� predecir si el pr�ximo n�mero a generar por la computadora ser� mayor, menor o igual al primer n�mero generado. Cada acierto vale un punto. El juego termina cuando usted no haya acertado" 
	Escribir ""
	Escribir ""
	aciertos = 0
	continua = Verdadero
	Repetir
		
		numeroAnterior = Aleatorio(1, 109)
		Escribir "El n�mero generado es ", numeroAnterior
		
		repetir 
			Escribir "� Como ser� el pr�ximo n�mero ? Escriba mayor, menor o igual"
			Leer opcion
		Mientras Que Mayusculas(opcion)<>"MAYOR" y Mayusculas(opcion)<>"MENOR" y Mayusculas(opcion)<>"IGUAL"
		
		numeroActual = Aleatorio(1, 109)
		
		Escribir "El nuevo n�mero generado es ", numeroActual
		
		Si (Mayusculas(opcion)=="MAYOR" y numeroActual>numeroAnterior) o (Mayusculas(opcion)=="MENOR" y numeroActual<numeroAnterior) o (Mayusculas(opcion)=="IGUAL" y numeroActual==numeroAnterior) Entonces
			Escribir "Acierto!"
			aciertos = aciertos + 1
		sino 
			Escribir "Lo siento. No ha acertado. Juego terminado"
			continua = Falso
		FinSi
		
	Mientras Que continua
	
	Escribir "Usted ha tenido ", aciertos, " aciertos"
	
FinAlgoritmo
