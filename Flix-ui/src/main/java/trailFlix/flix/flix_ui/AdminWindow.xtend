package trailFlix.flix.flix_ui

import trailFlix.flix.appModel.AdminMainWindow

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AdminWindow extends MainWindow<AdminMainWindow> {
	
	new() {
		super(new AdminMainWindow)
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Administración de TrailFlix"
		
		//Administrar peliculas
		new Label(mainPanel).text = "Películas"
		new TextBox(mainPanel) => [
			value <=> "peli_find"
		]
		new Button(mainPanel) => [
			caption = "Buscar"
			onClick [ | this.modelObject.buscarPeliculas]
		]
		new Selector(mainPanel)
		
		//Administrar series
		new Label(mainPanel).text = "Series"
		new TextBox(mainPanel) => [
			value <=> "serie_find"
		]
		new Button(mainPanel) => [
			caption = "Buscar"
			onClick [ | this.modelObject.buscarSeries]
		]
		new Selector(mainPanel)
	}
	
	def static main(String[] args) {
		//Rellenar modelo
		new AdminWindow().startApplication
	}
	
}
