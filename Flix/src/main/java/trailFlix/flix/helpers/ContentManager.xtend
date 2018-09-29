package trailFlix.flix.helpers

import trailFlix.flix.model.TrailFlix

/**
 * Esta clase se encarga de administrar el contenido guardado en trailFlix, o sea que provee metodos para modificar sus atributos.
 * No almacena datos, simplemente ofrece logica de administracion.
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
}