package trailFlix.flix.model;

import trailFlix.flix.model.Contenido;
import trailFlix.flix.model.Serie;

@SuppressWarnings("all")
public class Pelicula extends Contenido {
  public Pelicula(final String titulo) {
    this.setTitulo(titulo);
  }
  
  public Pelicula returnPeliculaVista() {
    return null;
  }
  
  public Serie returnSerieVista() {
    return null;
  }
}
