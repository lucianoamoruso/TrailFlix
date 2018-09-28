package trailFlix.flix_rest.simple_model

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pelicula_Simple extends Contenido_Simple {
	
	int				codigo
	String			titulo
	List<String>	categorias
	String			clasificacion
	String			fechaEstreno
	int				duracion
	List<String>	directores
	List<String>	actores
	List<Integer>	valoraciones
	List<Integer>	contRelacionado
	String			link
	
	new(int codigo, String titulo, List<String> categorias, String clasificacion, String fechaEstreno, int duracion, ArrayList<String> directores, ArrayList<String> actores, ArrayList<Integer> valoraciones, List<Integer> contRelacionado, String link) {
		this.codigo				= codigo
		this.titulo				= titulo
		this.categorias			= categorias
		this.clasificacion		= clasificacion
		this.fechaEstreno		= fechaEstreno
		this.duracion			= duracion
		this.directores			= directores
		this.actores			= actores
		this.valoraciones		= valoraciones
		this.contRelacionado	= contRelacionado
		this.link				= link
	}
	
}