note
	description: "Objet pour un mur du niveau."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20160220"

class
	MUR

inherit
	OBSTACLE
		rename
			make as make_obstacle
		end

create
	make

feature {NONE} -- Initialisation

	make (a_width, a_height, a_position_x, a_position_y:INTEGER)
			-- Initialise `Current'
		do
			make_obstacle (a_width, a_height, a_position_x, a_position_y)
			create color_rgb.make_from_array(<<0,0,0>>)
		end

feature -- Acc�s

	color_rgb:ARRAYED_LIST[INTEGER]
			-- Couleur du mur en RGB (dans cet ordre)

invariant
	color_rgb.capacity = 3

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
