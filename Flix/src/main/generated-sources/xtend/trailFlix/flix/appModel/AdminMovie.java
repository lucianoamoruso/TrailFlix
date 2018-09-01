package trailFlix.flix.appModel;

import java.util.Date;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.annotations.Observable;
import trailFlix.flix.model.Categoria;
import trailFlix.flix.model.Clasificacion;
import trailFlix.flix.model.Contenido;
import trailFlix.flix.model.TrailFlix;

@Accessors
@Observable
@SuppressWarnings("all")
public class AdminMovie {
  private TrailFlix trailFlix;
  
  private String titulo;
  
  private int duracion;
  
  private Date fecha_estreno;
  
  private List<String> directores;
  
  private List<String> actores_principales;
  
  private String link;
  
  private final Categoria[] categorias = { Categoria.ACCION, Categoria.COMEDIA, Categoria.DRAMA, Categoria.TERROR };
  
  private final Clasificacion[] clasificaciones = { Clasificacion.APT, Clasificacion.MAYORES13, Clasificacion.MAYORES16, Clasificacion.MAYORES18 };
  
  private List<Contenido> relacionado;
  
  public AdminMovie(final TrailFlix trailFlix) {
    this.trailFlix = trailFlix;
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
   * Idea: va a recibir el codigo (y nombre?) del relacionado desde el input de una ventana simple que se abre
   * al presionar "Agregar"
   */
  public Object agregarContenido(final int codigo) {
    return null;
  }
  
  @Pure
  public TrailFlix getTrailFlix() {
    return this.trailFlix;
  }
  
  public void setTrailFlix(final TrailFlix trailFlix) {
    this.trailFlix = trailFlix;
  }
  
  @Pure
  public String getTitulo() {
    return this.titulo;
  }
  
  public void setTitulo(final String titulo) {
    this.titulo = titulo;
  }
  
  @Pure
  public int getDuracion() {
    return this.duracion;
  }
  
  public void setDuracion(final int duracion) {
    this.duracion = duracion;
  }
  
  @Pure
  public Date getFecha_estreno() {
    return this.fecha_estreno;
  }
  
  public void setFecha_estreno(final Date fecha_estreno) {
    this.fecha_estreno = fecha_estreno;
  }
  
  @Pure
  public List<String> getDirectores() {
    return this.directores;
  }
  
  public void setDirectores(final List<String> directores) {
    this.directores = directores;
  }
  
  @Pure
  public List<String> getActores_principales() {
    return this.actores_principales;
  }
  
  public void setActores_principales(final List<String> actores_principales) {
    this.actores_principales = actores_principales;
  }
  
  @Pure
  public String getLink() {
    return this.link;
  }
  
  public void setLink(final String link) {
    this.link = link;
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
}
