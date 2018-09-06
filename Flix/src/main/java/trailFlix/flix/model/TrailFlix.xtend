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
		for (i:0..this.contenido.size-1){
			if (this.contenido.get(i).returnPelicula() !== null && this.contenido.get(i).titulo == nombre){
				return this.contenido.get(i)
			}
		}
	}
	
	def buscarSerie (String nombre){
		for (i:0..this.contenido.size-1){
			if (this.contenido.get(i).returnSerie() !== null && this.contenido.get(i).titulo == nombre){
				return this.contenido.get(i)
			}
		}
	}
	
	def buscarUsuario (String nombre){
		for (i:0..this.usuarios.size-1){
			if (this.usuarios.get(i).nombre == nombre){
				return this.usuarios.get(i)
			}
		}
	}
	
	def buscarPorCategoria (Categoria categoria){
		for (i:0..this.contenido.size-1){
			if (this.contenido.get(i).categorias.contains(categoria)){
				return this.contenido.get(i)
			}
		}
	}
	
	def buscarPorClasificacion (Clasificacion clasificacion){
		for (i:0..this.contenido.size-1){
			if (this.contenido.get(i).clasificacion.equals(clasificacion)){
				return this.contenido.get(i)
			}
		}
	}
	
	def agregarPelicula (Pelicula pelicula){
		this.contenido.add(pelicula)
	}
	
	def agregarSerie (Serie serie){
		this.contenido.add(serie)
	}
	
	
//-----------------GETTERS Y SETTERS----------------------------
	
	def getPeliculas() {
		var retorno = newArrayList
		for (i:0..this.contenido.size-1){
			if (this.contenido.get(i).returnPelicula() !== null){
				retorno.add(this.contenido.get(i) as Pelicula)
			}
		}
		retorno
	}
	
	def getSeries() {
		var retorno = newArrayList
		for (i:0..this.contenido.size-1){
			if (this.contenido.get(i).returnSerie() !== null){
				retorno.add(this.contenido.get(i) as Serie)
			}
		}
		retorno
	}
	
	def getUsuarios() {
		this.usuarios
	}
	
	def void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios
	}
}