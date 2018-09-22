package trailFlix.flix.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import trailFlix.flix.model.Categoria
import java.util.List
import trailFlix.flix.model.Clasificacion
import java.util.ArrayList
import trailFlix.flix.model.Contenido
import trailFlix.flix.model.TrailFlix
import trailFlix.flix.model.Serie
import trailFlix.flix.model.Capitulo
import org.joda.time.LocalDate
import java.util.Map
import java.util.HashMap
import java.util.Calendar

@Accessors
@Observable
class AdminSerie {
		
	TrailFlix			trailFlix
	String 				titulo
	String 				creadores
	Integer				temporadas
	List<String>		categorias_disp
	String	 			sel_categorias
	boolean				es_drama
	boolean				es_comedia
	boolean				es_terror
	boolean				es_accion
	List<String>		clasificaciones_disp
	String				sel_clasificacion
	List<Contenido>		relacionado = new ArrayList
	Contenido			sel_relacionado
	Contenido			new_relacionado
	List<Capitulo>		capitulos = new ArrayList
	boolean				datos_completados = false
		
		new(TrailFlix trailFlix) {
		this.trailFlix = trailFlix
		categorias_disp = trailFlix.categorias
		clasificaciones_disp = trailFlix.clasificaciones
		}
		
		def void nuevaSerie() {
		val ArrayList<String> nuevasCategorias = recolectarCategorias
		val cre = newArrayList()
		cre.addAll(creadores.split(",").toList())

		val serie = new Serie(titulo) => [
			categorias = nuevasCategorias
			clasificacion = sel_clasificacion
			creadores = cre
			contRelacionado = relacionado
			it.capitulos = this.capitulos
			it.temporadas = this.temporadas
		]
		
		trailFlix.agregarSerie(serie)
	}
	
	def addCapitulo (Capitulo capitulo){
		this.capitulos.add(capitulo)
		evaluarCompletado
	}
	
	
	protected def ArrayList<String> recolectarCategorias() {
		var ArrayList<String> ret = new ArrayList
		if (es_accion) {
			ret.add("ACCION")
		}
		if (es_comedia) {
			ret.add("COMEDIA")
		}
		if (es_drama) {
			ret.add("DRAMA")
		}
		if (es_terror) {
			ret.add("TERROR")
		}
		ret
	}
	
	def quitarContenido() {
		relacionado.remove(sel_relacionado)
	}
	
	/*
	 * Prop: Añade contenido relacionado a una pelicula.
	 */
	def agregarContenido(Contenido nuevo) {
		relacionado.add(nuevo)
	}

	
	/*
	 * Prop: evalua si todos los campos en UI estan completados y en caso de que sea cierto enciende el boton Aceptar.
	 * Nota: debe ser llamado al final de cada setter.
	 */
	def evaluarCompletado() {
		if (todoCompletado) {
			datos_completados = true
		} else {
			datos_completados = false
		}
	}
	
	def boolean todoCompletado() {
		titulo !== null && creadores !== null && temporadas !== null && capitulos.size>0 && sel_clasificacion !== null
	}
	
//-----------------GETTERS Y SETTERS----------------------------

	def void setTitulo(String titulo) {
		if (titulo == "") {
			this.titulo = null
		} else {
			this.titulo = titulo
		}
		evaluarCompletado
	}
	
	def void setSel_clasificacion(String sel_clasificacion) {
		this.sel_clasificacion = sel_clasificacion
		evaluarCompletado
	}
	
	def void setDirectores_elegidos(String directores_elegidos) {
		if (directores_elegidos == "") {
			this.directores_elegidos = null
		} else {
			this.directores_elegidos = directores_elegidos
		}
		evaluarCompletado
	}
	
	def void setCreadores(String creadores) {
		if (creadores == "") {
			this.creadores = null
		} else {
			this.creadores = creadores
		}
		evaluarCompletado
	}
	
	def void setTemporadas(Integer temporadas) {
		this.temporadas = temporadas
		evaluarCompletado
	}
	
}