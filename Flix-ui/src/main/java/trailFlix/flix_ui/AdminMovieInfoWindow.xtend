package trailFlix.flix_ui

import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import trailFlix.flix.appModel.AdminMovieInfo

class AdminMovieInfoWindow extends Dialog <AdminMovieInfo> {
	
	new(WindowOwner owner, AdminMovieInfo model) {
		super(owner, model)
		title = modelObject.pelicula.titulo
		taskDescription = "Informacion de " + title
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		val panelInfoLabel = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]
		new Label (panelInfoLabel) => [
			text = "Duracion:"
			fontSize = 12
		]
		new Label (panelInfoLabel) => [
			text = modelObject.duracion
			fontSize = 11
		]
		new Label (panelInfoLabel) => [
			text = "Fecha de Estreno:"
			fontSize = 12
		]
		new Label (panelInfoLabel) => [
			text = modelObject.fecha_estreno
			fontSize = 11
		]
		new Label (panelInfoLabel) => [
			text = "Reparto:"
			fontSize = 12
		]
		new Label (panelInfoLabel) => [
			text = modelObject.reparto
			fontSize = 11
		]
		new Label (panelInfoLabel) => [
			text = "Direccion:"
			fontSize = 12
		]
		new Label (panelInfoLabel) => [
			text = modelObject.direccion
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
			text = "Enlace:"
			fontSize = 12
		]
		new Label (panelInfoLabel) => [
			text = modelObject.enlace
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