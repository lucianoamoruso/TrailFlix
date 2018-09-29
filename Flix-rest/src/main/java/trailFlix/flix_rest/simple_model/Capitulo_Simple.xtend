package trailFlix.flix_rest.simple_model

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Capitulo_Simple {
	
	int				codigo
	String			titulo
	int				temporada
	int				capituloNro
	String			fechaEstreno
	int				duracion
	List<String>	directores
	List<String>	actores
	List<Integer>	valoraciones
	String			link
	
	new(int codigo, String titulo, int temporada, int capituloNro, String fecha, int duracion, List<String> directores, List<String> actores, List<Integer> valoraciones, String link) {
		this.codigo			= codigo
		this.titulo			= titulo
		this.temporada		= temporada
		this.capituloNro	= capituloNro
		this.fechaEstreno	= fecha
		this.duracion		= duracion
		this.directores		= directores
		this.actores		= actores
		this.valoraciones	= valoraciones
		this.link			= link
	}
	
	
}
