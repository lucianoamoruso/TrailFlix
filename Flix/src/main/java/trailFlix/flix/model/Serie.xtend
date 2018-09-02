package trailFlix.flix.model

import java.util.ArrayList

class Serie extends Contenido {
	
	ArrayList <String> creadores
	ArrayList <Contenido> contRelacionado
	int temporadas
	ArrayList <Capitulo> capitulos
	
	new(String titulo) {
		this.titulo = titulo
	}
	
	override returnPelicula() {
		null
	}
	
	override returnSerie() {
		this
	}
	
	override getRating() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}