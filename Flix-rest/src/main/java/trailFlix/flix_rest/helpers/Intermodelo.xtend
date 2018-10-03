package trailFlix.flix_rest.helpers

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.LocalDate
import org.uqbar.xtrest.json.JSONUtils
import trailFlix.flix.helpers.ContentManager
import trailFlix.flix.model.Capitulo
import trailFlix.flix.model.Contenido
import trailFlix.flix.model.Pelicula
import trailFlix.flix.model.Serie
import trailFlix.flix.model.TrailFlix
import trailFlix.flix_rest.server.RestfulServer
import trailFlix.flix_rest.simple_model.Capitulo_Simple
import trailFlix.flix_rest.simple_model.Contenido_Simple
import trailFlix.flix_rest.simple_model.Pelicula_Simple
import trailFlix.flix_rest.simple_model.Serie_Simple
import trailFlix.flix.model.UsuarioInexistente

/**
 * Esta clase hace de punto de encuentro entre las clases del modelo y el servidor REST: {@link RestfulServer}, simplificando
 * las clases y llamando metodos de {@link TrailFlix} sin la necesidad de hablarle directamente.
 * Trae los elementos del modelo de forma amigable para json y html y almacena informacion proveniente de http en el modelo. 
 */
class Intermodelo {
	
	TrailFlix		trailFlix
	ContentManager	manager
	
	extension JSONUtils = new JSONUtils
	
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
	
	/**
	 * Prop: agrega el contenido identificado por <code>codigoNuevo</code> a los relacionados del contenido identificado
	 * por <code>codigoTarget</code>.
	 */
	def void agregarRelacionado(String codigoTarget, String codigoNuevo) {
		manager.agregarRelacionado(Integer.parseInt(codigoTarget),Integer.parseInt(codigoNuevo))
	}
	
	/**
	 * Prop: devuelve las categorias registradas en el sistema en forma slug.
	 */
	def categorias() {
		val cates = newArrayList
		for (String categoria : trailFlix.categorias) {
			cates.add(categoria.toLowerCase)
		}
		cates
	}
	
	/**
	 * Prop: devuelve la lista de contenidos que tengan la categoria indicada.
	 */
	def List<Contenido_Simple> contenidosDeCategoria(String categoria) {
		val contenidos = trailFlix.buscarPorCategoria(categoria.toUpperCase)
		val simples = newArrayList
		for (Contenido c : contenidos) {
			simples.add(simplificar(c))
		}
		simples
	}
	
	/**
	 * Prop: devuelve la lista de contenidos favoritos del usuario registrado como <code>username</code>.
	 */
	def List<Contenido_Simple> favoritosDe(String username) {
		val usuario = manager.conseguirUsuario(username)
		val simples = newArrayList
		for (Contenido c : usuario.getContFavorito) {
			simples.add(simplificar(c))
		}
		simples
	}
	
	/**
	 * Prop: devuelve un objeto JSON con los datos de la pelicula y datos resultado de su relacion con el usuario.
	 */
	def peliculaSegunUsuario(String id_peli, String username) {
		val cod_peli = Integer.parseInt(id_peli)
		val peli = trailFlix.buscarPelicula(cod_peli).simplificar
		val vio = manager.vioContenido(cod_peli,username)
		val recomendadores = manager.recomendadoresDe(cod_peli,username)
		val json_final = new ResultWrapper(peli,vio,recomendadores).toJson
		json_final
	}
	
//	/**
//	 * Prop: devuelve un objeto JSON con los datos de la pelicula y datos resultado de su relacion con el usuario.
//	 */
//	def peliculaSegunUsuario(String id_peli, String username) {
//		val cod_peli = Integer.parseInt(id_peli)
//		val peli = trailFlix.buscarPelicula(cod_peli).simplificar
//		
//		val gson = new Gson()
//		var json_peli = gson.toJson(peli, Pelicula_Simple)
//		val jsonElement = gson.toJsonTree(peli)
//		val array_recom = gson.toJson(manager.recomendadoresDe(cod_peli,username))
//		
//		jsonElement.getAsJsonObject() => [
//			addProperty("watched", manager.vioContenido(cod_peli,username))
//			addProperty("recommendations", array_recom.toString)
//		]
//		json_peli = gson.toJson(jsonElement)
//		json_peli
//	}

	/**
	 * Prop: devuelve un objeto JSON con los datos de la serie y datos resultado de su relacion con el usuario.
	 */
	def serieSegunUsuario(String id_serie, String username) {
		val cod_serie = Integer.parseInt(id_serie)
		val serie = trailFlix.buscarSerie(cod_serie).simplificar
		val vio = manager.vioContenido(cod_serie,username)
		val recomendadores = manager.recomendadoresDe(cod_serie,username)
		val json_final = new ResultWrapper(serie,vio,recomendadores).toJson
		json_final
	}
	
	/**
	 * Prop: envia una recomendacion de Contenido de un usuario a otro.
	 * @param	from	usuario emisor de la recomendacion.
	 * @param	to	usuario al que la recomendacion va dirigida.
	 * @param	id_cont	codigo del Contenido a ser recomendado.
	 */
	def recomendar(String from, String to, String id_cont) {
		val emisor = manager.conseguirUsuario(from)
		val receptor = manager.conseguirUsuario(to)
		val contenido = trailFlix.buscarPelicula(Integer.parseInt(id_cont))
		emisor.recomendar(contenido,receptor)
	}
	
	/**
	 * Prop: devuelve si existe un usuario con ese <code>username</code> en el sistema.
	 */
	def existeUsuario(String username) {
		var ret = true
		try {
			manager.conseguirUsuario(username)
		} catch (UsuarioInexistente excepcion) {
			ret = false
		}
		ret
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

@Accessors
class ResultWrapper {
	
	Contenido_Simple	contenido
	ExtraInfoWrapper	info
	
	new(Contenido_Simple contenido, boolean watched, List<String> recommendations) {
		this.contenido	= contenido
		this.info		=	new ExtraInfoWrapper(watched,recommendations)
	}
	
}

@Accessors
class ExtraInfoWrapper {
	
	boolean			watched
	List<String>	recommendations
	
	new (boolean watched, List<String> recommendations) {
		this.watched			= watched
		this.recommendations	= recommendations
	}
	
}
