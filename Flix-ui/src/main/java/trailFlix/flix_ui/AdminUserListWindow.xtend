package trailFlix.flix_ui

import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import trailFlix.flix.appModel.AdminUserList
import trailFlix.flix.model.Usuario

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.VerticalLayout
import trailFlix.flix.appModel.AdminUser

class AdminUserListWindow extends SimpleWindow<AdminUserList>{
	
	new(WindowOwner parent, AdminUserList model) {
		super(parent, model)
		taskDescription = "Elija un usuario para información adicional"
	}
	
	override protected addActions(Panel actionsPanel) {}
	
	override protected createFormPanel(Panel mainPanel) {
		title = "Lista de usuarios"
		
		//Buscar y Ver------------------------------------
		val panelBusquedaVista = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		new TextBox(panelBusquedaVista) => [
			value <=> "user_find"
			width = 250
		]
		new Button(panelBusquedaVista) => [
			caption = "Limpiar"
//			iconImage = "undefined"
			onClick [ | modelObject.limpiarUserFind]
		]

		val panelTablaUsuarios = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		val int columnVis = 6
		crearListaUsuarios(panelTablaUsuarios, columnVis)
		
		val panelBotonCentrado = new Panel(panelTablaUsuarios) => [
			layout = new VerticalLayout
		]
		centrarVerticalElemento(120,70,panelBotonCentrado)
		new Button(panelBotonCentrado) => [
			caption = "Ver"
			height = columnVis * 10 + 10
			width = columnVis * 10 + 10
			setAsDefault
			bindEnabledToProperty("listo")
			onClick [ | new AdminUserWindow(this, new AdminUser(modelObject.sel_usuario)).open]
		]
		
		new Button(mainPanel) => [
			caption = "Cerrar"
			onClick [ | close]
		]
		
	}
	
	def void crearListaUsuarios(Panel mainPanel, int visibles) {
		
		val tablaUsuarios = new Table<Usuario>(mainPanel, typeof(Usuario)) => [
			items <=> "usuarios"
			value <=> "sel_usuario"
			numberVisibleRows = visibles
		]
		new Column<Usuario>(tablaUsuarios) => [
			title = "Username"
			fixedSize = 200
			bindContentsToProperty("nombreDeUsuario")
		]
		new Column<Usuario>(tablaUsuarios) => [
			title = "Nombre"
			bindContentsToProperty("nombre")
		]
		new Column<Usuario>(tablaUsuarios) => [
			title = "Favoritos"
			bindContentsToProperty("contFavorito")
		]
		
	}
	
	/*
	 * Prop: crea un boton invisible para centrar verticalmente el elemento deseado dentro de un contenedor.
	 */
	def void centrarVerticalElemento(int container_height, int element_height, Panel panel) {
		new Button(panel) => [
			height = container_height/2 - element_height/2
			width = 0
			bindVisibleToProperty("visible")
		]
	}
	
	/*
	 * Prop: crea un boton invisible para centrar horizontalmente el elemento deseado dentro de un contenedor.
	 */
	def void centrarHorizontalElemento(int container_width, int element_width, Panel panel) {
		new Button(panel) => [
			width = container_width/2 - element_width/2
			height = 0
			bindVisibleToProperty("visible")
		]
	}
	
}