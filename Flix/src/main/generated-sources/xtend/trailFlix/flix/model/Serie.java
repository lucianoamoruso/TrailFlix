package trailFlix.flix.model;

import java.util.ArrayList;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import trailFlix.flix.model.Capitulo;
import trailFlix.flix.model.Categoria;
import trailFlix.flix.model.Contenido;
import trailFlix.flix.model.Pelicula;

@SuppressWarnings("all")
public class Serie extends Contenido {
  private ArrayList<String> creadores;
  
  private ArrayList<Contenido> contRelacionado;
  
  private ArrayList<Categoria> categorias;
  
  private int temporadas;
  
  private ArrayList<Capitulo> capitulos;
  
  private ArrayList<Integer> valoraciones;
  
  public Serie(final String titulo) {
    this.titulo = titulo;
  }
  
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
  
  @Override
  public Pelicula returnPelicula() {
    return null;
  }
  
  @Override
  public Serie returnSerie() {
    return this;
  }
  
  @Override
  public double getRating() {
    int _xblockexpression = (int) 0;
    {
      int sum = 0;
      int _size = this.capitulos.size();
      IntegerRange _upTo = new IntegerRange(0, _size);
      for (final Integer i : _upTo) {
        int _rating = this.capitulos.get((i).intValue()).getRating();
        int _plus = (sum + _rating);
        sum = _plus;
      }
      int _size_1 = this.capitulos.size();
      _xblockexpression = (sum / _size_1);
    }
    return _xblockexpression;
  }
}
