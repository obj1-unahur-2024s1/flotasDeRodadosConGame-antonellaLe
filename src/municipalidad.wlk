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
/*ETAPA 2 */	

/*Agregar al modelo los **pedidos** de translados que se generan en la municipalidad.  
Cada pedido especifica: la _distancia_ a recorrer (expresada en kilómetros),
*  el _tiempo máximo_ en que se puede hacer el viaje (expresado en horas),
*  la _cantidad de pasajeros_ a transportar, y también un conjunto de _colores incompatibles_,
*  o sea, que los pasajeros rechazan hacer el viaje en autos de esos colores.  
La _velocidad requerida_ de un pedido es el resultado de dividir la cantidad de kilómetros por el tiempo máximo.
P.ej. si para un pedido de un viaje de 480 kilómetros se indica como tiempo máximo 6 horas, 
* entonces la velocidad requerida de este pedido es de 80 kms/hora (480 / 6 = 80).    */
class PedidoDeTraslado{
	var property distancia
	var property tiempoMax
	var property cantDePax
	const coloresIncompatibles = #{}
	
	method velocidadRequerida() = distancia / tiempoMax
	
	method puedeSatisfacerElPedido(auto) {
		return self.condicionDeVelocidad(auto) and self.condicionDeCapacidad(auto) and self.condicionColorCompatible(auto)
	}
	
	
	//que la velocidad máxima del auto sea al menos 10 km/h mayor a la velocidad requerida del pedido;
	method condicionDeVelocidad(auto) = auto.velocidadMax() - self.velocidadRequerida() >= 10
	
	//que la capacidad del auto dé para la cantidad de pasajeros del viaje;
	method condicionDeCapacidad(auto) = auto.capacidad() >= cantDePax
	
	//que el auto no sea de un color incompatible para el viaje.
	method condicionColorCompatible(auto) = !coloresIncompatibles.contains(auto.color())
}