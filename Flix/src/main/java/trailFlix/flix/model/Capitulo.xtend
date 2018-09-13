package trailFlix.flix.model

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime

@Accessors
class Capitulo {
	
	int codigo
	String titulo
	int temporada
	int capituloNro
	DateTime fechaEstreno
	int duracion
	ArrayList <String> directores
	ArrayList <String> actores
	ArrayList <Integer> valoraciones
	String link
	
	new (String titulo){
		this.titulo = titulo
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

	
}
