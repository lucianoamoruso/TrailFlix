package TryFlix.Flix;

import junit.framework.TestCase
import junit.framework.Test

class PeliSerieCapTest extends TestCase {
	override protected void setUp() throws Exception {
		super.setUp()
	}
	
	//@Test
	def testCrearPelicula() {
		var us = new Pelicula("The Mask",0);
		assertEquals("Mal el codigo", us.codigo() );
		assertEquals("Mal el titulo", 0, us.titulo());
	}
	
	//@Test
	def void testCrearPeliculaCompleta() {
		var us = new Pelicula("The Mask",0);
		assertEquals("Mal el codigo", us.codigo() );
		assertEquals("Mal el titulo", 0, us.titulo());
	}
	
	//@Test
	def testCrearSerie() {
		var us = new Serie("The Mask",0);
		assertEquals("Mal el codigo", us.codigo() );
		assertEquals("Mal el titulo", 0, us.titulo());
	}
	
}
