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
	Loader			loader
	TrailFlix		trailFlix
	List<Pelicula>	peliculas
	List<Serie>		series
	String			peli_find = ""
	String			serie_find = ""
	Pelicula		sel_pelicula
	Serie			sel_serie
	String			user_icon = "iconos\\usuario.jpg"
	boolean 		hay_peli_sel = false
	boolean			hay_serie_sel = false
	boolean			visible = false
	boolean			egg = false		//Indica si la condicion del Easter Egg fue satisfecha.
	
	new() {
		trailFlix = new TrailFlix(this)
		loader = new DataLoader
		loader.rellenarDatos(trailFlix)
		peliculas = trailFlix.peliculas
		series = trailFlix.series
	}
	
	/*
	 * Prop: respuesta a una notificacion de cambio de TrailFlix y llamado al buscar en las tablas.
	 */
	def actualizarContenidos() {
		
		val List<Pelicula> peliculas = trailFlix.peliculas
		this.peliculas = peliculas.filter[pelicula|this.match(peli_find, pelicula.titulo)].toList
		if (sel_pelicula === null) {hay_peli_sel = false}
		
		val List<Serie> series = trailFlix.series
		this.series = series.filter[serie|this.match(serie_find, serie.titulo)].toList
		if (sel_serie === null) {hay_serie_sel = false}
		
	}
	
	def match(Object expectedValue, Object realValue) {
		if (expectedValue === null) {
			return true
		}
		if (realValue === null) {
			return false
		}
		realValue.toString().toLowerCase().contains(expectedValue.toString().toLowerCase())
	}
	
	/*
	 * Prop: Carga de datos mock el modelo para poder interactuar en la UI de usuario.
	 */

	
	def quitarPelicula() {
		trailFlix.eliminarPelicula(sel_pelicula)
		actualizarContenidos()
	}
	
	def quitarSerie() {
		trailFlix.eliminarSerie(sel_serie)
		actualizarContenidos()
	}

	/*
	 * Prop: limpia el campo de busqueda de peliculas.
	 */
	def limpiarPeliFind() {
		setPeli_find("")
	}
	
	/*
	 * Prop: limpia el campo de busqueda de series.
	 */
	def limpiarSerieFind() {
		setSerie_find("")
	}

//-----------------GETTERS Y SETTERS----------------------------

	def void setSel_pelicula(Pelicula sel_pelicula) {
		if (sel_pelicula !== null) {
			hay_peli_sel = true
		}
		this.sel_pelicula = sel_pelicula
	}
	
	def void setSel_serie(Serie sel_serie) {
		if (sel_serie !== null) {
			hay_serie_sel = true
		}
		this.sel_serie = sel_serie
	}
	
	def void setPeli_find(String peli_find) {
		this.peli_find = peli_find
		actualizarContenidos()
	}
	
	def void setSerie_find(String serie_find) {
		this.serie_find = serie_find
		actualizarContenidos()
	}
	
}
