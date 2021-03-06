package trailFlix.flix.appModel

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import trailFlix.flix.model.Contenido
import trailFlix.flix.model.TrailFlix

@Accessors
@Observable
class AdminContentSerie {
	TrailFlix		trailFlix
	AdminSerie		parent
	List<Contenido>	disponibles = new ArrayList
	Contenido		elegido
	boolean			listo = false
	
	new(TrailFlix trailFlix, AdminSerie parent) {
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
	
	def void setElegido(Contenido elegido) {
		this.elegido = elegido
		listo = true
	}
	
}