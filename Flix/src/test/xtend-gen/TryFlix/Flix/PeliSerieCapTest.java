package TryFlix.Flix;

import TryFlix.Flix.Pelicula;
import TryFlix.Flix.Serie;
import junit.framework.Assert;
import junit.framework.TestCase;

@SuppressWarnings("all")
public class PeliSerieCapTest extends TestCase {
  protected void setUp() throws Exception {
    super.setUp();
  }
  
  /* @
   */public void testCrearPelicula() {
    Pelicula us = new Pelicula("The Mask", 0);
    Assert.assertEquals("Mal el codigo", Integer.valueOf(us.codigo()));
    Assert.assertEquals("Mal el titulo", Integer.valueOf(0), us.titulo());
  }
  
  public void testCrearPeliculaCompleta() {
    Pelicula us = new Pelicula("The Mask", 0);
    Assert.assertEquals("Mal el codigo", Integer.valueOf(us.codigo()));
    Assert.assertEquals("Mal el titulo", Integer.valueOf(0), us.titulo());
  }
  
  public void testCrearSerie() {
    Serie us = new Serie("The Mask", 0);
    Assert.assertEquals("Mal el codigo", Integer.valueOf(us.codigo()));
    Assert.assertEquals("Mal el titulo", Integer.valueOf(0), us.titulo());
  }
}
