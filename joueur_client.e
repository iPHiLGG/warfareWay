note
	description: "Objet pour un joueur (c�t� client)."
	author: "�tienne Boutet"
	author: "Philippe Guilmette"
	date: "20170423"

class
	JOUEUR_CLIENT

inherit
	JOUEUR
		redefine
			make
		end

create
	make

feature {NONE} -- Initialisation

	make(a_renderer:GAME_RENDERER)
			-- Initialisation de `Current'
		do
			initialise(a_renderer, "includes/images/ennemi_rifle.png")
			start_x := 50
			start_y := 50
		end

invariant

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
