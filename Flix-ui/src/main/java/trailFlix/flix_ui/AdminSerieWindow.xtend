package trailFlix.flix_ui

import java.awt.Color
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import trailFlix.flix.appModel.AdminChapter
import trailFlix.flix.appModel.AdminContentSerie
import trailFlix.flix.appModel.AdminSerie
import trailFlix.flix.model.Capitulo
import trailFlix.flix.model.Contenido
import trailFlix.flix_ui.helpers.ProveedorIconos

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AdminSerieWindow extends Dialog<AdminSerie> {
	
	new(WindowOwner owner, AdminSerie model) {
		super(owner, model)
		this.title = "Administración de series"
		taskDescription = "Cree una nueva serie"
		iconImage = ProveedorIconos.serie
	}

	override protected createFormPanel(Panel mainPanel) {
		
		//Pista
		new Label(mainPanel) => [
			text = "* = obligatorio"
			foreground = Color.RED
		]
		//Titulo
		val panelTitulo = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]
		new Label(panelTitulo).text = "Título"
		val titulo = new Panel(panelTitulo) => [
			layout = new HorizontalLayout
		]
		new Label(titulo) => [
			text = "*"
			foreground = Color.RED
		]
		new TextBox(titulo) => [
			value <=> "titulo"
			width = 100  
		]
		
		//Datos
		val panelDatos = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]
		
		ofrecerCategorias(panelDatos)

		new Label(panelDatos).text = "Clasificación"
		val clasificacion = new Panel(panelDatos) => [
			layout = new HorizontalLayout
		]
		new Label(clasificacion) => [
			text = "*"
			foreground = Color.RED
		]
		new Selector(clasificacion) => [
			allowNull(false)
			items <=> "clasificaciones_disp"
			value <=> "sel_clasificacion"
		]
		
		//-----Fecha de estreno
		new Label(panelDatos).text = "Creadores"
		val creadores = new Panel(panelDatos) => [
			layout = new HorizontalLayout
		]
		new Label(creadores) => [
			text = "*"
			foreground = Color.RED
		]
		new TextBox(creadores) => [
			value <=> "creadores"
			width = 70
		]
		
		new Label(panelDatos).text = "Temporadas"
		val temporadas = new Panel(panelDatos) => [
			layout = new HorizontalLayout
		]
		new Label(temporadas) => [
			text = "*"
			foreground = Color.RED
		]
		new NumericField(temporadas,false) => [
			value <=> "temporadas"
			width = 70
		]
		
		//Capitulos
		crearAreaCapitulos(mainPanel)
		
		//Contenido Relacionado
		administrarContenidoRelacionado(mainPanel)
		
		//Confirmacion
		new Button(mainPanel) => [
			caption = "Cancelar"
			onClick [ | close]
		]
		
		new Button(mainPanel) => [		//Agregar serie
			caption = "Aceptar"
			bindEnabledToProperty("datos_completados")
			onClick [ | {modelObject.nuevaSerie ; close}]
		]
		
	}
	
	protected def crearAreaCapitulos(Panel mainPanel) {
		
		new Label(mainPanel) => [
			text = "Capitulos"
			fontSize = 13
		]
		
		crearTablaCapitulos(mainPanel)
		
		val botonesCapitulo = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		
		centrarHorizontalElemento(mainPanel.width,45,botonesCapitulo)
		
		new Button(botonesCapitulo) => [
			caption = "Agregar capitulo"
			onClick [ | new AdminChapterWindow(this, new AdminChapter(this.modelObject, this.modelObject.trailFlix)).open]
		]
		
		new Label(botonesCapitulo) => [
			text = "* al menos 1"
			foreground = Color.RED
		]
		
	}
	
	def crearTablaCapitulos(Panel panel) {
		
		val tablaUsuarios = new Table<Capitulo>(panel, typeof(Capitulo)) => [
			items <=> "capitulos"
			numberVisibleRows = 3
		]
		new Column<Capitulo>(tablaUsuarios) => [
			title = "Titulo"
			fixedSize = 100
			bindContentsToProperty("titulo")
		]
		new Column<Capitulo>(tablaUsuarios) => [
			title = "Numero"
			bindContentsToProperty("capituloNro")
		]
		new Column<Capitulo>(tablaUsuarios) => [
			title = "Temporadas"
			bindContentsToProperty("temporada")
		]
		
	}
	
	def void ofrecerCategorias(Panel panelDatos) {
		
		new Label(panelDatos).text = "Categorias"
		val panelCategorias = new Panel(panelDatos) => [
			layout = new ColumnLayout(2)
		]
		
		val drama = new Panel(panelCategorias)
		new Label(drama).text = "Drama"
		new CheckBox(drama) => [
			value <=> "es_drama"
		]
		
		val comedia = new Panel(panelCategorias)
		new Label(comedia).text = "Comedia"
		new CheckBox(comedia) => [
			value <=> "es_comedia"
		]
		
		val terror = new Panel(panelCategorias)
		new Label(terror).text = "Terror"
		new CheckBox(terror) => [
			value <=> "es_terror"
		]
		
		val accion = new Panel(panelCategorias)
		new Label(accion).text = "Accion"
		new CheckBox(accion) => [
			value <=> "es_accion"
		]
		
	}
	
	def void administrarContenidoRelacionado(Panel panel) {
		
		new Label(panel) => [
			text = "Contenido relacionado"
			fontSize = 11
			alignLeft
		]
		val panelRelated = new Panel(panel) => [
			layout = new HorizontalLayout
		]
		new List(panelRelated) => [
			allowNull(false)
			width = 200
			height = 60
			value <=> "sel_relacionado"
			(items <=> "relacionado").adapter = new PropertyAdapter(typeof(Contenido), "titulo")
		]
		val panelRelatedButtons = new Panel(panelRelated)
		new Button(panelRelatedButtons) => [
			caption = "Agregar"
			onClick [ | new AdminContentSerieWindow(this, new AdminContentSerie(modelObject.trailFlix,modelObject)).open]
		]
		new Button(panelRelatedButtons) => [
			caption = "Quitar"
			onClick [ | modelObject.quitarContenido]
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
