package trailFlix.flix.model

import org.joda.time.*
import java.util.ArrayList

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