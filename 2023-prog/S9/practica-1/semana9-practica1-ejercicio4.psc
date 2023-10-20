Algoritmo sin_titulo
	
	Definir tiempoMin, tiempoSeg, sumaTiempoSeg Como Real
	Definir TOPE, i Como Entero
	
	TOPE = 12
	
	Dimensionar tiempoMin(TOPE), tiempoSeg(tope)
	
	Para i=0 Hasta TOPE-1 Hacer
		Escribir "Ingrese tiempo en minutos de miembro ", i
		Leer tiempoMin(i)
	FinPara
	
	Para i=0 Hasta TOPE-1 Hacer
		tiempoSeg(i) = tiempoMin(i) * 60
	FinPara
	
	sumaTiempoSeg = 0
	Para i=0 Hasta TOPE-1 Hacer
		Escribir "Tiempo en segundos de miembro ", i, " es ", tiempoSeg(i)
		sumaTiempoSeg = sumaTiempoSeg + tiempoSeg(i)
	FinPara
	
	Escribir "Tiempo promedio es ", sumaTiempoSeg / TOPE
	
FinAlgoritmo

