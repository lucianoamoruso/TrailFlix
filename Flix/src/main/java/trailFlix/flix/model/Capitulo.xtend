package trailFlix.flix.model

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.joda.time.LocalDate

@Accessors
@Observable
class Capitulo {
	
	int codigo = 0
	String titulo
	int temporada
	int capituloNro
	LocalDate fechaEstreno
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
	
	def getRating(){ //VOLVER A IMPLEMENTAR
		var sum = 0
		if (this.valoraciones.size == 0)
		{
			return 0
		}
		else
		{
			for (i : 0 ..< this.valoraciones.size){
				sum += this.valoraciones.get(i)	
			}
			sum / valoraciones.size
		}
	}
	
//-------------------OVERRIDE--------------------------
	
	override toString() {
		titulo
	}
	
//-----------------GETTERS Y SETTERS----------------------------
	
	def setFechaEstreno(LocalDate fecha) {
		this.fechaEstreno = fecha
	}
	
	/**
	 * Nota: Setea mediante el parseo de un string en formato yyyy-mm-dd.
	 */
	def setFechaEstreno(String fecha){
		this.fechaEstreno = LocalDate.parse(fecha)
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
