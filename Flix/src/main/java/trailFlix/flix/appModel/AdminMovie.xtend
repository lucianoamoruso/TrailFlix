package trailFlix.flix.appModel

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import trailFlix.flix.model.Categoria
import trailFlix.flix.model.Clasificacion
import trailFlix.flix.model.Contenido
import trailFlix.flix.model.TrailFlix
import java.util.ArrayList
import trailFlix.flix.model.Pelicula
import org.joda.time.DateTime

@Accessors
@Observable
class AdminMovie {
	TrailFlix			trailFlix
	String				titulo
	int					duracion_ingresada
	InterpretadorFecha	interpretador
	DateTime			fecha_estreno_ingresada
	String	            directores_elegidos
	String	            actores_principales
	List<Categoria>		categorias_disp = Categoria.values
	Categoria 			sel_categorias
	boolean				es_drama
	boolean				es_comedia
	boolean				es_terror
	boolean				es_accion
	List<Clasificacion>	clasificaciones_disp = Clasificacion.values
	Clasificacion		sel_clasificacion
	List<Contenido>		relacionado = new ArrayList
	Contenido			sel_relacionado
	Contenido			new_relacionado		//Seteado desde AdminContent
	String				link_ingresado
	
	
	new(TrailFlix trailFlix) {
		this.trailFlix = trailFlix
	}
	
	/*
	 * Prop: Carga una nueva pelicula a la base de datos.
	 */
	def void nuevaPeli() {
		val ArrayList<Categoria> nuevasCategorias = recolectarCategorias
		val dir = newArrayList()
		dir.addAll(directores_elegidos.split(",").toList())

		val act = newArrayList()
		act.addAll(actores_principales.split(",").toList())
		
		val pelicula = new Pelicula(titulo) => [
			codigo = trailFlix.nuevoCodigoPeli
			categorias = nuevasCategorias
			clasificacion = sel_clasificacion
			fechaEstreno = fecha_estreno_ingresada
			duracion = duracion_ingresada
			directores = dir
			actores = act
			contRelacionado = relacionado
			link = link_ingresado
		]
		
		trailFlix.agregarPelicula(pelicula)
	}
	
	/*
	 * Prop: revisa que categorias fueron tildadas y devuelve una lista conteniendolas.
	 */
	private def ArrayList<Categoria> recolectarCategorias() {
		var ArrayList<Categoria> ret = new ArrayList
		if (es_accion) {
			ret.add(Categoria.ACCION)
		}
		if (es_comedia) {
			ret.add(Categoria.COMEDIA)
		}
		if (es_drama) {
			ret.add(Categoria.DRAMA)
		}
		if (es_terror) {
			ret.add(Categoria.TERROR)
		}
		ret
	}
	
	/*
	 * Prop: Quita contenido relacionado a una pelicula.
	 */
	def quitarContenido() {
		relacionado.remove(sel_relacionado)
	}
	
	/*
	 * Prop: Añade contenido relacionado a una pelicula.
	 */
	def agregarContenido(Contenido nuevo) {
		relacionado.add(nuevo)
	}
	
//-------------------REDIRIGIDOS--------------------------
//Estos setters y getters apuntan a otra clase de appModel encargada del ingreso de Fecha

	def List<Integer> getDias_del_mes() {
		interpretador.dias_del_mes
	}
	
	def Integer getDia() {
		interpretador.dia
	}
	
	def void setDia(Integer dia) {
		interpretador.dia = dia
	}
	
	def List<String> getMeses() {
		interpretador.meses
	}
	
	def String getMes() {
		interpretador.mes
	}
	
	def void setMes(String mes) {
		interpretador.mes = mes
	}
	
	def List<Integer> getAnios() {
		interpretador.anios
	}
	
	def Integer getAnio() {
		interpretador.anio
	}
	
	def void setAnio(Integer anio) {
		interpretador.anio = anio
	}
	
}
