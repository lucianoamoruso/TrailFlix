package trailFlix.flix.model;

import java.util.ArrayList;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;

@SuppressWarnings("all")
public class Capitulo {
  private int codigo;
  
  private String titulo;
  
  private int temporada;
  
  private int capituloNro;
  
  private DateTime fechaEstreno;
  
  private LocalDate duracion;
  
  private ArrayList<String> directores;
  
  private ArrayList<String> actores;
  
  private ArrayList<Integer> valoraciones;
  
  private String link;
  
  public Capitulo(final String titulo) {
    this.titulo = titulo;
  }
  
  public int getRating() {
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
