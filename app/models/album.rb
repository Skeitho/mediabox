class Album < ActiveRecord::Base

	attr_reader :idAlbum, :idUsuario

	def crearNuevoAlbum (nombreAlbum,fechaCreacionAlbum,descripcionAlbum,lugarAlbum,imagenAlbum,privacidadAlbum,idUsuario)
		nuevoAlbum = Album.new nombre:nombreAlbum, fecha:fechaCreacionAlbum, descripcion:descripcionAlbum, lugar:lugarAlbum, 
		             imagen:imagenAlbum, privacidad:privacidadAlbum, fk_usuario:idUsuario, activo: "si"
		nuevoAlbum.new_record?
		nuevoAlbum.save
	end

	def iniciarAlbum (idUsuario, idAlbum)
		@idAlbum, @idUsuario = idAlbum, idUsuario
	end

	def eliminarAlbum(idAlbum)
		album = Album.find(idAlbum)
		album.activo = "no"
		album.save
	end

	def nombreAlbum
		nombre = Album.find(idAlbum).nombre
		return nombre 
	end

	def fechaCreacionAlbum
	    fecha = Album.find(idAlbum).fecha
	    return fecha	
	end

	def descripcionAlbum
	    descripcion = Album.find(idAlbum).descripcion
		return descripcion
	end

	def lugarAlbum
	    lugar = Album.find(idAlbum).lugar		
		return lugar
	end

	def imagenAlbum
		imagen = Album.find(idAlbum).imagen
		return imagen
	end

	def usuarioAlbum
		usuario = Album.find(idAlbum).fk_usuario
		return usuario
	end	

	def privacidadAlbum
		privacidad = Album.find(idAlbum).privacidad
		return privacidad
	end

	def modificarNombreAlbum (nuevoNombreAlbum,idAlbum)
		album = Album.find(idAlbum)
		album.nombre = nuevoNombreAlbum
		album.save
	end

	def modificarDescripcionAlbum (nuevaDescripcionAlbum,idAlbum)
		album = Album.find(idAlbum)
		album.descripcion = nuevaDescripcionAlbum
		album.save
	end

	def modificarLugarAlbum (nuevolugarAlbum,idAlbum)
		album = Album.find(idAlbum)
		album.lugar = nuevolugarAlbum
		album.save
	end

	def modificarPrivacidadAlbum (nuevaPrivacidadAlbum,idAlbum)
		album = Album.find(idAlbum)
		album.privacidad = nuevaPrivacidadAlbum
		album.save
	end

	def cantidadAlbumsTotal
		album = Album.count
		if (album)
		return album
	else
		return 0
	end
	end

	def regresarAlbumUsuario(idUsuario,idAlbum)
		album = Album.find_by(fk_usuario: idUsuario,id: idAlbum)
		if (album and album.activo == 'si')
		return album
		else
		return "no"
		end
	end



end
