note
	description: "Objet pour les actions de la souris."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CURSEUR

inherit
	POSITION
		rename
			center_x as last_x,
			center_y as last_y
		end

feature -- Acc�s

	last_x:INTEGER
		-- Derniere position en x du curseur avant de quitter l'�cran

	last_y:INTEGER
		-- Derniere position en y du curseur avant de quitter l'�cran

	on_mouse_move(a_timestamp: NATURAL_32; a_mouse_state: GAME_MOUSE_MOTION_STATE; a_delta_x, a_delta_y:INTEGER_32)
			-- Lorsque le curseur bouge, change les information � partir de `a_mouse_state'
	do
		last_x := a_mouse_state.x
		last_y := a_mouse_state.y
	end

feature {NONE} -- Impl�mentation

	on_mouse_down(a_timestamp: NATURAL_32; a_mouse_state: GAME_MOUSE_BUTTON_RELEASED_STATE)
			-- Lorsque l'utilisateur p�se sur la souris
	do

	end

	on_mouse_up(a_timestamp: NATURAL_32; a_mouse_state: GAME_MOUSE_BUTTON_RELEASED_STATE)
			-- Lorsque l'utilisateur ne p�se plus sur la souris
	do

	end
note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
