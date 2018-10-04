package trailFlix.flix.helpers

import java.util.ArrayList
import trailFlix.flix.model.RelacionRecomendacion
import trailFlix.flix.model.TrailFlix
import trailFlix.flix.model.UsuarioInexistente
import trailFlix.flix.model.Contenido

/**
 * Esta clase se encarga de administrar el contenido guardado en trailFlix, o sea que provee metodos para modificar sus atributos.
 * No almacena datos, simplemente ofrece logica de administracion y recolecta informacion.
 */
class ContentManager {
	
	TrailFlix trailFlix
	
	new(TrailFlix trailFlix) {
		this.trailFlix = trailFlix
	}
	
	def void agregarRelacionado(int target,int nuevo) {
		val objetivo = trailFlix.buscarContenido(target)
		val relacionado = trailFlix.buscarContenido(nuevo)
		objetivo.contRelacionado.add(relacionado)
	}
	
	/**
	 * Prop: recibe un username y devuelve el usuario asociado.
	 */
	def conseguirUsuario(String username) {
		val resultado = trailFlix.usuarios.findFirst[it.nombreDeUsuario == username]
		if (resultado===null) {throw new UsuarioInexistente}
		resultado
	}
	
	/**
	 * Prop: devuelve si el usuario vio el contenido identificado con <code>cont_cod</code>.
	 */
	def vioContenido(int cont_cod, String username) {
		val usuario = conseguirUsuario(username)
		usuario.contVisto.exists[it.codigo == cont_cod]
	}
	
	/**
	 * Prop: devuelve la lista de nombres de usuario de quienes recomendaron el contenido al usuario. 
	 */
	def recomendadoresDe(int cont_cod, String username) {
		val relaciones = conseguirUsuario(username).relaciones_recomendacion
		val filtradas = relaciones.filter[it.contenido.codigo == cont_cod].toList
		val recomendadores = new ArrayList
		for (RelacionRecomendacion relacion : filtradas) {
			recomendadores.add(relacion.emisor.nombreDeUsuario)
		}
		recomendadores.filter[it != username].toList	//Esto filtra las apariciones del usuario que recibe recomendaciones
	}
	
	/**
	 * Prop: busca en los titulos de todos los contenidos y devuelve los contenidos que coincidan.
	 */
	def buscarContenidos(String texto) {
		trailFlix.contenidos.filter[it.titulo.trim.toLowerCase.contains(texto)].toList
	}
	
	/**
	 * Prop: agrega la pelicula de codigo <code>cont_cod</code> a la lista de favoritos del usuario.
	 */
	def agregarFavoritoPeli(String username, int peli_cod) {
		val usuario = conseguirUsuario(username)
		val pelicula = trailFlix.buscarPelicula(peli_cod)
		usuario.getContFavorito.add(pelicula)
	}
	
	/**
	 * Prop: agrega la serie de codigo <code>cont_cod</code> a la lista de favoritos del usuario.
	 */
	def agregarFavoritoSerie(String username, int serie_cod) {
		val usuario = conseguirUsuario(username)
		val serie = trailFlix.buscarSerie(serie_cod)
		usuario.getContFavorito.add(serie)
	}
	
	/**
	 * Prop: quita la pelicula de codigo <code>cont_cod</code> de la lista de favoritos del usuario.
	 */
	def quitarFavoritoPeli(String username, int peli_cod) {
		val usuario = conseguirUsuario(username)
		val pelicula = trailFlix.buscarPelicula(peli_cod)
		usuario.getContFavorito.remove(pelicula)
	}
	
	/**
	 * Prop: quita la serie de codigo <code>cont_cod</code> de la lista de favoritos del usuario.
	 */
	def quitarFavoritoSerie(String username, int serie_cod) {
		val usuario = conseguirUsuario(username)
		val serie = trailFlix.buscarSerie(serie_cod)
		usuario.getContFavorito.remove(serie)
	}
	
	/**
	 * Prop: agrega la pelicula de codigo <code>cont_cod</code> a la lista de vistos del usuario.
	 */
	def agregarVistoPeli(String username, int peli_cod) {
		val usuario = conseguirUsuario(username)
		val pelicula = trailFlix.buscarPelicula(peli_cod)
		usuario.getContVisto.add(pelicula)
	}
	
	/**
	 * Prop: agrega la serie de codigo <code>cont_cod</code> a la lista de vistos del usuario.
	 */
	def agregarVistoSerie(String username, int serie_cod) {
		val usuario = conseguirUsuario(username)
		val serie = trailFlix.buscarSerie(serie_cod)
		usuario.getContVisto.add(serie)
	}
	
	/**
	 * Prop: quita la pelicula de codigo <code>cont_cod</code> de la lista de vistos del usuario.
	 */
	def quitarVistoPeli(String username, int peli_cod) {
		val usuario = conseguirUsuario(username)
		val pelicula = trailFlix.buscarPelicula(peli_cod)
		usuario.getContVisto.remove(pelicula)
	}
	
	/**
	 * Prop: quita la serie de codigo <code>cont_cod</code> de la lista de vistos del usuario.
	 */
	def quitarVistoSerie(String username, int serie_cod) {
		val usuario = conseguirUsuario(username)
		val serie = trailFlix.buscarSerie(serie_cod)
		usuario.getContVisto.remove(serie)
	}
	
	/**
	 * Prop: valora una pelicula con la cantidad de estrellas indicada.
	 */
	def ratePelicula(int cont_cod, int stars) {
		val pelicula = trailFlix.buscarPelicula(cont_cod)
		pelicula.valorar(stars)
	}
	
	/**
	 * Prop: valora un capitulo con la cantidad de estrellas indicada.
	 */
	def rateCapitulo(int cont_cod, int stars) {
		val capitulo = trailFlix.buscarCapitulo(cont_cod)
		capitulo.valorar(stars)
	}
	
}
