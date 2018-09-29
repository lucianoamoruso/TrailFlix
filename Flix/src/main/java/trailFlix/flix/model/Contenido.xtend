package trailFlix.flix.model

import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
@Observable
abstract class Contenido {
	protected int				codigo
	protected String			titulo = "sin titulo"
	protected List <String>		categorias
	protected String			clasificacion
	protected List<Contenido>	contRelacionado
	
	
	def abstract double getRating()
	
	
	def  esSerie(){
		false
	}
	def esPelicula(){
		false
	}

	override toString() {
		titulo
	}
}