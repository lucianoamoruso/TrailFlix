package trailFlix.flix.appModel;

import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.annotations.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class AdminMainWindow {
  private /* List<Pelicula> */Object peliculas;
  
  private /* List<Serie> */Object series;
  
  private String peli_find;
  
  private String serie_find;
  
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
  
  @Pure
  public /* List<Pelicula> */Object getPeliculas() {
    return this.peliculas;
  }
  
  public void setPeliculas(final /* List<Pelicula> */Object peliculas) {
    this.peliculas = peliculas;
  }
  
  @Pure
  public /* List<Serie> */Object getSeries() {
    return this.series;
  }
  
  public void setSeries(final /* List<Serie> */Object series) {
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
}
