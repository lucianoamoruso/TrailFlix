package trailFlix.flix.model;

import java.util.ArrayList;
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
  
  public Object getRating() {
    return null;
  }
}
