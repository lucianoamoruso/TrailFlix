package trailFlix.flix.model

import org.joda.time.DateTime
import java.util.ArrayList

class Usuario {
	
	int codigo
	String nombreDeUsuario
	String nombre
	DateTime fechaRegistro
	DateTime fechaNacimiento
	public ArrayList <Usuario> amigos
	public ArrayList <Contenido> contVisto
	public ArrayList <Contenido> contFavorito
	public ArrayList <Contenido> contRecomendado
	
	new(int codigo, String nombreDeUsuario, String nombre) {
		this.codigo = codigo
		this.nombreDeUsuario = nombreDeUsuario
		this.nombre = nombre
		amigos = newArrayList()
		contVisto = newArrayList()
		contFavorito = newArrayList()
		contRecomendado = newArrayList()
	}
	
	def getCodigo(){
		return codigo
	}
	def getNombre(){
		return nombre
	}
	def getNombreUsuario(){
		return nombreDeUsuario
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