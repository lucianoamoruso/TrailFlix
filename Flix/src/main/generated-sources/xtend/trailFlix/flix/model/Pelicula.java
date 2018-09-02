package trailFlix.flix.model;

import java.util.ArrayList;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.joda.time.DateTime;
import org.joda.time.LocalTime;
import trailFlix.flix.model.Contenido;
import trailFlix.flix.model.Serie;

@SuppressWarnings("all")
public class Pelicula extends Contenido {
  private DateTime fechaEstreno;
  
  private LocalTime duracion;
  
  private ArrayList<String> directores;
  
  private ArrayList<String> actores;
  
  private ArrayList<Integer> valoraciones;
  
  private ArrayList<Contenido> contRelacionado;
  
  private String link;
  
  public Pelicula(final String titulo, final int codigo) {
    this.titulo = titulo;
    this.codigo = codigo;
  }
  
  public Pelicula setDirectores(final String direc) {
    this.directores.add(direc);
    return this;
  }
  
  public ArrayList<String> getDirectores() {
    return this.directores;
  }
  
  public Object setFechaEstreno(final String dmy) {
    this.setFechaEstreno(dmy);
    return this;
  }
  
  public DateTime getFechaEstreno() {
    return this.fechaEstreno;
  }
  
  public Object setValoraciones(final int valoraciones) {
    this.setValoraciones(valoraciones);
    return this;
  }
  
  public ArrayList<Integer> getValoraciones() {
    return this.valoraciones;
  }
  
  public Pelicula setActores(final String actors) {
    this.actores.add(actors);
    return this;
  }
  
  public ArrayList<String> getActores() {
    return this.actores;
  }
  
  public Pelicula returnPelicula() {
    return this;
  }
  
  public Serie returnSerie() {
    return null;
  }
  
  public float getRating() {
    final Function2<Integer, Integer, Integer> _function = new Function2<Integer, Integer, Integer>() {
      public Integer apply(final Integer a, final Integer b) {
        return Integer.valueOf(((a).intValue() + (b).intValue()));
      }
    };
    Integer _reduce = IterableExtensions.<Integer>reduce(this.valoraciones, _function);
    int _size = this.valoraciones.size();
    return ((_reduce).intValue() / _size);
  }
}
