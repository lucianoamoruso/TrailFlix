package trailFlix.flix.helpers

import java.util.ArrayList
import trailFlix.flix.model.RelacionRecomendacion
import trailFlix.flix.model.TrailFlix
import trailFlix.flix.model.UsuarioInexistente

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
	 * Prop: quita el contenido de codigo <code>cont_cod</code> de la lista de favoritos del usuario.
	 */
	def quitarFavorito(String username, int cont_cod) {
		val usuario = conseguirUsuario(username)
		val contenido = trailFlix.buscarContenido(cont_cod)
		usuario.getContFavorito.remove(contenido)
	}
	
	/**
	 * Prop: agrega el contenido de codigo <code>cont_cod</code> a la lista de favoritos del usuario.
	 */
	def agregarFavorito(String username, int cont_cod) {
		val usuario = conseguirUsuario(username)
		val contenido = trailFlix.buscarContenido(cont_cod)
		usuario.getContFavorito.add(contenido)
	}
	
}
