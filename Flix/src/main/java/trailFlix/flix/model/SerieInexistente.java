package trailFlix.flix.model;

public class SerieInexistente extends ContenidoInexistente {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7606444046095061492L;

	@Override
	public String getMessage() {
		return "El codigo no existe o no representa ninguna serie en el sistema";
	}

}
