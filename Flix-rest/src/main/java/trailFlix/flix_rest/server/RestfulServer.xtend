package trailFlix.flix_rest.server

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import trailFlix.flix.model.TrailFlix
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType

@Controller
class RestfulServer {
	TrailFlix trailFlix
	
	extension JSONUtils = new JSONUtils
	
	new (TrailFlix trailFlix) {
		this.trailFlix = trailFlix
	}
	
	/**
	 * Prop: ofrece el listado de peliculas disponible en el sistema.
	 */
	@Get("/peliculas")
	def getPeliculas() {
		response.contentType = ContentType.APPLICATION_JSON		//Declaramos el tipo de respuesta que da nuestro servidor.
		return ok(trailFlix.peliculas.toJson)					//Devolvemos el codigo de OK (200) y en el body el listado de las peliculas serializado a json.
	}
	
}
