Algoritmo sin_titulo
	
	definir nombres Como Caracter
	definir edades, TOPE, maxEdad, cantAlumnos, i como entero
	
	TOPE = 20
	dimension nombres(TOPE)
	dimension edades(TOPE)
	
	cantAlumnos = 0
	maxEdad = 0
	
	Repetir
		Escribir "Ingrese nombre del alumno:"
		Leer nombres(cantAlumnos)
		Si nombres(cantAlumnos)<>"*" Entonces
			Escribir "Ingrese la edad"
			repetir
				leer edades(cantAlumnos)
				si edades(cantAlumnos)<0 Entonces
					Escribir "Edad incorrecta"
				FinSi
			Hasta Que edades(cantAlumnos)>0
			si edades(cantAlumnos)>maxEdad Entonces
				maxEdad = edades(cantAlumnos)
			FinSi
			cantAlumnos = cantAlumnos + 1
		FinSi
	Mientras que cantAlumnos<TOPE y nombres(cantAlumnos-1)<>"*" 
	
	Escribir "Hay ", cantAlumnos, " alumnos"
	Escribir "La edad m�xima es ", maxEdad
	Escribir "Los alumnos con edad m�xima son: "
	para i=0 hasta cantAlumnos -1 Hacer
		si maxEdad=edades(i) Entonces
			escribir nombres(i)
		FinSi
	FinPara
	
	si cantAlumnos=0 Entonces
		escribir "No ha ingresado ning�n alumno"
	SiNo
		
	FinSi

	
	
	
	
FinAlgoritmo
