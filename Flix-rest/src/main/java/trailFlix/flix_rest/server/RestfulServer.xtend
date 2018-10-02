package trailFlix.flix_rest.server

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
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
	
//		----------------- GET -----------------
	
	/**
	 * Prop: ofrece el listado de peliculas disponible en el sistema.
	 */
	@Get("/peliculas")
	def getPeliculas() {
		response.contentType = ContentType.APPLICATION_JSON		//Declaramos el tipo de respuesta que da nuestro servidor.
		return ok(intermodelo.peliculas.toJson)					//Devolvemos el codigo de OK (200) y en el body el listado de las peliculas serializado a json.
	}
	
	
	@Get("/categories")
	def getCategorias() {
		response.contentType = ContentType.APPLICATION_JSON
		return ok(intermodelo.categorias.toJson)
	}
	
	@Get("/content/:category")
	def contenidoDeCategoria() {
		response.contentType = ContentType.APPLICATION_JSON
		return ok(intermodelo.contenidosDeCategoria(category).toJson)
	}
	
	@Get("/:username/favs")
	def favoritosDe() {
		try {
			response.contentType = ContentType.APPLICATION_JSON
			return ok(intermodelo.favoritosDe(username).toJson)
		} catch (Exception excepcion) {
			return badRequest(errorJson("No existe el usuario de nombre " + username))
		}
	}
	
	@Get("/:username/movie/:id")
	def peliculaSegunUsuario() {
		try {
			response.contentType = ContentType.APPLICATION_JSON
			return ok(intermodelo.peliculaSegunUsuario(id,username))	//Ya devuelve un JSON
		} catch (Exception excepcion) {
			return badRequest(errorJson("No existe el usuario de nombre " + username + " o no existe la pelicula de codigo " + id))
		}
	}
	
//		----------------- POST -----------------

	@Post("/peliculas/:codigoPelicula/:codigoContenido")
	def agregarContenidoRelacionado() {
		response.contentType = ContentType.APPLICATION_JSON
		try {
			intermodelo.agregarRelacionado(codigoPelicula,codigoContenido)
			return ok("Contenido relacionado agregado correctamente")
		} catch (Exception exception) {
			return badRequest(errorJson("No existe la pelicula con codigo " + codigoPelicula))
		}
	}
	
	def errorJson(String mensaje) {
		"{ error: " + mensaje + " }"
	}
	
}
