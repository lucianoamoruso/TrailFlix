package trailFlix.flix.model

import org.eclipse.xtend.lib.annotations.Accessors

/**
 * Representa una recomendacion de contenido de un usuario a otro.
 */
@Accessors
class RelacionRecomendacion {
	
	Usuario		emisor
	Contenido	contenido
	Usuario		receptor
	
	new(Usuario emisor, Contenido contenido, Usuario receptor) {
		this.emisor = emisor
		this.contenido = contenido
		this.receptor = receptor
	}
}
