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
		var us = new Usuario(0,titulo,titulo)
		assertEquals("Mal el codigo", 0,us.getCodigo() )
		assertEquals("Mal el nombre", titulo, us.getNombre())
		assertEquals("Mal el nombre Usuario", titulo, us.getNombreUsuario())
	}
	
	def void testUsuarioPeliculaCompleta() {
		var us = new Usuario(0,"usuario","nombre")
		val amigo = new Usuario(1,"","")
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
		assertEquals( amigo, us.contFavorito.head()  )
		assertEquals( amigo, us.contRecomendado.head()  )
	}

	
	def getPeliculasVistastest(){
		var us = new Usuario(0,"usuario","nombre")
		val amigo = new Usuario(1,"","")
		val serie = new Serie("Elsecreto",0)
		val RaM = new Serie("R&M",1)
		val peli = new Pelicula("a",3)
		
		us => [
			amigos.add(amigo)
			contVisto.add(serie)
			contVisto.add(RaM)
			contVisto.add(peli)			
		]
		assertEquals( us.peliculasVistas.exists[pel|pel==peli]  )	
	}
	
	def getSeriesVistastest(){
		//TO DO
	}
	
	def getPeliculasFavoritastest(){
		//TO DO
	}
	
	def getSeriesFavoritastest(){
		//TO DO
	}
}
