package trailFlix.flix.appModel;

import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.annotations.Observable;
import trailFlix.flix.model.Pelicula;
import trailFlix.flix.model.Serie;
import trailFlix.flix.model.TrailFlix;

@Accessors
@Observable
@SuppressWarnings("all")
public class AdminMain {
  private List<Pelicula> peliculas;
  
  private List<Serie> series;
  
  private String peli_find;
  
  private String serie_find;
  
  private TrailFlix trailFlix;
  
  /**
   * Prop: Busca peliculas procesando el texto guardado en this.peli_find.
   */
  public Object buscarPeliculas() {
    return null;
  }
  
  /**
   * Prop: Busca series procesando el texto guardado en this.serie_find.
   */
  public Object buscarSeries() {
    return null;
  }
  
  /**
   * Prop: Carga de datos mock el modelo para poder interactuar en la UI de usuario.
   */
  public Object rellenarDatos() {
    return this.trailFlix.rellenarDatos();
  }
  
  @Pure
  public List<Pelicula> getPeliculas() {
    return this.peliculas;
  }
  
  public void setPeliculas(final List<Pelicula> peliculas) {
    this.peliculas = peliculas;
  }
  
  @Pure
  public List<Serie> getSeries() {
    return this.series;
  }
  
  public void setSeries(final List<Serie> series) {
    this.series = series;
  }
  
  @Pure
  public String getPeli_find() {
    return this.peli_find;
  }
  
  public void setPeli_find(final String peli_find) {
    this.peli_find = peli_find;
  }
  
  @Pure
  public String getSerie_find() {
    return this.serie_find;
  }
  
  public void setSerie_find(final String serie_find) {
    this.serie_find = serie_find;
  }
  
  @Pure
  public TrailFlix getTrailFlix() {
    return this.trailFlix;
  }
  
  public void setTrailFlix(final TrailFlix trailFlix) {
    this.trailFlix = trailFlix;
  }
}
