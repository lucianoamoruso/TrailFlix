package trailFlix.flix.appModel

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import trailFlix.flix.model.Categoria
import trailFlix.flix.model.Clasificacion
import trailFlix.flix.model.Contenido
import trailFlix.flix.model.TrailFlix
import java.util.Date
import java.util.ArrayList

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
	List<Categoria> categorias = Categoria.values
	List<Clasificacion> clasificaciones = Clasificacion.values
	List<Contenido> relacionado = new ArrayList
	Categoria sel_categorias
	Clasificacion sel_clasificacion
	Contenido sel_relacionado
	
	new(TrailFlix trailFlix) {
		this.trailFlix = trailFlix
		relacionado => [
			add(trailFlix.peliculas.head)
			add(trailFlix.series.head)
		]
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
		relacionado.remove(sel_relacionado)
	}
	
	/*
	 * Prop: Añade contenido relacionado a una pelicula.
	 */
	def agregarContenido(Contenido contenido) {
		relacionado.add(contenido)
	}
	
}