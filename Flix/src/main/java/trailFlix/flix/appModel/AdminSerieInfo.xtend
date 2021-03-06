package trailFlix.flix.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import trailFlix.flix.model.Serie
import trailFlix.flix.model.Capitulo
import java.util.List

@Accessors
@Observable
class AdminSerieInfo {
	
	Serie serie
	Capitulo sel_capitulo
	List<Capitulo> capitulos
	boolean hay_cap_sel = false
	
	new(Serie serie) {
		this.serie = serie
		this.capitulos = serie.capitulos
	}
	
	def capitulosList() {
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
		
	def void setSel_capitulo (Capitulo sel_capitulo) {
		this.sel_capitulo = sel_capitulo
		hay_cap_sel = true
	}
	
	def quitarCapitulo(){
		this.serie.quitarCapitulo(sel_capitulo)
		this.capitulos.remove(sel_capitulo)
		hay_cap_sel = false
	}
	
}