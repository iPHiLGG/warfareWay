note
	description: "Objet pour un personnage ennemi."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20160220"

class
	ENNEMI

inherit
	PERSONNAGE
		rename
			make as make_personnage
		end

create
	make

feature {NONE} -- Impl�mentation

	make(a_x, a_y: INTEGER; a_renderer:GAME_RENDERER)
			-- Initialisation de `Current'
		do
			make_personnage(a_renderer, "includes/images/ennemi_rifle.png")
			create rifle.make (1)
			start_x := a_x
			start_y := a_y
			half_width := width/2
			half_height := height/2
		end

feature -- Acc�s

	rifle:FUSIL_AUTOMATIQUE
			-- Le {FUSIL_AUTOMATIQUE} de `Current'.

invariant

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
