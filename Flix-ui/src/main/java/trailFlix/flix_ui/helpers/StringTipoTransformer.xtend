package trailFlix.flix_ui.helpers

import org.apache.commons.collections15.Transformer

class StringTipoTransformer implements Transformer<Integer,String> {
	
	override transform(Integer input) {
		var String ret
		if (input<1000) {
			ret = "Pelicula"
		} else {
			ret = "Serie"
		}
		ret

	}
	
}
