package trailFlix.flix_ui

import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.MainWindow
import trailFlix.flix.appModel.AdminMain

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import trailFlix.flix.appModel.AdminMovie

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
		]
		new Button(panelPeliFind) => [
			caption = "Buscar"
			onClick [ | this.modelObject.buscarPeliculas]
		]
		
		//-----Base de datos-----------------------------
		val panelPeliDB = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]
		new Selector(panelPeliDB)
		new Button(panelPeliDB) => [
			caption = "Nuevo"
			onClick [ | new AdminMovieWindow(this, new AdminMovie).open]
		]
		new Button(panelPeliDB) => [
			caption = "Ver"
		]
		new Button(panelPeliDB) => [
			caption = "Modificar"
		]
		new Button(panelPeliDB) => [
			caption = "Borrar"
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
		]
		new Button(panelSerieFind) => [
			caption = "Buscar"
			onClick [ | modelObject.buscarSeries]
		]
		//-----Base de datos-----------------------------
		val panelSerieDB = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]
		new Selector(panelSerieDB)
		new Button(panelSerieDB) => [
			caption = "Nuevo"
		]
		new Button(panelSerieDB) => [
			caption = "Ver"
		]
		new Button(panelSerieDB) => [
			caption = "Modificar"
		]
		new Button(panelSerieDB) => [
			caption = "Borrar"
		]
	}
	
//	def static void main(String[] args) {
//		new AdminMainWindow() => [
//			startApplication
//			modelObject.rellenarDatos
//		]
//	}

	def static main(String[] args) {
		new AdminMainWindow().startApplication
	}
	
}
