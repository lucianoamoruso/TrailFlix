package trailFlix.flix.model

import java.util.ArrayList
import java.util.List
import trailFlix.flix.appModel.AdminMain
import org.joda.time.LocalDate

class TrailFlix {
	List<Usuario> usuarios
	ArrayList<Contenido> contenido
	AdminMain ventana
	GeneradorDeIds generador
	ArrayList<String> clasificaciones = newArrayList ("ATP","Mayores13","Mayores16","Mayores21")
	ArrayList<String> categorias = newArrayList ("DRAMA","TERROR","COMEDIA","ACCION")
	
	
	new(AdminMain ventana) {
		contenido = new ArrayList
		usuarios = new ArrayList
		this.ventana = ventana
		this.generador = new GeneradorDeIds()
	}
	
	// todo ESTO NO DEBERIA ESTAR ACA
	def rellenarDatos() {
		
		val peli1 = new Pelicula("Terminator") => [
				codigo = 1000
				categorias = new ArrayList() => [add(Categoria.ACCION); add(Categoria.TERROR)]
				clasificacion = Clasificacion.MAYORES16
				fechaEstreno = "2015-5-15"
				duracion = 120
				directores = new ArrayList() => [add("Michael Bay"); add("Carlos Gamer")]
				actores = new ArrayList() => [add("Juan John"); add("Pepe Papa")]
				valoraciones = new ArrayList() => [add(7); add(8); add(9); add(8)]
				link = "https://www.youtube.com/watch?v=k64P4l2Wmeg"
			]
			
		val peli2 = new Pelicula("The Spacito 3") => [
				codigo = 2000
				categorias = new ArrayList() => [add(Categoria.COMEDIA); add(Categoria.DRAMA)]
				clasificacion = Clasificacion.ATP
				fechaEstreno = "2017-7-11"
				duracion = 420
				directores = new ArrayList() => [add("Luis Fonsi")]
				actores = new ArrayList() => [add("Bar Ney"); add("Juan Perez")]
				valoraciones = new ArrayList() => [add(4); add(8); add(5); add(10)]
				link = "https://www.youtube.com/watch?v=Vp1R4bb3FMw"
			]
			
		val peli3 = new Pelicula("Transformers") => [
				codigo = 3000
				categorias = new ArrayList() => [add(Categoria.COMEDIA); add(Categoria.TERROR)]
				clasificacion = Clasificacion.MAYORES13
				fechaEstreno = "2000-1-10"
				duracion = 150
				directores = new ArrayList() => [add("Michael Bay")]
				actores = new ArrayList() => [add("Vin Diesel"); add("The Rock")]
				valoraciones = new ArrayList() => [add(1); add(2); add(3); add(4)]
				link = "https://www.youtube.com/watch?v=UcRtFYAz2Yo"
			]
		
		peli1.contRelacionado = new ArrayList() => [add(peli2);add(peli3)]
		peli2.contRelacionado = new ArrayList() => [add(peli1);add(peli3)]
		peli3.contRelacionado = new ArrayList() => [add(peli1);add(peli2)]
		
		val cap1_1 = new Capitulo("Piloto") => [
			codigo = 0001
			temporada = 1
			capituloNro = 1
			fechaEstreno = "2008-2-05"
			duracion = 40
			directores = new ArrayList() => [add("Super Pepe")]
			actores = new ArrayList() => [add("Vin Diesel"); add("Dardo")]
			valoraciones = new ArrayList() => [add(9); add(10); add(8); add(8)]
			link = "https://www.youtube.com/watch?v=YCI1tczEZ6c"
		]
		
		val cap1_2 = new Capitulo("Fatiga") => [
			codigo = 0002
			temporada = 1
			capituloNro = 2
			fechaEstreno = "2008-2-06"
			duracion = 40
			directores = new ArrayList() => [add("Super Pepe")]
			actores = new ArrayList() => [add("Un Perro"); add("Dardo")]
			valoraciones = new ArrayList() => [add(4); add(10); add(6); add(9)]
			link = "https://youtu.be/mQ0hS7l9ckY"
		]
		
		val serie1 = new Serie("Casados con Hijos") => [
			codigo = 0100
			categorias = new ArrayList() => [add(Categoria.COMEDIA)]
			clasificacion = Clasificacion.ATP
			creadores = new ArrayList() => [add("Super Pepe")]
			capitulos = new ArrayList() => [add(cap1_1); add(cap1_2)]
			temporadas = 8
			contRelacionado = new ArrayList() => [add(peli1);add(peli3)]
		]
		
		val cap2_1 = new Capitulo("2000 years") => [
			codigo = 0003
			temporada = 1
			capituloNro = 1
			fechaEstreno = "2013-4-07"
			duracion = 20
			directores = new ArrayList() => [add("Hiroyuki Tanaka")]
			actores = new ArrayList() => [add("Eren"); add("Mikasa")]
			valoraciones = new ArrayList() => [add(9); add(9); add(9); add(9)]
			link = "https://youtu.be/XMXgHfHxKVM"
		]
		
		val serie2 = new Serie("Attack on Titan") => [
			codigo = 0200
			categorias = new ArrayList() => [add(Categoria.ACCION); add(Categoria.TERROR); add(Categoria.DRAMA)]
			clasificacion = Clasificacion.MAYORES13
			creadores = new ArrayList() => [add("Hiroyuki Tanaka")]
			capitulos = new ArrayList() => [add(cap2_1)]
			temporadas = 3
			contRelacionado = new ArrayList() => [add(peli3); add(serie1)]
		]
		
		val serie3 = new Serie("The Walking Bad") => [
		codigo = 0200
		categorias = new ArrayList() => [add(Categoria.ACCION); add(Categoria.TERROR)]
		clasificacion = Clasificacion.MAYORES16
		creadores = new ArrayList() => [add("Hiroyuki Tanaka")]
		capitulos = new ArrayList() => [add(cap2_1); add(cap1_2); add(cap1_1)]
		temporadas = 3
		contRelacionado = new ArrayList() => [add(peli3); add(serie1)]
		]
		
		contenido => [
			add(peli1)
			add(peli2)
			add(peli3)
			add(serie1)
			add(serie2)
			add(serie3)
		]
		
		val user1 = new Usuario(0001,"carlos3","Carlos") => [
			fechaRegistro = new LocalDate(1980,12,26)
			fechaNacimiento = new LocalDate(1970,10,22)
			contVisto = newArrayList(peli1,peli2,serie3)
			contFavorito = newArrayList(peli2)
			contRecomendado = newArrayList(peli1,serie3)
		]
		
		val user2 = new Usuario(0002,"pedro54","Pedro") => [
			fechaRegistro = new LocalDate(2001,9,15)
			fechaNacimiento = new LocalDate(2000,2,7)
			contVisto = newArrayList(peli1,peli2,serie3,peli3)
			contFavorito = newArrayList(peli2,serie3)
			contRecomendado = newArrayList(peli1,serie3)
		]
		
		val user3 = new Usuario(0003,"jose100","Jose") => [
			fechaRegistro = new LocalDate(1999,12,31)
			fechaNacimiento = new LocalDate(1995,5,17)
			contVisto = newArrayList(peli1,peli3)
			contFavorito = newArrayList()
			contRecomendado = newArrayList(peli3)
		]
		
		val user4 = new Usuario(0004,"xXxMiguexXx","Miguel") => [
			fechaRegistro = new LocalDate(2000,1,1)
			fechaNacimiento = new LocalDate(1000,12,25)
			contVisto = newArrayList(peli3,peli2,serie2)
			contFavorito = newArrayList(serie1)
			contRecomendado = newArrayList()
		]
		
		user1.amigos.addAll(user2,user3)
		user2.amigos.addAll(user1,user3)
		user3.amigos.addAll(user2,user1)
		//user 4 no tiene amigos :(
			
		usuarios => [
			add(user1)
			add(user2)
			add(user3)
			add(user4)
		]
	}


	

	def buscarPelicula (int id){
		this.contenido.findFirst[(it.esPelicula && it.codigo == id)]
	}
	
	def buscarSerie (int id){
		this.contenido.findFirst[(it.esSerie && it.codigo == id)]
	}
	
	def buscarUsuario (int id){
		this.usuarios.findFirst[it.codigo == id]
	
	}
	
	def buscarPorCategoria (String categoria){
		this.categorias.filter[it == categoria]
	}
	
	def buscarPorClasificacion (String clasificacion){
		this.clasificacion.filter[it == clasificacion]
	}
	
	/*
	 * Prop: se añade una pelicula y se notifica a la ventana principal.
	 */
	def agregarPelicula (Pelicula pelicula){ //CHECKEAR SI EXISTE SU CLASIFICACION/CATEGORIA DE LA PELICULA PASADA POR PARAMETRO, SINO AGREGARLA
		pelicula.codigo = this.generador.generarCodigo
		this.contenido.add(pelicula)
		ventana.actualizarContenidos
	}
	
	/*
	 * Prop: se añade una serie y se notifica a la ventana principal.
	 */
	def agregarSerie (Serie serie){ //CHECKEAR SI EXISTE SU CLASIFICACION/CATEGORIA DE LOS CAPITULOS DE LA SERIE PASADA POR PARAMETRO, SINO AGREGARLA
		serie.codigo = this.generador.generarCodigo
		this.contenido.add(serie)
		ventana.actualizarContenidos
	}
	
	def agregarUsuario (Usuario usuario){
		usuario.codigo = this.generador.generarCodigo
		this.usuarios.add(usuario)
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
	
	def generarId (){
		this.generador.generarCodigo
	}
	
//-----------------GETTERS Y SETTERS----------------------------


	def getPeliculas() { //IMPLEMENTAR
		this.contenido.map[returnPelicula].filter[it !== null].toList
	}
	
	def getSeries() { //IMPLEMENTAR
		this.contenido.map[returnSerie].filter[it !== null].toList
	}
	
	def getUsuarios() {
		this.usuarios
	}
	
	def getCategorias(){
		this.categorias
	}
	
	def getClasificacion(){
		this.clasificaciones
	}
	
	def void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios
	}
	
		
}
