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
	
	new(TrailFlix trailFlix) {
		this.trailFlix = trailFlix
		usuarios = trailFlix.usuarios
	}
	
}