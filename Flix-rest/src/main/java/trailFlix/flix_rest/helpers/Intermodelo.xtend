package trailFlix.flix_rest.helpers

import trailFlix.flix_rest.server.RestfulServer
import trailFlix.flix.model.TrailFlix
import trailFlix.flix.model.Pelicula
import trailFlix.flix_rest.simple_model.Pelicula_Simple
import trailFlix.flix.model.Contenido
import java.util.List
import org.joda.time.LocalDate
import trailFlix.flix.helpers.ContentManager
import trailFlix.flix.model.Serie
import trailFlix.flix_rest.simple_model.Serie_Simple
import trailFlix.flix.model.Capitulo
import trailFlix.flix_rest.simple_model.Capitulo_Simple
import trailFlix.flix_rest.simple_model.Contenido_Simple

/**
 * Esta clase hace de punto de encuentro entre las clases del modelo y el servidor REST: {@link RestfulServer}, simplificando
 * las clases y llamando metodos de {@link TrailFlix} sin la necesidad de hablarle directamente.
 * Trae los elementos del modelo de forma amigable para json y html y almacena informacion proveniente de http en el modelo. 
 */
class Intermodelo {
	
	TrailFlix		trailFlix
	ContentManager	manager
	
	new(TrailFlix trailFlix) {
		this.trailFlix = trailFlix
		this.manager = new ContentManager(trailFlix)
	}
	
	def getPeliculas() {
		val peliculas = trailFlix.peliculas
		val simples = newArrayList()
		for (Pelicula peli : peliculas) {
			simples.add(simplificar(peli))
		}
		simples
	}
	
	def void agregarRelacionado(String codigoTarget, String codigoNuevo) {
		manager.agregarRelacionado(Integer.parseInt(codigoTarget),Integer.parseInt(codigoNuevo))
	}
	
	def categorias() {
		trailFlix.categorias
	}
	
	def List<Contenido_Simple> contenidosDeCategoria(String categoria) {
		val contenidos = trailFlix.buscarPorCategoria(categoria.toUpperCase)
		val simples = newArrayList
		for (Contenido c : contenidos) {
			simples.add(simplificar(c))
		}
		simples
	}
	
//	---------------- SIMPLIFICADO ----------------
	
	/**
	 * Prop: devuelve {@link Contenido_Simple}, listo para ser pasado a json.
	 */
	def simplificar(Contenido c) {
		if (c.codigo<1000) {
			return simplificar(c as Pelicula)
		} else {
			return simplificar(c as Serie)
		}
	}
	
	/**
	 * Prop: devuelve una {@link Pelicula_Simple}, lista para ser pasada a json.
	 */
	def simplificar(Pelicula p) {
		val fecha = aplanarFecha(p.fechaEstreno)
		val relacionado = aplanarRelacionados(p.contRelacionado)
		new Pelicula_Simple(p.codigo,p.titulo,p.categorias,p.clasificacion,fecha,p.duracion,p.directores,p.actores,p.valoraciones,relacionado,p.link)
	}

	/**
	 * Prop: devuelve una {@link Serie_Simple}, lista para ser pasada a json.
	 */
	def simplificar(Serie s) {
		val relacionado = aplanarRelacionados(s.contRelacionado)
		val capitulos_planos = aplanarCapitulos(s.capitulos)
		new Serie_Simple(s.codigo,s.titulo,s.categorias,s.clasificacion,s.creadores,capitulos_planos,s.temporadas,relacionado)
	}
	
	/**
	 * Prop: devuelve un {@link Capitulo_Simple}, listo para ser pasado a json.
	 */
	def simplificar(Capitulo c) {
		val fecha = aplanarFecha(c.fechaEstreno)
		new Capitulo_Simple(c.codigo,c.titulo,c.temporada,c.capituloNro,fecha,c.duracion,c.directores,c.actores,c.valoraciones,c.link)
	}
	
//	---------------- APLANADO ----------------

	/**
	 * Prop: devuelve la lista de relacionados pero sin referencia recursiva.
	 */
	def aplanarRelacionados(List<Contenido> relacionados) {
		val plano = newArrayList
		for (Contenido c : relacionados) {
			plano.add(c.codigo)
		}
		plano
	}
	
	/**
	 * Prop: devuelve la fecha en formato dd/mm/aaaa.
	 */
	def aplanarFecha(LocalDate fecha) {
		fecha.toString("dd/MM/yyyy")
	}
	
	/**
	 * Prop: devuelve una lista de {@link Capitulo_Simple} en vez de {@link Capitulo}.
	 */
	def aplanarCapitulos(List<Capitulo> capitulos) {
		val plano = newArrayList
		for (Capitulo c : capitulos) {
			plano.add(simplificar(c))
		}
		plano
	}
	
}
