note
	description: "Summary description for {MAP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MAP

inherit
	IMG_LIBRARY_SHARED
	GAME_TEXTURE
		rename
			make as make_texture
		end

create
	make

feature {NONE} -- Initialization

	make(a_renderer: GAME_RENDERER)
			-- Fond de la fen�tre principale
		local
			l_background: IMG_IMAGE_FILE
		do
			create l_background.make ("includes/images/background.jpg")
			if l_background.is_openable then
				l_background.open
				if l_background.is_open then
					make_from_image (a_renderer, l_background)
				end
			end
		end

end
