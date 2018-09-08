package trailFlix.flix.model

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Serie extends Contenido {
	
	ArrayList <String> creadores
	ArrayList <Capitulo> capitulos
	int temporadas
	ArrayList<Integer> valoraciones
	List<Contenido> contRelacionado
		
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
	def getTemporadas() {
		return capitulos.size()
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
		for (i : 0..this.capitulos.size){
			sum = sum + capitulos.get(i).getRating()
		}
		sum / capitulos.size
	}
	
	
}