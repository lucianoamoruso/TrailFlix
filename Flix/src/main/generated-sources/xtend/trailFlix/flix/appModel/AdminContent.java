package trailFlix.flix.appModel;

import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.annotations.Observable;
import trailFlix.flix.model.Contenido;
import trailFlix.flix.model.Pelicula;
import trailFlix.flix.model.Serie;

@Accessors
@Observable
@SuppressWarnings("all")
public class AdminContent {
  private List<Contenido> disponibles = new ArrayList<Contenido>();
  
  private Contenido elegido;
  
  public AdminContent() {
    this.rellenar();
  }
  
  public List<Contenido> rellenar() {
    final Procedure1<List<Contenido>> _function = new Procedure1<List<Contenido>>() {
      public void apply(final List<Contenido> it) {
        Pelicula _pelicula = new Pelicula("Terminator");
        it.add(_pelicula);
        Serie _serie = new Serie("Casados con Hijos");
        it.add(_serie);
        Pelicula _pelicula_1 = new Pelicula("Despacito 3");
        it.add(_pelicula_1);
      }
    };
    return ObjectExtensions.<List<Contenido>>operator_doubleArrow(
      this.disponibles, _function);
  }
  
  @Pure
  public List<Contenido> getDisponibles() {
    return this.disponibles;
  }
  
  public void setDisponibles(final List<Contenido> disponibles) {
    this.disponibles = disponibles;
  }
  
  @Pure
  public Contenido getElegido() {
    return this.elegido;
  }
  
  public void setElegido(final Contenido elegido) {
    this.elegido = elegido;
  }
}
