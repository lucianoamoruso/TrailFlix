package trailFlix.flix.model

import java.util.ArrayList
import org.joda.time.DateTime
import org.joda.time.LocalTime

class Pelicula extends Contenido {
	
	DateTime fechaEstreno
	LocalTime duracion
	ArrayList<String> directores
	ArrayList<String> actores
	ArrayList<Integer> valoraciones
	ArrayList<Contenido> contRelacionado
	String link
	
	
	new(String titulo) {
		this.titulo = titulo
	}
	
	override returnPelicula() {
		this
	}
	
	override returnSerie() {
		null
	}
	
	override getRating() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}