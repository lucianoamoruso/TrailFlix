package trailFlix.flix.model

class GeneradorDeIds {
	
	
	int id
	
	new (){
		this.id = 0
	}
	
	def generarCodigo(){
		this.id++
	}
}