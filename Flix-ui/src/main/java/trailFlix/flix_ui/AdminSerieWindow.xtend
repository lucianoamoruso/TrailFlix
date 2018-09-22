package trailFlix.flix_ui

import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import trailFlix.flix.model.Contenido
import trailFlix.flix.appModel.AdminSerie

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import trailFlix.flix.appModel.AdminContentSerie
import trailFlix.flix.appModel.AdminChapter
import trailFlix.flix_ui.helpers.ProveedorIconos
import org.uqbar.arena.widgets.NumericField
import java.awt.Color

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
		
		//Contenido Relacionado
		administrarContenidoRelacionado(mainPanel)
		
		new Label(panelDatos).text = "Capitulos"
		val capitulos = new Panel(panelDatos) => [
			layout = new HorizontalLayout
		]
		new Button(capitulos) => [
		caption = "Agregar Capitulo"
		onClick [ | new AdminChapterWindow(this, new AdminChapter(this.modelObject, this.modelObject.trailFlix)).open]
		]
		new Label(capitulos) => [
			text = "* al menos 1"
			foreground = Color.RED
		]
		
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
	
	def void administrarContenidoRelacionado(Panel mainPanel) {
		
		val panelRelated = new Panel(mainPanel) => [
			layout = new VerticalLayout
		]
		
		val panelRelatedLabel = new Panel(panelRelated) => [
			layout = new ColumnLayout(2)
		]
		new Label(panelRelatedLabel).text = "Contenido relacionado"
		val panelRelatedButtons = new Panel(panelRelatedLabel) => [
			layout = new HorizontalLayout
		]
		new Button(panelRelatedButtons) => [
			caption = "Quitar"
			onClick [ | modelObject.quitarContenido]
		]
		new Button(panelRelatedButtons) => [
			caption = "Agregar"
			onClick [ | new AdminContentSerieWindow(this, new AdminContentSerie(modelObject.trailFlix,modelObject)).open]
		]
		new List(panelRelated) => [
			allowNull(false)
			value <=> "sel_relacionado"
			(items <=> "relacionado").adapter = new PropertyAdapter(typeof(Contenido), "titulo")
		]
		
		
	}
	
}
