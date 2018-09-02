package trailFlix.flix.model;

import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
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
    List<Usuario> _xblockexpression = null;
    {
      final Procedure1<ArrayList<Contenido>> _function = new Procedure1<ArrayList<Contenido>>() {
        public void apply(final ArrayList<Contenido> it) {
          Pelicula _pelicula = new Pelicula("Terminator");
          it.add(_pelicula);
          Pelicula _pelicula_1 = new Pelicula("The Spacito 3");
          it.add(_pelicula_1);
          Pelicula _pelicula_2 = new Pelicula("Wall-E");
          it.add(_pelicula_2);
          Serie _serie = new Serie("Casados con Hijos");
          it.add(_serie);
          Serie _serie_1 = new Serie("Attack on Titan");
          it.add(_serie_1);
          Serie _serie_2 = new Serie("Attack on Pepe");
          it.add(_serie_2);
          Serie _serie_3 = new Serie("The Grim Adventures of Billy and Mandy");
          it.add(_serie_3);
        }
      };
      ObjectExtensions.<ArrayList<Contenido>>operator_doubleArrow(
        this.contenido, _function);
      final Procedure1<List<Usuario>> _function_1 = new Procedure1<List<Usuario>>() {
        public void apply(final List<Usuario> it) {
          Usuario _usuario = new Usuario(1, "carlos3", "Carlos");
          it.add(_usuario);
          Usuario _usuario_1 = new Usuario(2, "pedro54", "Pedro");
          it.add(_usuario_1);
          Usuario _usuario_2 = new Usuario(3, "jose100", "Jose");
          it.add(_usuario_2);
          Usuario _usuario_3 = new Usuario(4, "xXxMiguexXx", "Miguel");
          it.add(_usuario_3);
        }
      };
      _xblockexpression = ObjectExtensions.<List<Usuario>>operator_doubleArrow(
        this.usuarios, _function_1);
    }
    return _xblockexpression;
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
