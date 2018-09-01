package trailFlix.flix.model;

import trailFlix.flix.model.Contenido;
import trailFlix.flix.model.Pelicula;

@SuppressWarnings("all")
public class Serie extends Contenido {
  public Serie(final String titulo) {
    this.setTitulo(titulo);
  }
  
  public Pelicula returnPeliculaVista() {
    return null;
  }
  
  public Serie returnSerieVista() {
    return null;
  }
}
