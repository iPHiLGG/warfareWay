note
	description: "Objet pour un mur du niveau."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20160220"

class
	MUR

inherit
	AFFICHABLE
		rename
			make as make_affichable
		end
	OBSTACLE
		rename
			make as make_obstacle
		end

create
	make

feature {NONE} -- Initialisation

	make (a_width, a_height, a_position_x, a_position_y:INTEGER; a_renderer:GAME_RENDERER)
			-- Initialise `Current'
		require
			a_width > 0
			a_height > 0
			a_position_x >= 0
			a_position_y >= 0
		do
			make_without_file (a_renderer, a_width, a_height, a_position_x, a_position_y)
--			Bloqu� temporairement
--			make_obstacle (a_width, a_height, a_position_x, a_position_y)
			create color_rgb.make_from_array(<<0,0,0>>)
		ensure
			color_rgb.count = 3
		end

feature -- Acc�s

	color_rgb:ARRAYED_LIST[INTEGER]
			-- Couleur de `Current' en RGB (dans cet ordre)

invariant
	color_rgb.capacity = 3

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
