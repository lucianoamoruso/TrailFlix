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

	def void setSel_usuario(Usuario sel_usuario) {
		this.sel_usuario = sel_usuario
		listo = true
	}	
}
