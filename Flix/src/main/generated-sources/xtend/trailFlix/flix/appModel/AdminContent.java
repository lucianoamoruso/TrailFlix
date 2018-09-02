package trailFlix.flix.appModel;

import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.annotations.Observable;
import trailFlix.flix.model.Contenido;
import trailFlix.flix.model.TrailFlix;

@Accessors
@Observable
@SuppressWarnings("all")
public class AdminContent {
  private TrailFlix trailFlix;
  
  private List<Contenido> disponibles = new ArrayList<Contenido>();
  
  private Contenido elegido;
  
  public AdminContent(final TrailFlix trailFlix) {
    throw new Error("Unresolved compilation problems:"
      + "\nType mismatch: cannot convert from Object to Contenido[]"
      + "\nType mismatch: cannot convert from Object to Contenido[]");
  }
  
  @Pure
  public TrailFlix getTrailFlix() {
    return this.trailFlix;
  }
  
  public void setTrailFlix(final TrailFlix trailFlix) {
    this.trailFlix = trailFlix;
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
