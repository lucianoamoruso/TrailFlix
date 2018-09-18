package trailFlix.flix.appModel

import java.util.ArrayList
import java.util.Calendar
import java.util.HashMap
import java.util.List
import java.util.Map
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.LocalDate
import org.uqbar.commons.model.annotations.Observable
import trailFlix.flix.model.Categoria
import trailFlix.flix.model.Clasificacion
import trailFlix.flix.model.Contenido
import trailFlix.flix.model.Pelicula
import trailFlix.flix.model.TrailFlix
import org.uqbar.lacar.ui.model.WindowBuilder
import org.uqbar.arena.windows.MessageBox.Type

@Accessors
@Observable
class AdminMovie {
	WindowBuilder		builder
	AdminMain			parent
	TrailFlix			trailFlix
	String				titulo
	int					duracion_ingresada = 0
	LocalDate			fecha_estreno_ingresada = new LocalDate(1990,1,1)	//Default
	List<Integer>		dias_del_mes
	Integer				dia
	List<String>		meses
	Map<String,Integer>	map_meses = new HashMap
	String				mes
	List<Integer>		anios
	Integer				anio
	String				directores_elegidos
	String				actores_principales
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
	boolean				datos_completados = false
	
	
	//Solo es true cuando todos los campos en la UI fueron completados
	
	new(TrailFlix trailFlix, AdminMain parent) {
		this.trailFlix = trailFlix
		this.parent = parent
		meses = newArrayList("Enero","Febrero","Marzo","Abril","Mayo",
		"Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre")
		map_meses => [
			for (var int i=0;i<12;i++) {
				put(meses.get(i),i+1)		//Asocia el nombre del mes a su numero
			}
		]
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
	 * Prop: revisa que categorias fueron tildadas y devuelve una lista conteniendolas.
	 */
	def ArrayList<Categoria> recolectarCategorias() {
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
		titulo !== null && duracion_ingresada !== 0 && sel_clasificacion !== null &&
		dia !== null && mes !== null && anio !== null && directores_elegidos !== null &&
		actores_principales !== null && link_ingresado !== null
	}
	
//-----------------GETTERS Y SETTERS----------------------------

	def List<Integer> getDias_del_mes() {
		var int min
		var int max
		val List<Integer> lista = newArrayList()
 		val Calendar calendario = Calendar.getInstance
 		calendario.set(fecha_estreno_ingresada.getYear,fecha_estreno_ingresada.getMonthOfYear-1,1)	//Se le resta 1 por ser zero-based
 		min = calendario.getActualMinimum(5)	//El campo 5 es el mes
 		max = calendario.getActualMaximum(5)
 		(min..max).iterator.forEach[lista.add(it)]
 		return lista
	}
	
	def Integer getDia() {
		fecha_estreno_ingresada.getDayOfMonth
	}
	
	def void setDia(Integer dia) {
		try {
			fecha_estreno_ingresada = fecha_estreno_ingresada.withDayOfMonth(dia)
			this.dia = dia
		}
		catch(NullPointerException ex) {
			//ignorar
		}
		evaluarCompletado
	}
	
	def void setMes(String mes) {
		fecha_estreno_ingresada = fecha_estreno_ingresada.withMonthOfYear(map_meses.get(mes))
		dias_del_mes = dias_del_mes		//Truco para notificar de cambio
		this.mes = mes
		evaluarCompletado
	}
	
	def void setAnio(Integer anio) {
		fecha_estreno_ingresada = fecha_estreno_ingresada.withYear(anio)
		dias_del_mes = dias_del_mes		//Truco para notificar de cambio
		this.anio = anio
		evaluarCompletado
	}
			
	def List<Integer> getAnios() {
		val List<Integer> lista = newArrayList()
		(LocalDate.now.getYear..1900).iterator.forEach[lista.add(it)]
		lista
	}
	
	def void setTitulo(String titulo) {
		if (titulo == "") {
			this.titulo = null
		} else {
			this.titulo = titulo
		}
		evaluarCompletado
		evaluarEasterEgg(titulo)
	}
	
	def evaluarEasterEgg(String titulo) {
		if (titulo == "Quiero usuarios!") {
			builder.showMessage(Type.Information,"¡Bueno pero no me grites!")
			builder.close
			parent.egg = true
		}
	}
	
	def void setDuracion_ingresada(int duracion_ingresada) {
		this.duracion_ingresada = duracion_ingresada
		evaluarCompletado
	}
	
	def void setSel_clasificacion(Clasificacion sel_clasificacion) {
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
	
	def void setActores_principales(String actores_principales) {
		if (actores_principales == "") {
			this.actores_principales = null
		} else {
			this.actores_principales = actores_principales
		}
		evaluarCompletado
	}
	
	def void setLink_ingresado(String link_ingresado) {
		if (link_ingresado == "") {
			this.link_ingresado = null
		} else {
			this.link_ingresado = link_ingresado
		}
		evaluarCompletado
	}
	
	def setDelegate(WindowBuilder builder) {
		this.builder = builder
	}
	
}
