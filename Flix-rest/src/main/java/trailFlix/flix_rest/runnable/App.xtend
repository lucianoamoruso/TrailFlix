package trailFlix.flix_rest.runnable

import org.uqbar.xtrest.api.XTRest
import trailFlix.flix_rest.server.RestfulServer
import trailFlix.flix.model.TrailFlix
import trailFlix.flix.appModel.AdminMain

class App {
	
	def static void main(String[] args) {
		val dummyVentana = new AdminMain	//Hay que hacer que trailFlix no necesite conocer una ventana, hasta ese entonces usaremos este dummy.
		val trailFlix = new TrailFlix(dummyVentana)
		XTRest.startInstance(9000, new RestfulServer(trailFlix))
	}
}
