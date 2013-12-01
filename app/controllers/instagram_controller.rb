class InstagramController < ApplicationController

    $lista


	def retornarFotos
		@hashtag = params[:hashtag]

		fotos = Instagram.tag_recent_media(@hashtag,options = {:count => 1000}) #los primeros 10
        @listaFotos = fotos.sort_by {|hash| hash.likes["count"]}.uniq.reverse!
		$lista = @listaFotos

		render "/instagram/mostrarFotos"

	end

	def paginacion

		@siguientePagina = params[:i]
		@listaFotos = $lista
		render "/instagram/mostrarFotos"
	end
end
