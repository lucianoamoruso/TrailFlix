package trailFlix.flix.appModel

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import trailFlix.flix.model.Contenido
import trailFlix.flix.model.TrailFlix
import java.awt.Color

@Accessors
@Observable
class AdminContent {
	TrailFlix		trailFlix
	AdminMovie		parent
	List<Contenido>	disponibles = new ArrayList
	Contenido		elegido
	Color			color_item = Color.CYAN
	boolean			listo = false
	
	new(TrailFlix trailFlix, AdminMovie parent) {
		this.trailFlix = trailFlix
		disponibles => [		//Rellenado
			addAll(trailFlix.peliculas)
			addAll(trailFlix.series)
			]
		this.parent = parent
	}
		
	def agregar() {
		parent.agregarContenido(elegido)
	}
	
	def activar() {
		listo = true
	}
	
}