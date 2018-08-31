package trailFlix.flix.appModel;

import java.util.Collection;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.annotations.Observable;
import trailFlix.flix.model.Categoria;
import trailFlix.flix.model.Clasificacion;
import trailFlix.flix.model.Contenido;

@Accessors
@Observable
@SuppressWarnings("all")
public class AdminMovie {
  private String titulo;
  
  private final Categoria[] categorias = new Categoria[4];
  
  private final Clasificacion[] clasificaciones = new Clasificacion[4];
  
  private List<Contenido> relacionado;
  
  private /* TrailFlix */Object trailFlix;
  
  public AdminMovie() {
    ((List<Categoria>)Conversions.doWrapArray(this.categorias)).addAll(((Collection<? extends Categoria>)Conversions.doWrapArray(Categoria.values())));
    ((List<Clasificacion>)Conversions.doWrapArray(this.clasificaciones)).addAll(((Collection<? extends Clasificacion>)Conversions.doWrapArray(Clasificacion.values())));
  }
  
  /**
   * Prop: Carga de datos mock el modelo para poder interactuar en la UI de usuario.
   */
  public Object rellenarDatos() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe field AdminMovie.trailFlix refers to the missing type TrailFlix"
      + "\nrellenarDatos cannot be resolved");
  }
  
  /**
   * Prop: Carga una nueva pelicula a la base de datos.
   */
  public Object nuevaPeli() {
    return null;
  }
  
  /**
   * Prop: Quita contenido relacionado a una pelicula.
   */
  public Object quitarContenido() {
    return null;
  }
  
  /**
   * Prop: Añade contenido relacionado a una pelicula.
   */
  public Object agregarContenido() {
    return null;
  }
  
  @Pure
  public String getTitulo() {
    return this.titulo;
  }
  
  public void setTitulo(final String titulo) {
    this.titulo = titulo;
  }
  
  @Pure
  public Categoria[] getCategorias() {
    return this.categorias;
  }
  
  @Pure
  public Clasificacion[] getClasificaciones() {
    return this.clasificaciones;
  }
  
  @Pure
  public List<Contenido> getRelacionado() {
    return this.relacionado;
  }
  
  public void setRelacionado(final List<Contenido> relacionado) {
    this.relacionado = relacionado;
  }
  
  @Pure
  public TrailFlix getTrailFlix() {
    return this.trailFlix;
  }
  
  public void setTrailFlix(final TrailFlix trailFlix) {
    this.trailFlix = trailFlix;
  }
}
