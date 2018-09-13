package trailFlix.flix.model

import java.util.List
import java.util.ArrayList
import trailFlix.flix.appModel.AdminMain

class TrailFlix {
	List<Usuario> usuarios
	ArrayList<Contenido> contenido
	AdminMain ventana
	
	
	new(AdminMain ventana) {
		contenido = new ArrayList
		usuarios = new ArrayList
		this.ventana = ventana
	}
	
	def rellenarDatos() {
		
		val peli1 = new Pelicula("Terminator") => [
				codigo = 0008
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
				codigo = 0015
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
				codigo = 0065
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
			codigo = 1001
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
			codigo = 1002
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
			valoraciones = new ArrayList() => [add(10); add(10); add(10); add(10)]
			contRelacionado = new ArrayList() => [add(peli1);add(peli3)]
		]
		
		val cap2_1 = new Capitulo("2000 years") => [
			codigo = 2001
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
			codigo = 0101
			categorias = new ArrayList() => [add(Categoria.ACCION); add(Categoria.TERROR); add(Categoria.DRAMA)]
			clasificacion = Clasificacion.MAYORES13
			creadores = new ArrayList() => [add("Hiroyuki Tanaka")]
			capitulos = new ArrayList() => [add(cap2_1)]
			temporadas = 3
			valoraciones = new ArrayList() => [add(9); add(9); add(9); add(9)]
			contRelacionado = new ArrayList() => [add(peli3); add(serie1)]
		]
		
		contenido => [
			add(peli1)
			add(peli2)
			add(peli3)
			add(serie1)
			add(serie2)
			add(new Serie("Attack on Pepe"))
			add(new Serie("The Grim Adventures of Billy and Mandy"))
		]
		
		usuarios => [
			add(new Usuario(0001,"carlos3","Carlos"))
			add(new Usuario(0002,"pedro54","Pedro"))
			add(new Usuario(0003,"jose100","Jose"))
			add(new Usuario(0004,"xXxMiguexXx","Miguel"))
		]
	}
	
	def buscarPelicula (String nombre){
		for (i:0..this.contenido.size-1){
			if (this.contenido.get(i).returnPelicula() !== null && this.contenido.get(i).titulo == nombre){
				return this.contenido.get(i)
			}
		}
	}
	
	def buscarSerie (String nombre){
		for (i:0..this.contenido.size-1){
			if (this.contenido.get(i).returnSerie() !== null && this.contenido.get(i).titulo == nombre){
				return this.contenido.get(i)
			}
		}
	}
	
	def buscarUsuario (String nombre){
		for (i:0..this.usuarios.size-1){
			if (this.usuarios.get(i).nombre == nombre){
				return this.usuarios.get(i)
			}
		}
	}
	
	def buscarPorCategoria (Categoria categoria){
		for (i:0..this.contenido.size-1){
			if (this.contenido.get(i).categorias.contains(categoria)){
				return this.contenido.get(i)
			}
		}
	}
	
	def buscarPorClasificacion (Clasificacion clasificacion){
		for (i:0..this.contenido.size-1){
			if (this.contenido.get(i).clasificacion.equals(clasificacion)){
				return this.contenido.get(i)
			}
		}
	}
	
	/*
	 * Prop: se añade una pelicula y se notifica a la ventana principal.
	 */
	def agregarPelicula (Pelicula pelicula){
		this.contenido.add(pelicula)
		ventana.actualizarContenidos
	}
	
	/*
	 * Prop: se añade una serie y se notifica a la ventana principal.
	 */
	def agregarSerie (Serie serie){
		this.contenido.add(serie)
		ventana.actualizarContenidos
	}
	
	
//-----------------GETTERS Y SETTERS----------------------------
	
	def getPeliculas() {
		var retorno = newArrayList
		for (i:0..this.contenido.size-1){
			if (this.contenido.get(i).returnPelicula() !== null){
				retorno.add(this.contenido.get(i) as Pelicula)
			}
		}
		retorno
	}
	
	def getSeries() {
		var retorno = newArrayList
		for (i:0..this.contenido.size-1){
			if (this.contenido.get(i).returnSerie() !== null){
				retorno.add(this.contenido.get(i) as Serie)
			}
		}
		retorno
	}
	
	def getUsuarios() {
		this.usuarios
	}
	
	def void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios
	}
	
	/**
	 * Prop: devuelve un nuevo codigo unico que identifique a la pelicula recien creada.
	 */
	def nuevoCodigoPeli() {
		//TODO
		0001
	}
	
	/**
	 * Prop: devuelve un nuevo codigo unico que identifique a la serie recien creada.
	 */
	def nuevoCodigoSerie() {
		//TODO
	}
	
	/**
	 * Prop: devuelve un nuevo codigo unico que identifique al capitulo recien creado.
	 */
	def nuevoCodigoCapitulo() {
		//TODO
	}
	
}