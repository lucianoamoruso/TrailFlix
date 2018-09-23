package trailFlix.flix.model

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.LocalDate
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Usuario {
	
	int codigo
	String nombreDeUsuario
	String nombre
	LocalDate fechaRegistro
	LocalDate fechaNacimiento
	public List <Usuario> amigos
	public List <Contenido> contVisto
	public List <Contenido> contFavorito
	public List <Contenido> contRecomendado
	
	new(String nombreDeUsuario, String nombre) {
		this.codigo = codigo
		this.nombreDeUsuario = nombreDeUsuario
		this.nombre = nombre
		amigos = newArrayList()
		contVisto = newArrayList()
		contFavorito = newArrayList()
		contRecomendado = newArrayList()
	}
	
	def getPeliculasVistas(){
		return this.contVisto.filter[it.esPelicula]
	}
	
	def getSeriesVistas(){
		return this.contVisto.filter[it.esSerie]
	}
	
	def getPeliculasFavoritas(){
		return this.contFavorito.filter[it.esPelicula]
	}
	
	def getSeriesFavoritas(){
		return this.contFavorito.filter[it.esSerie]
	}
	
}