package trailFlix.flix.model;

import java.util.ArrayList;
import org.joda.time.DateTime;
import trailFlix.flix.model.Contenido;

@SuppressWarnings("all")
public class Usuario {
  private int codigo;
  
  private String nombreDeUsuario;
  
  private String nombre;
  
  private DateTime fechaRegistro;
  
  private DateTime fechaNacimiento;
  
  private ArrayList<Usuario> amigos;
  
  private ArrayList<Contenido> contVisto;
  
  private ArrayList<Contenido> contFavorito;
  
  private ArrayList<Contenido> contRecomendado;
  
  public Usuario(final int codigo, final String nombreDeUsuario, final String nombre) {
    this.codigo = codigo;
    this.nombreDeUsuario = nombreDeUsuario;
    this.nombre = nombre;
  }
  
  public Object getPeliculasVistas() {
    return null;
  }
  
  public Object getSeriesVistas() {
    return null;
  }
  
  public Object getPeliculasFavoritas() {
    return null;
  }
  
  public Object getSeriesFavoritas() {
    return null;
  }
}
