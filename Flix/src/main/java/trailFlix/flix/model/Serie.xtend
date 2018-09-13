package trailFlix.flix.model

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Serie extends Contenido {
	
	ArrayList <String> creadores
	ArrayList <Capitulo> capitulos
	int temporadas
	List<Contenido> contRelacionado
		
	new (String titulo){
		this.titulo = titulo
		this.clasificacion = null
		creadores = newArrayList()
		capitulos = newArrayList()
		contRelacionado = newArrayList()
	}
	
	new(String titulo,int codigo){
		this.titulo = titulo
		this.codigo = codigo
		capitulos = newArrayList()
		creadores = newArrayList()
		contRelacionado = newArrayList()
	}
	
	def addCap(Capitulo cap){
		capitulos.add(cap)
	}
	def getTemporadas() {
		temporadas
	}
	
	def getCapitulos() {
		capitulos
	}
	
	def quitarCapitulo (Capitulo cap){
		this.capitulos.remove(cap)
	}
	
	

//-------------------OVERRIDE--------------------------

	override returnPelicula() {
		null
	}
	
	override returnSerie() {
		this
	}
	
	override getRating() {
		var sum = 0
		for (i : 0..this.capitulos.size-1){
			sum = sum + capitulos.get(i).getRating()
		}
		sum / capitulos.size
	}
	
	
}