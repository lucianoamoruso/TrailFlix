package trailFlix.flix.appModel

import trailFlix.flix.model.Pelicula
import trailFlix.flix.model.TrailFlix
import trailFlix.flix.model.Categoria
import java.util.ArrayList
import java.util.Map
import java.util.HashMap
import java.util.List

class AdminMovieModify extends AdminMovie {
	Map<Integer,String>	map_reverso = new HashMap
	
	new(TrailFlix trailFlix,AdminMain parent,Pelicula peli){
		super(trailFlix,parent)
		pelicula = peli
		crearMapeoInversoMeses()
		titulo = peli.titulo
		duracion_ingresada = peli.duracion
		fecha_estreno_ingresada = peli.fechaEstreno
		dia = fecha_estreno_ingresada.getDayOfMonth
		mes = map_reverso.get(fecha_estreno_ingresada.getMonthOfYear)
		anio = fecha_estreno_ingresada.getYear
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
		evaluarCompletado
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
		val tit = titulo
		pelicula => [
			setTitulo(tit)
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
	
	def void crearMapeoInversoMeses() {
		val original = map_meses
		val List<String> claves = original.keySet.toList
		val List<Integer> valores = original.values.toList
		
		for (var int i=0; i<original.size;i++) {
			map_reverso.put(valores.get(i),claves.get(i))
		}
	}
	
	
	
	
	
	
}