package trailFlix.flix.model

import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
abstract class Contenido {
	int codigo
	String titulo = "sin titulo"
	
	def abstract Pelicula returnPelicula()
	def abstract Serie returnSerie()
	def abstract float getRating()
}