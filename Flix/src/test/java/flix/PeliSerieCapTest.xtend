package flix

import junit.framework.TestCase
import trailFlix.flix.model.Pelicula
import trailFlix.flix.model.Serie
import java.util.ArrayList
import org.joda.time.DateTime
import trailFlix.flix.model.Capitulo
import org.joda.time.LocalDate

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
		var us = new Pelicula("The Mask")
		val dir = new ArrayList()
		val act = new ArrayList()
		val fecha = new LocalDate(2000,1,12)
		
		dir.add("D")
		act.add("Jim")
		us =>[
			setDirectores(dir)
			setFechaEstreno(fecha)
			setActores(act)
			setDuracion(3)
			setContRelacionado( new ArrayList() => [add(new Pelicula(""))])
			setLink( "Youtube" )
			setValoraciones(new ArrayList() => [add(8)])
		]
		assertEquals(3,us.getDuracion())
		assertEquals("Mal Director:", "D", us.getDirectores().head() )
		assertEquals("Mal Fecha:", fecha, us.getFechaEstreno() )
		assertEquals("Mal Actores:", "Jim", us.getActores().head() )
		assertEquals(1, us.getContRelacionado().size())
		assertEquals("Youtube", us.getLink())
		assertEquals("", 8.0, us.getRating())
		assertEquals("", 8, us.getValoraciones().head())
		
	}
	
	def testCrearSerie() {
		var us = new Serie("R&M",1);
		assertEquals("Mal el codigo", 1,us.codigo )
		assertEquals("Mal el titulo", "R&M", us.titulo)
	}
	
	def testCrearSerieCompleta() {
		var serie = new Serie("R&M")
		val se1 = new Serie("BB")
		val cap = new Capitulo("")
		
		serie =>[
			setCreadores(new ArrayList =>[add("A")])
			addCap(cap)
			setTemporadas(1)
			setContRelacionado( new ArrayList() => [add(se1)])
		]
		assertEquals("", "A", serie.creadores.head() )
		assertEquals("", 1, serie.temporadas )
		assertEquals("", cap, serie.capitulos.head() )
		assertEquals("", cap, serie.getCapitulos().head() )
		assertEquals(se1, serie.getContRelacionado().head())
		
	}
	
	def testPonerCapitulos(){
		var serie = new Serie("R&M",0)
		val cap1 = new Capitulo("te1")
		val cap2 = new Capitulo("te2")
		
		cap2.actores = new ArrayList =>[add("Rick");add("Morty")]
		cap1 => [ setTitulo("ep1")
			setActores(new ArrayList =>[add("Rick")])
			//setFechaEstreno(fecha)
			setActores(new ArrayList =>[add("Rick");add("Morty")])
			setDuracion(3)
			setTemporada(1)
			//setContRelacionado( new ArrayList() => [add(cap2)])
			setLink( "Youtube" )
			setValoraciones(new ArrayList() => [add(8)])
		]
		
		cap2.titulo = "ep1"
		
		serie.setCapitulos(new ArrayList =>[add(cap1);add(cap2)])
		
		assertEquals("", 4.0, serie.getRating())
			
		
		serie => [	quitarCapitulo(cap1)
					quitarCapitulo(cap2)
			]
			
		assertEquals("", 0, serie.getCapitulos().size() )	
	}
	
	def testSonSeriePelicula(){
		var serie = new Serie("R&M",0)
		assertEquals(null,serie.returnPelicula())
		assertEquals(serie,serie.returnSerie())
		
		var peli = new Pelicula("R&M",0)
		assertEquals(null,peli.returnSerie ())
		assertEquals(peli,peli.returnPelicula())
	}
	
	
}
