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

feature {NONE} -- Impl�mentation

	make
			-- Initialise `Current'
		do

		end

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
