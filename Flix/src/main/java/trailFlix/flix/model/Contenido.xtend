package trailFlix.flix.model

import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
@Observable
abstract class Contenido {
	protected int codigo
	protected String titulo = "sin titulo"
	protected List <Categoria> categorias
	protected Clasificacion clasificacion
	
	def abstract Pelicula returnPelicula()
	def abstract Serie returnSerie()
	def abstract double getRating()

	override toString() {
		titulo
	}
	
}