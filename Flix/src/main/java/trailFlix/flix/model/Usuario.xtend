package trailFlix.flix.model

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.LocalDate
import org.uqbar.commons.model.annotations.Observable
import java.util.ArrayList

@Accessors
@Observable
class Usuario {
	
	int codigo
	String nombreDeUsuario
	String nombre
	LocalDate fechaRegistro
	LocalDate fechaNacimiento
	public List <Usuario> amigos
	public List <Contenido> contVisto
	public List <Contenido> contFavorito
	public List <Contenido> contRecomendado		//Contenido sugerido por sus amigos
	List <RelacionRecomendacion> relaciones_recomendacion	//Este campo no va a ser mostrado en una UI
	
	new(String nombreDeUsuario, String nombre) {
		this.codigo = codigo
		this.nombreDeUsuario = nombreDeUsuario
		this.nombre = nombre
		amigos = new ArrayList
		contVisto = new ArrayList
		contFavorito = new ArrayList
		contRecomendado = new ArrayList
		relaciones_recomendacion = new ArrayList
	}
	
	def getPeliculasVistas(){
		return this.contVisto.filter[it.esPelicula]
	}
	
	def getSeriesVistas(){
		return this.contVisto.filter[it.esSerie]
	}
	
	def getPeliculasFavoritas(){
		return this.contFavorito.filter[it.esPelicula]
	}
	
	def getSeriesFavoritas(){
		return this.contFavorito.filter[it.esSerie]
	}
	
	/**
	 * Prop: recomienda un contenido a un usuario en su lista de amigos.
	 */
	def void recomendar(Contenido contenido, Usuario usuario) {
		val relacion = new RelacionRecomendacion(this,contenido,usuario)
		relaciones_recomendacion.add(relacion)
		usuario.recibirRecomendacion(relacion)
	}
	
	/**
	 * Prop: recibe una recomendacion de contenido de un amigo.
	 */
	def void recibirRecomendacion(RelacionRecomendacion relacion) {
		relaciones_recomendacion.add(relacion)
		contRecomendado.add(relacion.contenido)
	}
	
	override toString() {
		nombreDeUsuario
	}
	
}
