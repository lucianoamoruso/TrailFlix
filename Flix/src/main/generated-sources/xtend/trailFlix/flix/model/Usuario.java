package trailFlix.flix.model;

import java.util.ArrayList;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.joda.time.DateTime;
import trailFlix.flix.model.Contenido;

@SuppressWarnings("all")
public class Usuario {
  private int codigo;
  
  private String nombreDeUsuario;
  
  private String nombre;
  
  private DateTime fechaRegistro;
  
  private DateTime fechaNacimiento;
  
  public ArrayList<Usuario> amigos;
  
  public ArrayList<Contenido> contVisto;
  
  public ArrayList<Contenido> contFavorito;
  
  public ArrayList<Contenido> contRecomendado;
  
  public Usuario(final int codigo, final String nombreDeUsuario, final String nombre) {
    this.codigo = codigo;
    this.nombreDeUsuario = nombreDeUsuario;
    this.nombre = nombre;
    this.amigos = CollectionLiterals.<Usuario>newArrayList();
    this.contVisto = CollectionLiterals.<Contenido>newArrayList();
    this.contFavorito = CollectionLiterals.<Contenido>newArrayList();
    this.contRecomendado = CollectionLiterals.<Contenido>newArrayList();
  }
  
  public int getCodigo() {
    return this.codigo;
  }
  
  public String getNombre() {
    return this.nombre;
  }
  
  public String getNombreUsuario() {
    return this.nombreDeUsuario;
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
