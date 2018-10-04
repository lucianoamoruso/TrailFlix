package trailFlix.flix.model;

public class PeliculaInexistente extends ContenidoInexistente {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8293783839364990639L;

	@Override
	public String getMessage() {
		return "El codigo no existe o no representa ninguna pelicula en el sistema";
	}

}
