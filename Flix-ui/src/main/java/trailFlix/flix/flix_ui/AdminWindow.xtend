package trailFlix.flix.flix_ui

import trailFlix.flix.appModel.AdminMainWindow

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.ColumnLayout

class AdminWindow extends MainWindow<AdminMainWindow> {
	
	new() {
		super(new AdminMainWindow)
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
			onClick [ | this.modelObject.buscarSeries]
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
	
	def static main(String[] args) {
		//Rellenar modelo
		new AdminWindow().startApplication
	}
	
}
