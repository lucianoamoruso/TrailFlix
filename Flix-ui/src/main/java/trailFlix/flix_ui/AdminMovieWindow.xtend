package trailFlix.flix_ui

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner
import trailFlix.flix.appModel.AdminContent
import trailFlix.flix.appModel.AdminMovie
import trailFlix.flix.model.Contenido

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AdminMovieWindow extends TransactionalDialog<AdminMovie> {
	
	new(WindowOwner owner, AdminMovie model) {
		super(owner, model)
		title = "Cree una nueva película"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		this.title = "Administración de peliculas"
		
		//-----Titulo-------------------------------
		val panelTitulo = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]
		new Label(panelTitulo).text = "Título"
		new TextBox(panelTitulo) => [
			value <=> "titulo"
			width = 100
		]
		
		//-----Datos--------------------------------
		val panelDatos = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]
		new Label(panelDatos).text = "Categorias"
		new List(panelDatos) => [
			allowNull(false)
			items <=> "categorias"
			value <=> "sel_categorias"
		]
		new Label(panelDatos).text = "Duración"
		new TextBox(panelDatos) => [
			value <=> "duracion"
			width = 50
		]
		new Label(panelDatos).text = "Clasificación"
		new Selector(panelDatos) => [
			allowNull(false)
			items <=> "clasificaciones"
			value <=> "sel_clasificacion"
		]
		new Label(panelDatos).text = "Fecha estreno"
		new TextBox(panelDatos) => [
			value <=> "fecha_estreno"
			width = 70
		]
		new Label(panelDatos).text = "Directores"
		new TextBox(panelDatos) => [
			value <=> "directores"
			width = 70
		]
		new Label(panelDatos).text = "Actores principales"
		new TextBox(panelDatos) => [
			value <=> "actores_principales"
			width = 70
		]
		new Label(panelDatos).text = "Link Youtube"
		new TextBox(panelDatos) => [
			value <=> "link"
			width = 100
		]
		
		//-----Contenido Relacionado----------------
		val panelRelated = new Panel(mainPanel) => [
			layout = new VerticalLayout
		]
		val panelRelatedLabel = new Panel(panelRelated) => [
			layout = new ColumnLayout(2)
		]
		new Label(panelRelatedLabel).text = "Contenido relacionado"
		new Button(panelRelatedLabel) => [
			caption = "Quitar"
			onClick [ | modelObject.quitarContenido]
		]
		new Button(panelRelatedLabel) => [
			caption = "Agregar"
			onClick [ | new AdminContentWindow(this, new AdminContent(modelObject.trailFlix,modelObject)).open]
			onAccept [ | modelObject.agregarContenido()]
		]
		new List(panelRelated) => [
			allowNull(false)
			(items <=> "relacionado").adapter = new PropertyAdapter(typeof(Contenido), "titulo")
			value <=> "sel_relacionado"
		]

		//-----Confirmacion-------------------------
		new Button(mainPanel) => [
			caption = "Cancelar"
			onClick [ | close]
		]
		new Button(mainPanel) => [		//Agregar pelicula
			caption = "Aceptar"
			onClick [ | modelObject.nuevaPeli]
		]
		
	}
			
}
