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
import trailFlix.flix.model.Pelicula

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import trailFlix.flix.model.Usuario

class AdminUserListWindow extends SimpleWindow<AdminUserList>{
	
	new(WindowOwner parent, AdminUserList model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		//TODO?
	}
	
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
			caption = "Ver"
			onClick [ | ]	//Se abre AdminUserWindow
		]
		
		crearListaUsuarios(mainPanel)
		
		new Button(panelBusquedaVista) => [
			caption = "Cerrar"
			onClick [ | close]
		]
		
	}
	
	def void crearListaUsuarios(Panel mainPanel) {
		
		val tablaUsuarios = new Table<Usuario>(mainPanel, typeof(Usuario)) => [
			items <=> "usuarios"
			value <=> "sel_usuario"
			numberVisibleRows = 3
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
	
}