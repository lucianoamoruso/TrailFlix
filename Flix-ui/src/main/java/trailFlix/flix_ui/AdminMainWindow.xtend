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
import trailFlix.flix.appModel.AdminMovieModify
import trailFlix.flix.appModel.AdminSerie
import trailFlix.flix.appModel.AdminSerieInfo
import trailFlix.flix.appModel.AdminSerieModify
import trailFlix.flix.appModel.AdminUserList
import trailFlix.flix.model.Pelicula
import trailFlix.flix.model.Serie

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Link
import java.awt.Color

class AdminMainWindow extends MainWindow<AdminMain> {
	
	TransformadorImagen transformadorImagen = new TransformadorImagen
	
	new() {
		super(new AdminMain)
		this.title = "Administración de TrailFlix"
		iconImage = "C:\\Users\\user\\git\\grupo-7-Tryhard\\Flix-ui\\src\\main\\java\\trailFlix\\flix_ui\\iconos\\gear.png"
	}
	
	override createContents(Panel mainPanel) {
		
		generarElementosDePeliculas(mainPanel)
		generarElementosDeSeries(mainPanel)
	}
	
//	PELICULA

	def void generarElementosDePeliculas(Panel mainPanel) {
		
		//Pelis y ver Usuarios----------------------------
		val panelPeliLabel = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		new Label(panelPeliLabel) => [
			text = "Peliculas"
			fontSize = 15
			foreground = new Color(39,183,212)
		]
		ocuparEspacio(500,0,panelPeliLabel)
		new Button(panelPeliLabel) => [
			caption = "Usuarios"
//			bindVisibleToProperty("egg")
			bindImageToProperty("user_icon",transformadorImagen)
			onClick [ | new AdminUserListWindow(this, new AdminUserList(modelObject.trailFlix)).open]
		]
		
		//Busqueda----------------------------------------
		val panelPeliFind = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		new TextBox(panelPeliFind) => [
			value <=> "peli_find"
			width = 150
		]
		new Link(panelPeliFind) => [
			caption = "Limpiar"
			onClick [ | modelObject.limpiarPeliFind]
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
			onClick [ | new AdminMovieWindow(this, new AdminMovie(modelObject.trailFlix,modelObject)).open]
		]
		new Button(panelPeliButtons) => [
			caption = "Ver"
			bindEnabledToProperty("hay_peli_sel")
			onClick [ | new AdminMovieInfoWindow(this, new AdminMovieInfo(modelObject.sel_pelicula)).open]
		]
		new Button(panelPeliButtons) => [
			bindEnabledToProperty("hay_peli_sel")
			caption = "Modificar"
			onClick [ | new AdminMovieModifyWindow(this, new AdminMovieModify(modelObject.trailFlix,modelObject,modelObject.sel_pelicula)).open]
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
		new Label(panelSerieLabel) => [
			text = "Series"
			fontSize = 15
			foreground = new Color(236,170,113)
		]
		
		//Busqueda----------------------------------------
		val panelSerieFind = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		new TextBox(panelSerieFind) => [
			value <=> "serie_find"
			width = 150
		]
		new Link(panelSerieFind) => [
			caption = "Limpiar"
			onClick [ | modelObject.limpiarSerieFind]
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
			onClick [ | new AdminSerieModifyWindow(this, new AdminSerieModify(modelObject.trailFlix,modelObject.sel_serie)).open]
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
	
	/*
	 * Prop: rellena espacio en un panel para ubicar elementos en el lugar deseado.
	 */
	def void ocuparEspacio(int ancho, int alto, Panel panel) {
		new Button(panel) => [
			width = ancho
			height = alto
			bindVisibleToProperty("visible")
		]
	}
	
	
	def static main(String[] args) {
		new AdminMainWindow().startApplication
	}
	
}
