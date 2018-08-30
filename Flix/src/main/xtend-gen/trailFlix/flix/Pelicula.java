package trailFlix.flix;

import trailFlix.flix.Contenido;

@SuppressWarnings("all")
public class Pelicula implements Contenido {
  private final String _titulo;
  
  private final int _codigo;
  
  public Pelicula(final String tituto, final int codigo) {
    this._titulo = this.titulo();
    this._codigo = codigo;
  }
  
  public int codigo() {
    return this._codigo;
  }
  
  public String titulo() {
    return this._titulo;
  }
}
