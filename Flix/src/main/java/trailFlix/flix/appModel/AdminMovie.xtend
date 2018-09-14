package trailFlix.flix.appModel

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.LocalDate
import org.uqbar.commons.model.annotations.Observable
import trailFlix.flix.model.Categoria
import trailFlix.flix.model.Clasificacion
import trailFlix.flix.model.Contenido
import trailFlix.flix.model.Pelicula
import trailFlix.flix.model.TrailFlix
import java.util.ArrayList
import trailFlix.flix.model.Pelicula
import org.joda.time.DateTime
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.Transactional
import java.util.Calendar
import java.util.Map
import java.util.HashMap

@Accessors
@Observable
@Transactional
class AdminMovie extends Entity{
	TrailFlix			trailFlix
	String				titulo
	int					duracion_ingresada
	LocalDate			fecha_estreno_ingresada = new LocalDate(1990,1,1)	//Default
	List<Integer>		dias_del_mes
	Integer				dia
	List<String>		meses
	Map<String,Integer>	map_meses = new HashMap
	String				mes = "Enero"
	List<Integer>		anios
	Integer				anio
	ArrayList<String>	directores_elegidos
	ArrayList<String>	actores_principales
	InterpretadorFecha	interpretador
	String	            directores_elegidos
	String	            actores_principales
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
	Contenido			new_relacionado		//Seteado desde AdminContent
	String				link_ingresado
	Pelicula			pelicula
	
	new(TrailFlix trailFlix) {
		this.trailFlix = trailFlix
		meses = newArrayList("Enero","Febrero","Marzo","Abril","Mayo",
		"Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre")
		map_meses => [
			for (var int i=0;i<12;i++) {
				put(meses.get(i),i+1)		//Asocia el nombre del mes a su numero
			}
		]
	}
	
	new(Pelicula peli){
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
		//ssel_relacionado
		//new_relacionado
		link_ingresado = peli.link
	}
	
	/*
	 * Prop: Carga una nueva pelicula a la base de datos.
	 */
	def void nuevaPeli() {
		val ArrayList<Categoria> nuevasCategorias = recolectarCategorias
		val dir = newArrayList()
		dir.addAll(directores_elegidos.split(",").toList())

		val act = newArrayList()
		act.addAll(actores_principales.split(",").toList())
		
		val pelicula = new Pelicula(titulo) => [
			codigo = trailFlix.nuevoCodigoPeli
			categorias = nuevasCategorias
			clasificacion = sel_clasificacion
			fechaEstreno = fecha_estreno_ingresada
			duracion = duracion_ingresada
			directores = dir
			actores = act
			contRelacionado = relacionado
			link = link_ingresado
		]
		
		trailFlix.agregarPelicula(pelicula)
	}
	
	/*
	 * Prop: Carga una pelicula a la base de datos.
	 */	
	def void modPeli(){
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
	/*
	 * Prop: revisa que categorias fueron tildadas y devuelve una lista conteniendolas.
	 */
	private def ArrayList<Categoria> recolectarCategorias() {
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
	
	/*
	 * Prop: Quita contenido relacionado a una pelicula.
	 */
	def quitarContenido() {
		relacionado.remove(sel_relacionado)
	}
	
	/*
	 * Prop: Añade contenido relacionado a una pelicula.
	 */
	def agregarContenido(Contenido nuevo) {
		relacionado.add(nuevo)
	}
	
//-----------------GETTERS Y SETTERS----------------------------

	def List<Integer> getDias_del_mes() {
		var int min = 1
		var int max = 31
		val List<Integer> lista = newArrayList()
// 		val Calendar calendario = Calendar.getInstance
// 		min = calendario.getActualMinimum(fecha_estreno_ingresada.getMonthOfYear)
// 		max = calendario.getActualMaximum(fecha_estreno_ingresada.getMonthOfYear)
 		(min..max).iterator.forEach[lista.add(it)]
 		return lista
	}
	
	def Integer getDia() {
		fecha_estreno_ingresada.getDayOfMonth
	}
	
	def void setDia(Integer dia) {
		fecha_estreno_ingresada.withDayOfMonth(dia)
	}
			
	def List<Integer> getAnios() {
		val List<Integer> lista = newArrayList()
		(LocalDate.now.getYear..1900).iterator.forEach[lista.add(it)]
		lista
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
