package trailFlix.flix.model;

import java.util.ArrayList;
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
  
  public Pelicula(final String titulo) {
    this.setTitulo(titulo);
  }
  
  public Pelicula returnPelicula() {
    return this;
  }
  
  public Serie returnSerie() {
    return null;
  }
  
  public float getRating() {
    throw new UnsupportedOperationException("TODO: auto-generated method stub");
  }
}
