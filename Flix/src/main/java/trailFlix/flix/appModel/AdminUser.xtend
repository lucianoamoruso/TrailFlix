package trailFlix.flix.appModel

import trailFlix.flix.model.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class AdminUser {
	Usuario usuario
	
	new(Usuario usuario) {
		this.usuario = usuario
	}
	
	def nombre() {
		usuario.nombre
	}
	
	def nombreDeUsuario() {
		usuario.nombreDeUsuario
	}
	
}
