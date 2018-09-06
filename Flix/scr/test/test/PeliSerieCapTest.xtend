package test

import junit.framework.TestCase
import trailFlix.flix.model.Pelicula
import trailFlix.flix.model.Serie

class PeliSerieCapTest extends TestCase {
	override protected void setUp() throws Exception {
		super.setUp()
	}
	
	def testCrearPelicula() {
		var titulo = "The Mask"
		var peli = new Pelicula(titulo,0)
		assertEquals("Mal el codigo", 0,peli.codigo )
		assertEquals("Mal el titulo", titulo, peli.titulo)
	}
	
	def void testCrearPeliculaCompleta() {
		var us = new Pelicula("The Mask",0)
		us =>[
			setDirectores("D")
			setFechaEstreno("Mañana")
			setActores("Jim")
		]
		assertEquals("Mal Director:", "D", us.getDirectores().head() )
		assertEquals("Mal Fecha:", "Mañana", us.getFechaEstreno() )
		assertEquals("Mal Actores:", "Jim", us.getActores().head() )
		
	}
	
	def testCrearSerie() {
		var us = new Serie("R&M",1);
		assertEquals("Mal el codigo", 1,us.codigo )
		assertEquals("Mal el titulo", "R&M", us.titulo)
	}
	
	def void testCrearSerieCompleta() {
		var us = new Pelicula("The Mask",0)
		us =>[
			setDirectores("D")
			setFechaEstreno("Mañana")
			setActores("Jim")
		]
		assertEquals("Mal Director:", "D", us.getDirectores().head() )
		assertEquals("Mal Fecha:", "Mañana", us.getFechaEstreno() )
		assertEquals("Mal Actores:", "Jim", us.getActores().head() )
		
	}
	
}
