package flix

import static org.junit.Assert.*
import org.junit.Test
import trailFlix.flix.model.TrailFlix

class TrailFlixTest {
	def void testCreacion() {
		val tf = new TrailFlix(null)
		//assertNull(null,tf.ventana)
		assertEquals(0,tf.generarId())
		assertEquals(1,tf.generarId())
		assertEquals(2,tf.nuevoCodigoPeli())
		assertEquals(3,tf.generarId())
		assertEquals(4,tf.nuevoCodigoSerie())
		assertEquals(5,tf.generarId())
		assertEquals(6,tf.nuevoCodigoCapitulo())		
		assertEquals(7,tf.generarId())
		
		assertEquals(0,tf.peliculas.size())
		assertEquals(0,tf.series.size())
		assertEquals(0,tf.usuarios.size())
	}
		
		
}
