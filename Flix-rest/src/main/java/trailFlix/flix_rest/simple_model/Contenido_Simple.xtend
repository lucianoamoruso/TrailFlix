package trailFlix.flix_rest.simple_model

import java.util.List

class Contenido_Simple {
	
	protected int			codigo
	protected String		titulo
	protected List<String>	categorias
	protected String		clasificacion
	
	new(int codigo, String titulo, List<String> categorias, String clasificacion) {
		this.codigo			= codigo
		this.titulo			= titulo
		this.categorias		= categorias
		this.clasificacion	= clasificacion
	}
	
}