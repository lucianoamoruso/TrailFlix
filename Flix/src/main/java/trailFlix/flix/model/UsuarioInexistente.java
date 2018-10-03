package trailFlix.flix.model;

public class UsuarioInexistente extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5763573981502073471L;

	@Override
	public String getMessage() {
		return "El codigo o username no existe o no representa ningun usuario en el sistema";
	}
	
}
