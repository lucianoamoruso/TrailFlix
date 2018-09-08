package trailFlix.flix_ui

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import trailFlix.flix.appModel.AdminMovieInfo
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.VerticalLayout

class AdminMovieInfoWindow extends Dialog <AdminMovieInfo> {
	
	new(WindowOwner owner, AdminMovieInfo model) {
		super(owner, model)
		title = modelObject.pelicula.titulo
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		val panelInfoLabel = new Panel(mainPanel) => [
			layout = new VerticalLayout
		]
		new Label (panelInfoLabel).text = "Duracion:" + modelObject.pelicula.duracion.toString
		new Label (panelInfoLabel).text = "Fecha de Estreno:" + modelObject.pelicula.fechaEstreno.toString
		new Label (panelInfoLabel).text = "Reparto:" + modelObject.pelicula.actores.toString
		new Label (panelInfoLabel).text = "Direccion:" + modelObject.pelicula.directores.toString
		new Label (panelInfoLabel).text = "Valoraciones:" + modelObject.pelicula.getRating()
		new Label (panelInfoLabel).text = "Enlace:"+modelObject.pelicula.link
		new Label (panelInfoLabel).text = "Contenido Relacionado:" + modelObject.pelicula.contRelacionado.toString		
	}
	

	
}