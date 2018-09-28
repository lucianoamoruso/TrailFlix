package trailFlix.flix.helpers

import trailFlix.flix.model.TrailFlix

interface Loader {
	
	def abstract void rellenarDatos(TrailFlix trailflix)
}
