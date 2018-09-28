package trailFlix.flix_rest.helpers

import trailFlix.flix_rest.server.RestfulServer
import trailFlix.flix.model.TrailFlix
import trailFlix.flix.model.Pelicula
import trailFlix.flix_rest.simple_model.Pelicula_Simple
import trailFlix.flix.model.Contenido
import java.util.List
import org.joda.time.LocalDate

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
		val fecha = aplanarAtributo(p.fechaEstreno)
		val relacionado = aplanarAtributo(p.contRelacionado)
		new Pelicula_Simple(p.codigo,p.titulo,p.categorias,p.clasificacion,fecha,p.duracion,p.directores,p.actores,p.valoraciones,relacionado,p.link)
	}
	
	/**
	 * Prop: devuelve la lista de relacionados pero sin referencia recursiva.
	 */
	def aplanarAtributo(List<Contenido> relacionados) {
		val plano = newArrayList
		for (Contenido c : relacionados) {
			plano.add(c.codigo)
		}
		plano
	}
	
	/**
	 * Prop: devuelve la fecha en formato dd/mm/aaaa.
	 */
	def aplanarAtributo(LocalDate fecha) {
		fecha.toString("dd/MM/yyyy")
	}
	
}
