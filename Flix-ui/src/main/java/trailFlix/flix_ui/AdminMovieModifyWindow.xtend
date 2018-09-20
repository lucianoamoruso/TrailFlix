package trailFlix.flix_ui


import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

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
import trailFlix.flix.appModel.AdminContent
import trailFlix.flix.appModel.AdminMovie
import trailFlix.flix.model.Contenido
import trailFlix.flix_ui.helpers.ProveedorIconos

class AdminMovieModifyWindow extends Dialog<AdminMovie> {
	
	new(WindowOwner owner, AdminMovie modelpelicula) {
		super(owner, modelpelicula)
		this.title = "Administracion de peliculas"
		iconImage = ProveedorIconos.pelicula
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		taskDescription = "Modifique una película"
		
		//Titulo
		val panelTitulo = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]
		new Label(panelTitulo).text = "Titulo"
		new TextBox(panelTitulo) => [
			value <=> "titulo"
			width = 100  
		]
		
		//Datos
		val panelDatos = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]
		
		ofrecerCategorias(panelDatos)

		new Label(panelDatos).text = "Duracion"
		new TextBox(panelDatos) => [
			value <=> "duracion_ingresada"
			width = 50
		]
		new Label(panelDatos).text = "Clasificacion"
		new Selector(panelDatos) => [
			allowNull(false)
			items <=> "clasificaciones_disp"
			value <=> "sel_clasificacion"
		]
		
		//-----Fecha de estreno
		crearInputFechaEstreno(panelDatos)
		
		new Label(panelDatos).text = "Directores"
		new TextBox(panelDatos) => [
			value <=> "directores_elegidos"
			width = 70
		]
		new Label(panelDatos).text = "Actores principales"
		new TextBox(panelDatos) => [
			value <=> "actores_principales"
			width = 70
		]
		new Label(panelDatos).text = "Link Youtube"
		new TextBox(panelDatos) => [
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
		
		new Label(panelDatos).text = "Fecha estreno"
		val panelFechas = new Panel(panelDatos) => [
			layout = new VerticalLayout
		]
		new Label(panelFechas).text = "Dia"
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
			onClick [ | new AdminContentWindow(this, new AdminContent(modelObject.trailFlix,modelObject)).open]
		]
		new List(panelRelated) => [
			allowNull(false)
			value <=> "sel_relacionado"
			(items <=> "relacionado").adapter = new PropertyAdapter(typeof(Contenido), "titulo")
		]
	}
}