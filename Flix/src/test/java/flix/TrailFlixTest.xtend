package flix

import static org.junit.Assert.*
import org.junit.Test
import trailFlix.flix.model.TrailFlix
import junit.framework.TestCase

class TrailFlixTest  extends TestCase {
	def void testCreacion() {
		val tf = new TrailFlix(null)
		//assertNull(null,tf.ventana)
		assertEquals(0,tf.generarId())
		assertEquals(1,tf.generarId())	
		assertEquals(2,tf.generarId())
		
		assertEquals(0,tf.peliculas.size())
		assertEquals(0,tf.series.size())
		assertEquals(0,tf.usuarios.size())
		
		assertEquals(0,tf.getUsuarios().size() ) //No hay usuarios
	}
	
	def void testRellenar(){
		val tf = new TrailFlix(null)
		tf.rellenarDatos()
		//La informacion que esta es muy random, y sensible a cambios
		tf.getUsuarios().map[ assertEquals(it,tf.buscarUsuario(it.codigo)); //Cada usuario se puede ubicar buscando
			                  assertTrue(it.amigos.forall[i | i.amigos.contains(it)])  //La amistad es bidireccional
							  assertTrue(it.peliculasFavoritas.forall[peli|tf.buscarPelicula(peli.codigo)==peli])
							  assertTrue(it.peliculasVistas.forall[peli|tf.buscarPelicula(peli.codigo)==peli])
							  assertTrue(it.seriesFavoritas.forall[ser|tf.buscarSerie(ser.codigo)==ser])
							  assertTrue(it.seriesVistas.forall[ser|tf.buscarSerie(ser.codigo)==ser])
							  
							  it
							]
	}
		
	// TODO arreglar test
    def void testquitarRelleno(){
    	val tf = new TrailFlix(null)
		tf.rellenarDatos()
		assertTrue( 0 != tf.peliculas.size() )
		assertTrue( 0 != tf.series.size())
		//tf.peliculas.clear()
		tf.peliculas.forEach[tf.eliminarPelicula(it)]
    }
		
}
