package flix

import junit.framework.TestCase
import trailFlix.flix.model.Pelicula
import trailFlix.flix.model.Serie
import java.util.ArrayList
import org.joda.time.DateTime
import trailFlix.flix.model.Capitulo

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
		val dir = new ArrayList()
		val act = new ArrayList()
		val fecha = new DateTime("2004-12-13T21:39:45.618-08:00")
		
		dir.add("D")
		act.add("Jim")
		us =>[
			setDirectores(dir)
			setFechaEstreno(fecha)
			setActores(act)
		]
		assertEquals("Mal Director:", "D", us.getDirectores().head() )
		assertEquals("Mal Fecha:", fecha, us.getFechaEstreno() )
		assertEquals("Mal Actores:", "Jim", us.getActores().head() )
		
	}
	
	def testCrearSerie() {
		var us = new Serie("R&M",1);
		assertEquals("Mal el codigo", 1,us.codigo )
		assertEquals("Mal el titulo", "R&M", us.titulo)
	}
	
	def testCrearSerieCompleta() {
		var serie = new Serie("R&M",0)
		val se1 = new Serie("BB",1)
		val cap = new Capitulo("")
		
		serie =>[
			creadores.add("A")
			capitulos.add(cap)
			temporadas = 1
			contRelacionado.add(se1)
		]
		//assertEquals("", "A", serie.creadores.head() )
		assertEquals("", 1, serie.temporadas )
		assertEquals("", cap, serie.capitulos.head() )
		
	}
	
}
