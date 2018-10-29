package trailFlix.flix_rest.server

import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import trailFlix.flix.model.ContenidoInexistente
import trailFlix.flix.model.UsuarioInexistente
import trailFlix.flix_rest.helpers.Intermodelo
import trailFlix.flix_rest.json_holders.EntreUsuarios
import trailFlix.flix_rest.json_holders.PedidoBusqueda
import trailFlix.flix_rest.json_holders.Rating
import trailFlix.flix_rest.json_holders.SesionUsuario
import trailFlix.flix_rest.json_holders.Toggle
import trailFlix.flix.model.CapituloInexistente
import trailFlix.flix.model.PeliculaInexistente
import trailFlix.flix.model.SerieInexistente
import org.eclipse.xtend.lib.annotations.Accessors

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
		response.contentType = ContentType.APPLICATION_JSON
		
		try {
			return ok(intermodelo.favoritosDe(username).toJson)
		} catch (Exception excepcion) {
			return manejarExcepcion(excepcion)
		}
	}
	
	@Get("/:username/movie/:id")
	def peliculaSegunUsuario() {
		response.contentType = ContentType.APPLICATION_JSON

		try {
			return ok(intermodelo.peliculaSegunUsuario(id,username))	//Ya devuelve un JSON
		} catch (Exception excepcion) {
			return manejarExcepcion(excepcion)
		}
	}
	
	@Get("/:username/serie/:id")
	def serieSegunUsuario() {
		response.contentType = ContentType.APPLICATION_JSON
		
		try {
			return ok(intermodelo.serieSegunUsuario(id,username))
		} catch (Exception excepcion) {
			return manejarExcepcion(excepcion)
		}
	}
	
//		----------------- POST -----------------

	@Post("/auth")
	// Body: { "username" : "jose100", "password" : "contrasenia" }
	def autorizarLogin(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON
		var result = ok("El usuario es valido")
		
		try {
			val usuario = body.fromJson(SesionUsuario)
			if (!usuarioEsValido(usuario)) {result = badRequest(errorJson("Nombre de usuario o contrasenia incorrecta"))}
		} catch (Exception excepcion) {
			result = manejarExcepcion(excepcion)
		}
		
		result
	}
	
	def private usuarioEsValido(SesionUsuario usuario) {
		existeUsuario(usuario.username) && contraseniaCorrecta(usuario.password)
	}

	def private existeUsuario(String username) {
		intermodelo.existeUsuario(username)
	}

	def private contraseniaCorrecta(String string) {	//No nos interesa en esta implementacion
		true
	}
	
	@Post("/peliculas/:codigoPelicula/:codigoContenido")
	def agregarContenidoRelacionado() {
		response.contentType = ContentType.APPLICATION_JSON
		var result = ok("Contenido relacionado agregado correctamente")
		
		try {
			intermodelo.agregarRelacionado(codigoPelicula,codigoContenido)
		} catch (Exception exception) {
			result = manejarExcepcion(exception)
		}
		
		return result
	}
	
	@Post("/recommend/:type/:id")
	// Body: { "from": "jose1000", "to": "pedro54" }
	def recomendar(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON
		val envio = body.fromJson(EntreUsuarios)
		val user_from = envio.from
		val user_to = envio.to
		var result = ok("Recomendacion enviada exitosamente")
		val comprobante = result
		
		if (type != "movie" && type != "serie") {
			result = badRequest(errorJson("No existe el tipo de contenido elegido"))
		}
		
		if (comprobante == result) {
			try {
				intermodelo.recomendar(user_from,user_to,id,type)
			} catch (Exception excepcion) {
				result = manejarExcepcion(excepcion)
			}
		}
		
		return result 
	}
	
	@Post("/search")
	// Body: { "text": "terminator" }
	def buscarContenidos(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON
		val pedido = body.fromJson(PedidoBusqueda)
		val texto = pedido.text
		
		try {
			return ok(intermodelo.buscarContenidos(texto.toLowerCase))
		} catch (Exception exception) {
			return badRequest(errorJson("Error desconocido"))
		}
	}
	
//		----------------- PUT -----------------
	
	@Put("/:username/fav/:type/:id")
	// Body { "value": true }
	def toggleFavorito(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON
		val cuerpo = body.fromJson(Toggle)
		val valor = cuerpo.isValue
		var result = ok("Lista de favoritos actualizada")
		val comprobante = result		//Se guarda el estado del resultado para luego ser comparado
		
		if (type != "movie" && type != "serie") {
			result = badRequest(errorJson("No existe el tipo de contenido elegido"))
		}
		
		if (comprobante == result) {		//Si se cumplen los requerimientos de este metodo (o sea que ninguna verificacion causo que cambie el resultado por un badRequest)
			try {
				intermodelo.toggleFavorito(username,id,valor,type)
			} catch (Exception excepcion) {
				result = manejarExcepcion(excepcion)
			}
		}
		
		return result
	}
	
	@Put("/:username/watched/:type/:id")
	// Body { "value": true }
	def toggleVisto(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON
		val cuerpo = body.fromJson(Toggle)
		val valor = cuerpo.isValue
		var result = ok("Lista de vistos actualizada")
		val comprobante = result
		
		if (type != "movie" && type != "serie")	{result = badRequest(errorJson("No existe el tipo de contenido elegido"))}
		
		if (comprobante == result) {
			try {
				intermodelo.toggleVisto(username,id,valor,type)
			} catch (Exception excepcion) {
				result = manejarExcepcion(excepcion)
			}
		}
		
		return result
	}
	
	@Put("/:username/rating/:type/:id")
	// Body { "stars": 3 }
	def rateContenido(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON
		val cuerpo = body.fromJson(Rating)
		val stars = cuerpo.stars
		var result = ok("Valoracion enviada")
		val comprobante = result
		
		//Chequeos
		if (type != "movie" && type != "chapter")	{result = badRequest(errorJson("No existe el tipo de contenido elegido"))}
		if (!enRango(stars))						{result = badRequest(errorJson("Valoracion fuera de rango"))}
		if (!existeUsuario(username)) 				{result = badRequest(errorJson("Nombre de usuario inexistente"))}

		if (comprobante == result) {
			try {
				intermodelo.rateContenido(id,stars,type)
			} catch (Exception excepcion) {
				result = manejarExcepcionRating(excepcion)
			}
		}
		
		return result
	}
	
	def private enRango(int stars) {
		1 <= stars && stars <= 5
	}
	
	def private manejarExcepcion(Exception excepcion) {
		var result = badRequest(errorJson("Error desconocido"))
		if (excepcion.class == ContenidoInexistente) {
			result = badRequest(errorJson("Codigo de contenido inexistente"))
		}
		if (excepcion.class == PeliculaInexistente) {
			result = badRequest(errorJson("Codigo de pelicula inexistente"))
		}
		if (excepcion.class == SerieInexistente) {
			result = badRequest(errorJson("Codigo de serie inexistente"))
		}
		if (excepcion.class == UsuarioInexistente) {
			result = badRequest(errorJson("Nombre de usuario inexistente"))
		}
		result
	}
	
	def private manejarExcepcionRating(Exception excepcion) {
		var result = badRequest(errorJson("Error desconocido"))
		if (excepcion.class == PeliculaInexistente) {
			result = badRequest(errorJson("Codigo de pelicula inexistente"))
		}
		if (excepcion.class == CapituloInexistente) {
			result = badRequest(errorJson("Codigo de capitulo inexistente"))
		}
		result
	}
	
	def private errorJson(String mensaje) {
		new ErrorJson(mensaje).toJson
	}
	
}

@Accessors
class ErrorJson {
	
	String	error
	
	new(String mensaje) {
		this.error = mensaje
	}
	
}
