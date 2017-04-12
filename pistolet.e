note
	description: "Objet pour le pistolet."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20160220"

class
	PISTOLET

inherit
	ARMES_TIRE

create
	make

feature {NONE} -- Initialisation

	make
			-- Initialisation de `Current'.
		do
			bullet_speed := 10
			total_ammunition := 24
			clip_ammunition := 8
			damage := 10
			weapon_filename := "includes/images/personnage_pistol.png"
		end

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
