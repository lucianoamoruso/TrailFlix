package trailFlix.flix_ui

import trailFlix.flix_ui.AdminSerieWindow
import org.uqbar.arena.windows.WindowOwner
import trailFlix.flix.appModel.AdminSerie

class AdminSerieModifyWindow extends AdminSerieWindow {
	
	new(WindowOwner owner, AdminSerie modelpelicula) {
		super(owner, modelpelicula)
		taskDescription = "Modifique una serie"
	}
}