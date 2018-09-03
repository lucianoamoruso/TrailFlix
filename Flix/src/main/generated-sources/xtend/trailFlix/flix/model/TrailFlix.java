package trailFlix.flix.model;

import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.IntegerRange;
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
      final Procedure1<ArrayList<Contenido>> _function = (ArrayList<Contenido> it) -> {
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
      };
      ObjectExtensions.<ArrayList<Contenido>>operator_doubleArrow(
        this.contenido, _function);
      final Procedure1<List<Usuario>> _function_1 = (List<Usuario> it) -> {
        Usuario _usuario = new Usuario(1, "carlos3", "Carlos");
        it.add(_usuario);
        Usuario _usuario_1 = new Usuario(2, "pedro54", "Pedro");
        it.add(_usuario_1);
        Usuario _usuario_2 = new Usuario(3, "jose100", "Jose");
        it.add(_usuario_2);
        Usuario _usuario_3 = new Usuario(4, "xXxMiguexXx", "Miguel");
        it.add(_usuario_3);
      };
      _xblockexpression = ObjectExtensions.<List<Usuario>>operator_doubleArrow(
        this.usuarios, _function_1);
    }
    return _xblockexpression;
  }
  
  public Contenido buscarPelicula(final String nombre) {
    int _size = this.contenido.size();
    IntegerRange _upTo = new IntegerRange(0, _size);
    for (final Integer i : _upTo) {
      if (((this.contenido.get((i).intValue()).returnPelicula() != null) && Objects.equal(this.contenido.get((i).intValue()).titulo, nombre))) {
        return this.contenido.get((i).intValue());
      }
    }
    return null;
  }
  
  public Contenido buscarSerie(final String nombre) {
    int _size = this.contenido.size();
    IntegerRange _upTo = new IntegerRange(0, _size);
    for (final Integer i : _upTo) {
      if (((this.contenido.get((i).intValue()).returnSerie() != null) && Objects.equal(this.contenido.get((i).intValue()).titulo, nombre))) {
        return this.contenido.get((i).intValue());
      }
    }
    return null;
  }
  
  public Usuario buscarUsuario(final String nombre) {
    int _size = this.usuarios.size();
    IntegerRange _upTo = new IntegerRange(0, _size);
    for (final Integer i : _upTo) {
      String _nombre = this.usuarios.get((i).intValue()).getNombre();
      boolean _equals = Objects.equal(_nombre, nombre);
      if (_equals) {
        return this.usuarios.get((i).intValue());
      }
    }
    return null;
  }
  
  public Contenido buscarPorCategoria(final Categoria categoria) {
    int _size = this.contenido.size();
    IntegerRange _upTo = new IntegerRange(0, _size);
    for (final Integer i : _upTo) {
      boolean _contains = this.contenido.get((i).intValue()).categorias.contains(categoria);
      if (_contains) {
        return this.contenido.get((i).intValue());
      }
    }
    return null;
  }
  
  public Contenido buscarPorClasificacion(final Clasificacion clasificacion) {
    int _size = this.contenido.size();
    IntegerRange _upTo = new IntegerRange(0, _size);
    for (final Integer i : _upTo) {
      boolean _equals = this.contenido.get((i).intValue()).clasificacion.equals(clasificacion);
      if (_equals) {
        return this.contenido.get((i).intValue());
      }
    }
    return null;
  }
  
  public boolean agregarPelicula(final Pelicula pelicula) {
    return this.contenido.add(pelicula);
  }
  
  public boolean agregarSerie(final Serie serie) {
    return this.contenido.add(serie);
  }
  
  public ArrayList<Contenido> getPeliculas() {
    ArrayList<Contenido> _xblockexpression = null;
    {
      ArrayList<Contenido> retorno = CollectionLiterals.<Contenido>newArrayList();
      int _size = this.contenido.size();
      IntegerRange _upTo = new IntegerRange(0, _size);
      for (final Integer i : _upTo) {
        Pelicula _returnPelicula = this.contenido.get((i).intValue()).returnPelicula();
        boolean _tripleNotEquals = (_returnPelicula != null);
        if (_tripleNotEquals) {
          retorno.add(this.contenido.get((i).intValue()));
        }
      }
      _xblockexpression = retorno;
    }
    return _xblockexpression;
  }
  
  public ArrayList<Contenido> getSeries() {
    ArrayList<Contenido> _xblockexpression = null;
    {
      ArrayList<Contenido> retorno = CollectionLiterals.<Contenido>newArrayList();
      int _size = this.contenido.size();
      IntegerRange _upTo = new IntegerRange(0, _size);
      for (final Integer i : _upTo) {
        Serie _returnSerie = this.contenido.get((i).intValue()).returnSerie();
        boolean _tripleNotEquals = (_returnSerie != null);
        if (_tripleNotEquals) {
          retorno.add(this.contenido.get((i).intValue()));
        }
      }
      _xblockexpression = retorno;
    }
    return _xblockexpression;
  }
  
  public List<Usuario> getUsuarios() {
    return this.usuarios;
  }
  
  public void setUsuarios(final List<Usuario> usuarios) {
    this.usuarios = usuarios;
  }
}
