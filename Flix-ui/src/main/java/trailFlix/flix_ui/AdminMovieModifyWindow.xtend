package trailFlix.flix_ui

import org.uqbar.arena.windows.WindowOwner
import trailFlix.flix.appModel.AdminMovie
import org.uqbar.arena.widgets.Panel

class AdminMovieModifyWindow extends AdminMovieWindow{
	
	new(WindowOwner owner, AdminMovie modelpelicula) {
		super(owner, modelpelicula)
		taskDescription = "Modifique una película"
	}
}