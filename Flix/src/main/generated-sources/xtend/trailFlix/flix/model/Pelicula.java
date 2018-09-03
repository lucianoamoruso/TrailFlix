package trailFlix.flix.model;

import java.util.ArrayList;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.joda.time.DateTime;
import org.joda.time.LocalTime;
import trailFlix.flix.model.Categoria;
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
  
  private ArrayList<Categoria> categorias;
  
  private String link;
  
  public Pelicula(final String titulo) {
    this.titulo = titulo;
  }
  
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
  
  @Override
  public Pelicula returnPelicula() {
    return this;
  }
  
  @Override
  public Serie returnSerie() {
    return null;
  }
  
  @Override
  public double getRating() {
    int _xblockexpression = (int) 0;
    {
      int sum = 0;
      int _size = this.valoraciones.size();
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
      for (final Integer i : _doubleDotLessThan) {
        int _sum = sum;
        sum = (_sum + (i).intValue());
      }
      int _size_1 = this.valoraciones.size();
      _xblockexpression = (sum / _size_1);
    }
    return _xblockexpression;
  }
}
