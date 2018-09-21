package trailFlix.flix.model

import java.util.ArrayList
import java.util.List
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
	List<Contenido> contRelacionado
	String link
	
	new(String titulo){
		this.titulo = titulo
	}
	
	new(String titulo,int codigo) {
		this.titulo = titulo
		this.codigo = codigo
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
	
	/**
	 * Nota: Devuelve la fecha en formato dd/mm/yyyy.
	 * TODO
	 */
	def getFechaEstreno() {
		return fechaEstreno
	}

}
