package trailFlix.flix.model;

public class CapituloInexistente extends ContenidoInexistente {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7329743671878902526L;
	
	@Override
	public String getMessage() {
		return "El codigo no existe o no representa ningun capitulo en el sistema";
	}

}
