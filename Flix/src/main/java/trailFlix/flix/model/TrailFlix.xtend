package trailFlix.flix.model

import java.util.List
import java.util.ArrayList

class TrailFlix {
	List<Pelicula> peliculas
	List<Serie> series
	List<Usuario> usuarios
	
	new() {
		peliculas = new ArrayList
		series = new ArrayList
		usuarios = new ArrayList
	}
	
	def rellenarDatos() {
		peliculas => [
			add(new Pelicula("Terminator"))
			add(new Pelicula("The Spacito 3"))
			add(new Pelicula("Wall-E"))
		]
		
		series => [
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
	
//-----------------GETTERS Y SETTERS----------------------------
	
	def getPeliculas() {
		this.peliculas
	}
	
	def void setPeliculas(List<Pelicula> peliculas) {
		this.peliculas = peliculas
	}
	
	def getSeries() {
		this.series
	}
	
	def void setSeries(List<Serie> series) {
		this.series = series
	}
	
	def getUsuarios() {
		this.usuarios
	}
	
	def void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios
	}
}