package trailFlix.flix.appModel

import java.util.Calendar
import java.util.HashMap
import java.util.List
import java.util.Map
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.LocalDate
import org.uqbar.commons.model.annotations.Observable
import trailFlix.flix.model.Capitulo
import trailFlix.flix.model.TrailFlix

@Accessors
@Observable
class AdminChapter {
	
	TrailFlix			trailflix
	AdminSerie			adminSerie
	String				titulo
	List <String> 		categorias
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
	String				link_ingresado
	Integer				duracion_ingresada
	Integer				temporada
	Capitulo 			capituloNuevo
	boolean				datos_completados = false
	
	
	new(AdminSerie admin, TrailFlix trailflix) {
		this.adminSerie = admin
		this.trailflix = trailflix
		this.categorias = trailflix.categorias
		meses = newArrayList("Enero","Febrero","Marzo","Abril","Mayo",
		"Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre")
		map_meses => [
			for (var int i=0;i<12;i++) {
				put(meses.get(i),i+1)		//Asocia el nombre del mes a su numero
			}
		]
	}
	
	def nuevoCap (){
		val dir = newArrayList()
		dir.addAll(directores_elegidos.split(",").toList())

		val act = newArrayList()
		act.addAll(actores_principales.split(",").toList())
		
		val capitulo = new Capitulo(titulo) => [
			//codigo = trailFlix.nuevoCodigoPeli
			fechaEstreno = fecha_estreno_ingresada
			duracion = duracion_ingresada
			directores = dir
			actores = act
			link = link_ingresado
			it.temporada = this.temporada
			it.capituloNro = adminSerie.cont_cap
			it.codigo = this.trailflix.nuevoCodigoCapitulo
		]
		adminSerie.cont_cap = adminSerie.cont_cap + 1
		this.adminSerie.addCapitulo(capitulo)
}
	
	def evaluarCompletado() {
		if (todoCompletado) {
			datos_completados = true
		} else {
			datos_completados = false
		}
	}
	
	def boolean todoCompletado() {
		titulo !== null && duracion_ingresada !== null && temporada !== null && dia !== null && mes !== null && anio !== null && directores_elegidos !== null &&
		actores_principales !== null && link_ingresado !== null
	}
	
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
	}
	
	def void setDuracion_ingresada(Integer duracion_ingresada) {
		this.duracion_ingresada = duracion_ingresada
		evaluarCompletado
	}
	
	def void setTemporada(Integer temporada) {
		this.temporada = temporada
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
	
}