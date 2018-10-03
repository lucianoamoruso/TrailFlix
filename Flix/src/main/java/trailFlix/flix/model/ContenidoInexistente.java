package trailFlix.flix.model;

public class ContenidoInexistente extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5747246856712716558L;

	@Override
	public String getMessage() {
		return "El codigo no existe o no representa ningun contenido en el sistema";
	}
	
}
