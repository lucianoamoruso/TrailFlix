package trailFlix.flix.model

import org.joda.time.DateTime
import java.util.ArrayList

class Usuario {
	
	int codigo
	String nombreDeUsuario
	String nombre
	DateTime fechaRegistro
	DateTime fechaNacimiento
	ArrayList <Usuario> amigos
	ArrayList <Contenido> contVisto
	ArrayList <Contenido> contFavorito
	ArrayList <Contenido> contRecomendado
	
	new(int codigo, String nombreDeUsuario, String nombre) {
		this.codigo = codigo
		this.nombreDeUsuario = nombreDeUsuario
		this.nombre = nombre
	}
	
	def getPeliculasVistas(){
		//TO DO
	}
	
	def getSeriesVistas(){
		//TO DO
	}
	
	def getPeliculasFavoritas(){
		//TO DO
	}
	
	def getSeriesFavoritas(){
		//TO DO
	}
	
}