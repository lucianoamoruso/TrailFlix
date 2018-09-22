package trailFlix.flix_ui

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
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import trailFlix.flix.appModel.AdminContent
import trailFlix.flix.appModel.AdminMovie
import trailFlix.flix.model.Contenido
import trailFlix.flix_ui.helpers.ProveedorIconos

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import java.awt.Color

class AdminMovieWindow extends Dialog<AdminMovie> {
	
	new(WindowOwner owner, AdminMovie model) {
		super(owner, model)
		this.title = "Administración de peliculas"
		taskDescription = "Cree una nueva película"
		iconImage = ProveedorIconos.pelicula
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		modelObject.setDelegate(delegate)
		
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

		new Label(panelDatos).text = "Duración"
		val duracion = new Panel(panelDatos) => [
			layout = new HorizontalLayout
		]
		new Label(duracion) => [
			text = "*"
			foreground = Color.RED
		]
		new NumericField(duracion,false) => [
			value <=> "duracion_ingresada"
			width = 50
		]
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
		crearInputFechaEstreno(panelDatos)
		
		new Label(panelDatos).text = "Directores"
		val directores = new Panel(panelDatos) => [
			layout = new HorizontalLayout
		]
		new Label(directores) => [
			text = "*"
			foreground = Color.RED
		]
		new TextBox(directores) => [
			value <=> "directores_elegidos"
			width = 70
		]
		new Label(panelDatos).text = "Actores principales"
		val actores = new Panel(panelDatos) => [
			layout = new HorizontalLayout
		]
		new Label(actores) => [
			text = "*"
			foreground = Color.RED
		]
		new TextBox(actores) => [
			value <=> "actores_principales"
			width = 70
		]
		new Label(panelDatos).text = "Link Youtube"
		val link = new Panel(panelDatos) => [
			layout = new HorizontalLayout
		]
		new Label(link) => [
			text = "*"
			foreground = Color.RED
		]
		new TextBox(link) => [
			value <=> "link_ingresado"
			width = 100
		]
		
		//Contenido Relacionado
		administrarContenidoRelacionado(mainPanel)
				
		//Confirmacion
		new Button(mainPanel) => [
			caption = "Cancelar"
			onClick [ | close]
		]
		
		new Button(mainPanel) => [		//Agregar pelicula
			caption = "Aceptar"
			bindEnabledToProperty("datos_completados")
			onClick [ | {modelObject.nuevaPeli ; close}]
		]
	}
	
	def void crearInputFechaEstreno(Panel panelDatos) {
		
		val fecha = new Panel(panelDatos) => [
			layout = new HorizontalLayout
		]
		new Label(fecha).text = "Fecha estreno"
		new Label(fecha) => [
			text = "*"
			foreground = Color.RED
		]
		val panelFechas = new Panel(panelDatos) => [
			layout = new VerticalLayout
		]
		new Label(panelFechas).text = "Día"
		new Selector(panelFechas) => [
			allowNull(false)
			items <=> "dias_del_mes"
			value <=> "dia"
		]
		new Label(panelFechas).text = "Mes"
		new Selector(panelFechas) => [
			allowNull(false)
			items <=> "meses"
			value <=> "mes"
		]
		new Label(panelFechas).text = "Año"
		new Selector(panelFechas) => [
			allowNull(false)
			items <=> "anios"
			value <=> "anio"
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
			onClick [ | new AdminContentWindow(this, new AdminContent(modelObject.trailFlix,modelObject)).open]
		]
		new Button(panelRelatedButtons) => [
			caption = "Quitar"
			onClick [ | modelObject.quitarContenido]
		]
		
	}

}
