package trailFlix.flix.model;

import java.util.ArrayList;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.annotations.Observable;
import trailFlix.flix.model.Categoria;
import trailFlix.flix.model.Clasificacion;
import trailFlix.flix.model.Pelicula;
import trailFlix.flix.model.Serie;

@Accessors
@Observable
@SuppressWarnings("all")
public abstract class Contenido {
  protected int codigo;
  
  protected String titulo = "sin titulo";
  
  protected ArrayList<Categoria> categorias;
  
  protected Clasificacion clasificacion;
  
  public abstract Pelicula returnPelicula();
  
  public abstract Serie returnSerie();
  
  public abstract double getRating();
  
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
  
  @Pure
  public ArrayList<Categoria> getCategorias() {
    return this.categorias;
  }
  
  public void setCategorias(final ArrayList<Categoria> categorias) {
    this.categorias = categorias;
  }
  
  @Pure
  public Clasificacion getClasificacion() {
    return this.clasificacion;
  }
  
  public void setClasificacion(final Clasificacion clasificacion) {
    this.clasificacion = clasificacion;
  }
}
