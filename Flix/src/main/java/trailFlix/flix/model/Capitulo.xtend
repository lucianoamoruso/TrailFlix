package trailFlix.flix.model

import org.joda.time.DateTime
import org.joda.time.LocalDate
import java.util.ArrayList

class Capitulo {
	
	int codigo
	String titulo
	int temporada
	int capituloNro
	DateTime fechaEstreno
	LocalDate duracion
	ArrayList <String> directores
	ArrayList <String> actores
	ArrayList <Integer> valoraciones
	String link
	
	new (String titulo){
		this.titulo = titulo
	}
	
	def getRating(){
		//TO DO
	}
	
}