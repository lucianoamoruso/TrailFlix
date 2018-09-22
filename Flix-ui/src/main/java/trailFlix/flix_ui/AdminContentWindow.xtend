package trailFlix.flix_ui

import java.awt.Color
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
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


		crearPistas(mainPanel)
		new List(mainPanel) => [
			allowNull(false)
			(items <=> "disponibles").adapter = nameAdapter
			value <=> "elegido"
			bindForegroundToProperty("color_item")
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
	
	protected def crearPistas(Panel panel) {
		val panelPistas = new Panel(panel) => [
			layout = new HorizontalLayout
		]
		new Label(panelPistas) => [
			text = "Seleccione"
		]
		new Label(panelPistas) => [
			text = "peliculas"
			background = Color.BLACK
			foreground = new Color(204,255,204)
		]
		new Label(panelPistas) => [
			text = "y"
		]
		new Label(panelPistas) => [
			text = "series"
			background = Color.BLACK
			foreground = new Color(255,204,204)
		]
	}
	
	def nameAdapter() {
		new PropertyAdapter(Contenido, "titulo")
	}
	
}