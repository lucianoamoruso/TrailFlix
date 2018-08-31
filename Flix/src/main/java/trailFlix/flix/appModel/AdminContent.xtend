package trailFlix.flix.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.util.List
import trailFlix.flix.model.Contenido
import trailFlix.flix.model.Pelicula
import trailFlix.flix.model.Serie
import java.util.ArrayList

@Accessors
@Observable
class AdminContent {
	List<Contenido> disponibles = new ArrayList
	Contenido elegido
	
	new() {rellenar}
	
	def rellenar() {
		disponibles => [
			add(new Pelicula)
			add(new Serie)
			add(new Pelicula)
			add(new Serie)
		]
	}
}