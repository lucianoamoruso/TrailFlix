package trailFlix.flix_ui

import org.apache.commons.collections15.Transformer
import org.uqbar.arena.graphics.Image

class TransformadorImagen implements Transformer<String,Image> {
	
	override transform(String input) {
		new Image(input)
	}
	
}