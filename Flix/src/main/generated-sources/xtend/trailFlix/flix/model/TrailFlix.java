package trailFlix.flix.model;

import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import trailFlix.flix.model.Pelicula;
import trailFlix.flix.model.Serie;
import trailFlix.flix.model.Usuario;

@SuppressWarnings("all")
public class TrailFlix {
  private List<Pelicula> peliculas;
  
  private List<Serie> series;
  
  private List<Usuario> usuarios;
  
  public TrailFlix() {
    ArrayList<Pelicula> _arrayList = new ArrayList<Pelicula>();
    this.peliculas = _arrayList;
    ArrayList<Serie> _arrayList_1 = new ArrayList<Serie>();
    this.series = _arrayList_1;
    ArrayList<Usuario> _arrayList_2 = new ArrayList<Usuario>();
    this.usuarios = _arrayList_2;
  }
  
  public List<Usuario> rellenarDatos() {
    List<Usuario> _xblockexpression = null;
    {
      final Procedure1<List<Pelicula>> _function = new Procedure1<List<Pelicula>>() {
        public void apply(final List<Pelicula> it) {
          Pelicula _pelicula = new Pelicula("Terminator");
          it.add(_pelicula);
          Pelicula _pelicula_1 = new Pelicula("The Spacito 3");
          it.add(_pelicula_1);
          Pelicula _pelicula_2 = new Pelicula("Wall-E");
          it.add(_pelicula_2);
        }
      };
      ObjectExtensions.<List<Pelicula>>operator_doubleArrow(
        this.peliculas, _function);
      final Procedure1<List<Serie>> _function_1 = new Procedure1<List<Serie>>() {
        public void apply(final List<Serie> it) {
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
      ObjectExtensions.<List<Serie>>operator_doubleArrow(
        this.series, _function_1);
      final Procedure1<List<Usuario>> _function_2 = new Procedure1<List<Usuario>>() {
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
        this.usuarios, _function_2);
    }
    return _xblockexpression;
  }
  
  public List<Pelicula> getPeliculas() {
    return this.peliculas;
  }
  
  public void setPeliculas(final List<Pelicula> peliculas) {
    this.peliculas = peliculas;
  }
  
  public List<Serie> getSeries() {
    return this.series;
  }
  
  public void setSeries(final List<Serie> series) {
    this.series = series;
  }
  
  public List<Usuario> getUsuarios() {
    return this.usuarios;
  }
  
  public void setUsuarios(final List<Usuario> usuarios) {
    this.usuarios = usuarios;
  }
}
