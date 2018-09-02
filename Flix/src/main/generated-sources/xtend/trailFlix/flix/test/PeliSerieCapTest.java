package trailFlix.flix.test;

import junit.framework.Assert;
import junit.framework.TestCase;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import trailFlix.flix.model.Pelicula;
import trailFlix.flix.model.Serie;

@SuppressWarnings("all")
public class PeliSerieCapTest extends TestCase {
  protected void setUp() throws Exception {
    super.setUp();
  }
  
  public void testCrearPelicula() {
    String titulo = "The Mask";
    Pelicula peli = new Pelicula(titulo, 0);
    Assert.assertEquals("Mal el codigo", 0, peli.getCodigo());
    Assert.assertEquals("Mal el titulo", titulo, peli.getTitulo());
  }
  
  public void testCrearPeliculaCompleta() {
    Pelicula us = new Pelicula("The Mask", 0);
    final Procedure1<Pelicula> _function = new Procedure1<Pelicula>() {
      public void apply(final Pelicula it) {
        it.setDirectores("D");
        it.setFechaEstreno("Mañana");
        it.setActores("Jim");
      }
    };
    ObjectExtensions.<Pelicula>operator_doubleArrow(us, _function);
    Assert.assertEquals("Mal Director:", "D", IterableExtensions.<String>head(us.getDirectores()));
    Assert.assertEquals("Mal Fecha:", "Mañana", us.getFechaEstreno());
    Assert.assertEquals("Mal Actores:", "Jim", IterableExtensions.<String>head(us.getActores()));
  }
  
  public void testCrearSerie() {
    Serie us = new Serie("R&M", 1);
    Assert.assertEquals("Mal el codigo", 1, us.getCodigo());
    Assert.assertEquals("Mal el titulo", "R&M", us.getTitulo());
  }
  
  public void testCrearSerieCompleta() {
    Pelicula us = new Pelicula("The Mask", 0);
    final Procedure1<Pelicula> _function = new Procedure1<Pelicula>() {
      public void apply(final Pelicula it) {
        it.setDirectores("D");
        it.setFechaEstreno("Mañana");
        it.setActores("Jim");
      }
    };
    ObjectExtensions.<Pelicula>operator_doubleArrow(us, _function);
    Assert.assertEquals("Mal Director:", "D", IterableExtensions.<String>head(us.getDirectores()));
    Assert.assertEquals("Mal Fecha:", "Mañana", us.getFechaEstreno());
    Assert.assertEquals("Mal Actores:", "Jim", IterableExtensions.<String>head(us.getActores()));
  }
}
