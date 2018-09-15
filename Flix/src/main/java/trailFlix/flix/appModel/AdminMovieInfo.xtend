package trailFlix.flix.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import trailFlix.flix.model.Pelicula


@Accessors
@Observable
class AdminMovieInfo {
	
	Pelicula pelicula
	
	new(Pelicula pelicula) {
		this.pelicula = pelicula
	}
	
	def duracion() {
		pelicula.duracion.toString
	}
	
	def fecha_estreno() {
		pelicula.fechaEstreno.toString
	}
	
	def clasificacion() {
		pelicula.clasificacion.toString
	}
	
	def categorias() {
		pelicula.categorias.toString
	}
	
	def reparto() {
		pelicula.actores.toString
	}
	
	def direccion() {
		pelicula.directores.toString
	}
	
	def valoraciones() {
		var String ret
		if (pelicula.valoraciones===null) {
			ret = "<AUN NO VALORADA>"
		} else {
			ret = pelicula.rating.toString
		}
		ret
	}
	
	def enlace() {
		pelicula.link
	}
	
	def contenido_relacionado() {
		pelicula.contRelacionado.toString
	}
	
	
}