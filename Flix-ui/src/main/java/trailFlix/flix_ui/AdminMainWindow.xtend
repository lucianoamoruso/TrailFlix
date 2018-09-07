package trailFlix.flix_ui

import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.MainWindow
import trailFlix.flix.appModel.AdminMain
import trailFlix.flix.appModel.AdminMovie

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.tables.Table
import trailFlix.flix.model.Pelicula
import org.uqbar.arena.widgets.tables.Column

class AdminMainWindow extends MainWindow<AdminMain> {
	
	new() {
		super(new AdminMain)
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
			layout = new ColumnLayout(2)
		]
		new List(panelPeliDB) => [
			allowNull(false)
			items <=> "peliculas"
			value <=> "sel_pelicula"
			width = 200
			height = 100
		]
		//----------Tabla Peliculas----------------------
		val tablaPelis = new Table<Pelicula>(mainPanel, typeof(Pelicula)) => [
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
			layout = new ColumnLayout(2)
		]
		new List(panelSerieDB) => [
			allowNull(false)
			items <=> "series"
			value <=> "sel_serie"
			width = 200
			height = 100
		]
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
