package trailFlix.flix.model;

@SuppressWarnings("all")
public class Usuario {
  private int codigo;
  
  private String nombreDeUsuario;
  
  private String nombre;
  
  public Usuario(final int codigo, final String nombreDeUsuario, final String nombre) {
    this.codigo = codigo;
    this.nombreDeUsuario = nombreDeUsuario;
    this.nombre = nombre;
  }
}
