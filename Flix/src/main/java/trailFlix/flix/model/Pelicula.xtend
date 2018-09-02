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
	
	
	new(String titulo,int codigo) {
		this.titulo = titulo
		this.codigo = codigo
	}
	
	def setDirectores(String direc){
		directores.add(direc)
		return this
	}
	def getDirectores(){
		return directores
	}
	def setFechaEstreno(String dmy){
		this.fechaEstreno = dmy
		return this
	}
	def getFechaEstreno() {
		return fechaEstreno
	}
	
	def setValoraciones(int valoraciones){
		this.valoraciones = valoraciones
		return this
	}
	def getValoraciones(){
		return valoraciones
	}
	def setActores(String actors){
		actores.add( actors)
		return this
	}
	def getActores() {
		return actores
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