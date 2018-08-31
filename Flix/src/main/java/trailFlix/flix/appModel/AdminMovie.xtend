package trailFlix.flix.appModel

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import trailFlix.flix.model.Categoria
import trailFlix.flix.model.Clasificacion

@Accessors
@Observable
class AdminMovie {
	String titulo
	val Categoria[] categorias = newArrayOfSize(4)
	val Clasificacion[] clasificaciones = newArrayOfSize(4)
	List<Contenido> relacionado
	TrailFlix trailFlix
	
	new() {
		categorias.addAll(Categoria.values)
		clasificaciones.addAll(Clasificacion.values)
	}
	
	
	/*
	 * Prop: Carga de datos mock el modelo para poder interactuar en la UI de usuario.
	 */
	def rellenarDatos() {
//		trailFlix.rellenarDatos
	}
	
	/*
	 * Prop: Carga una nueva pelicula a la base de datos.
	 */
	def nuevaPeli() {
		//TODO
	}
	
	/*
	 * Prop: Quita contenido relacionado a una pelicula.
	 */
	def quitarContenido() {
		//TODO
	}
	
	/*
	 * Prop: Añade contenido relacionado a una pelicula.
	 */
	def agregarContenido() {
		//TODO
	}
	
}