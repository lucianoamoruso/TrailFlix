package trailFlix.flix_ui

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import trailFlix.flix.appModel.AdminContent
import trailFlix.flix.appModel.AdminMovie

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.WindowOwner

class AdminMovieWindow extends TransactionalDialog<AdminMovie> {
	
	new(WindowOwner owner, AdminMovie model) {
		super(owner, model)
		title = "Cree una nueva película"
	}
	
	override protected createFormPanel(Panel mainPanel) {
				this.title = "Administración de peliculas"
		
		//-----Titulo-------------------------------
		val panelTitulo = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		new Label(panelTitulo).text = "Título"
		new TextBox(panelTitulo) => [
			value <=> "titulo"
		]
		
		//-----Datos--------------------------------
		val panelDatos = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]
		new Label(panelDatos).text = "Categorias"
		new Selector(panelDatos)
		new Label(panelDatos).text = "Duración"
		new TextBox(panelDatos) => [
			value <=> "duracion"
		]
		new Label(panelDatos).text = "Clasificación"
		new Selector(panelDatos)
		new Label(panelDatos).text = "Fecha estreno"
		new TextBox(panelDatos) => [
			value <=> "fecha_estreno"
		]
		new Label(panelDatos).text = "Directores"
		new TextBox(panelDatos) => [
			value <=> "directores"
		]
		new Label(panelDatos).text = "Actores principales"
		new TextBox(panelDatos) => [
			value <=> "actores_principales"
		]
		new Label(panelDatos).text = "Link Youtube"
		new TextBox(panelDatos) => [
			value <=> "link"
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
			onClick [ | new AdminContentWindow(this, new AdminContent(modelObject.trailFlix)).open]
		]
		new Selector(panelRelated)

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
