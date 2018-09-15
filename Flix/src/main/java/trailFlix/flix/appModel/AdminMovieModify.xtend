package trailFlix.flix.appModel

import trailFlix.flix.model.Pelicula
import trailFlix.flix.model.TrailFlix
import trailFlix.flix.model.Categoria
import java.util.ArrayList

class AdminMovieModify extends AdminMovie {
	new(TrailFlix trailFlix,Pelicula peli){
		super(trailFlix)
		this.trailFlix = null
		pelicula = peli
		
		titulo = peli.titulo
		duracion_ingresada = peli.duracion
//		interpretador
		fecha_estreno_ingresada = peli.fechaEstreno
		directores_elegidos = peli.directores.reduce[p1, p2| p1 + "," + p2]
		actores_principales = peli.actores.reduce[p1, p2| p1 + "," + p2]
		//sel_categorias
		es_drama = peli.categorias.exists[it == Categoria.DRAMA]
		es_comedia = peli.categorias.exists[it == Categoria.COMEDIA]
		es_terror = peli.categorias.exists[it == Categoria.TERROR]
		es_accion = peli.categorias.exists[it == Categoria.ACCION]
		sel_clasificacion = peli.clasificacion
		relacionado.addAll( peli.contRelacionado)
		//sel_relacionado
		//new_relacionado
		link_ingresado = peli.link
	}
	
	/*
	 * Prop: Carga una pelicula a la base de datos.
	 */	
	override void nuevaPeli(){
		val ArrayList<Categoria> nuevasCategorias = recolectarCategorias
		val dir = newArrayList()
		dir.addAll(directores_elegidos.split(",").toList())

		val act = newArrayList()
		act.addAll(actores_principales.split(",").toList())
		
		pelicula => [
			it.titulo = titulo
			categorias = nuevasCategorias
			clasificacion = sel_clasificacion
			fechaEstreno = fecha_estreno_ingresada
			duracion = duracion_ingresada
			directores = dir
			actores = act
			contRelacionado = relacionado
			link = link_ingresado
		]
		
	}
}