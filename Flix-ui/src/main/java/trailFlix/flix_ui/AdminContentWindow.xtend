package trailFlix.flix_ui

import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import trailFlix.flix.appModel.AdminContent
import trailFlix.flix.model.Contenido

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AdminContentWindow extends SimpleWindow<AdminContent> {
	
	new(WindowOwner parent, AdminContent model) {
		super(parent, model)
	}
	
	override protected void addActions(Panel actionsPanel) {
	}
	
	override protected void createFormPanel(Panel mainPanel) {
	}
	
	override createMainTemplate(Panel mainPanel) {
		this.title = "Añadir relacionado"
		mainPanel.layout = new VerticalLayout

		//Panel de contenidos
		val Panel contentPanel = new Panel(mainPanel)
		contentPanel.layout = new ColumnLayout(2)
		new List(mainPanel) => [
			allowNull(false)
			(items <=> "disponibles").adapter = nameAdapter
			value <=> "elegido"
		]
		new Button(contentPanel) => [
			caption = "Agregar"
			onClick [ | this.accept]
		]
		new Button(contentPanel) => [
			caption = "Cancelar"
			onClick [ | close]
		]
				
	}
	
	def nameAdapter() {
		new PropertyAdapter(Contenido, "titulo")
	}
	
}