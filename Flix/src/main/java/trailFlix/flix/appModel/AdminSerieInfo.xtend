package trailFlix.flix.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import trailFlix.flix.model.Serie

@Accessors
@Observable
class AdminSerieInfo {
	
	Serie serie
	
	new(Serie serie) {
		this.serie = serie
	}
	
	def capitulos() {
		serie.capitulos.size.toString
	}
	
	def creadores() {
		serie.creadores.toString
	}
	
	def valoraciones() {
		var String ret
		if (serie.capitulos===null) {
			ret = "<AUN NO VALORADA>"
		} else {
			ret = serie.rating.toString
		}
		ret
	}
	
	def contenido_relacionado() {
		serie.contRelacionado.toString
	}
	
	def temporadas(){
		serie.temporadas.toString
	}
	
	def categorias(){
		serie.categorias.toString
	}
}