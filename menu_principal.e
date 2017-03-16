note
	description: "Objet pour le menu principal."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20160220"

class
	MENU_PRINCIPAL

inherit
	MENU
		rename
			make as make_base
		end

create
	make

feature {NONE} -- Initialization

	make(a_window: GAME_WINDOW_RENDERED; a_font:TEXT_FONT)
		local
		do
			make_base(a_window, a_font)
		end

end

