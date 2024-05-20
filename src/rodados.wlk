
class Corsa{
	var property color
	
	method capacidad() = 4
	method velocidadMax() = 150
	method peso() = 1300
	
	
}

class Renault{
	
	var property cuentaConUnTanqueDeGas = false
	
	method capacidad() = if(!cuentaConUnTanqueDeGas) 4 else 3 
	method velocidadMax() = if(!cuentaConUnTanqueDeGas) 110 else 130 
	method peso() = if(cuentaConUnTanqueDeGas) 1200 + 150 else 1200
	method color() = "azul"
	
}

object traffic{
	
	var interiorComodo = null 
	var motorBueno = null
	
	method capacidad() = if(interiorComodo) 5 else 12 
	method velocidadMax() =  if(motorBueno) 130 else 80
	method peso()=  self.interiorPeso() + self.motorPeso()+ 4000 
	method color() = "blanco"
	
	method interiorPeso() = if(interiorComodo) 700 else 1000 
	method interiorEsPopular(){interiorComodo = false} 
	method interiorEsComodo(){interiorComodo = true}
	
	method motorPeso() = if(motorBueno) 800 else 500
	method motorEsPulenta(){motorBueno = true}
	method motorEsBataton(){motorBueno = false }
	
	
}

class AutoEspecial{
	var property capacidad
	var property velocidadMax
	var property peso
	var property color 
}
