package trailFlix.flix.model

import java.util.ArrayList

class Serie extends Contenido {
	
	ArrayList <String> creadores
	ArrayList <Contenido> contRelacionado
	ArrayList <Categoria> categorias
	int temporadas
	ArrayList <Capitulo> capitulos
	ArrayList<Integer> valoraciones
		
	new (String titulo){
		this.titulo = titulo
	}
	
	new(String titulo,int codigo){
		this.titulo = titulo
		this.codigo = codigo
		capitulos = newArrayList()
	}
	
	def addCap(Capitulo cap){
		capitulos.add(cap)
	}
	def capitulos() {
		return capitulos
	}
	def getTemporadas() {
		return capitulos.size()
	}	
	
	def setValoraciones(int valoraciones){
		this.valoraciones = valoraciones
		return this
	}
	def getValoraciones(){
		return valoraciones
	}
	
	override returnPelicula() {
		null
	}
	
	override returnSerie() {
		this
	}
	
	override getRating() {
		var sum = 0
		for (i : 0..this.capitulos.size){
			sum = sum + capitulos.get(i).getRating()
		}
		sum / capitulos.size
	}
	
}