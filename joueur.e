note
	description: "Objet pour un personnage qui peut �tre controll�."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20170220"

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
			make_personnage(a_renderer, "includes/images/personnage_pistol.png")
			create rifle.make_for_player
			create pistol.make
			create knife.make
			start_x := 0
			start_y := 0
			half_width := width/2
			half_height := height/2
		end

feature -- Acc�s

	rifle:FUSIL_AUTOMATIQUE
			-- Le {FUSIL_AUTOMATIQUE} de `Current'.

	pistol:PISTOLET
			-- Le {PISTOLET} de `Current'.

	knife:COUTEAU
			-- Le {COUTEAU} de `Current'.

invariant

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
