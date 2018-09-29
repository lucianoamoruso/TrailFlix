package trailFlix.flix_rest.simple_model

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Serie_Simple extends Contenido_Simple {
	
	int						codigo
	String					titulo
	List<String>			categorias
	String					clasificacion
	List<String>			creadores
	List<Capitulo_Simple>	capitulos
	int						temporadas
	List<Integer>			contRelacionado
	
	new(int codigo, String titulo, List<String> categorias, String clasificacion, List<String> creadores, List<Capitulo_Simple> capitulos_planos, int temporadas, List<Integer> relacionado) {
		this.codigo				= codigo
		this.titulo				= titulo
		this.categorias			= categorias
		this.clasificacion		= clasificacion
		this.creadores			= creadores
		this.capitulos			= capitulos_planos
		this.temporadas			= temporadas
		this.contRelacionado	= relacionado
	}
	
}
