Algoritmo facturacion
	
	Definir cantMb, cantMbMax, cli50 Como Entero
	Definir tipoAbono, codCli, codCliCantMbMax Como Caracter
	definir sumaAbonoA, sumaAbonoB, sumaAbonoC, abono Como Real
	
	Escribir "Ingrese código de cliente, enter para finalizar"
	leer codCli
	
	cantMbMax = 0
	codCliCantMbMax = ""
	cli50 = 0
	
	Mientras codCli<>"" Hacer
		
		Repetir
			Escribir "Ingrese tipo de abono (A, B, C)"
			Leer tipoAbono
		Mientras Que Mayusculas(tipoAbono)<>"A" y Mayusculas(tipoAbono)<>"B" y Mayusculas(tipoAbono)<>"C" 
		
		
		Repetir
			Escribir "Ingrese cantidad de MB consumidos"
			Leer cantMb
		Mientras Que cantMb<=0 
		
		
		Segun tipoAbono Hacer
			"A":
				abono = 0.5 * cantMb
			"B":
				si cantMb<=5 Entonces
					abono = cantMb * 1
				SiNo
					abono = (5 * 1) + (cantMb - 5) * 0.75
				FinSi
			"C":
				si cantMb<=10 Entonces
					abono = cantMb * 1
				SiNo
					abono = 10
				FinSi
		FinSegun
		
		si cantMbMax<cantMb Entonces
			cantMbMax = cantMb
			codCliCantMbMax = codCli
		FinSi
		
		si cantMb>50 Entonces
			cli50 = cli50 + 1
		FinSi
		
		Escribir "Importe ", abono
		
		Escribir "Ingrese código de cliente, enter para finalizar"
		leer codCli
	FinMientras
	
	si cantMbMax>0 Entonces
		Escribir "El cliente que consumió mas datos es ", codCliCantMbMax, " y consumió ", cantMbMax, " mb"
		Escribir "La cantidad de clientes con mas de 50 mb es ", cli50
	SiNo
		Escribir "No se han ingresado datos. No se puede saber cual es el cliente con mayor cantidad de consumo"
	FinSi
	
	
FinAlgoritmo
