note
	description: "Summary description for {CURSEUR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CURSEUR

feature -- Acc�s
	last_x:INTEGER_32
		-- Derni�re position en x du curseur
	last_y:INTEGER_32
		-- Derni�re position en y du curseur

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


end
