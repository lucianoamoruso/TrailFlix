package trailFlix.flix.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import trailFlix.flix.model.Pelicula


@Accessors
@Observable
class AdminMovieInfo {
	
	Pelicula pelicula
	
	new(Pelicula pelicula) {
		this.pelicula = pelicula
	}
	
}