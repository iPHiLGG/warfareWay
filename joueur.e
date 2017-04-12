note
	description: "Objet pour un personnage qui peut �tre controll�."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20160220"

class
	JOUEUR

inherit
	PERSONNAGE
		rename
			make as make_personnage
		end

create
	make

feature {NONE} -- Initialisation
	make(a_renderer:GAME_RENDERER)
			-- Initialisation de `Current'
		do
			make_personnage(a_renderer, "includes/images/personnage.png")
			start_x := 0
			start_y := 0
			half_width := width/2
			half_height := height/2
		end

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
