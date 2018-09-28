package trailFlix.flix_rest.helpers

import trailFlix.flix_rest.server.RestfulServer
import trailFlix.flix.model.TrailFlix
import trailFlix.flix.model.Pelicula
import trailFlix.flix_rest.simple_model.Pelicula_Simple

/**
 * Esta clase hace de punto de encuentro entre las clases del modelo y el servidor REST: {@link RestfulServer}, simplificando
 * las clases y llamando metodos de {@link TrailFlix} sin la necesidad de hablarle directamente.
 */
class Intermodelo {
	
	TrailFlix trailFlix
	
	new(TrailFlix trailFlix) {
		this.trailFlix = trailFlix
	}
	
	def getPeliculas() {
		val peliculas = trailFlix.peliculas
		val simples = newArrayList()
		for (Pelicula peli : peliculas) {
			simples.add(simplificar(peli))
		}
		simples
	}
	
	/**
	 * Prop: devuelve una pelicula simplificada, lista para ser pasada a json.
	 */
	def simplificar(Pelicula p) {
		new Pelicula_Simple(p.codigo,p.titulo,p.categorias,p.clasificacion,p.fechaEstreno,p.duracion,p.directores,p.actores,p.valoraciones,p.contRelacionado,p.link)
	}
	
}