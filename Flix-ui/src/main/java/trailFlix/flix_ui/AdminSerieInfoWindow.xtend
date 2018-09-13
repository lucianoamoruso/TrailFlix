package trailFlix.flix_ui

import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import trailFlix.flix.appModel.AdminSerieInfo

class AdminSerieInfoWindow extends Dialog <AdminSerieInfo> {
	
	new(WindowOwner owner, AdminSerieInfo model) {
		super(owner, model)
		title = modelObject.serie.titulo
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
			text = modelObject.capitulos
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
	}
	

	
}