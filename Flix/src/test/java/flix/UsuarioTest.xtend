package flix

import junit.framework.TestCase
import org.joda.time.DateTime
import java.util.ArrayList
import trailFlix.flix.model.Usuario
import trailFlix.flix.model.Serie
import trailFlix.flix.model.Pelicula

class UsuarioTest extends TestCase {
	override protected void setUp() throws Exception {
		super.setUp()
	}
	
	def testCrearUsuario() {
		var titulo = "Jorgeee"
		var us = new Usuario(titulo,titulo)
		assertEquals("Mal el codigo", 0,us.getCodigo() )
		assertEquals("Mal el nombre", titulo, us.getNombre())
		assertEquals("Mal el nombre Usuario", titulo, us.nombreDeUsuario )
	}
	
	def void testUsuarioPeliculaCompleta() {
		var us = new Usuario("usuario","nombre")
		val amigo = new Usuario("","")
		val serie = new Serie("Elsecreto",0)
		val RaM = new Serie("R&M",1)
		us => [
			amigos.add(amigo)
			contVisto.add(serie)
			contFavorito.add(serie)
			contRecomendado.add(RaM)			
		]
		assertEquals( amigo, us.amigos.head()  )
		assertEquals( serie, us.contVisto.head()  )
		assertEquals( serie, us.contFavorito.head()  )
		assertEquals( RaM, us.contRecomendado.head()  )
	}

	
	def testgetPeliculasSeriesVistas(){
		var us = new Usuario("usuario","nombre")
		val amigo = new Usuario("","")
		val serie = new Serie("Elsecreto",0)
		val RaM = new Serie("R&M",1)
		val peli = new Pelicula("a",3)
		
		us => [
			amigos.add(amigo)
			contVisto.add(serie)
			contVisto.add(RaM)
			contVisto.add(peli)			
		]
		assertTrue( us.peliculasVistas.exists[pel|pel==peli]  )
		assertEquals( us.peliculasVistas.size(),1  )
		assertEquals( us.seriesVistas.size(),2 )
		assertEquals("",serie, us.seriesVistas.get(0))
		assertEquals("",RaM, us.seriesVistas.get(1))
		
		assertEquals(amigo, us.amigos.get(0))
		
	}
	
	def testgetPeliculasFavoritas(){
		var us = new Usuario("usuario","nombre")
		assertEquals( 0,us.getPeliculasFavoritas().size()  ) 
		val peli = new Pelicula("a",3)
		us.contFavorito.add(peli)
		assertEquals( 1,  us.getPeliculasFavoritas().size()  )
		assertEquals( peli,us.getPeliculasFavoritas().head()  )
	}
	
	def testgetSeriesFavoritas(){
		var us = new Usuario("usuario","nombre")
		assertEquals( 0,  us.getSeriesFavoritas().size()  )
		val RaM = new Serie("R&M",1)
		us.contFavorito.add(RaM)
		assertEquals( 1,  us.getSeriesFavoritas().size()  )
		assertEquals( RaM,us.getSeriesFavoritas().head()  )
	}
}
