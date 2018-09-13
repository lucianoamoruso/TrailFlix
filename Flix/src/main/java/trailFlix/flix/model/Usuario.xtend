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
		var retorno = newArrayList
		for (i:0..this.contVisto.size-1){
			if (this.contVisto.get(i).returnPelicula() !== null){
				retorno.add(this.contVisto.get(i))
			}
		}
		retorno
	}
	
	def getSeriesVistas(){
		var retorno = newArrayList
		for (i:0..this.contVisto.size-1){
			if (this.contVisto.get(i).returnSerie() !== null){
				retorno.add(this.contVisto.get(i))
			}
		}
		retorno
	}
	
	def getPeliculasFavoritas(){
		var retorno = newArrayList
		for (i:0..this.contFavorito.size-1){
			if (this.contFavorito.get(i).returnPelicula() !== null){
				retorno.add(this.contFavorito.get(i))
			}
		}
		retorno
	}
	
	def getSeriesFavoritas(){
		var retorno = newArrayList
		for (i:0..this.contFavorito.size-1){
			if (this.contFavorito.get(i).returnSerie() !== null){
				retorno.add(this.contFavorito.get(i))
			}
		}
		retorno
	}
	
}