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

@Accessors
@Observable
class AdminSerie {
		
		TrailFlix			trailFlix
		String 				titulo
		String 				creadores
		int 				temporadas
		List<Categoria>		categorias_disp = Categoria.values
		Categoria 			sel_categorias
		boolean				es_drama
		boolean				es_comedia
		boolean				es_terror
		boolean				es_accion
		List<Clasificacion>	clasificaciones_disp = Clasificacion.values
		Clasificacion		sel_clasificacion
		List<Contenido>		relacionado = new ArrayList
		Contenido			sel_relacionado
		Contenido			new_relacionado
		boolean				datos_completados = false
		List<Capitulo>		capitulos = new ArrayList
		
		new(TrailFlix trailFlix) {
		this.trailFlix = trailFlix
		}
		
		def void nuevaSerie() {
		val ArrayList<Categoria> nuevasCategorias = recolectarCategorias
		val cre = newArrayList()
		cre.addAll(creadores.split(",").toList())

		val serie = new Serie(titulo) => [
			codigo = trailFlix.nuevoCodigoSerie
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
	
	
	protected def ArrayList<Categoria> recolectarCategorias() {
		var ArrayList<Categoria> ret = new ArrayList
		if (es_accion) {
			ret.add(Categoria.ACCION)
		}
		if (es_comedia) {
			ret.add(Categoria.COMEDIA)
		}
		if (es_drama) {
			ret.add(Categoria.DRAMA)
		}
		if (es_terror) {
			ret.add(Categoria.TERROR)
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

	
	def evaluarCompletado() {
		if (todoCompletado) {
			datos_completados = true
		}
	}
	
	def boolean todoCompletado() {
		titulo !== null && sel_clasificacion !== null && creadores !== null && this.capitulos.size>0
	}
	
	def void setTitulo(String titulo) {
		this.titulo = titulo
		evaluarCompletado
	}
	
	def void setSel_clasificacion(Clasificacion sel_clasificacion) {
		this.sel_clasificacion = sel_clasificacion
		evaluarCompletado
	}
	
	def void setCreadores(String directores_elegidos) {
		this.creadores = directores_elegidos
		evaluarCompletado
	}
	
}