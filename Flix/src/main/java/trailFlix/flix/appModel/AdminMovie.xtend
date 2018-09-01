package trailFlix.flix.appModel

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import trailFlix.flix.model.Categoria
import trailFlix.flix.model.Clasificacion
import trailFlix.flix.model.Contenido
import trailFlix.flix.model.TrailFlix
import java.util.Date

@Accessors
@Observable
class AdminMovie {
	TrailFlix trailFlix
	String titulo
	int duracion
	Date fecha_estreno
	List<String> directores
	List<String> actores_principales
	String link
	val Categoria[] categorias = #[Categoria.ACCION,Categoria.COMEDIA,Categoria.DRAMA,Categoria.TERROR]
	val Clasificacion[] clasificaciones = #[Clasificacion.APT,Clasificacion.MAYORES13,Clasificacion.MAYORES16,Clasificacion.MAYORES18]
	List<Contenido> relacionado
	
	new(TrailFlix trailFlix) {
		this.trailFlix = trailFlix
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
	 * Idea: va a recibir el codigo (y nombre?) del relacionado desde el input de una ventana simple que se abre
	 * al presionar "Agregar"
	 */
	def agregarContenido(int codigo) {
		//TODO
	}
	
}