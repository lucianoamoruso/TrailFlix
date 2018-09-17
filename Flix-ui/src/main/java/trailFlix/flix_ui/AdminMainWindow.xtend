package trailFlix.flix_ui

import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.MainWindow
import trailFlix.flix.appModel.AdminMain
import trailFlix.flix.appModel.AdminMovie
import trailFlix.flix.appModel.AdminMovieInfo
import trailFlix.flix.model.Pelicula
import trailFlix.flix.model.Serie

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import trailFlix.flix.appModel.AdminUserList
import trailFlix.flix.appModel.AdminSerieInfo
import trailFlix.flix.appModel.AdminMovieModify
import trailFlix.flix.appModel.AdminSerie

class AdminMainWindow extends MainWindow<AdminMain> {
	
	new() {
		super(new AdminMain)
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Administración de TrailFlix"
		
		generarElementosDePeliculas(mainPanel)
		generarElementosDeSeries(mainPanel)
	}
	
//	PELICULA

	def void generarElementosDePeliculas(Panel mainPanel) {
		//Pelis y ver Usuarios----------------------------
		val verUsuario = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		new Button(verUsuario) => [
			caption = "Usuarios"
//			iconImage = "undefined"
			onClick [ | new AdminUserListWindow(this, new AdminUserList(modelObject.trailFlix)).open]
		]
		val panelPeliLabel = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		new Label(panelPeliLabel).text = "Peliculas"
		
		//Busqueda----------------------------------------
		val panelPeliFind = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		new TextBox(panelPeliFind) => [
			value <=> "peli_find"
			width = 150
		]
		new Button(panelPeliFind) => [
			caption = "Buscar"
			onClick [ | this.modelObject.buscarPeliculas]
		]
		
		//Base de datos-----------------------------------
		val panelPeliDB = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		
		//-----Tabla Peliculas----------------------------
		crearTablaPeliculas(panelPeliDB)
		
		val panelPeliButtons = new Panel(panelPeliDB) => [
			layout = new VerticalLayout
		]
		new Button(panelPeliButtons) => [
			caption = "Nuevo"
			onClick [ | new AdminMovieWindow(this, new AdminMovie(modelObject.trailFlix)).open]
		]
		new Button(panelPeliButtons) => [
			caption = "Ver"
			bindEnabledToProperty("hay_peli_sel")
			onClick [ | new AdminMovieInfoWindow(this, new AdminMovieInfo(modelObject.sel_pelicula)).open]
		]
		new Button(panelPeliButtons) => [
			bindEnabledToProperty("hay_peli_sel")
			caption = "Modificar"
			onClick [ | new AdminMovieModifyWindow(this, new AdminMovieModify(modelObject.trailFlix,modelObject.sel_pelicula)).open]
		]
		new Button(panelPeliButtons) => [
			caption = "Borrar"
			bindEnabledToProperty("hay_peli_sel")
			onClick [ | modelObject.quitarPelicula]
		]
	}
	
	def void crearTablaPeliculas(Panel panelPeliDB) {
		
		val tablaPelis = new Table<Pelicula>(panelPeliDB, typeof(Pelicula)) => [
			items <=> "peliculas"
			value <=> "sel_pelicula"
			numberVisibleRows = 5
			
		]
		new Column<Pelicula>(tablaPelis) => [
			title = "Titulo"
			fixedSize = 200
			bindContentsToProperty("titulo")
		]
		new Column<Pelicula>(tablaPelis) => [
			title = "Codigo"
			bindContentsToProperty("codigo")
		]
		new Column<Pelicula>(tablaPelis) => [
			title = "Clasificacion"
			bindContentsToProperty("clasificacion")
		]
		new Column<Pelicula>(tablaPelis) => [
			title = "Duracion"
			bindContentsToProperty("duracion")
		]
		new Column<Pelicula>(tablaPelis) => [
			title = "Directores"
			bindContentsToProperty("directores")
		]
	}
	
//	SERIE

	def void generarElementosDeSeries(Panel mainPanel) {
		
		//Series------------------------------------------
		val panelSerieLabel = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		new Label(panelSerieLabel).text = "Series"
		
		//Busqueda----------------------------------------
		val panelSerieFind = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		new TextBox(panelSerieFind) => [
			value <=> "serie_find"
			width = 150
		]
		new Button(panelSerieFind) => [
			caption = "Buscar"
			onClick [ | modelObject.buscarSeries]
		]
		//Base de datos-----------------------------------
		val panelSerieDB = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		//-----Tabla Series-------------------------------
		crearTablaSeries(panelSerieDB)
		
		val panelSerieButtons = new Panel(panelSerieDB) => [
			layout = new VerticalLayout
		]
		new Button(panelSerieButtons) => [
			caption = "Nuevo"
			onClick [ | new AdminSerieWindow(this, new AdminSerie(modelObject.trailFlix)).open]
		]
		new Button(panelSerieButtons) => [
			caption = "Ver"
			bindEnabledToProperty("hay_serie_sel")
			onClick [ | new AdminSerieInfoWindow(this, new AdminSerieInfo(modelObject.sel_serie)).open]
		]
		new Button(panelSerieButtons) => [
			bindEnabledToProperty("hay_serie_sel")
			caption = "Modificar"
		]
		new Button(panelSerieButtons) => [
			caption = "Borrar"
			bindEnabledToProperty("hay_serie_sel")
			onClick [ | modelObject.quitarSerie]
		]
	}
	
	def void crearTablaSeries(Panel panelSerieDB) {
		val tablaSeries = new Table<Serie>(panelSerieDB, typeof(Serie)) => [
			items <=> "series"
			value <=> "sel_serie"
			numberVisibleRows = 5
		]
		new Column<Serie>(tablaSeries) => [
			title = "Titulo"
			fixedSize = 200
			bindContentsToProperty("titulo")
		]
		new Column<Serie>(tablaSeries) => [
			title = "Codigo"
			bindContentsToProperty("codigo")
		]
		new Column<Serie>(tablaSeries) => [
			title = "Clasificacion"
			bindContentsToProperty("clasificacion")
		]
		new Column<Serie>(tablaSeries) => [
			title = "Creadores"
			bindContentsToProperty("creadores")
		]
		new Column<Serie>(tablaSeries) => [
			title = "Capitulos"
			bindContentsToProperty("capitulos")
		]
	}
	
	
	def static main(String[] args) {
		new AdminMainWindow().startApplication
	}
	
}
