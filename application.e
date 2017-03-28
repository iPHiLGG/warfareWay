note
    description : "Objet principal du jeu pour initialiser les librairies"
    author      : "Philippe Guilmette"
    author      : "�tienne Boutet"
    generator   : "Eiffel Game2 Project Wizard"
    date        : "2017-02-07 08:03:10.728 +0000"

class
    APPLICATION

inherit
	GAME_LIBRARY_SHARED
	IMG_LIBRARY_SHARED
	MPG_LIBRARY_SHARED
	TEXT_LIBRARY_SHARED

create
    make

feature {NONE} -- Initialization

    make
            -- Ex�cution du jeu
        local
        	l_engine : detachable ENGIN
        			-- L'engin principal du jeu
        do
        	mpg_library.enable_mpg
        	game_library.enable_video
        	text_library.enable_text
			image_file_library.enable_image (true, false, true)
			create l_engine.make
			l_engine.start_game
        end

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
