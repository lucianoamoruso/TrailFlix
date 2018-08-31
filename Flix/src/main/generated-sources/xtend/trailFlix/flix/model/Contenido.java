package trailFlix.flix.model;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.annotations.Observable;
import trailFlix.flix.model.Pelicula;
import trailFlix.flix.model.Serie;

@Accessors
@Observable
@SuppressWarnings("all")
public abstract class Contenido {
  private int codigo;
  
  private String titulo = "sin titulo";
  
  public abstract Pelicula returnPeliculaVista();
  
  public abstract Serie returnSerieVista();
  
  @Pure
  public int getCodigo() {
    return this.codigo;
  }
  
  public void setCodigo(final int codigo) {
    this.codigo = codigo;
  }
  
  @Pure
  public String getTitulo() {
    return this.titulo;
  }
  
  public void setTitulo(final String titulo) {
    this.titulo = titulo;
  }
}
