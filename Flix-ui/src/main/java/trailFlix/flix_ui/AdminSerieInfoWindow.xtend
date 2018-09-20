package trailFlix.flix_ui

import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import trailFlix.flix.appModel.AdminSerieInfo

import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table


import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import trailFlix.flix.model.Capitulo
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button

class AdminSerieInfoWindow extends Dialog <AdminSerieInfo> {
	
	new(WindowOwner owner, AdminSerieInfo model) {
		super(owner, model)
		title = modelObject.serie.titulo
		iconImage = "C:\\Users\\user\\git\\grupo-7-Tryhard\\Flix-ui\\src\\main\\java\\trailFlix\\flix_ui\\serie.png"
		taskDescription = "Informacion de " + title
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		val panelInfoLabel = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]
		new Label (panelInfoLabel) => [
			text = "Capitulos:"
			fontSize = 12
		]
		new Label (panelInfoLabel) => [
			text = modelObject.capitulosList
			fontSize = 11
		]

		new Label (panelInfoLabel) => [
			text = "Creadores:"
			fontSize = 12
		]
		new Label (panelInfoLabel) => [
			text = modelObject.creadores
			fontSize = 11
		]
		new Label (panelInfoLabel) => [
			text = "Valoraciones:"
			fontSize = 12
		]
		new Label (panelInfoLabel) => [
			text = modelObject.valoraciones
			fontSize = 11
		]
		
		new Label (panelInfoLabel) => [
			text = "Temporadas:"
			fontSize = 12
		]
		new Label (panelInfoLabel) => [
			text = modelObject.temporadas
			fontSize = 11
		]
		new Label (panelInfoLabel) => [
			text = "Categorias:"
			fontSize = 12
		]
		new Label (panelInfoLabel) => [
			text = modelObject.categorias
			fontSize = 11
		]
		new Label (panelInfoLabel) => [
			text = "Contenido Relacionado:"
			fontSize = 12
		]
		new Label (panelInfoLabel) => [
			text = modelObject.contenido_relacionado
			fontSize = 11
		]
		
		new Label (panelInfoLabel) => [
			text = "Capitulos:"
			fontSize = 11
		]
		
		val panelCapitulos = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		crearTablaCapitulos(panelCapitulos)
		
//		val panelBotones = new Panel (panelCapitulos) => [
//			layout = new VerticalLayout
//		]
//		
//		new Button(panelBotones).caption = "Nuevo"
//		
//		new Button(panelBotones) => [
//			caption = "Ver"
//			bindEnabledToProperty("hay_cap_sel")
//		]
//		
//		new Button(panelBotones).caption = "Modificar"
//		
//		new Button(panelBotones) => [
//			caption = "Borrar"
//			onClick [ | modelObject.quitarCapitulo]
//		]
//		
		}
		
	
	def void crearTablaCapitulos(Panel panelCapitulos) {
		
		val tablaCapitulos = new Table<Capitulo>(panelCapitulos, typeof(Capitulo)) => [
			items <=> "capitulos"
			value <=> "sel_capitulo"
			numberVisibleRows = 4
		]
		new Column<Capitulo>(tablaCapitulos) => [
			title = "Codigo"
			bindContentsToProperty("codigo")
		]
		
		new Column<Capitulo>(tablaCapitulos) => [
			title = "Titulo"
			bindContentsToProperty("titulo")
		]
		
		new Column<Capitulo>(tablaCapitulos) => [
			title = "Temporada"
			bindContentsToProperty("temporada")
		]
		
		new Column<Capitulo>(tablaCapitulos) => [
			title = "Duracion"
			bindContentsToProperty("duracion")
		]
	}
	

	
}