package trailFlix.flix.model

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.util.ArrayList

@Accessors
@Observable
class Serie extends Contenido {
	
	List <String> creadores
	List <Capitulo> capitulos
	int temporadas
		
	new (String titulo){
		this.titulo = titulo
		creadores = new ArrayList
		capitulos = new ArrayList
		contRelacionado = new ArrayList
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

	override esSerie (){
		true
	}
	
	override getRating() {
		if (this.capitulos.size == 0) return 0
		this.capitulos.fold(0d, [res, cap | res + cap.rating]) / capitulos.size
	}
	
	
}