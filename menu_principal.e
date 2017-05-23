note
	description: "Objet pour le menu principal."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20170220"

class
	MENU_PRINCIPAL

inherit
	MENU
		redefine
			make
		end

create
	make

feature {NONE} -- Initialisation

	make(a_window: GAME_RENDERER; a_font:TEXT_FONT)
			-- <Precursor>
		do
			Precursor (a_window, a_font)
			create sections.make_from_array (<<"Solo", "Multijoueur", "Cr�dits", "Quitter">>)
			show_sections (sections)
		end

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end

