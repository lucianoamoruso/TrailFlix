package trailFlix.flix.model

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.joda.time.LocalDate
import java.util.ArrayList

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
		directores = new ArrayList
		actores = new ArrayList
		valoraciones = new ArrayList
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
	
	/**
	 * Prop: agrega una nueva valoracion en estrellas.
	 */
	def valorar(int estrellas) {
		valoraciones.add(estrellas)
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
	
	def getFechaEstreno() {
		return fechaEstreno
	}
	
	def getTitulo(){
		titulo
	}
	
}
