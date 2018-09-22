package trailFlix.flix_ui

import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import trailFlix.flix.appModel.AdminContent
import trailFlix.flix.model.Contenido
import trailFlix.flix_ui.helpers.ProveedorIconos

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AdminContentWindow extends Dialog<AdminContent> {
	
	new(WindowOwner owner, AdminContent model) {
		super(owner, model)
		iconImage = ProveedorIconos.pelicula
		title = "Contenido relacionado"
		taskDescription = "Añada contenido relacionado"
	}
		
	override protected createFormPanel(Panel mainPanel) {

		crearListaContenido(mainPanel)
		
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

	def void crearListaContenido(Panel mainPanel) {
		
		val tablaContenido = new Table<Contenido>(mainPanel, typeof(Contenido)) => [
			items <=> "disponibles"
			value <=> "elegido"
			numberVisibleRows = 8
		]
		new Column<Contenido>(tablaContenido) => [
			title = "Titulo"
			fixedSize = 50
			bindContentsToProperty("titulo")
		]
		new Column<Contenido>(tablaContenido) => [
			title = "Tipo"
			(bindContentsToProperty("codigo")).transformer = new StringTipoTransformer()
		]
		
	}
	
	def nameAdapter() {
		new PropertyAdapter(Contenido, "titulo")
	}
	
}