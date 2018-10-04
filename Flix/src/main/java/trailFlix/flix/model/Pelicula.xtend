package trailFlix.flix.model

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.LocalDate
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Pelicula extends Contenido {
	
	LocalDate fechaEstreno
	int duracion		//En minutos
	ArrayList<String> directores
	ArrayList<String> actores
	ArrayList<Integer> valoraciones
	String link
	
	new(String titulo){
		this.titulo = titulo
	}
	
	new(String titulo,int codigo) {
		this.titulo = titulo
		this.codigo = codigo
	}

	/**
	 * Prop: agrega una nueva valoracion en estrellas.
	 */
	def valorar(int estrellas) {
		valoraciones.add(estrellas)
	}

//-------------------OVERRIDE--------------------------

	override esPelicula (){
		true
	}
	
	
	override getRating() {  //VOLVER A IMPLEMENTAR
		var sum = 0
		for (i : 0 ..< this.valoraciones.size){
			sum += this.valoraciones.get(i)	
		}
		sum / valoraciones.size
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
	
}
