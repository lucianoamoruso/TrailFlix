package trailFlix.flix.model

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Capitulo {
	
	int codigo
	String titulo
	int temporada
	int capituloNro
	DateTime fechaEstreno
	int duracion
	List <String> directores
	List <String> actores
	List <Integer> valoraciones
	String link
	
	new (String titulo){
		this.titulo = titulo
		directores = newArrayList()
		actores = newArrayList()
		valoraciones = newArrayList()
	}
	
	def getRating(){
		var sum = 0
		for (i : 0 ..< this.valoraciones.size){
			sum += this.valoraciones.get(i)	
		}
		sum / valoraciones.size
		}
	
//-------------------OVERRIDE--------------------------
	
	override toString() {
		titulo
	}
	
//-----------------GETTERS Y SETTERS----------------------------
	
	def setFechaEstreno(DateTime fecha) {
		this.fechaEstreno = fecha
	}
	
	/**
	 * Nota: Setea mediante el parseo de un string en formato yyyy-mm-dd.
	 */
	def setFechaEstreno(String fecha){
		this.fechaEstreno = DateTime.parse(fecha)
	}
	
	/**
	 * Nota: Devuelve la fecha en formato dd/mm/yyyy.
	 * TODO
	 */
	def getFechaEstreno() {
		return fechaEstreno
	}
	
	def getTitulo(){
		titulo
	}

	
}
