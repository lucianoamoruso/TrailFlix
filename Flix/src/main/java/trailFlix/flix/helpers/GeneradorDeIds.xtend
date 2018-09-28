package trailFlix.flix.helpers

class GeneradorDeIds {
	
	int id_peli
	int id_resto
	
	new (){
		this.id_peli = 0
		this.id_resto = 1000
	}
	
	def generarCodigoPeli() {
		this.id_peli++
	}

	def generarCodigoResto(){
		this.id_resto++
	}
	
}
