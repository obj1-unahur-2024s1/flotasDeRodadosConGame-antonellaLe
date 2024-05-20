import rodados.*

class DependenciasM{
	
	var property cantDeEmpledos = 0
	const property lFlota = #{}
	
	method agregarAFlota(rodado) = lFlota.add(rodado)

	method quitarDeFlota(rodado) = lFlota.remove(rodado)
	
//pesoTotalFlota()`, la suma del peso de cada rodado afectado a la flota.
	method pesoTotalFlota() = lFlota.sum({x => x.peso()})
	
//estaBienEquipada()`, es verdadero si la flota tiene al menos 3 rodados, y además, _todos_ los rodados de la flota pueden ir al menos a 100 km/h.
	method estaBienEquipadad() {
		return lFlota.size() > 3 and lFlota.all({x => x.velocidadMax() > 100})
	}	
//`capacidadTotalEnColor(color)`, la cantidad total de personas que puede transportar la flota afectada a la dependencia, considerando solamente los rodados del color indicado.
	method capacidadTotalEnColor(color) {
		const lCapacidadXColor = lFlota.filter({x => x.color() == color})
			return lCapacidadXColor.sum({x => x.capacidad()})
	}
//colorDelRodadoMasRapido()
	method colorDelRodadoMasRapido() {
		const l = lFlota.max({x => x.velocidadMax()})
		return l.color()
	}
//capacidadFaltante()`, que es el resultado de restar, de la cantidad de empleados, la capacidad sumada de los vehículos de la flota. 
	method capacidadFaltante() = cantDeEmpledos - lFlota.sum({x => x.capacidad()}) 

//esGrande()`, la condición es que la dependencia tenga al menos 40 empleados y 5 rodados.
	method esGrande(){
		return (cantDeEmpledos >= 40 and lFlota.size() >= 5)
	}
	
}