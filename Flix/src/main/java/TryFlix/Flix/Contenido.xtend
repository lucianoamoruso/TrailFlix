package TryFlix.Flix;

import java.util.List

interface Contenido {
	def int codigo()
	def String titulo()
}

class Pelicula implements Contenido{
	
	val String _titulo
	val int _codigo
	
	new(String tituto,int codigo){
		_titulo = titulo
		_codigo = codigo
	}
	
	override codigo() {
		return _codigo
	}
	
	override titulo() {
		return _titulo
	}
	
}


class Capitulo implements Contenido{
	
	val String _titulo
	val int _codigo
	
	new(String tituto,int codigo){
		_titulo = titulo
		_codigo = codigo
	}
	
	override codigo() {
		return _codigo
	}
	
	override titulo() {
		return _titulo
	}	
}


class Serie implements Contenido{
	
	val String _titulo
	val int _codigo
	
	var List<Capitulo> capitulos
	
	new(String tituto,int codigo){
		_titulo = titulo
		_codigo = codigo
		capitulos = newArrayList()
	}
	
	def addCap(Capitulo cap){
		capitulos.add(cap)
	}
	
	override codigo() {
		return _codigo
	}
	
	override titulo() {
		return _titulo
	}	
}
