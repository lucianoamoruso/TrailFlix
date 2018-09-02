package trailFlix.flix.model

import java.util.List
import java.util.ArrayList

class TrailFlix {
	List<Usuario> usuarios
	ArrayList<Contenido> contenido
	
	
	new() {
		contenido = new ArrayList
		usuarios = new ArrayList
	}
	
	def rellenarDatos() {
		contenido => [
			add(new Pelicula("Terminator"))
			add(new Pelicula("The Spacito 3"))
			add(new Pelicula("Wall-E"))
			add(new Serie("Casados con Hijos"))
			add(new Serie("Attack on Titan"))
			add(new Serie("Attack on Pepe"))
			add(new Serie("The Grim Adventures of Billy and Mandy"))
		]
		
		usuarios => [
			add(new Usuario(0001,"carlos3","Carlos"))
			add(new Usuario(0002,"pedro54","Pedro"))
			add(new Usuario(0003,"jose100","Jose"))
			add(new Usuario(0004,"xXxMiguexXx","Miguel"))
		]
	}
	
	def buscarPelicula (String nombre){
		//TO DO
	}
	
	def buscarSerie (String nombre){
		//TO DO
	}
	
	def buscarUsuario (String nombre){
		//TO DO
	}
	
	def buscarPorCategoria (Categoria categoria){
		//TO DO
	}
	
	def buscarPorClasificacion (Clasificacion clasificacion){
		//TO DO
	}
	
	def agregarPelicula (Pelicula pelicula){
		this.contenido.add(pelicula)
	}
	
	def agregarSerie (Serie serie){
		this.contenido.add(serie)
	}
	
	
//-----------------GETTERS Y SETTERS----------------------------
	
	def getPeliculas() {
		//TO DO
	}
	
	def getSeries() {
		//TO DO
	}
	
	def getUsuarios() {
		this.usuarios
	}
	
	def void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios
	}
}