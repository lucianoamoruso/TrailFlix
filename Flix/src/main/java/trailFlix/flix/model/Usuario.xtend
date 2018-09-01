package trailFlix.flix.model

class Usuario {
	int codigo
	String nombreDeUsuario
	String nombre
	
	new(int codigo, String nombreDeUsuario, String nombre) {
		this.codigo = codigo
		this.nombreDeUsuario = nombreDeUsuario
		this.nombre = nombre
	}
	
}