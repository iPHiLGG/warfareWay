note
	description: "Objet pour le couteau."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20160220"

class
	COUTEAU

inherit
	ANIMATION
	ARMES

create
	make

feature {NONE} -- Initialisation

	make
			-- Initialisation de `Current'.
		do
			damage := 100
			weapon_filename := "includes/images/personnage_knife.png"
		end

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
