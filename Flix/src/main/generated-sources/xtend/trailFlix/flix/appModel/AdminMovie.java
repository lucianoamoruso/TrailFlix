package trailFlix.flix.appModel;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.annotations.Observable;
import trailFlix.flix.model.Categoria;
import trailFlix.flix.model.Clasificacion;
import trailFlix.flix.model.Contenido;
import trailFlix.flix.model.Pelicula;
import trailFlix.flix.model.Serie;
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
  
  private List<Categoria> categorias = (List<Categoria>)Conversions.doWrapArray(Categoria.values());
  
  private List<Clasificacion> clasificaciones = (List<Clasificacion>)Conversions.doWrapArray(Clasificacion.values());
  
  private List<Contenido> relacionado = new ArrayList<Contenido>();
  
  private Categoria sel_categorias;
  
  private Clasificacion sel_clasificacion;
  
  private Contenido sel_relacionado;
  
  public AdminMovie(final TrailFlix trailFlix) {
    this.trailFlix = trailFlix;
    final Procedure1<List<Contenido>> _function = new Procedure1<List<Contenido>>() {
      public void apply(final List<Contenido> it) {
        it.add(IterableExtensions.<Pelicula>head(trailFlix.getPeliculas()));
        it.add(IterableExtensions.<Serie>head(trailFlix.getSeries()));
      }
    };
    ObjectExtensions.<List<Contenido>>operator_doubleArrow(
      this.relacionado, _function);
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
  public boolean quitarContenido() {
    return this.relacionado.remove(this.sel_relacionado);
  }
  
  /**
   * Prop: Añade contenido relacionado a una pelicula.
   */
  public boolean agregarContenido(final Contenido contenido) {
    return this.relacionado.add(contenido);
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
  public List<Categoria> getCategorias() {
    return this.categorias;
  }
  
  public void setCategorias(final List<Categoria> categorias) {
    this.categorias = categorias;
  }
  
  @Pure
  public List<Clasificacion> getClasificaciones() {
    return this.clasificaciones;
  }
  
  public void setClasificaciones(final List<Clasificacion> clasificaciones) {
    this.clasificaciones = clasificaciones;
  }
  
  @Pure
  public List<Contenido> getRelacionado() {
    return this.relacionado;
  }
  
  public void setRelacionado(final List<Contenido> relacionado) {
    this.relacionado = relacionado;
  }
  
  @Pure
  public Categoria getSel_categorias() {
    return this.sel_categorias;
  }
  
  public void setSel_categorias(final Categoria sel_categorias) {
    this.sel_categorias = sel_categorias;
  }
  
  @Pure
  public Clasificacion getSel_clasificacion() {
    return this.sel_clasificacion;
  }
  
  public void setSel_clasificacion(final Clasificacion sel_clasificacion) {
    this.sel_clasificacion = sel_clasificacion;
  }
  
  @Pure
  public Contenido getSel_relacionado() {
    return this.sel_relacionado;
  }
  
  public void setSel_relacionado(final Contenido sel_relacionado) {
    this.sel_relacionado = sel_relacionado;
  }
}
