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
import trailFlix.flix_ui.helpers.ProveedorIconos
import org.uqbar.arena.widgets.NumericField
import java.awt.Color
import org.uqbar.arena.layout.HorizontalLayout

class AdminChapterWindow extends Dialog<AdminChapter> {
	
	new(WindowOwner owner, AdminChapter model) {
		super(owner, model)
		iconImage = ProveedorIconos.serie
		this.title = "Administración de capitulos"
		taskDescription = "Cree un nuevo capitulo"
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
		
		new Label(panelDatos).text = "Temporada"
		val temporada = new Panel(panelDatos) => [
			layout = new HorizontalLayout
		]
		new Label(temporada) => [
			text = "*"
			foreground = Color.RED
		]
		new NumericField(temporada,false) => [
			value <=> "temporada"
			width = 50
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
}
