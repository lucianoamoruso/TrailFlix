package trailFlix.flix.appModel

import trailFlix.flix.model.TrailFlix
import java.util.List
import trailFlix.flix.model.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class AdminUserList {
	TrailFlix		trailFlix
	List<Usuario>	usuarios
	Usuario			sel_usuario
	String			user_find
	boolean			listo = false
	boolean 		visible = false		//Se usa para crear elementos invisibles
	
	new(TrailFlix trailFlix) {
		this.trailFlix = trailFlix
		usuarios = trailFlix.usuarios
	}
	
	def actualizarContenidos() {
		
		val List<Usuario> usuarios = trailFlix.usuarios
		this.usuarios = usuarios.filter[usuario|this.match(user_find, usuario.nombreDeUsuario) || this.match(user_find, usuario.nombre)].toList
		if (sel_usuario === null) {listo = false}
		
	}

	def match(Object expectedValue, Object realValue) {
		if (expectedValue === null) {
			return true
		}
		if (realValue === null) {
			return false
		}
		realValue.toString().toLowerCase().contains(expectedValue.toString().toLowerCase())
	}

	/*
	 * Prop: limpia el campo de busqueda de usuarios.
	 */
	def limpiarUserFind() {
		setUser_find("")
	}

//-----------------GETTERS Y SETTERS----------------------------

	def void setSel_usuario(Usuario sel_usuario) {
		this.sel_usuario = sel_usuario
		listo = true
	}
	
	def void setUser_find(String user_find) {
		this.user_find = user_find
		actualizarContenidos()
	}

}
