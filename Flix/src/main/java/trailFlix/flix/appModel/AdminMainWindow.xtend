package trailFlix.flix.appModel

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class AdminMainWindow {
	List<Pelicula> peliculas
	List<Serie> series
	String peli_find
	String serie_find
	
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
}
