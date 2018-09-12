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
	TrailFlix trailFlix
	List<Pelicula> peliculas
	List<Serie> series
	String peli_find
	String serie_find
	Pelicula sel_pelicula
	Serie sel_serie
	boolean hay_peli_sel = false
	boolean hay_serie_sel = false
	
	new() {
		trailFlix = new TrailFlix => [rellenarDatos]
		peliculas = trailFlix.peliculas
		series = trailFlix.series
	}
	
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
	
	def quitarPelicula() {
		peliculas.remove(sel_pelicula)
		hay_peli_sel = false
	}
	
	def quitarSerie() {
		series.remove(sel_serie)
		hay_serie_sel = false
	}

	def void setSel_pelicula(Pelicula sel_pelicula) {
		this.sel_pelicula = sel_pelicula
		hay_peli_sel = true
	}
	
	def void setSel_serie(Serie sel_serie) {
		this.sel_serie = sel_serie
		hay_serie_sel = true
	}
	
}
