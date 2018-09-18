package trailFlix.flix.appModel

import trailFlix.flix.model.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.util.List

@Accessors
@Observable
class AdminUser {
	Usuario			usuario
	List<Usuario>	amigos
	Usuario			sel_amigo
	boolean			listo = false	//Indica si hay un amigo seleccionado.
	boolean			visible = false
	
	
	new(Usuario usuario) {
		this.usuario = usuario
		amigos = usuario.getAmigos
	}
	
	def username() {
		usuario.nombreDeUsuario
	}
	
	def nombre() {
		usuario.nombre
	}
	
	def codigo() {
		usuario.codigo.toString
	}
	
	def registro() {
		usuario.fechaRegistro.toString
	}
	
	def nacimiento() {
		usuario.fechaNacimiento.toString
	}
	
	def visto() {	//mostrar tabla
		usuario.getContVisto
	}
	
	def favoritos() {	//mostrar tabla
		usuario.getContFavorito
	}
	
	def recomendado() {	//mostrar tabla
		usuario.getContRecomendado
	}

//-----------------GETTERS Y SETTERS----------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

