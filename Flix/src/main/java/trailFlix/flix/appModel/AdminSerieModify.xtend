package trailFlix.flix.appModel

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import trailFlix.flix.model.Serie
import trailFlix.flix.model.TrailFlix

@Accessors
@Observable
class AdminSerieModify extends AdminSerie {
	Serie serie
	
	new(TrailFlix trailFlix,Serie sel){
		super(trailFlix)
		serie = sel
		
		capitulos = sel.capitulos
		cont_cap = capitulos.maxBy[it.capituloNro].capituloNro + 1
		titulo = sel.titulo
		sel_categorias = sel.categorias.head()
		temporadas = sel.temporadas
		creadores = sel.creadores.reduce[p1, p2| p1 + "," + p2]
		//sel_categorias
		es_drama = sel.categorias.exists[it == "DRAMA"]
		es_comedia = sel.categorias.exists[it == "COMEDIA"]
		es_terror = sel.categorias.exists[it == "TERROR"]
		es_accion = sel.categorias.exists[it == "ACCION"]
		sel_clasificacion = sel.clasificacion
		relacionado.addAll( sel.contRelacionado)
		evaluarCompletado
	}

	/*
	 * Prop: Carga una pelicula a la base de datos.
	 */	
	override void nuevaSerie(){
		val ArrayList<String> nuevasCategorias = recolectarCategorias
		val dir = newArrayList()
		dir.addAll(creadores.split(",").toList())

		serie => [
			it.titulo = titulo
			categorias = nuevasCategorias
			clasificacion = sel_clasificacion
			creadores = creadores
			contRelacionado = relacionado
			capitulos = this.capitulos
		]
		
	}
	
}
