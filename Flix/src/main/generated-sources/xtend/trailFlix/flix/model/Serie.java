package trailFlix.flix.model;

import java.util.ArrayList;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import trailFlix.flix.model.Capitulo;
import trailFlix.flix.model.Contenido;
import trailFlix.flix.model.Pelicula;

@SuppressWarnings("all")
public class Serie extends Contenido {
  private ArrayList<String> creadores;
  
  private ArrayList<Contenido> contRelacionado;
  
  private int temporadas;
  
  private ArrayList<Capitulo> capitulos;
  
  private ArrayList<Integer> valoraciones;
  
  public Serie(final String titulo, final int codigo) {
    this.titulo = titulo;
    this.codigo = codigo;
    this.capitulos = CollectionLiterals.<Capitulo>newArrayList();
  }
  
  public boolean addCap(final Capitulo cap) {
    return this.capitulos.add(cap);
  }
  
  public ArrayList<Capitulo> capitulos() {
    return this.capitulos;
  }
  
  public int getTemporadas() {
    return this.capitulos.size();
  }
  
  public Object setValoraciones(final int valoraciones) {
    this.setValoraciones(valoraciones);
    return this;
  }
  
  public ArrayList<Integer> getValoraciones() {
    return this.valoraciones;
  }
  
  public Pelicula returnPelicula() {
    return null;
  }
  
  public Serie returnSerie() {
    return this;
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
