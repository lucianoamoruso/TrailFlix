package trailFlix.flix.helpers

import trailFlix.flix.model.TrailFlix

/**
 * Esta clase se encarga de administrar el contenido guardado en trailFlix, o sea que provee metodos para modificar sus atributos.
 * No almacena datos, simplemente ofrece logica de administracion y recolecta informacion.
 */
class ContentManager {
	
	TrailFlix trailFlix
	
	new(TrailFlix trailFlix) {
		this.trailFlix = trailFlix
	}
	
	def void agregarRelacionado(int target,int nuevo) {
		val objetivo = trailFlix.buscarContenido(target)
		val relacionado = trailFlix.buscarContenido(nuevo)
		objetivo.contRelacionado.add(relacionado)
	}
	
	/**
	 * Prop: recibe un username y devuelve el usuario asociado.
	 */
	def conseguirUsuario(String username) {
		trailFlix.usuarios.findFirst[it.nombreDeUsuario == username]
	}
	
}