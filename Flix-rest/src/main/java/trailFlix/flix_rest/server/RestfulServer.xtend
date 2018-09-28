package trailFlix.flix_rest.server

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import trailFlix.flix_rest.helpers.Intermodelo

@Controller
class RestfulServer {
	
	Intermodelo intermodelo
	
	extension JSONUtils = new JSONUtils
	
	new (Intermodelo intermodelo) {
		this.intermodelo = intermodelo
	}
	
	/**
	 * Prop: ofrece el listado de peliculas disponible en el sistema.
	 */
	@Get("/peliculas")
	def getPeliculas() {
		response.contentType = ContentType.APPLICATION_JSON		//Declaramos el tipo de respuesta que da nuestro servidor.
		return ok(intermodelo.peliculas.toJson)					//Devolvemos el codigo de OK (200) y en el body el listado de las peliculas serializado a json.
	}
	
}
