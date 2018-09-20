package trailFlix.flix_ui

import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import trailFlix.flix.appModel.AdminSerieInfo
import trailFlix.flix.model.Capitulo

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import trailFlix.flix_ui.helpers.ProveedorIconos

class AdminSerieInfoWindow extends Dialog <AdminSerieInfo> {
	
	new(WindowOwner owner, AdminSerieInfo model) {
		super(owner, model)
		title = modelObject.serie.titulo
		taskDescription = "Informacion de " + title
		iconImage = ProveedorIconos.serie
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
		
		new Label (mainPanel) => [
			text = "Capitulos:"
			fontSize = 15
		]
		
		crearTablaCapitulos(mainPanel)
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