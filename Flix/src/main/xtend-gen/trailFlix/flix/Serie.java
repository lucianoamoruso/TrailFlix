package trailFlix.flix;

import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import trailFlix.flix.Capitulo;
import trailFlix.flix.Contenido;

@SuppressWarnings("all")
public class Serie implements Contenido {
  private final String _titulo;
  
  private final int _codigo;
  
  private List<Capitulo> capitulos;
  
  public Serie(final String tituto, final int codigo) {
    this._titulo = this.titulo();
    this._codigo = codigo;
    this.capitulos = CollectionLiterals.<Capitulo>newArrayList();
  }
  
  public boolean addCap(final Capitulo cap) {
    return this.capitulos.add(cap);
  }
  
  public int codigo() {
    return this._codigo;
  }
  
  public String titulo() {
    return this._titulo;
  }
}
