package trailFlix.flix_ui

import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.MainWindow
import trailFlix.flix.appModel.AdminMain
import trailFlix.flix.appModel.AdminMovie
import trailFlix.flix.model.Pelicula

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import trailFlix.flix.model.Serie
import trailFlix.flix.appModel.AdminMovieInfo

class AdminMainWindow extends MainWindow<AdminMain> {
	
	new() {
		super(new AdminMain)
		title = "Añada contenido relacionado"
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Administración de TrailFlix"
		
		//Administrar peliculas
		//-----Pelis y ver Usuarios-----------------------
		val panelPeliLabel = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		new Label(panelPeliLabel).text = "Películas"
		
		//-----Busqueda-----------------------------------
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
		
		//-----Base de datos-----------------------------
		val panelPeliDB = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		//----------Tabla Peliculas----------------------
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
				//---------------//
		
		val panelPeliButtons = new Panel(panelPeliDB) => [
			layout = new VerticalLayout
		]
		new Button(panelPeliButtons) => [
			caption = "Nuevo"
			onClick [ | new AdminMovieWindow(this, new AdminMovie(modelObject.trailFlix)).open]
		]
		new Button(panelPeliButtons) => [
			caption = "Ver"
			onClick [ | new AdminMovieInfoWindow(this, new AdminMovieInfo (modelObject.sel_pelicula)).open]
		]
		new Button(panelPeliButtons) => [
			caption = "Modificar"
		]
		new Button(panelPeliButtons) => [
			caption = "Borrar"
			onClick [ | modelObject.quitarPelicula]
		]
		
		//Administrar series
		//-----Series------------------------------------
		val panelSerieLabel = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		new Label(panelSerieLabel).text = "Series"
		
		//-----Busqueda-----------------------------------
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
		//-----Base de datos-----------------------------
		val panelSerieDB = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		//----------Tabla Peliculas----------------------
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
				//---------------//
		
		val panelSerieButtons = new Panel(panelSerieDB) => [
			layout = new VerticalLayout
		]
		new Button(panelSerieButtons) => [
			caption = "Nuevo"
		]
		new Button(panelSerieButtons) => [
			caption = "Ver"
		]
		new Button(panelSerieButtons) => [
			caption = "Modificar"
		]
		new Button(panelSerieButtons) => [
			caption = "Borrar"
			onClick [ | modelObject.quitarSerie]
		]
	}
	
	def static main(String[] args) {
		new AdminMainWindow().startApplication
	}
	
}
