package trailFlix.flix.model;

import java.util.ArrayList;
import trailFlix.flix.model.Contenido;
import trailFlix.flix.model.Pelicula;

@SuppressWarnings("all")
public class Serie extends Contenido {
  private ArrayList<String> creadores;
  
  private ArrayList<Contenido> contRelacionado;
  
  private int temporadas;
  
  public Serie(final String titulo) {
    this.setTitulo(titulo);
  }
  
  public Pelicula returnPelicula() {
    return null;
  }
  
  public Serie returnSerie() {
    return this;
  }
  
  public float getRating() {
    throw new UnsupportedOperationException("TODO: auto-generated method stub");
  }
}
