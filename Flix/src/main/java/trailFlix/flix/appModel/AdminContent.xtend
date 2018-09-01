package trailFlix.flix.appModel

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import trailFlix.flix.model.Contenido
import trailFlix.flix.model.TrailFlix

@Accessors
@Observable
class AdminContent {
	TrailFlix trailFlix
	List<Contenido> disponibles = new ArrayList
	Contenido elegido
	
	new(TrailFlix trailFlix) {
		this.trailFlix = trailFlix
		disponibles => [		//Rellenado
			addAll(trailFlix.peliculas)
			addAll(trailFlix.series)
			]
	}
		
}