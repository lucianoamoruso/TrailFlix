package trailFlix.flix_ui

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import trailFlix.flix.appModel.AdminUser
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout

class AdminUserWindow extends SimpleWindow<AdminUser> {
	
	new(WindowOwner parent, AdminUser model) {
		super(parent, model)
		taskDescription = "Datos de " + modelObject.nombre
	}
	
	override protected addActions(Panel actionsPanel) {
		//TODO?
	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = "Datos de usuario"
		
		val panelInfoLabel = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]
		new Label (panelInfoLabel) => [
			text = "Nombre:"
			fontSize = 12
		]
		new Label (panelInfoLabel) => [
			text = modelObject.nombre
			fontSize = 11
		]
		new Label (panelInfoLabel) => [
			text = "Username:"
			fontSize = 12
		]
		new Label (panelInfoLabel) => [
			text = modelObject.nombreDeUsuario
			fontSize = 11
		]
	}
	
}