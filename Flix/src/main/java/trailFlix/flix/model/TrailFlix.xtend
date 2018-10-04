package trailFlix.flix.model

import java.util.ArrayList
import java.util.List
import trailFlix.flix.appModel.AdminMain
import trailFlix.flix.helpers.GeneradorDeIds

class TrailFlix {
	List<Usuario>			usuarios
	ArrayList<Contenido>	contenido
	AdminMain				ventana
	GeneradorDeIds			generador
	ArrayList<String>		clasificaciones = newArrayList ("ATP","Mayores13","Mayores16","Mayores21")
	ArrayList<String>		categorias = newArrayList ("DRAMA","TERROR","COMEDIA","ACCION")
	
	
	new(AdminMain ventana) {
		contenido = new ArrayList
		usuarios = new ArrayList
		this.ventana = ventana
		this.generador = new GeneradorDeIds()
	}

	

	def buscarPelicula (int id){
		val resultado = this.contenido.findFirst[(it.esPelicula && it.codigo == id)] as Pelicula
		if (resultado===null) {throw new PeliculaInexistente}
		resultado
	}
	
	def buscarSerie (int id){
		val resultado = this.contenido.findFirst[(it.esSerie && it.codigo == id)] as Serie
		if (resultado===null) {throw new SerieInexistente}
		resultado
	}
	
	def buscarUsuario (int id){
		val resultado = this.usuarios.findFirst[it.codigo == id]
		if (resultado===null) {throw new UsuarioInexistente}
		resultado
	
	}
	
	/*
	 * Prop: devuelve un contenido a partir de su codigo.
	 */
	def buscarContenido (int id){
		val resultado = this.contenido.findFirst[it.codigo == id]
		if (resultado===null) {throw new ContenidoInexistente}
		resultado
	}

	/*
	 * Prop: devuelve todos los Contenidos que tengan la categoria recibida.
	 */
	def buscarPorCategoria(String categoria) {
		this.contenido.filter[(it.categorias).contains(categoria)].toList
	}
		
	/*
	 * Prop: se añade una pelicula y se notifica a la ventana principal.
	 */
	def agregarPelicula (Pelicula pelicula){ //CHECKEAR SI EXISTE SU CLASIFICACION/CATEGORIA DE LA PELICULA PASADA POR PARAMETRO, SINO AGREGARLA
		pelicula.codigo = this.generador.generarCodigoPeli
		this.contenido.add(pelicula)
		ventana.actualizarContenidos
	}
	
	/*
	 * Prop: se añade una serie y se notifica a la ventana principal.
	 */
	def agregarSerie (Serie serie){ //CHECKEAR SI EXISTE SU CLASIFICACION/CATEGORIA DE LOS CAPITULOS DE LA SERIE PASADA POR PARAMETRO, SINO AGREGARLA
		serie.codigo = this.generador.generarCodigoResto
		this.contenido.add(serie)
		ventana.actualizarContenidos
	}
	
	def agregarUsuario (Usuario usuario){
		usuario.codigo = this.generador.generarCodigoResto
		this.usuarios.add(usuario)
	}
	
	def nuevoCodigoCapitulo() {
		this.generador.generarCodigoResto
	}
	
	def agregarCategoria (String categoria){
		this.categorias.add(categoria)
	}
	
	def agregarClasificacion (String clasificacion){
		this.clasificaciones.add(clasificacion)
	}
	
	/*
	 * Prop: elimina una pelicula de la base de datos.
	 */
	def eliminarPelicula(Pelicula pelicula) {
		this.contenido.remove(pelicula)
	}
	
	/*
	 * Prop: elimina una serie de la base de datos.
	 */
	def eliminarSerie(Serie serie) {
		this.contenido.remove(serie)
	}
	
//-----------------GETTERS Y SETTERS----------------------------

	def getContenidos() {
		contenido
	}

	def getPeliculas() { //IMPLEMENTAR
		this.contenido.filter[esPelicula].map[it as Pelicula].toList
	}
	
	def getSeries() { //IMPLEMENTAR
		this.contenido.filter[esSerie].map[it as Serie].toList
	}
	
	def private getCapitulos() {
		val caps = newArrayList
		for (Serie serie : series) {
			caps.addAll(serie.capitulos)
		}
		caps
	}
	
	def getUsuarios() {
		this.usuarios
	}
	
	def getCategorias(){
		this.categorias
	}
	
	def getClasificaciones(){
		this.clasificaciones
	}
	
	def void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios
	}
	
	def buscarCapitulo(int id) {
		val resultado = capitulos.findFirst[it.codigo == id]
		if (resultado===null) {throw new CapituloInexistente}
		resultado
	}
	
}
