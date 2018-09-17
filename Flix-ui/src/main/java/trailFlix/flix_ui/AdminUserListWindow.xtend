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

class AdminUserListWindow extends SimpleWindow<AdminUserList>{
	
	new(WindowOwner parent, AdminUserList model) {
		super(parent, model)
		taskDescription = "Elija un usuario para información adicional"
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
		
		val panelTablaUsuarios = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		val int columnVis = 6
		crearListaUsuarios(panelTablaUsuarios, columnVis)
		
		val panelBotonCentrado = new Panel(panelTablaUsuarios) => [
			layout = new VerticalLayout
		]
		centrarVerticalElemento(140,panelBotonCentrado)
		new Button(panelBotonCentrado) => [
			caption = "Ver"
			height = columnVis * 10 + 10
			width = columnVis * 10 + 10
			setAsDefault
			
			onClick [ | ]	//Se abre AdminUserWindow
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
	 * Prop: este metodo rellena de paneles vacios para lograr centrar un elemento.
	 * Nota: este metodo en realidad no ubica a cualquier elemento en el centro sino que crea su esquina superior
	 * 		 izquierda en el centro del panel contenedor. (ahora mismo esto no es cierto ya que acomoda a "ver"
	 * 		 en el centro.
	 */
	def void centrarVerticalElemento(int container_height, Panel panel) {
		//Se estima que cada panel vacio ocupa 15 pixeles de alto
		val int paneles = container_height / 30
		for (var int i=0;i<paneles;i++) {
			new Panel(panel)
		}
	}
	
}