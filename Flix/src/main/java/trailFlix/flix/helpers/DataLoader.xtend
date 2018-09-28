package trailFlix.flix.helpers

import trailFlix.flix.model.TrailFlix
import trailFlix.flix.model.Pelicula
import java.util.ArrayList
import trailFlix.flix.model.Capitulo
import trailFlix.flix.model.Serie
import trailFlix.flix.model.Usuario
import org.joda.time.LocalDate

class DataLoader implements Loader {
	
	
	override rellenarDatos(TrailFlix modelo) {
		
		val peli1 = new Pelicula("Terminator") => [
				categorias = new ArrayList() => [add(modelo.categorias.get(3)); add(modelo.categorias.get(1))]
				clasificacion = modelo.clasificaciones.get(1)
				fechaEstreno = "2015-5-15"
				duracion = 120
				directores = new ArrayList() => [add("Michael Bay"); add("Carlos Gamer")]
				actores = new ArrayList() => [add("Juan John"); add("Pepe Papa")]
				valoraciones = new ArrayList() => [add(7); add(8); add(9); add(8)]
				link = "https://www.youtube.com/watch?v=k64P4l2Wmeg"
			]
			
		val peli2 = new Pelicula("The Spacito 3") => [
				categorias = new ArrayList() => [add(modelo.categorias.get(0)); add(modelo.categorias.get(2))]
				clasificacion = modelo.clasificaciones.get(0)
				fechaEstreno = "2017-7-11"
				duracion = 420
				directores = new ArrayList() => [add("Luis Fonsi")]
				actores = new ArrayList() => [add("Bar Ney"); add("Juan Perez")]
				valoraciones = new ArrayList() => [add(4); add(8); add(5); add(10)]
				link = "https://www.youtube.com/watch?v=Vp1R4bb3FMw"
			]
			
		val peli3 = new Pelicula("Transformers") => [
				categorias = new ArrayList() => [add(modelo.categorias.get(1)); add(modelo.categorias.get(3))]
				clasificacion = modelo.clasificaciones.get(0)
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
			categorias = new ArrayList() => [add(modelo.categorias.get(2))]
			clasificacion = modelo.clasificaciones.get(0)
			creadores = new ArrayList() => [add("Super Pepe")]
			capitulos = new ArrayList() => [add(cap1_1); add(cap1_2)]
			temporadas = 8
			contRelacionado = new ArrayList() => [add(peli1);add(peli3)]
		]
		
		val cap2_1 = new Capitulo("2000 years") => [
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
			categorias = new ArrayList() => [add(modelo.categorias.get(1)); add(modelo.categorias.get(2)); add(modelo.categorias.get(3))]
			clasificacion = modelo.clasificaciones.get(1)
			creadores = new ArrayList() => [add("Hiroyuki Tanaka")]
			capitulos = new ArrayList() => [add(cap2_1)]
			temporadas = 3
			contRelacionado = new ArrayList() => [add(peli3); add(serie1)]
		]
		
		val serie3 = new Serie("The Walking Bad") => [
		categorias = new ArrayList() => [add(modelo.categorias.get(3)); add(modelo.categorias.get(2))]
		clasificacion = modelo.clasificaciones.get(2)
		creadores = new ArrayList() => [add("Hiroyuki Tanaka")]
		capitulos = new ArrayList() => [add(cap2_1); add(cap1_2); add(cap1_1)]
		temporadas = 3
		contRelacionado = new ArrayList() => [add(peli3); add(serie1)]
		]
		
		modelo.agregarPelicula(peli1)
		modelo.agregarPelicula(peli2)
		modelo.agregarPelicula(peli3)
		modelo.agregarSerie(serie1)
		modelo.agregarSerie(serie2)
		modelo.agregarSerie(serie3)
		
		val user1 = new Usuario("carlos3","Carlos") => [
			fechaRegistro = new LocalDate(1980,12,26)
			fechaNacimiento = new LocalDate(1970,10,22)
			contVisto = newArrayList(peli1,peli2,serie3)
			contFavorito = newArrayList(peli2)
			contRecomendado = newArrayList(peli1,serie3)
		]
		
		val user2 = new Usuario("pedro54","Pedro") => [
			fechaRegistro = new LocalDate(2001,9,15)
			fechaNacimiento = new LocalDate(2000,2,7)
			contVisto = newArrayList(peli1,peli2,serie3,peli3)
			contFavorito = newArrayList(peli2,serie3)
			contRecomendado = newArrayList(peli1,serie3)
		]
		
		val user3 = new Usuario("jose100","Jose") => [
			fechaRegistro = new LocalDate(1999,12,31)
			fechaNacimiento = new LocalDate(1995,5,17)
			contVisto = newArrayList(peli1,peli3)
			contFavorito = newArrayList()
			contRecomendado = newArrayList(peli3)
		]
		
		val user4 = new Usuario("xXxMiguexXx","Miguel") => [
			fechaRegistro = new LocalDate(2000,1,1)
			fechaNacimiento = new LocalDate(1000,12,25)
			contVisto = newArrayList(peli3,peli2,serie2)
			contFavorito = newArrayList(serie1)
			contRecomendado = newArrayList()
		]
		
		user1.amigos.add(user2)
		//user2.amigos.addAll(user1,user3)
		//user3.amigos.addAll(user2,user1)
		//user 4 no tiene amigos :(
			
		modelo.agregarUsuario(user1)
		modelo.agregarUsuario(user2)
		modelo.agregarUsuario(user3)
		modelo.agregarUsuario(user4)
	}
	
}
