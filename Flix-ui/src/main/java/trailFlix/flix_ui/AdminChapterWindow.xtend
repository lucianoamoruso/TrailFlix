package trailFlix.flix_ui

import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import trailFlix.flix.appModel.AdminChapter

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AdminChapterWindow extends Dialog<AdminChapter> {
	
	new(WindowOwner owner, AdminChapter model) {
		super(owner, model)
		iconImage = "C:\\Users\\user\\git\\grupo-7-Tryhard\\Flix-ui\\src\\main\\java\\trailFlix\\flix_ui\\iconos\\serie.png"
		taskDescription = "Cree un nuevo capitulo"
	}
	

	override protected createFormPanel(Panel mainPanel) {
		
		this.title = "Administración de capitulos"
		
		//Titulo
		val panelTitulo = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]
		new Label(panelTitulo).text = "Título"
		new TextBox(panelTitulo) => [
			value <=> "titulo"
			width = 100  
		]
		
		//Datos
		val panelDatos = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]

		new Label(panelDatos).text = "Duración"
		new TextBox(panelDatos) => [
			value <=> "duracion_ingresada"
			width = 50
		]
		
		new Label(panelDatos).text = "Temporada"
		new TextBox(panelDatos) => [
			value <=> "temporada"
			width = 50
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
		
		new Button(mainPanel) => [
		caption = "Cancelar"
		onClick [ | close]
		]
		
		new Button(mainPanel) => [		//Agregar capitulo
			caption = "Aceptar"
			bindEnabledToProperty("datos_completados")
			onClick [ | {modelObject.nuevoCap ; close}]
		]
		
	}
	
	def void crearInputFechaEstreno(Panel panelDatos) {
		
		new Label(panelDatos).text = "Fecha estreno"
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
}
