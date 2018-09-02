package trailFlix.flix.test;

import junit.framework.Assert;
import junit.framework.TestCase;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import trailFlix.flix.model.Contenido;
import trailFlix.flix.model.Serie;
import trailFlix.flix.model.Usuario;

@SuppressWarnings("all")
public class UsuarioTest extends TestCase {
  protected void setUp() throws Exception {
    super.setUp();
  }
  
  public void testCrearUsuario() {
    String titulo = "Jorgeee";
    Usuario us = new Usuario(0, titulo, titulo);
    Assert.assertEquals("Mal el codigo", 0, us.getCodigo());
    Assert.assertEquals("Mal el nombre", titulo, us.getNombre());
    Assert.assertEquals("Mal el nombre Usuario", titulo, us.getNombreUsuario());
  }
  
  public void testUsuarioPeliculaCompleta() {
    Usuario us = new Usuario(0, "usuario", "nombre");
    final Usuario amigo = new Usuario(1, "", "");
    final Serie serie = new Serie("Elsecreto", 0);
    final Serie RaM = new Serie("R&M", 1);
    final Procedure1<Usuario> _function = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.amigos.add(amigo);
        it.contVisto.add(serie);
        it.contFavorito.add(serie);
        it.contRecomendado.add(RaM);
      }
    };
    ObjectExtensions.<Usuario>operator_doubleArrow(us, _function);
    Assert.assertEquals(amigo, IterableExtensions.<Usuario>head(us.amigos));
    Assert.assertEquals(serie, IterableExtensions.<Contenido>head(us.contVisto));
    Assert.assertEquals(amigo, IterableExtensions.<Contenido>head(us.contFavorito));
    Assert.assertEquals(amigo, IterableExtensions.<Contenido>head(us.contRecomendado));
  }
  
  public Object getPeliculasVistastest() {
    return null;
  }
  
  public Object getSeriesVistastest() {
    return null;
  }
  
  public Object getPeliculasFavoritastest() {
    return null;
  }
  
  public Object getSeriesFavoritastest() {
    return null;
  }
}
