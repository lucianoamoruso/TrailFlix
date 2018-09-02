package TraiFlix.Flix

import junit.framework.TestCase

class PeliSerieCapTest extends TestCase {
	override protected void setUp() throws Exception {
		super.setUp()
	}
	
	def testCrearPelicula() {
		var titulo = "The Mask"
		var us = new Pelicula(titulo,0)
		assertEquals("Mal el codigo", 0,us.codigo() )
		assertEquals("Mal el titulo", titulo, us.titulo())
	}
	
	def void testCrearPeliculaCompleta() {
		var us = new Pelicula("The Mask",0);
		us =>[
			setDirectores("D")
			setFechaEstreno("Mañana")
			setActores("Jim")
		]
		assertEquals("Mal Director:", "D", us.getDirectores() )
		assertEquals("Mal Fecha:", "Mañana", us.getFechaEstreno() )
		assertEquals("Mal Actores:", "Jim", us.getActores() )
		
	}
	
	def testCrearSerie() {
		var us = new Serie("R&M",1);
		assertEquals("Mal el codigo", 1,us.codigo() );
		assertEquals("Mal el titulo", "R&M", us.titulo());
	}
	
}
