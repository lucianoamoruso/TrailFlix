package trailFlix.flix_rest.runnable

import org.uqbar.xtrest.api.XTRest
import trailFlix.flix_rest.server.RestfulServer
import trailFlix.flix.model.TrailFlix
import trailFlix.flix.appModel.AdminMain
import trailFlix.flix.helpers.DataLoader
import trailFlix.flix_rest.helpers.Intermodelo

class App {
	
	def static void main(String[] args) {
		val dummyVentana = new AdminMain	//Hay que hacer que trailFlix no necesite conocer una ventana, hasta ese entonces usaremos este dummy.
		val trailFlix = new TrailFlix(dummyVentana)
		val loader = new DataLoader
		loader.rellenarDatos(trailFlix)
		val intermodelo = new Intermodelo(trailFlix)
		XTRest.startInstance(9000, new RestfulServer(intermodelo))
	}
}
