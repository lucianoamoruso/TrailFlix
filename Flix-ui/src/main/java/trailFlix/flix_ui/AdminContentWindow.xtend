package trailFlix.flix_ui

import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import trailFlix.flix.appModel.AdminContent
import trailFlix.flix.model.Contenido

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.HorizontalLayout

class AdminContentWindow extends Dialog<AdminContent> {
	
	new(WindowOwner owner, AdminContent model) {
		super(owner, model)
		title = "Añada contenido relacionado"
	}
		
	override protected createFormPanel(Panel mainPanel) {

		this.title = "Añadir relacionado"

		new List(mainPanel) => [
			allowNull(false)
			(items <=> "disponibles").adapter = nameAdapter
			value <=> "elegido"
			onSelection [ | modelObject.activar]
		]
		
		//Panel de botones
		val panelBotones = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		
		new Button(panelBotones) => [
			caption = "Agregar"
			setAsDefault
			bindEnabledToProperty("listo")
			onClick [ | {modelObject.agregar; close}]
		]
	}
	
	def nameAdapter() {
		new PropertyAdapter(Contenido, "titulo")
	}
	
}