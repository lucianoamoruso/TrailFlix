package trailFlix.flix_ui

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import trailFlix.flix.appModel.AdminContent
import trailFlix.flix.model.Contenido

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AdminContentWindow extends TransactionalDialog<AdminContent> {
	
	new(WindowOwner owner, AdminContent model) {
		super(owner, model)
		title = "Añada contenido relacionado"
	}
		
	override protected createFormPanel(Panel mainPanel) {

		this.title = "Añadir relacionado"

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
			setAsDefault
			disableOnError	
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