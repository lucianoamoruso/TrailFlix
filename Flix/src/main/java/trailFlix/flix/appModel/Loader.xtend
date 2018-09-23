package trailFlix.flix.appModel

import trailFlix.flix.model.TrailFlix

interface Loader {
	
	def abstract void rellenarDatos(TrailFlix trailflix)
}