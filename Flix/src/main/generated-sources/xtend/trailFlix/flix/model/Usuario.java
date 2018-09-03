package trailFlix.flix.model;

import java.util.ArrayList;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.joda.time.DateTime;
import trailFlix.flix.model.Contenido;
import trailFlix.flix.model.Pelicula;
import trailFlix.flix.model.Serie;

@SuppressWarnings("all")
public class Usuario {
  private int codigo;
  
  private String nombreDeUsuario;
  
  private String nombre;
  
  private DateTime fechaRegistro;
  
  private DateTime fechaNacimiento;
  
  public ArrayList<Usuario> amigos;
  
  public ArrayList<Contenido> contVisto;
  
  public ArrayList<Contenido> contFavorito;
  
  public ArrayList<Contenido> contRecomendado;
  
  public Usuario(final int codigo, final String nombreDeUsuario, final String nombre) {
    this.codigo = codigo;
    this.nombreDeUsuario = nombreDeUsuario;
    this.nombre = nombre;
    this.amigos = CollectionLiterals.<Usuario>newArrayList();
    this.contVisto = CollectionLiterals.<Contenido>newArrayList();
    this.contFavorito = CollectionLiterals.<Contenido>newArrayList();
    this.contRecomendado = CollectionLiterals.<Contenido>newArrayList();
  }
  
  public int getCodigo() {
    return this.codigo;
  }
  
  public String getNombre() {
    return this.nombre;
  }
  
  public String getNombreUsuario() {
    return this.nombreDeUsuario;
  }
  
  public ArrayList<Contenido> getPeliculasVistas() {
    ArrayList<Contenido> _xblockexpression = null;
    {
      ArrayList<Contenido> retorno = CollectionLiterals.<Contenido>newArrayList();
      int _size = this.contVisto.size();
      IntegerRange _upTo = new IntegerRange(0, _size);
      for (final Integer i : _upTo) {
        Pelicula _returnPelicula = this.contVisto.get((i).intValue()).returnPelicula();
        boolean _tripleNotEquals = (_returnPelicula != null);
        if (_tripleNotEquals) {
          retorno.add(this.contVisto.get((i).intValue()));
        }
      }
      _xblockexpression = retorno;
    }
    return _xblockexpression;
  }
  
  public ArrayList<Contenido> getSeriesVistas() {
    ArrayList<Contenido> _xblockexpression = null;
    {
      ArrayList<Contenido> retorno = CollectionLiterals.<Contenido>newArrayList();
      int _size = this.contVisto.size();
      IntegerRange _upTo = new IntegerRange(0, _size);
      for (final Integer i : _upTo) {
        Serie _returnSerie = this.contVisto.get((i).intValue()).returnSerie();
        boolean _tripleNotEquals = (_returnSerie != null);
        if (_tripleNotEquals) {
          retorno.add(this.contVisto.get((i).intValue()));
        }
      }
      _xblockexpression = retorno;
    }
    return _xblockexpression;
  }
  
  public ArrayList<Contenido> getPeliculasFavoritas() {
    ArrayList<Contenido> _xblockexpression = null;
    {
      ArrayList<Contenido> retorno = CollectionLiterals.<Contenido>newArrayList();
      int _size = this.contFavorito.size();
      IntegerRange _upTo = new IntegerRange(0, _size);
      for (final Integer i : _upTo) {
        Pelicula _returnPelicula = this.contFavorito.get((i).intValue()).returnPelicula();
        boolean _tripleNotEquals = (_returnPelicula != null);
        if (_tripleNotEquals) {
          retorno.add(this.contFavorito.get((i).intValue()));
        }
      }
      _xblockexpression = retorno;
    }
    return _xblockexpression;
  }
  
  public ArrayList<Contenido> getSeriesFavoritas() {
    ArrayList<Contenido> _xblockexpression = null;
    {
      ArrayList<Contenido> retorno = CollectionLiterals.<Contenido>newArrayList();
      int _size = this.contFavorito.size();
      IntegerRange _upTo = new IntegerRange(0, _size);
      for (final Integer i : _upTo) {
        Serie _returnSerie = this.contFavorito.get((i).intValue()).returnSerie();
        boolean _tripleNotEquals = (_returnSerie != null);
        if (_tripleNotEquals) {
          retorno.add(this.contFavorito.get((i).intValue()));
        }
      }
      _xblockexpression = retorno;
    }
    return _xblockexpression;
  }
}
