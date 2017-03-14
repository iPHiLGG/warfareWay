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
		end

end
