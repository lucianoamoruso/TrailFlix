package trailFlix.flix.appModel

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import trailFlix.flix.model.TrailFlix
import trailFlix.flix.model.Pelicula
import trailFlix.flix.model.Serie

@Accessors
@Observable
class AdminMain {
	List<Pelicula> peliculas
	List<Serie> series
	String peli_find
	String serie_find
	TrailFlix trailFlix
	
	/*
	 * Prop: Busca peliculas procesando el texto guardado en this.peli_find.
	 */
	def buscarPeliculas() {
		//TODO
	}
	
	/*
	 * Prop: Busca series procesando el texto guardado en this.serie_find.
	 */
	def buscarSeries() {
		//TODO
	}
	
	/*
	 * Prop: Carga de datos mock el modelo para poder interactuar en la UI de usuario.
	 */
	def rellenarDatos() {
		trailFlix.rellenarDatos
	}
	
}