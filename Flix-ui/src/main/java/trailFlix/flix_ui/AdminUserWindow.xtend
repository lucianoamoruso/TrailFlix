package trailFlix.flix_ui

import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import trailFlix.flix.appModel.AdminUser
import trailFlix.flix.model.Usuario

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import trailFlix.flix.model.Contenido
import java.awt.Color

class AdminUserWindow extends SimpleWindow<AdminUser> {
	
	new(WindowOwner parent, AdminUser model) {
		super(parent, model)
		title = "Datos de usuario"
		iconImage = "C:\\Users\\user\\git\\grupo-7-Tryhard\\Flix-ui\\src\\main\\java\\trailFlix\\flix_ui\\iconos\\usuario.jpg"
	}
	
	override protected addActions(Panel actionsPanel) {}
	
	override protected createFormPanel(Panel mainPanel) {
		
		taskDescription = "Datos de " + modelObject.username
		
		val panelInfoLabel = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]
		new Label(panelInfoLabel) => [
			text = "Nombre:"
			fontSize = 12
		]
		new Label(panelInfoLabel) => [
			text = modelObject.nombre
			fontSize = 11
		]
		new Label(panelInfoLabel) => [
			text = "Username:"
			fontSize = 12
		]
		new Label(panelInfoLabel) => [
			text = modelObject.username
			fontSize = 11
		]
		new Label(panelInfoLabel) => [
			text = "Codigo:"
			fontSize = 12
		]
		new Label(panelInfoLabel) => [
			text = modelObject.codigo
			fontSize = 11
		]
		new Label(panelInfoLabel) => [
			text = "Fecha de registro:"
			fontSize = 12
		]
		new Label(panelInfoLabel) => [
			text = modelObject.registro
			fontSize = 11
		]
		new Label(panelInfoLabel) => [
			text = "Fecha de nacimiento:"
			fontSize = 12
		]
		new Label(panelInfoLabel) => [
			text = modelObject.nacimiento
			fontSize = 11
		]
		new Label(panelInfoLabel) => [
			text = "Amigos:"
			fontSize = 12
		]
		val panelAmigos = new Panel(panelInfoLabel) => [
			layout = new HorizontalLayout
		]
		new List(panelAmigos) => [
			allowNull(false)
			value <=> "sel_amigo"
			(items <=> "amigos").adapter = new PropertyAdapter(typeof(Usuario), "nombre")
			onSelection [ | modelObject.listo = true]
		]
		val panelVer = new Panel(panelAmigos)
		centrarVerticalElemento(50,37,panelVer)
		new Button(panelVer) => [
			caption = "Ver"
			bindVisibleToProperty("listo")
			onClick [ | {close; new AdminUserWindow(owner, new AdminUser(modelObject.sel_amigo)).open}]
		]
		
		new Label(mainPanel) => [
			text = "Contenido visto:"
			fontSize = 12
			background = Color.LIGHT_GRAY
			foreground = new Color(204,229,255)
		]
		crearTablaVisto(mainPanel)
		
		new Label(mainPanel) => [
			text = "Contenido favorito:"
			fontSize = 12
			background = Color.LIGHT_GRAY
			foreground = new Color(255,215,0)
		]
		crearTablaFavoritos(mainPanel)

		new Label(mainPanel) => [
			text = "Contenido recomendado:"
			fontSize = 12
			background = Color.LIGHT_GRAY
			foreground = new Color(255,204,229)
		]
		crearTablaRecomendado(mainPanel)
	}
	
	def void crearTablaVisto(Panel panel) {
		
		val tablaVisto = new Table<Contenido>(panel, typeof(Contenido)) => [
			items <=> "visto"
			numberVisibleRows = 4
			
		]
		new Column<Contenido>(tablaVisto) => [
			title = "Titulo"
			fixedSize = 200
			bindContentsToProperty("titulo")
		]
		new Column<Contenido>(tablaVisto) => [
			title = "Codigo"
			bindContentsToProperty("codigo")
		]
	}

	def void crearTablaFavoritos(Panel panel) {
		
		val tablaFavoritos = new Table<Contenido>(panel, typeof(Contenido)) => [
			items <=> "favoritos"
			numberVisibleRows = 4
			
		]
		new Column<Contenido>(tablaFavoritos) => [
			title = "Titulo"
			fixedSize = 200
			bindContentsToProperty("titulo")
		]
		new Column<Contenido>(tablaFavoritos) => [
			title = "Codigo"
			bindContentsToProperty("codigo")
		]
	}

	def void crearTablaRecomendado(Panel panel) {
		
		val tablaRecomendado = new Table<Contenido>(panel, typeof(Contenido)) => [
			items <=> "recomendado"
			numberVisibleRows = 4
			
		]
		new Column<Contenido>(tablaRecomendado) => [
			title = "Titulo"
			fixedSize = 200
			bindContentsToProperty("titulo")
		]
		new Column<Contenido>(tablaRecomendado) => [
			title = "Codigo"
			bindContentsToProperty("codigo")
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