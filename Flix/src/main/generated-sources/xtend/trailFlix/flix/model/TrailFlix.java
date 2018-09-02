package trailFlix.flix.model;

import java.util.ArrayList;
import java.util.List;
import trailFlix.flix.model.Categoria;
import trailFlix.flix.model.Clasificacion;
import trailFlix.flix.model.Contenido;
import trailFlix.flix.model.Pelicula;
import trailFlix.flix.model.Serie;
import trailFlix.flix.model.Usuario;

@SuppressWarnings("all")
public class TrailFlix {
  private List<Usuario> usuarios;
  
  private ArrayList<Contenido> contenido;
  
  public TrailFlix() {
    ArrayList<Contenido> _arrayList = new ArrayList<Contenido>();
    this.contenido = _arrayList;
    ArrayList<Usuario> _arrayList_1 = new ArrayList<Usuario>();
    this.usuarios = _arrayList_1;
  }
  
  public List<Usuario> rellenarDatos() {
    throw new Error("Unresolved compilation problems:"
      + "\nInvalid number of arguments. The constructor Pelicula(String, int) is not applicable for the arguments (String)"
      + "\nInvalid number of arguments. The constructor Pelicula(String, int) is not applicable for the arguments (String)"
      + "\nInvalid number of arguments. The constructor Pelicula(String, int) is not applicable for the arguments (String)"
      + "\nInvalid number of arguments. The constructor Serie(String, int) is not applicable for the arguments (String)"
      + "\nInvalid number of arguments. The constructor Serie(String, int) is not applicable for the arguments (String)"
      + "\nInvalid number of arguments. The constructor Serie(String, int) is not applicable for the arguments (String)"
      + "\nInvalid number of arguments. The constructor Serie(String, int) is not applicable for the arguments (String)");
  }
  
  public Object buscarPelicula(final String nombre) {
    return null;
  }
  
  public Object buscarSerie(final String nombre) {
    return null;
  }
  
  public Object buscarUsuario(final String nombre) {
    return null;
  }
  
  public Object buscarPorCategoria(final Categoria categoria) {
    return null;
  }
  
  public Object buscarPorClasificacion(final Clasificacion clasificacion) {
    return null;
  }
  
  public boolean agregarPelicula(final Pelicula pelicula) {
    return this.contenido.add(pelicula);
  }
  
  public boolean agregarSerie(final Serie serie) {
    return this.contenido.add(serie);
  }
  
  public Object getPeliculas() {
    return null;
  }
  
  public Object getSeries() {
    return null;
  }
  
  public List<Usuario> getUsuarios() {
    return this.usuarios;
  }
  
  public void setUsuarios(final List<Usuario> usuarios) {
    this.usuarios = usuarios;
  }
}
